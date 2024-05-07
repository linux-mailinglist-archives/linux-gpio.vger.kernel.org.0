Return-Path: <linux-gpio+bounces-6213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2FB8BEB7F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 20:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E571C21FF5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 18:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0B816D331;
	Tue,  7 May 2024 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgtYPCVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0451C13C825;
	Tue,  7 May 2024 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715106926; cv=none; b=GmoGkMKD2ygRYSt9eAHdEEmTAk82/fvqZ2QvOAZsBdKiBNPDkzoT6lZuytyRZFOvj91oXtEd45wKyhbrHX9GZXroFZ7doAOjSy7osShKVJTArXbrjei7i6XqDVdQQKcH/l3KdyAyEgU32yD87xLCpRQMtl5xA22VwBEXQYYKXNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715106926; c=relaxed/simple;
	bh=TELV8mwIKIxcpUSfKl97kkO2PhVXm6bY9UQzIfbvyME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwMXd0EkXrhTIXuqfryqAhKHlo0Fje85Ob8a3YnhmWCgqaxAYcLXA4JlbBmMhs3+yvmBTQVqRkR2oFPfUhVEpZ9A36TfsnLPr7ObVHULybkioFU6wDXl3TUINzzOTyataeUV/jNntgGe0XPdU2ELWV6SUoocjq0u7oLj23UEhXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgtYPCVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F710C2BBFC;
	Tue,  7 May 2024 18:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715106925;
	bh=TELV8mwIKIxcpUSfKl97kkO2PhVXm6bY9UQzIfbvyME=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AgtYPCVb8iZvLBsMlqjrcFAH6Ita4rUX/3mRDHYkc/6QjHQTFNibqtIE67w5EeOA+
	 SiQyd7WHTnCtOvAco/6hGeIHlVy+KZppR3BtFsBY6C7BDXU6Yw6IkEjIG2+eInzUO7
	 W4LGZC+kwNMUEnctl6dK+Iawra4TlrR2l7aCNxlHy0S9UrFVawwJjfspfS5TfurMY1
	 oZMeXEi7kvUXbSSWlrqQlCfjSseUK2+Aig7zK4TIwml5scBu0k24JtYJ//DusS82NG
	 MRGv/eMOcdixi61wHWpGYfi4MzJWItfXXOloauTAzqk2i+eGM88XPhGZHqytJdCfNS
	 lp3lwv5v20RCg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1064DCE0C56; Tue,  7 May 2024 11:35:25 -0700 (PDT)
Date: Tue, 7 May 2024 11:35:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: use a single SRCU struct for all GPIO
 descriptors
Message-ID: <bee9f8b8-2b12-45a0-a440-04ecb71b98bd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240507172414.28513-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507172414.28513-1-brgl@bgdev.pl>

On Tue, May 07, 2024 at 07:24:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We used a per-descriptor SRCU struct in order to not impose a wait with
> synchronize_srcu() for descriptor X on read-only operations of
> descriptor Y. Now that we no longer call synchronize_srcu() on
> descriptor label change but only when releasing descriptor resources, we
> can use a single SRCU structure for all GPIO descriptors in a given chip.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  drivers/gpio/gpiolib-cdev.c |  2 +-
>  drivers/gpio/gpiolib.c      | 41 +++++++++++++++++--------------------
>  drivers/gpio/gpiolib.h      | 10 ++++-----
>  3 files changed, 25 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index d09c7d728365..fea149ae7774 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -2351,7 +2351,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  
>  	dflags = READ_ONCE(desc->flags);
>  
> -	scoped_guard(srcu, &desc->srcu) {
> +	scoped_guard(srcu, &desc->gdev->desc_srcu) {
>  		label = gpiod_get_label(desc);
>  		if (label && test_bit(FLAG_REQUESTED, &dflags))
>  			strscpy(info->consumer, label,
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 2fa3756c9073..fa50db0c3605 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -112,8 +112,8 @@ const char *gpiod_get_label(struct gpio_desc *desc)
>  	if (!test_bit(FLAG_REQUESTED, &flags))
>  		return NULL;
>  
> -	label = srcu_dereference_check(desc->label, &desc->srcu,
> -				       srcu_read_lock_held(&desc->srcu));
> +	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
> +				srcu_read_lock_held(&desc->gdev->desc_srcu));
>  
>  	return label->str;
>  }
> @@ -138,7 +138,7 @@ static int desc_set_label(struct gpio_desc *desc, const char *label)
>  
>  	old = rcu_replace_pointer(desc->label, new, 1);
>  	if (old)
> -		call_srcu(&desc->srcu, &old->rh, desc_free_label);
> +		call_srcu(&desc->gdev->desc_srcu, &old->rh, desc_free_label);
>  
>  	return 0;
>  }
> @@ -709,13 +709,10 @@ EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
>  static void gpiodev_release(struct device *dev)
>  {
>  	struct gpio_device *gdev = to_gpio_device(dev);
> -	unsigned int i;
>  
> -	for (i = 0; i < gdev->ngpio; i++) {
> -		/* Free pending label. */
> -		synchronize_srcu(&gdev->descs[i].srcu);
> -		cleanup_srcu_struct(&gdev->descs[i].srcu);
> -	}
> +	/* Call pending kfree()s for descriptor labels. */
> +	synchronize_srcu(&gdev->desc_srcu);
> +	cleanup_srcu_struct(&gdev->desc_srcu);
>  
>  	ida_free(&gpio_ida, gdev->id);
>  	kfree_const(gdev->label);
> @@ -992,6 +989,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  	if (ret)
>  		goto err_remove_from_list;
>  
> +	ret = init_srcu_struct(&gdev->desc_srcu);
> +	if (ret)
> +		goto err_cleanup_gdev_srcu;
> +
>  #ifdef CONFIG_PINCTRL
>  	INIT_LIST_HEAD(&gdev->pin_ranges);
>  #endif
> @@ -999,23 +1000,19 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  	if (gc->names) {
>  		ret = gpiochip_set_desc_names(gc);
>  		if (ret)
> -			goto err_cleanup_gdev_srcu;
> +			goto err_cleanup_desc_srcu;
>  	}
>  	ret = gpiochip_set_names(gc);
>  	if (ret)
> -		goto err_cleanup_gdev_srcu;
> +		goto err_cleanup_desc_srcu;
>  
>  	ret = gpiochip_init_valid_mask(gc);
>  	if (ret)
> -		goto err_cleanup_gdev_srcu;
> +		goto err_cleanup_desc_srcu;
>  
>  	for (desc_index = 0; desc_index < gc->ngpio; desc_index++) {
>  		struct gpio_desc *desc = &gdev->descs[desc_index];
>  
> -		ret = init_srcu_struct(&desc->srcu);
> -		if (ret)
> -			goto err_cleanup_desc_srcu;
> -
>  		if (gc->get_direction && gpiochip_line_is_valid(gc, desc_index)) {
>  			assign_bit(FLAG_IS_OUT,
>  				   &desc->flags, !gc->get_direction(gc, desc_index));
> @@ -1027,7 +1024,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  
>  	ret = of_gpiochip_add(gc);
>  	if (ret)
> -		goto err_cleanup_desc_srcu;
> +		goto err_free_valid_mask;
>  
>  	ret = gpiochip_add_pin_ranges(gc);
>  	if (ret)
> @@ -1074,10 +1071,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  	gpiochip_remove_pin_ranges(gc);
>  err_remove_of_chip:
>  	of_gpiochip_remove(gc);
> -err_cleanup_desc_srcu:
> -	while (desc_index--)
> -		cleanup_srcu_struct(&gdev->descs[desc_index].srcu);
> +err_free_valid_mask:
>  	gpiochip_free_valid_mask(gc);
> +err_cleanup_desc_srcu:
> +	cleanup_srcu_struct(&gdev->desc_srcu);
>  err_cleanup_gdev_srcu:
>  	cleanup_srcu_struct(&gdev->srcu);
>  err_remove_from_list:
> @@ -2407,7 +2404,7 @@ char *gpiochip_dup_line_label(struct gpio_chip *gc, unsigned int offset)
>  	if (!test_bit(FLAG_REQUESTED, &desc->flags))
>  		return NULL;
>  
> -	guard(srcu)(&desc->srcu);
> +	guard(srcu)(&desc->gdev->desc_srcu);
>  
>  	label = kstrdup(gpiod_get_label(desc), GFP_KERNEL);
>  	if (!label)
> @@ -4798,7 +4795,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_device *gdev)
>  	}
>  
>  	for_each_gpio_desc(gc, desc) {
> -		guard(srcu)(&desc->srcu);
> +		guard(srcu)(&desc->gdev->desc_srcu);
>  		if (test_bit(FLAG_REQUESTED, &desc->flags)) {
>  			gpiod_get_direction(desc);
>  			is_out = test_bit(FLAG_IS_OUT, &desc->flags);
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 69a353c789f0..8e0e211ebf08 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -31,6 +31,7 @@
>   * @chip: pointer to the corresponding gpiochip, holding static
>   * data for this device
>   * @descs: array of ngpio descriptors.
> + * @desc_srcu: ensures consistent state of GPIO descriptors exposed to users
>   * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
>   * of the @descs array.
>   * @can_sleep: indicate whether the GPIO chip driver's callbacks can sleep
> @@ -61,6 +62,7 @@ struct gpio_device {
>  	struct module		*owner;
>  	struct gpio_chip __rcu	*chip;
>  	struct gpio_desc	*descs;
> +	struct srcu_struct	desc_srcu;
>  	int			base;
>  	u16			ngpio;
>  	bool			can_sleep;
> @@ -150,7 +152,6 @@ struct gpio_desc_label {
>   * @label:		Name of the consumer
>   * @name:		Line name
>   * @hog:		Pointer to the device node that hogs this line (if any)
> - * @srcu:		SRCU struct protecting the label pointer.
>   *
>   * These are obtained using gpiod_get() and are preferable to the old
>   * integer-based handles.
> @@ -188,7 +189,6 @@ struct gpio_desc {
>  #ifdef CONFIG_OF_DYNAMIC
>  	struct device_node	*hog;
>  #endif
> -	struct srcu_struct	srcu;
>  };
>  
>  #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
> @@ -256,7 +256,7 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
>  
>  #define gpiod_err(desc, fmt, ...) \
>  do { \
> -	scoped_guard(srcu, &desc->srcu) { \
> +	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
>  		pr_err("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
>  		       gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
>  	} \
> @@ -264,7 +264,7 @@ do { \
>  
>  #define gpiod_warn(desc, fmt, ...) \
>  do { \
> -	scoped_guard(srcu, &desc->srcu) { \
> +	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
>  		pr_warn("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
>  			gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
>  	} \
> @@ -272,7 +272,7 @@ do { \
>  
>  #define gpiod_dbg(desc, fmt, ...) \
>  do { \
> -	scoped_guard(srcu, &desc->srcu) { \
> +	scoped_guard(srcu, &desc->gdev->desc_srcu) { \
>  		pr_debug("gpio-%d (%s): " fmt, desc_to_gpio(desc), \
>  			 gpiod_get_label(desc) ? : "?", ##__VA_ARGS__); \
>  	} \
> -- 
> 2.40.1
> 

