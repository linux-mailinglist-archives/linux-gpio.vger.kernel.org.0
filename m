Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A77D10B25C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 16:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfK0PYS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 10:24:18 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34187 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0PYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 10:24:18 -0500
Received: by mail-pj1-f65.google.com with SMTP id bo14so10153826pjb.1;
        Wed, 27 Nov 2019 07:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y06sDd7nBt7g+f5VdCmd7T/y1VGrjxlKuQQXHHujB2c=;
        b=VeGfDUkTAHEYaBRkhkFEyFi/2LhrfInpM7E6KQ4VEdRAP1FYfk2YndYch3UWZLIzck
         VKAFpNqLXlNeLXVT0yF78KWpbUxdrePb07EyG5Rs+lc/J3gRDgi4Oi0kakkVNwfA/CwA
         V7MC6DpaffnY4eKPQ5ZLud8n11hmWR+iSvKAlrQLVPuofblKpCB4P0VohHLcTZnkko9S
         GaqIgaZSAP2NUukid6g9xEzhphssJjwltYM11G2C7F12cE1HM5Ap3bJ0m+PtTDYJjTy6
         5VAnDOQlhpHEjcpyuexzWFiYad0c3zBHsGVWVOvGZ1mIkxfDDZhoQn4ck0kB9ghCD2Cr
         pqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y06sDd7nBt7g+f5VdCmd7T/y1VGrjxlKuQQXHHujB2c=;
        b=Oc8IusHTPYy6NfnUmG6gD2gChJcuum0eI/TuSJWIk8vEpCJcYTWT/C86lFTJ9F0fhl
         AcrXpcNiFVYM36lSJyQM/JHpsYJZ+GhSg4xKvS75PKxpZgVU5DzZGNHi6Zm1Kt9cJNFr
         rbjlEkEBbmk2uG25iILJNSO67S/q7OPeuh24GHio6fj5S+etmYBy9QftYVou44mN1KY5
         ADukN0tV5Z7YsWcv1kOakK1AggENDZ+n7Zl8B1HPdBfZ8CzFJxceGx97UqQHfaTA3TTu
         laVXozjZ5VuEX+kyj/oplbhiigzsVJFLEjmfpzJB37fdGDxsWVg6v9FenfyWbB9l42BU
         neiw==
X-Gm-Message-State: APjAAAWXddhy8g84KXjMOw3yejNuTZrktwFgDm30jWU6ALTyOiWMVXm8
        w/XekvH6ysz7POrsIPUMKO8=
X-Google-Smtp-Source: APXvYqxDtBFdYtvo680ydWvFs485NzVKtDNed0pS6zL6ZuCCWHx1LgnqSukDE7OA57B2yvSwgaFZnw==
X-Received: by 2002:a17:902:900b:: with SMTP id a11mr4553187plp.116.1574868256669;
        Wed, 27 Nov 2019 07:24:16 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id v26sm17203797pfm.126.2019.11.27.07.24.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 07:24:15 -0800 (PST)
Date:   Wed, 27 Nov 2019 23:24:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 7/8] gpiolib: add new ioctl() for monitoring changes in
 line info
Message-ID: <20191127152410.GA24936@sol>
References: <20191127133510.10614-1-brgl@bgdev.pl>
 <20191127133510.10614-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127133510.10614-8-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 02:35:09PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
> 
> This patch adds a new ioctl() that allows user-space processes to retrieve
> a file-descriptor for given GPIO lines which can be polled for line status
> change events.
> 
> Currently the events are generated on three types of status changes: when
> a line is requested, when it's released and when its config is changed.
> The first two are self-explanatory. For the third one: this will only
> happen when another user-space process calls the new SET_CONFIG ioctl()
> as any changes that can happen from within the kernel (i.e.
> set_transitory() or set_debounce()) are of no interest to user-space.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c    | 218 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.h    |   1 +
>  include/uapi/linux/gpio.h |  36 +++++++
>  3 files changed, 255 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index d094b1be334d..be5df4bdf44b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -547,6 +547,9 @@ static long linehandle_set_config(struct linehandle_state *lh,
>  			if (ret)
>  				return ret;
>  		}
> +
> +		atomic_notifier_call_chain(&desc->gdev->notifier,
> +					   GPIOLINE_CHANGED_CONFIG, desc);
>  	}
>  	return 0;
>  }
> @@ -1148,6 +1151,212 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>  	return ret;
>  }
>  
> +struct linechanged_fd_state {
> +	struct gpio_device *gdev;
> +	struct gpio_desc *descs[GPIOHANDLES_MAX];
> +	size_t numdescs;
> +	wait_queue_head_t waitqueue;
> +	DECLARE_KFIFO(events, struct gpioline_changed, 16);
> +	struct mutex lock;
> +	struct notifier_block changed_nb;
> +};
> +
> +static int linechanged_fd_release(struct inode *inode, struct file *filep)
> +{
> +	struct linechanged_fd_state *lc_state = filep->private_data;
> +
> +	atomic_notifier_chain_unregister(&lc_state->gdev->notifier,
> +					 &lc_state->changed_nb);
> +	put_device(&lc_state->gdev->dev);
> +	kfree(lc_state);
> +
> +	return 0;
> +}
> +
> +static __poll_t linechanged_fd_poll(struct file *filep,
> +				    struct poll_table_struct *pollt)
> +{
> +	struct linechanged_fd_state *lc_state = filep->private_data;
> +	__poll_t events = 0;
> +
> +	poll_wait(filep, &lc_state->waitqueue, pollt);
> +
> +	mutex_lock(&lc_state->lock);
> +	if (!kfifo_is_empty(&lc_state->events))
> +		events = EPOLLIN | EPOLLRDNORM;
> +	mutex_unlock(&lc_state->lock);
> +
> +	return events;
> +}
> +
> +static ssize_t linechanged_fd_read(struct file *filep, char __user *buf,
> +				   size_t count, loff_t *off)
> +{
> +	struct linechanged_fd_state *lc_state = filep->private_data;
> +	unsigned int copied;
> +	int ret;
> +
> +	if (count < sizeof(struct gpioline_changed))
> +		return -EINVAL;
> +
> +	do {
> +		mutex_lock(&lc_state->lock);
> +		if (kfifo_is_empty(&lc_state->events)) {
> +			mutex_unlock(&lc_state->lock);
> +			if (filep->f_flags & O_NONBLOCK)
> +				return -EAGAIN;
> +
> +			ret = wait_event_interruptible(lc_state->waitqueue,
> +					!kfifo_is_empty(&lc_state->events));
> +			if (ret)
> +				return ret;
> +		} else {
> +			mutex_unlock(&lc_state->lock);
> +		}
> +
> +		if (mutex_lock_interruptible(&lc_state->lock))
> +			return -ERESTARTSYS;
> +
> +		ret = kfifo_to_user(&lc_state->events, buf, count, &copied);
> +		mutex_unlock(&lc_state->lock);
> +		if (ret)
> +			return ret;
> +
> +		if (copied == 0 && (filep->f_flags & O_NONBLOCK))
> +			return -EAGAIN;
> +	} while (copied == 0);
> +
> +	return copied;
> +}
> +
> +static const struct file_operations linechanged_fd_fileops = {
> +	.release = linechanged_fd_release,
> +	.owner = THIS_MODULE,
> +	.llseek = noop_llseek,
> +	.poll = linechanged_fd_poll,
> +	.read = linechanged_fd_read,
> +};
> +
> +static struct linechanged_fd_state *
> +to_linechanged_fd_state(struct notifier_block *nb)
> +{
> +	return container_of(nb, struct linechanged_fd_state, changed_nb);
> +}
> +
> +static int linechanged_fd_notify(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct linechanged_fd_state *lc_state = to_linechanged_fd_state(nb);
> +	struct gpio_desc *desc = data;
> +	struct gpioline_changed chg;
> +	int i, ret;
> +
> +	for (i = 0; i < lc_state->numdescs; i++) {
> +		/* Are we watching this desc? */
> +		if (desc == lc_state->descs[i]) {
> +			/* Yes - prepare the event. */
> +			memset(&chg, 0, sizeof(chg));
> +			chg.line_offset = gpio_chip_hwgpio(desc);
> +			chg.event_type = action;
> +
> +			mutex_lock(&lc_state->lock);
> +			ret = kfifo_put(&lc_state->events, chg);
> +			mutex_unlock(&lc_state->lock);
> +			if (ret)
> +				wake_up_poll(&lc_state->waitqueue, EPOLLIN);
> +
> +			return NOTIFY_OK;
> +		}
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int linechanged_fd_create(struct gpio_device *gdev, void __user *ip)
> +{
> +	struct gpioline_changed_fd_request changed_req;
> +	struct linechanged_fd_state *lc_state;
> +	struct gpio_desc *desc;
> +	struct file *file;
> +	int ret, i, fd;
> +	u32 offset;
> +
> +	ret = copy_from_user(&changed_req, ip, sizeof(changed_req));
> +	if (ret)
> +		return -EFAULT;
> +
> +	if ((changed_req.num_lines == 0) ||
> +	    (changed_req.num_lines > GPIOHANDLES_MAX))
> +		return -EINVAL;
> +
> +	lc_state = kzalloc(sizeof(*lc_state), GFP_KERNEL);
> +	if (!lc_state)
> +		return -ENOMEM;
> +
> +	lc_state->gdev = gdev;
> +	get_device(&gdev->dev);
> +
> +	for (i = 0; i < changed_req.num_lines; i++) {
> +		offset = changed_req.lineoffsets[i];
> +		desc = gpiochip_get_desc(gdev->chip, offset);
> +		if (IS_ERR(desc)) {
> +			ret = PTR_ERR(desc);
> +			goto out_free_lc_state;
> +		}
> +
> +		lc_state->descs[i] = desc;
> +	}
> +
> +	lc_state->numdescs = changed_req.num_lines;
> +
> +	init_waitqueue_head(&lc_state->waitqueue);
> +	INIT_KFIFO(lc_state->events);
> +	mutex_init(&lc_state->lock);
> +
> +	lc_state->changed_nb.notifier_call = linechanged_fd_notify;
> +
> +	ret = atomic_notifier_chain_register(&gdev->notifier,
> +					     &lc_state->changed_nb);
> +	if (ret)
> +		goto out_free_lc_state;
> +
> +	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> +	if (fd < 0) {
> +		ret = fd;
> +		goto out_unregister_notifier;
> +	}
> +
> +	file = anon_inode_getfile("gpio-line-changed-fd",
> +				  &linechanged_fd_fileops,
> +				  lc_state, O_RDONLY | O_CLOEXEC);
> +	if (IS_ERR(file)) {
> +		ret = PTR_ERR(file);
> +		goto out_put_unused_fd;
> +	}
> +
> +	changed_req.fd = fd;
> +	ret = copy_to_user(ip, &changed_req, sizeof(changed_req));
> +	if (ret) {
> +		fput(file);
> +		put_unused_fd(fd);
> +		return -EFAULT;
> +	}
> +
> +	fd_install(fd, file);
> +
> +	return 0;
> +
> +out_put_unused_fd:
> +	put_unused_fd(fd);
> +out_unregister_notifier:
> +	atomic_notifier_chain_unregister(&gdev->notifier,
> +					 &lc_state->changed_nb);
> +out_free_lc_state:
> +	kfree(lc_state);
> +
> +	return ret;
> +}
> +
>  /*
>   * gpio_ioctl() - ioctl handler for the GPIO chardev
>   */
> @@ -1238,6 +1447,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return linehandle_create(gdev, ip);
>  	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
>  		return lineevent_create(gdev, ip);
> +	} else if (cmd == GPIO_GET_LINECHANGED_FD_IOCTL) {
> +		return linechanged_fd_create(gdev, ip);
>  	}
>  	return -EINVAL;
>  }
> @@ -1499,6 +1710,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>  	for (i = 0; i < chip->ngpio; i++)
>  		gdev->descs[i].gdev = gdev;
>  
> +	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> +
>  #ifdef CONFIG_PINCTRL
>  	INIT_LIST_HEAD(&gdev->pin_ranges);
>  #endif
> @@ -2837,6 +3050,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
>  		spin_lock_irqsave(&gpio_lock, flags);
>  	}
>  done:
> +	atomic_notifier_call_chain(&desc->gdev->notifier,
> +				   GPIOLINE_CHANGED_REQUESTED, desc);
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  	return ret;
>  }
> @@ -2934,6 +3149,8 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>  		ret = true;
>  	}
>  
> +	atomic_notifier_call_chain(&desc->gdev->notifier,
> +				   GPIOLINE_CHANGED_RELEASED, desc);
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  	return ret;
>  }
> @@ -3097,6 +3314,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
>  		if (ret != -ENOTSUPP)
>  			return ret;
>  	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index a1cbeabadc69..8e3969616cfe 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -54,6 +54,7 @@ struct gpio_device {
>  	const char		*label;
>  	void			*data;
>  	struct list_head        list;
> +	struct atomic_notifier_head notifier;
>  
>  #ifdef CONFIG_PINCTRL
>  	/*
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 799cf823d493..c61429467dd4 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -59,6 +59,40 @@ struct gpioline_info {
>  /* Maximum number of requested handles */
>  #define GPIOHANDLES_MAX 64
>  
> +/**
> + * struct gpioline_changed_fd_request - Information about a linechanged fd
> + * request
> + * @lineoffsets: an array of desired lines, specified by offset index for the
> + * associated GPIO device
> + * @num_lines: number of lines requested in this request, i.e. the number of
> + * valid fields in the above arrays, set to 1 to request a single line
> + * @fd: if successful this field will contain a valid anonymous file handle
> + */
> +struct gpioline_changed_fd_request {
> +	__u32 lineoffsets[GPIOHANDLES_MAX];
> +	__u32 num_lines;
> +	int fd;
> +};
> +

Wouldn't the most common case be to watch all the lines on a chip?
How about an easy way to do that, say num_lines=0?

> +/* Possible line status change events */
> +enum {
> +	GPIOLINE_CHANGED_REQUESTED = 1,
> +	GPIOLINE_CHANGED_RELEASED,
> +	GPIOLINE_CHANGED_CONFIG,
> +};
> +
> +/**
> + * struct gpioline_changed - Information about a change in status
> + * of a GPIO line
> + * @line_offset: offset of the line that changed relative to the gpiochip
> + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> + * and GPIOLINE_CHANGED_CONFIG
> + */
> +struct gpioline_changed {
> +	__u32 line_offset;
> +	__u32 event_type;
> +};
> +

Rather than sending an event type, and requiring userspace to poll
LINEINFO, which is racy, how about passing the updated info flags here?
A change in the state of the GPIOLINE_FLAG_KERNEL implies the
GPIOLINE_CHANGED_REQUESTED or GPIOLINE_CHANGED_RELEASED, so the
event_type is then redundant.
Userspace would then only have to poll LINEINFO if they were interested
in the consumer on GPIOLINE_CHANGED_REQUESTED.

To sync kernel and userspace state the current state of each line 
should be returned immediately via the fd as soon as the fd is created,
and then subsequently on any change.

And a timestamp might be useful, as per gpioevent_data?

Kent.

>  /* Linerequest flags */
>  #define GPIOHANDLE_REQUEST_INPUT	(1UL << 0)
>  #define GPIOHANDLE_REQUEST_OUTPUT	(1UL << 1)
> @@ -176,6 +210,8 @@ struct gpioevent_data {
>  
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
>  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> +#define GPIO_GET_LINECHANGED_FD_IOCTL \
> +		_IOWR(0xB4, 0x0b, struct gpioline_changed_fd_request)
>  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
>  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
>  
> -- 
> 2.23.0
> 
