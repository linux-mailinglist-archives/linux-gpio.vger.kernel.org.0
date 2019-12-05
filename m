Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 616C2113FA1
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 11:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbfLEKrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 05:47:35 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34736 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbfLEKrf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2019 05:47:35 -0500
Received: by mail-pl1-f196.google.com with SMTP id h13so1109373plr.1;
        Thu, 05 Dec 2019 02:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gk6TblHVVrg9Cpc/xHxeB9rnv+iljuF8odgalkwRB/k=;
        b=Vnt4TGefqBqXWOMrSc0EIBLaU3txO5yVQ+E22FATz2hInSOlSBPVqxuFXbHHC/38Zf
         ktrqrIsY3S+sYEH+YY3U0KHJcfNYCz63EgJ9XFxrkZDX8wuWqpzSNgEEU5P4oj4xcvJ/
         OGYqo96wo+vX49QrnmRkHlMP2DhpeqxkFZ8yqTSItf8vr29Xez8ecMyGFs/OeOao+s3G
         sCucPle4EL8pjcPDWc7+mUCx3L7Rbj/DPgPIkyokNZDBqEnufHhfEitZsD7ynZWh75Q9
         YUYfsU5jrIofsP9nY7VW6z7LlcEwvMcROF3iAWoZdFjPHvrvb0Rvok9qQd8pA/IVf7YK
         OwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gk6TblHVVrg9Cpc/xHxeB9rnv+iljuF8odgalkwRB/k=;
        b=XzpOimTGvrWNPTrzo3zhaNdRIjz2jZqNqpqyvGwcVmqLzNGtH0EHyb28FKlyzw09Ow
         Hl//7DrYttxpL6v2tddG+JN9LDE9RSfCv1q6JuXGwyhrjq3UneJpG00erEBBKI/P8uB+
         5vbvhjUL2OuLuLDeMnV7F0Qc+ONSETqSJG97w1zfRZk89r/LqVHN2tfNgcLWAU9mdsbu
         7ssUXg3D8mrC1qf6EJZnxiQNwpvR8Rj7HUoSwDpESdP+xmEbn5B8D5zBgYmHl3phlAM4
         n21sW0LYbDyb1VGBAT6Pa1j3yDn1jUb4tccM7r4EKw/PYZ4gjZ2tDxCWd/SQic2s+r1T
         0vZA==
X-Gm-Message-State: APjAAAV58vuZx3U23/Q8pubzGlrBw6jEIfM0NPXtzAJi9ByMnU9+3uFt
        kXz4gM3CX7S47ViK6X2fG+E=
X-Google-Smtp-Source: APXvYqwIwHOsXHimhVrPGpJRhNXaqSVw8lm5Imo+eNludoaSvkWFrhjE8Qtf1FqG/UeFtobUwWYgxw==
X-Received: by 2002:a17:902:7c83:: with SMTP id y3mr8368505pll.34.1575542854334;
        Thu, 05 Dec 2019 02:47:34 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id 24sm8604991pfn.101.2019.12.05.02.47.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 02:47:33 -0800 (PST)
Date:   Thu, 5 Dec 2019 18:47:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 10/11] gpiolib: add new ioctl() for monitoring changes
 in line info
Message-ID: <20191205104728.GA9443@sol>
References: <20191204155941.17814-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204155941.17814-1-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 04, 2019 at 04:59:40PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
> 
> This patch adds a new ioctl() that allows user-space processes to reuse
> the file descriptor associated with the character device for watching
> any changes in line properties. Every such event contains the updated
> line information.
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
>  drivers/gpio/gpiolib.c    | 177 ++++++++++++++++++++++++++++++++++++--
>  drivers/gpio/gpiolib.h    |   2 +
>  include/uapi/linux/gpio.h |  24 ++++++
>  3 files changed, 195 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 711963aa9239..2ff15ef0bbe0 100644
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
> @@ -1199,14 +1202,24 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  }
>  
> +struct gpio_chardev_data {
> +	struct gpio_device *gdev;
> +	wait_queue_head_t wait;
> +	DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
> +	struct notifier_block lineinfo_changed_nb;
> +};
> +
>  /*
>   * gpio_ioctl() - ioctl handler for the GPIO chardev
>   */
>  static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
> -	struct gpio_device *gdev = filp->private_data;
> +	struct gpio_chardev_data *priv = filp->private_data;
> +	struct gpio_device *gdev = priv->gdev;
>  	struct gpio_chip *chip = gdev->chip;
>  	void __user *ip = (void __user *)arg;
> +	struct gpio_desc *desc;
> +	__u32 offset;
>  
>  	/* We fail any subsequent ioctl():s when the chip is gone */
>  	if (!chip)
> @@ -1228,9 +1241,9 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
>  			return -EFAULT;
>  		return 0;
> -	} else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
> +	} else if (cmd == GPIO_GET_LINEINFO_IOCTL ||
> +		   cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
>  		struct gpioline_info lineinfo;
> -		struct gpio_desc *desc;
>  
>  		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>  			return -EFAULT;
> @@ -1243,11 +1256,25 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  
>  		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>  			return -EFAULT;
> +
> +		if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL)
> +			set_bit(FLAG_WATCHED, &desc->flags);
> +

The WATCHED flag is stored globally in the gdev->descs?
Shouldn't it be stored in struct gpio_chardev_data?
Otherwise I can open the chip and disable your watches.

Kent.


>  		return 0;
>  	} else if (cmd == GPIO_GET_LINEHANDLE_IOCTL) {
>  		return linehandle_create(gdev, ip);
>  	} else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
>  		return lineevent_create(gdev, ip);
> +	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
> +		if (copy_from_user(&offset, ip, sizeof(offset)))
> +			return -EFAULT;
> +
> +		desc = gpiochip_get_desc(chip, offset);
> +		if (IS_ERR(desc))
> +			return PTR_ERR(desc);
> +
> +		clear_bit(FLAG_WATCHED, &desc->flags);
> +		return 0;
>  	}
>  	return -EINVAL;
>  }
> @@ -1260,6 +1287,99 @@ static long gpio_ioctl_compat(struct file *filp, unsigned int cmd,
>  }
>  #endif
>  
> +static struct gpio_chardev_data *
> +to_gpio_chardev_data(struct notifier_block *nb)
> +{
> +	return container_of(nb, struct gpio_chardev_data, lineinfo_changed_nb);
> +}
> +
> +static int lineinfo_changed_notify(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct gpio_chardev_data *priv = to_gpio_chardev_data(nb);
> +	struct gpioline_info_changed chg;
> +	struct gpio_desc *desc = data;
> +	int ret = NOTIFY_DONE;
> +
> +	if (test_bit(FLAG_WATCHED, &desc->flags)) {
> +		memset(&chg, 0, sizeof(chg));
> +		chg.info.line_offset = gpio_chip_hwgpio(desc);
> +		chg.event_type = action;
> +		chg.timestamp = ktime_get_real_ns();
> +		gpio_desc_to_lineinfo(desc, &chg.info);
> +
> +		ret = kfifo_in_spinlocked(&priv->events, &chg,
> +					  1, &priv->wait.lock);
> +		if (ret)
> +			wake_up_poll(&priv->wait, EPOLLIN);
> +		else
> +			pr_debug_ratelimited(
> +				"%s: lineinfo event FIFO is full - event dropped\n",
> +				__func__);
> +
> +		ret = NOTIFY_OK;
> +	}
> +
> +	return ret;
> +}
> +
> +static __poll_t lineinfo_watch_poll(struct file *filep,
> +				    struct poll_table_struct *pollt)
> +{
> +	struct gpio_chardev_data *priv = filep->private_data;
> +	__poll_t events = 0;
> +
> +	poll_wait(filep, &priv->wait, pollt);
> +
> +	spin_lock(&priv->wait.lock);
> +	if (!kfifo_is_empty(&priv->events))
> +		events = EPOLLIN | EPOLLRDNORM;
> +	spin_unlock(&priv->wait.lock);
> +
> +	return events;
> +}
> +
> +static ssize_t lineinfo_watch_read(struct file *filep, char __user *buf,
> +				   size_t count, loff_t *off)
> +{
> +	struct gpio_chardev_data *priv = filep->private_data;
> +	struct gpioline_info_changed event;
> +	int ret;
> +
> +	if (count < sizeof(event))
> +		return -EINVAL;
> +
> +	for (;;) {
> +		spin_lock(&priv->wait.lock);
> +		if (kfifo_is_empty(&priv->events)) {
> +			if (filep->f_flags & O_NONBLOCK) {
> +				spin_unlock(&priv->wait.lock);
> +				return -EAGAIN;
> +			}
> +
> +			ret = wait_event_interruptible_locked(priv->wait,
> +					!kfifo_is_empty(&priv->events));
> +			if (ret) {
> +				spin_unlock(&priv->wait.lock);
> +				return ret;
> +			}
> +		}
> +
> +		ret = kfifo_out(&priv->events, &event, 1);
> +		spin_unlock(&priv->wait.lock);
> +		if (ret == 1)
> +			break;
> +
> +		/* We should never get here. See lineevent_read(). */
> +	}
> +
> +	ret = copy_to_user(buf, &event, sizeof(event));
> +	if (ret)
> +		return -EFAULT;
> +
> +	return sizeof(event);
> +}
> +
>  /**
>   * gpio_chrdev_open() - open the chardev for ioctl operations
>   * @inode: inode for this chardev
> @@ -1270,14 +1390,42 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
>  {
>  	struct gpio_device *gdev = container_of(inode->i_cdev,
>  					      struct gpio_device, chrdev);
> +	struct gpio_chardev_data *priv;
> +	int ret;
>  
>  	/* Fail on open if the backing gpiochip is gone */
>  	if (!gdev->chip)
>  		return -ENODEV;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	init_waitqueue_head(&priv->wait);
> +	INIT_KFIFO(priv->events);
> +	priv->gdev = gdev;
> +
> +	priv->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
> +	ret = atomic_notifier_chain_register(&gdev->notifier,
> +					     &priv->lineinfo_changed_nb);
> +	if (ret)
> +		goto out_free_priv;
> +
>  	get_device(&gdev->dev);
> -	filp->private_data = gdev;
> +	filp->private_data = priv;
> +
> +	ret = nonseekable_open(inode, filp);
> +	if (ret)
> +		goto out_unregister_notifier;
>  
> -	return nonseekable_open(inode, filp);
> +	return ret;
> +
> +out_unregister_notifier:
> +	atomic_notifier_chain_unregister(&gdev->notifier,
> +					 &priv->lineinfo_changed_nb);
> +out_free_priv:
> +	kfree(priv);
> +	return ret;
>  }
>  
>  /**
> @@ -1288,17 +1436,22 @@ static int gpio_chrdev_open(struct inode *inode, struct file *filp)
>   */
>  static int gpio_chrdev_release(struct inode *inode, struct file *filp)
>  {
> -	struct gpio_device *gdev = container_of(inode->i_cdev,
> -					      struct gpio_device, chrdev);
> +	struct gpio_chardev_data *priv = filp->private_data;
> +	struct gpio_device *gdev = priv->gdev;
>  
> +	atomic_notifier_chain_unregister(&gdev->notifier,
> +					 &priv->lineinfo_changed_nb);
>  	put_device(&gdev->dev);
> +	kfree(priv);
> +
>  	return 0;
>  }
>  
> -
>  static const struct file_operations gpio_fileops = {
>  	.release = gpio_chrdev_release,
>  	.open = gpio_chrdev_open,
> +	.poll = lineinfo_watch_poll,
> +	.read = lineinfo_watch_read,
>  	.owner = THIS_MODULE,
>  	.llseek = no_llseek,
>  	.unlocked_ioctl = gpio_ioctl,
> @@ -1509,6 +1662,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>  	for (i = 0; i < chip->ngpio; i++)
>  		gdev->descs[i].gdev = gdev;
>  
> +	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->notifier);
> +
>  #ifdef CONFIG_PINCTRL
>  	INIT_LIST_HEAD(&gdev->pin_ranges);
>  #endif
> @@ -2848,6 +3003,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
>  	}
>  done:
>  	spin_unlock_irqrestore(&gpio_lock, flags);
> +	atomic_notifier_call_chain(&desc->gdev->notifier,
> +				   GPIOLINE_CHANGED_REQUESTED, desc);
>  	return ret;
>  }
>  
> @@ -2945,6 +3102,9 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
>  	}
>  
>  	spin_unlock_irqrestore(&gpio_lock, flags);
> +	atomic_notifier_call_chain(&desc->gdev->notifier,
> +				   GPIOLINE_CHANGED_RELEASED, desc);
> +
>  	return ret;
>  }
>  
> @@ -3107,6 +3267,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
>  		if (ret != -ENOTSUPP)
>  			return ret;
>  	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index a1cbeabadc69..4fca77241fb0 100644
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
> @@ -112,6 +113,7 @@ struct gpio_desc {
>  #define FLAG_PULL_UP    13	/* GPIO has pull up enabled */
>  #define FLAG_PULL_DOWN  14	/* GPIO has pull down enabled */
>  #define FLAG_BIAS_DISABLE    15	/* GPIO has pull disabled */
> +#define FLAG_WATCHED	16	/* GPIO line is being watched by user-space */
>  
>  	/* Connection label */
>  	const char		*label;
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 799cf823d493..2401028ae7de 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -59,6 +59,28 @@ struct gpioline_info {
>  /* Maximum number of requested handles */
>  #define GPIOHANDLES_MAX 64
>  
> +/* Possible line status change events */
> +enum {
> +	GPIOLINE_CHANGED_REQUESTED = 1,
> +	GPIOLINE_CHANGED_RELEASED,
> +	GPIOLINE_CHANGED_CONFIG,
> +};
> +
> +/**
> + * struct gpioline_info_changed - Information about a change in status
> + * of a GPIO line
> + * @timestamp: estimate of time of status change occurrence, in nanoseconds
> + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> + * and GPIOLINE_CHANGED_CONFIG
> + * @info: updated line information
> + */
> +struct gpioline_info_changed {
> +	__u64 timestamp;
> +	__u32 event_type;
> +	struct gpioline_info info;
> +	__u32 padding[4]; /* for future use */
> +};
> +
>  /* Linerequest flags */
>  #define GPIOHANDLE_REQUEST_INPUT	(1UL << 0)
>  #define GPIOHANDLE_REQUEST_OUTPUT	(1UL << 1)
> @@ -176,6 +198,8 @@ struct gpioevent_data {
>  
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
>  #define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
> +#define GPIO_GET_LINEINFO_WATCH_IOCTL _IOWR(0xB4, 0x0b, struct gpioline_info)
> +#define GPIO_GET_LINEINFO_UNWATCH_IOCTL _IOWR(0xB4, 0x0c, __u32)
>  #define GPIO_GET_LINEHANDLE_IOCTL _IOWR(0xB4, 0x03, struct gpiohandle_request)
>  #define GPIO_GET_LINEEVENT_IOCTL _IOWR(0xB4, 0x04, struct gpioevent_request)
>  
> -- 
> 2.23.0
> 
