Return-Path: <linux-gpio+bounces-6193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA58BE5D0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 16:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C7EC1C2218D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 14:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA0D15FCF5;
	Tue,  7 May 2024 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tj8C9NPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15A15F417;
	Tue,  7 May 2024 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091854; cv=none; b=W58cYllsnQEZ5Y/qcqpI2g6a/lybGGUQCNGt7JfItk7W+2KR72RQxd0+Jugs0FsU1bzPWbVLOFHpAiOrT7OCVndEm8eee0VJhKpbil7ZGI1KwVkVv4Hx4W+0xBx2UDwTAeXdcavNmghROAFkNdjPbHITAfb1ryzC5l5wwa/FNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091854; c=relaxed/simple;
	bh=Zp41r/yYmWHwZsrp8pLB9sTFQRfp3NwkITAqbXQDiSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cS/VfPyVONB1tRgHOAv6Srp8kaXjU5xFsp/b/6dOeXMhIAFS9nE//ar26W9IX/dhoWXY7plXOvsTHhyYEmBkOeWYHEaZqM8PLRpMS9rD48HhefZSOZmJ0icQ1bwy0dmj6mlz8fDfJ9Dl/H8/Me8DrXmS+Mhf1e0u945Tt7da8MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tj8C9NPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615FBC2BBFC;
	Tue,  7 May 2024 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715091854;
	bh=Zp41r/yYmWHwZsrp8pLB9sTFQRfp3NwkITAqbXQDiSU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Tj8C9NPF1Ns9iCUnWotpt1qn0fdCPefMgCAZ/4hxDQ6Gb/c3+r6bTxekCJe3Rh9x0
	 PKR3LWbXCksqpwY9bbOObzd26dixMWFjtoNJcWPNaLo3wMCZmP7zmDTkwffRRX8SFt
	 QDBFlMHMNrqtTCI+EOSed54Z5TSFyOBCB3czHtseUzYO8xXtSOGHPSzBQckaJvlxaO
	 sBXCZpPzabwdL+VE9emrPflwh5OmvcLYtwq+YFi0991I3yun6BWA+bRiM3oMmCb481
	 Gu0fw/njd9xKaG3wbFccid+f3bRstjRu3p0bPVQrqpiAWZKLhoio1sciBZFNKST1LV
	 m38WWOdUnGWfQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0596ACE12BD; Tue,  7 May 2024 07:24:14 -0700 (PDT)
Date: Tue, 7 May 2024 07:24:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] gpiolib: fix the speed of descriptor label setting with
 SRCU
Message-ID: <597f5da2-71be-4144-a570-fdc4f06c4cc6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240507121346.16969-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507121346.16969-1-brgl@bgdev.pl>

On Tue, May 07, 2024 at 02:13:46PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Commit 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> caused a massive drop in performance of requesting GPIO lines due to the
> call to synchronize_srcu() on each label change. Rework the code to not
> wait until all read-only users are done with reading the label but
> instead atomically replace the label pointer and schedule its release
> after all read-only critical sections are done.
> 
> To that end wrap the descriptor label in a struct that also contains the
> rcu_head struct required for deferring tasks using call_srcu() and stop
> using kstrdup_const() as we're required to allocate memory anyway. Just
> allocate enough for the label string and rcu_head in one go.
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Closes: https://lore.kernel.org/linux-gpio/CAMRc=Mfig2oooDQYTqo23W3PXSdzhVO4p=G4+P8y1ppBOrkrJQ@mail.gmail.com/
> Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Looks good to me!

Acked-by: Paul E. McKenney <paulmck@kernel.org>

One semi-related question...  Why the per-descriptor srcu_struct?
Please see below for more on this question.

							Thanx, Paul

> ---
>  drivers/gpio/gpiolib.c | 31 ++++++++++++++++++++++++-------
>  drivers/gpio/gpiolib.h |  7 ++++++-
>  2 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 94903fc1c145..2fa3756c9073 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -101,6 +101,7 @@ static bool gpiolib_initialized;
>  
>  const char *gpiod_get_label(struct gpio_desc *desc)
>  {
> +	struct gpio_desc_label *label;
>  	unsigned long flags;
>  
>  	flags = READ_ONCE(desc->flags);
> @@ -108,23 +109,36 @@ const char *gpiod_get_label(struct gpio_desc *desc)
>  	    !test_bit(FLAG_REQUESTED, &flags))
>  		return "interrupt";
>  
> -	return test_bit(FLAG_REQUESTED, &flags) ?
> -			srcu_dereference(desc->label, &desc->srcu) : NULL;
> +	if (!test_bit(FLAG_REQUESTED, &flags))
> +		return NULL;
> +
> +	label = srcu_dereference_check(desc->label, &desc->srcu,
> +				       srcu_read_lock_held(&desc->srcu));
> +
> +	return label->str;
> +}
> +
> +static void desc_free_label(struct rcu_head *rh)
> +{
> +	kfree(container_of(rh, struct gpio_desc_label, rh));
>  }
>  
>  static int desc_set_label(struct gpio_desc *desc, const char *label)
>  {
> -	const char *new = NULL, *old;
> +	struct gpio_desc_label *new = NULL, *old;
>  
>  	if (label) {
> -		new = kstrdup_const(label, GFP_KERNEL);
> +		new = kzalloc(struct_size(new, str, strlen(label) + 1),
> +			      GFP_KERNEL);
>  		if (!new)
>  			return -ENOMEM;
> +
> +		strcpy(new->str, label);
>  	}
>  
>  	old = rcu_replace_pointer(desc->label, new, 1);
> -	synchronize_srcu(&desc->srcu);
> -	kfree_const(old);
> +	if (old)
> +		call_srcu(&desc->srcu, &old->rh, desc_free_label);
>  
>  	return 0;
>  }
> @@ -697,8 +711,11 @@ static void gpiodev_release(struct device *dev)
>  	struct gpio_device *gdev = to_gpio_device(dev);
>  	unsigned int i;
>  
> -	for (i = 0; i < gdev->ngpio; i++)
> +	for (i = 0; i < gdev->ngpio; i++) {
> +		/* Free pending label. */
> +		synchronize_srcu(&gdev->descs[i].srcu);
>  		cleanup_srcu_struct(&gdev->descs[i].srcu);
> +	}

If the srcu_struct was shared among all of these, you could just do one
synchronize_srcu() and one cleanup_srcu_struct() instead of needing to
do one per gdev->desc[] entry.

You might be able to go further and have one srcu_struct for all the
gpio devices.

Or did you guys run tests and find some performance problem with sharing
srcu_struct structures?   (I wouldn't expect one, but sometimes the
hardware has a better imagination than I do.)

>  	ida_free(&gpio_ida, gdev->id);
>  	kfree_const(gdev->label);
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index f67d5991ab1c..69a353c789f0 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -137,6 +137,11 @@ int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
>  
>  void gpiod_line_state_notify(struct gpio_desc *desc, unsigned long action);
>  
> +struct gpio_desc_label {
> +	struct rcu_head rh;
> +	char str[];
> +};
> +
>  /**
>   * struct gpio_desc - Opaque descriptor for a GPIO
>   *
> @@ -177,7 +182,7 @@ struct gpio_desc {
>  #define FLAG_EVENT_CLOCK_HTE		19 /* GPIO CDEV reports hardware timestamps in events */
>  
>  	/* Connection label */
> -	const char __rcu	*label;
> +	struct gpio_desc_label __rcu *label;
>  	/* Name of the GPIO */
>  	const char		*name;
>  #ifdef CONFIG_OF_DYNAMIC
> -- 
> 2.40.1
> 

