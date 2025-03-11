Return-Path: <linux-gpio+bounces-17428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A56A5C311
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 14:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1C53B358D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 13:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D1E253B64;
	Tue, 11 Mar 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="RwdRgjPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp15.bhosted.nl (smtp15.bhosted.nl [94.124.121.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508B24EF97
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741701254; cv=none; b=DeWqnmmAX8j2W4MTqiyZEKlgOVV23xfqLRmoQCVH+QeTDcN3sMwK0AE/djvukNzX+GetI10vhkUUl3VMosfXCKwzrY6SND90I8JKknJ9mFdzjbadkzwBTWVPC5YPNY9PKa4XagO+TzOfFLL4s87FmqPM4nI7DU66oodBcx8sN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741701254; c=relaxed/simple;
	bh=AGcHUb372Qb4xp3PIIbgqrFpbsdhvyHF+3MvUWkEIUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VxeRRmuHaKOKGxXJObvd4kIfzFnXm5otZTQIMUxZORnmhiBKTIeyW65kVi1G5g9uO1N0W3e4dLnADQybG51W7W97v+4p57hSZsG9fW7teGMVUMx0fAPOsQ4yw2V2Q16amw9W+W/iGyOS4+iiCAC/KSolvHywNjzCyAmvW8qhiPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=RwdRgjPw; arc=none smtp.client-ip=94.124.121.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=xus23xtK3M/qRjR6KMXHiICpWAcFs8WV4zaduJRJqis=;
	b=RwdRgjPw84rYbU0uTbR5bXlPAUGBNjN0JVROqGEG+jZACXgHamTSYK22FqvqEXyMXbYLeGPp7r71v
	 UVDxvkIaqvmG+ofG70jSoQ7Cr8QS3HZo6zc/rcxe+Wy8tQo5Ucmbhp/fvQeU5CiTMVnUKHHN/D/OA1
	 dTUybv0heA5IJbWYz4KfXpZguGUFOy3nZ3j5IiGjdmGGjOX9MtBW7cB1k9NJUsV7hyZKUNTuKGaLkg
	 qKDByLICJDRTBCi8EI1hgKjBmsAA8nQGfe9NmEUq7IKvbMwjgNMSWkYOzy1HKj6BWC7DMGRdiHLLuE
	 bbvyyXZd3XPpO/PYw1hUr8mlqedJf6A==
X-MSG-ID: 4da3203a-fe80-11ef-a3a3-00505681446f
Date: Tue, 11 Mar 2025 14:54:07 +0100
From: David Jander <david@protonic.nl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT] gpio: cdev: use raw notifier
Message-ID: <20250311145407.7e05b5d9@erd003.prtnl>
In-Reply-To: <20250311-gpiolib-line-state-raw-notifier-v1-1-d0fa44fd67cc@linaro.org>
References: <20250311-gpiolib-line-state-raw-notifier-v1-1-d0fa44fd67cc@linaro.org>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Mar 2025 14:19:40 +0100
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Atomic notifiers call rcu_synchronize() in
> atomic_notifier_chain_unregister() causing a considerable delay in some
> circumstances. Replace the atomic notifier with the raw variant and
> provide synchronization with a read-write spinlock.
> 
> Fixes: fcc8b637c542 ("gpiolib: switch the line state notifier to atomic")
> Reported-by: David Jander <david@protonic.nl>
> Closes: https://lore.kernel.org/all/20250311110034.53959031@erd003.prtnl/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 15 +++++++++------
>  drivers/gpio/gpiolib.c      |  8 +++++---
>  drivers/gpio/gpiolib.h      |  5 ++++-
>  3 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 40f76a90fd7d..107d75558b5a 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2729,8 +2729,9 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
>  	cdev->gdev = gpio_device_get(gdev);
>  
>  	cdev->lineinfo_changed_nb.notifier_call = lineinfo_changed_notify;
> -	ret = atomic_notifier_chain_register(&gdev->line_state_notifier,
> -					     &cdev->lineinfo_changed_nb);
> +	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
> +		ret = raw_notifier_chain_register(&gdev->line_state_notifier,
> +						  &cdev->lineinfo_changed_nb);
>  	if (ret)
>  		goto out_free_bitmap;
>  
> @@ -2754,8 +2755,9 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
>  	blocking_notifier_chain_unregister(&gdev->device_notifier,
>  					   &cdev->device_unregistered_nb);
>  out_unregister_line_notifier:
> -	atomic_notifier_chain_unregister(&gdev->line_state_notifier,
> -					 &cdev->lineinfo_changed_nb);
> +	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
> +		raw_notifier_chain_unregister(&gdev->line_state_notifier,
> +					      &cdev->lineinfo_changed_nb);
>  out_free_bitmap:
>  	gpio_device_put(gdev);
>  	bitmap_free(cdev->watched_lines);
> @@ -2779,8 +2781,9 @@ static int gpio_chrdev_release(struct inode *inode, struct file *file)
>  
>  	blocking_notifier_chain_unregister(&gdev->device_notifier,
>  					   &cdev->device_unregistered_nb);
> -	atomic_notifier_chain_unregister(&gdev->line_state_notifier,
> -					 &cdev->lineinfo_changed_nb);
> +	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
> +		raw_notifier_chain_unregister(&gdev->line_state_notifier,
> +					      &cdev->lineinfo_changed_nb);
>  	bitmap_free(cdev->watched_lines);
>  	gpio_device_put(gdev);
>  	kfree(cdev);
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e5eb3f0ee071..b8197502a5ac 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1075,7 +1075,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  		}
>  	}
>  
> -	ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
> +	rwlock_init(&gdev->line_state_lock);
> +	RAW_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
>  
>  	ret = init_srcu_struct(&gdev->srcu);
> @@ -4361,8 +4362,9 @@ EXPORT_SYMBOL_GPL(gpiod_set_array_value_cansleep);
>  
>  void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action)
>  {
> -	atomic_notifier_call_chain(&desc->gdev->line_state_notifier,
> -				   action, desc);
> +	guard(read_lock_irqsave)(&desc->gdev->line_state_lock);
> +
> +	raw_notifier_call_chain(&desc->gdev->line_state_notifier, action, desc);
>  }
>  
>  /**
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index a738e6c647d8..58f64056de77 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -16,6 +16,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
> +#include <linux/spinlock.h>
>  #include <linux/srcu.h>
>  #include <linux/workqueue.h>
>  
> @@ -47,6 +48,7 @@
>   * @list: links gpio_device:s together for traversal
>   * @line_state_notifier: used to notify subscribers about lines being
>   *                       requested, released or reconfigured
> + * @line_state_lock: RW-spinlock protecting the line state notifier
>   * @line_state_wq: used to emit line state events from a separate thread in
>   *                 process context
>   * @device_notifier: used to notify character device wait queues about the GPIO
> @@ -75,7 +77,8 @@ struct gpio_device {
>  	const char		*label;
>  	void			*data;
>  	struct list_head        list;
> -	struct atomic_notifier_head line_state_notifier;
> +	struct raw_notifier_head line_state_notifier;
> +	rwlock_t		line_state_lock;
>  	struct workqueue_struct	*line_state_wq;
>  	struct blocking_notifier_head device_notifier;
>  	struct srcu_struct	srcu;
> 
> ---
> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
> change-id: 20250311-gpiolib-line-state-raw-notifier-70c1ad3e99eb
> 
> Best regards,

Tested-by: David Jander <david@protonic.nl>

Thanks!

Seems to work correctly under some basic testing.

$ time gpiofind LPOUT0
gpiochip7 9
real    0m 0.02s
user    0m 0.00s
sys     0m 0.01s

$ time gpiodetect
gpiochip0 [GPIOA] (16 lines)
gpiochip1 [GPIOB] (16 lines)
gpiochip10 [GPIOK] (8 lines)
gpiochip11 [GPIOZ] (8 lines)
gpiochip12 [unknown] (22 lines)
gpiochip13 [mcp23s17.0] (16 lines)
gpiochip14 [0-0020] (16 lines)
gpiochip15 [0-0021] (16 lines)
gpiochip2 [GPIOC] (16 lines)
gpiochip3 [GPIOD] (16 lines)
gpiochip4 [GPIOE] (16 lines)
gpiochip5 [GPIOF] (16 lines)
gpiochip6 [GPIOG] (16 lines)
gpiochip7 [GPIOH] (16 lines)
gpiochip8 [GPIOI] (16 lines)
gpiochip9 [GPIOJ] (16 lines)
real    0m 0.03s
user    0m 0.00s
sys     0m 0.01s

Best regards,

-- 
David Jander

