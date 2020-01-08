Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7350E133FE1
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 12:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgAHLGl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 06:06:41 -0500
Received: from mga11.intel.com ([192.55.52.93]:42333 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbgAHLGk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 06:06:40 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 03:06:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; 
   d="scan'208";a="421415431"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jan 2020 03:06:38 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ip9Ad-0001gj-Dp; Wed, 08 Jan 2020 13:06:39 +0200
Date:   Wed, 8 Jan 2020 13:06:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 09/13] gpiolib: rework the locking mechanism for
 lineevent kfifo
Message-ID: <20200108110639.GL32742@smile.fi.intel.com>
References: <20191224120709.18247-1-brgl@bgdev.pl>
 <20191224120709.18247-10-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224120709.18247-10-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 01:07:05PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The read_lock mutex is supposed to prevent collisions between reading
> and writing to the line event kfifo but it's actually only taken when
> the events are being read from it.
> 
> Drop the mutex entirely and reuse the spinlock made available to us in
> the waitqueue struct. Take the lock whenever the fifo is modified or
> inspected. Drop the call to kfifo_to_user() and instead first extract
> the new element from kfifo when the lock is taken and only then pass
> it on to the user after the spinlock is released.

Sounds like a plausible approach.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 64 +++++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 81d5eda4de7d..a859c0813e0d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -788,8 +788,6 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>   * @irq: the interrupt that trigger in response to events on this GPIO
>   * @wait: wait queue that handles blocking reads of events
>   * @events: KFIFO for the GPIO events
> - * @read_lock: mutex lock to protect reads from colliding with adding
> - * new events to the FIFO
>   * @timestamp: cache for the timestamp storing it between hardirq
>   * and IRQ thread, used to bring the timestamp close to the actual
>   * event
> @@ -802,7 +800,6 @@ struct lineevent_state {
>  	int irq;
>  	wait_queue_head_t wait;
>  	DECLARE_KFIFO(events, struct gpioevent_data, 16);
> -	struct mutex read_lock;
>  	u64 timestamp;
>  };
>  
> @@ -818,7 +815,7 @@ static __poll_t lineevent_poll(struct file *filep,
>  
>  	poll_wait(filep, &le->wait, wait);
>  
> -	if (!kfifo_is_empty(&le->events))
> +	if (!kfifo_is_empty_spinlocked_noirqsave(&le->events, &le->wait.lock))
>  		events = EPOLLIN | EPOLLRDNORM;
>  
>  	return events;
> @@ -831,43 +828,52 @@ static ssize_t lineevent_read(struct file *filep,
>  			      loff_t *f_ps)
>  {
>  	struct lineevent_state *le = filep->private_data;
> -	unsigned int copied;
> +	struct gpioevent_data event;
> +	ssize_t bytes_read = 0;
>  	int ret;
>  
> -	if (count < sizeof(struct gpioevent_data))
> +	if (count < sizeof(event))
>  		return -EINVAL;
>  
>  	do {
> +		spin_lock(&le->wait.lock);
>  		if (kfifo_is_empty(&le->events)) {
> -			if (filep->f_flags & O_NONBLOCK)
> +			if (bytes_read) {
> +				spin_unlock(&le->wait.lock);
> +				return bytes_read;
> +			}
> +
> +			if (filep->f_flags & O_NONBLOCK) {
> +				spin_unlock(&le->wait.lock);
>  				return -EAGAIN;
> +			}
>  
> -			ret = wait_event_interruptible(le->wait,
> +			ret = wait_event_interruptible_locked(le->wait,
>  					!kfifo_is_empty(&le->events));
> -			if (ret)
> +			if (ret) {
> +				spin_unlock(&le->wait.lock);
>  				return ret;
> +			}
>  		}
>  
> -		if (mutex_lock_interruptible(&le->read_lock))
> -			return -ERESTARTSYS;
> -		ret = kfifo_to_user(&le->events, buf, count, &copied);
> -		mutex_unlock(&le->read_lock);
> -
> -		if (ret)
> -			return ret;
> -
> -		/*
> -		 * If we couldn't read anything from the fifo (a different
> -		 * thread might have been faster) we either return -EAGAIN if
> -		 * the file descriptor is non-blocking, otherwise we go back to
> -		 * sleep and wait for more data to arrive.
> -		 */
> -		if (copied == 0 && (filep->f_flags & O_NONBLOCK))
> -			return -EAGAIN;
> +		ret = kfifo_out(&le->events, &event, 1);
> +		spin_unlock(&le->wait.lock);
> +		if (ret != 1) {
> +			/*
> +			 * This should never happen - we were holding the lock
> +			 * from the moment we learned the fifo is no longer
> +			 * empty until now.
> +			 */
> +			ret = -EIO;
> +			break;
> +		}
>  
> -	} while (copied == 0);
> +		if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
> +			return -EFAULT;
> +		bytes_read += sizeof(event);
> +	} while (count >= bytes_read + sizeof(event));
>  
> -	return copied;
> +	return bytes_read;
>  }
>  
>  static int lineevent_release(struct inode *inode, struct file *filep)
> @@ -969,7 +975,8 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
>  		return IRQ_NONE;
>  	}
>  
> -	ret = kfifo_put(&le->events, ge);
> +	ret = kfifo_in_spinlocked_noirqsave(&le->events, &ge,
> +					    1, &le->wait.lock);
>  	if (ret)
>  		wake_up_poll(&le->wait, EPOLLIN);
>  
> @@ -1084,7 +1091,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  
>  	INIT_KFIFO(le->events);
>  	init_waitqueue_head(&le->wait);
> -	mutex_init(&le->read_lock);
>  
>  	/* Request a thread to read the events */
>  	ret = request_threaded_irq(le->irq,
> -- 
> 2.23.0
> 

-- 
With Best Regards,
Andy Shevchenko


