Return-Path: <linux-gpio+bounces-16876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA0A4AE5F
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 00:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 909E716F1BF
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 23:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEA51E3DFA;
	Sat,  1 Mar 2025 23:29:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991778BF8;
	Sat,  1 Mar 2025 23:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740871791; cv=none; b=VGffhfaZHhxt0hAOVnijHCY9kdaUU/CGUWh6JVzJje+ti8muwH+X7EyvL+/8BIwOoMY0gZ1SiVLkDvtj/EeKEBnpMXYqzk0d29+yvMD9rozNpLQw4ON1alzHPXAKEuXDZZqrN/2K1ok1WZaigGRp8lBvpMGBTC4veKz+gtCbZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740871791; c=relaxed/simple;
	bh=XoA9oReb6CJth7thsqapf840HIXHfr+rBAqbIplUdrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2gq36C063wDF6Qs3jKTHxz0FhQreMdKHGqfAAhZwNaSBGbRrosjairinJn8oaxa1L3sTJd2R6FXqlHPWIRG17R/pEmCi5UA0BnUn5I5avHEbN7hN0IMH3DMsgezU8kvFRiqr1a0jCDsdUCLvIL8ald+iQJ6uMOO7sJEH/mJFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8A58A343152;
	Sat, 01 Mar 2025 23:29:48 +0000 (UTC)
Date: Sat, 1 Mar 2025 23:29:44 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250301232944-GYA55471@gentoo>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-2-34f13ad37ea4@gentoo.org>

Hi Linus, Thomas:

On 07:15 Sun 02 Mar     , Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpiolib-of.c |  8 ++++++++
>  drivers/gpio/gpiolib-of.h |  6 ++++++
>  drivers/gpio/gpiolib.c    | 23 +++++++++++++++++++----
>  3 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..e19904569fb1b71c1fff237132d17050ef02b074 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1187,3 +1187,11 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>  {
>  	of_node_put(dev_of_node(&chip->gpiodev->dev));
>  }
> +
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)
> +{
> +	if (gc->of_node_instance_match)
> +		return gc->of_node_instance_match(gc, index);
> +
> +	return false;
> +}
> diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
> index 16d6ac8cb156c02232ea868b755bbdc46c78e3c7..3eebfac290c571e3b90e4437295db8eaacb021a3 100644
> --- a/drivers/gpio/gpiolib-of.h
> +++ b/drivers/gpio/gpiolib-of.h
> @@ -22,6 +22,7 @@ struct gpio_desc *of_find_gpio(struct device_node *np,
>  			       unsigned long *lookupflags);
>  int of_gpiochip_add(struct gpio_chip *gc);
>  void of_gpiochip_remove(struct gpio_chip *gc);
> +bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index);
>  int of_gpio_count(const struct fwnode_handle *fwnode, const char *con_id);
>  #else
>  static inline struct gpio_desc *of_find_gpio(struct device_node *np,
> @@ -33,6 +34,11 @@ static inline struct gpio_desc *of_find_gpio(struct device_node *np,
>  }
>  static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
>  static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
> +static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
> +					      unsigned int index)
> +{
> +	return false;
> +}
>  static inline int of_gpio_count(const struct fwnode_handle *fwnode,
>  				const char *con_id)
>  {
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 679ed764cb143c4b3357106de1570e8d38441372..266be465b9103c17861a0d76f2dfbf1f1de3a073 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1449,10 +1449,9 @@ static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
>  						   unsigned long *hwirq,
>  						   unsigned int *type)
>  {
> -	/* We support standard DT translation */
> -	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> -		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> -	}
> +	/* We support standard DT translation up to three cells */
> +	if (is_of_node(fwspec->fwnode))
> +		return irq_domain_translate_cells(d, fwspec, hwirq, type);

I'm not sure if you like this way for calling generic cells parser here,
as it should work for 1, 2, 3 cells model, which save a few lines meanwhile

otherwise we end something like

	if (is_of_node(fwspec->fwnode) {
		if (fwspec->param_count == 2) {
			return irq_domain_translate_twocell(d, fwspec, hwirq, type);
		if (fwspec->param_count == 3) {
			return irq_domain_translate_threecell(d, fwspec, hwirq, type);
	}
>  
>  	/* This is for board files and others not using DT */
>  	if (is_fwnode_irqchip(fwspec->fwnode)) {
> @@ -1754,9 +1753,25 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
>  	irq_set_chip_data(irq, NULL);
>  }
>  
> +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> +			enum irq_domain_bus_token bus_token)
> +{
> +	struct fwnode_handle *fwnode = fwspec->fwnode;
> +	struct gpio_chip *gc = d->host_data;
> +	unsigned int index = fwspec->param[0];
> +
> +	if (fwspec->param_count == 3 && is_of_node(fwnode))
> +		return of_gpiochip_instance_match(gc, index);
> +
> +	/* Fallback for twocells */
> +	return ((fwnode != NULL) && (d->fwnode == fwnode) &&
> +		(d->bus_token == bus_token));
> +}
> +
>  static const struct irq_domain_ops gpiochip_domain_ops = {
>  	.map	= gpiochip_irq_map,
>  	.unmap	= gpiochip_irq_unmap,
> +	.select	= gpiochip_irq_select,
>  	/* Virtually all GPIO irqchips are twocell:ed */
>  	.xlate	= irq_domain_xlate_twocell,
>  };
> 
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

