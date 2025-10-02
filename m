Return-Path: <linux-gpio+bounces-26760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB757BB41E6
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 16:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C85F17D771
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 14:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D031713B5AE;
	Thu,  2 Oct 2025 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8EASvGD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C0139E;
	Thu,  2 Oct 2025 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759413745; cv=none; b=tmN2fRDLzttqxAX4tQKLZKiCpw0z4foTe2q4HbG3KH4Mw+uFSMMUI+YUY1BzpnBo4wpol+hA1/YuD8oXrWEDk7jUWZGanzQ39rBeqVttu74PGX0kYnfipwfFUAp06J0WRqwtdGYBDTw9UWpD86aVwrabGbxsCl3zW3Cla4qDzxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759413745; c=relaxed/simple;
	bh=Knz7TaS2NpECls0C9xbmF0c5aMf2bwguD/z7iQ6D85g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnLiYkNMiXUBwB/edXpWo88eZfJqRby+M3+rOSqttXzwRNJf1x5QdM8ANTK3TlWb0MsccngxxTHVRi2UpO4IHmOoiMGo7kCEu/tW8f1Zf6NMViLet54kuEbcrJCX43rAoxyb3CtPyZnQrQ7fN4+vDgwuPP3m1FTgnfvvrg4swc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8EASvGD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F9CC4CEF4;
	Thu,  2 Oct 2025 14:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759413745;
	bh=Knz7TaS2NpECls0C9xbmF0c5aMf2bwguD/z7iQ6D85g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8EASvGDfVg8/2sxIiZrH/ZYOSHsK1lmUfLbGgqHK3xHWUGWS5F1DNsFrizgI2tKk
	 x21UGOA5WfKz8trtRBT2LYZc+oE7OxmE09qurRVlNmPHJVFVlYPp/aBluid5fl+oTN
	 DVWxpBqtzKiVl18pvn6wzUibzr4Gxxs6MI4xx2FFsLoRQeRY8zwvjG7mP6Rl2MqEz0
	 Ry6Ol2kkBuoQNA2OrNQF+sLsrpWwQZt8C3Z5KB8fNcl787qiIXjuSkkZ4VbLexwhjg
	 lN28TtP1m9cfDhRAf6AIVfBCp5VjsyTsLtTXfFotkJxjfY3mCpka40nrU6Fu2DsM+s
	 7HSZu95ReHPWQ==
Date: Thu, 2 Oct 2025 22:02:21 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aN6F7Qw7wZAYpHCB@tzungbi-laptop>
References: <20250923133304.273529-1-mstrodl@csh.rit.edu>
 <20250923133304.273529-2-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923133304.273529-2-mstrodl@csh.rit.edu>

On Tue, Sep 23, 2025 at 09:33:02AM -0400, Mary Strodl wrote:
> @@ -261,9 +273,8 @@ static int gpio_mpsse_direction_input(struct gpio_chip *chip,
>  
>  	guard(mutex)(&priv->io_mutex);
>  	priv->gpio_dir[bank] &= ~BIT(bank_offset);
> -	gpio_mpsse_set_bank(priv, bank);
>  
> -	return 0;
> +	return gpio_mpsse_set_bank(priv, bank);

The change looks irrelevant to the patch.

> +static void gpio_mpsse_poll(struct work_struct *my_work)
>  {
[...]
> +	/*
> +	 * We only want one worker. Workers race to acquire irq_race and tear
> +	 * down all other workers. This is a cond guard so that we don't deadlock
> +	 * trying to cancel a worker.
> +	 */
> +	scoped_cond_guard(mutex_try, ;, &priv->irq_race) {
> +		scoped_guard(rcu) {
> +			list_for_each_entry_rcu(worker, &priv->workers, list) {

I'm not sure: doesn't it need to use list_for_each_entry_safe() (or variants)
as elements may be removed in the loop?

> +				/* Don't stop ourselves */
> +				if (worker == my_worker)
> +					continue;
> +
> +				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
> +					list_del_rcu(&worker->list);

If RCU is using, does it still need to acquire the spinlock?  Alternatively,
could it use the spinlock to protect the list so that it doesn't need RCU at
all?

>  static void gpio_mpsse_irq_disable(struct irq_data *irqd)
>  {
> +	struct mpsse_worker *worker;
>  	struct mpsse_priv *priv = irq_data_get_irq_chip_data(irqd);
>  
>  	atomic_and(~BIT(irqd->hwirq), &priv->irq_enabled);
>  	gpiochip_disable_irq(&priv->gpio, irqd->hwirq);
> +
> +	/* Can't actually do teardown in IRQ context (blocks...) */
> +	scoped_guard(rcu)
> +		list_for_each_entry_rcu(worker, &priv->workers, list)
> +			atomic_set(&worker->cancelled, 1);
>  }
>  
>  static void gpio_mpsse_irq_enable(struct irq_data *irqd)
>  {
> +	struct mpsse_worker *worker;
>  	struct mpsse_priv *priv = irq_data_get_irq_chip_data(irqd);
>  
>  	gpiochip_enable_irq(&priv->gpio, irqd->hwirq);
>  	/* If no-one else was using the IRQ, enable it */
>  	if (!atomic_fetch_or(BIT(irqd->hwirq), &priv->irq_enabled)) {
> -		INIT_WORK(&priv->irq_work, gpio_mpsse_poll);
> -		schedule_work(&priv->irq_work);
> +		/*
> +		 * Can't be devm because it uses a non-raw spinlock (illegal in
> +		 * this context, where a raw spinlock is held by our caller)
> +		 */
> +		worker = kzalloc(sizeof(*worker), GFP_KERNEL);

I'm not sure: however it seems this function may be in IRQ context too (as
gpio_mpsse_irq_disable() does).  GFP_KERNEL can sleep.

> +		if (!worker)
> +			return;
> +
> +		worker->priv = priv;
> +		INIT_LIST_HEAD(&worker->list);
> +		INIT_WORK(&worker->work, gpio_mpsse_poll);
> +		schedule_work(&worker->work);
> +
> +		scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
> +			list_add_rcu(&worker->list, &priv->workers);

Doesn't it need a synchronize_rcu()?

>  static void gpio_mpsse_disconnect(struct usb_interface *intf)
>  {
> +	struct mpsse_worker *worker;
>  	struct mpsse_priv *priv = usb_get_intfdata(intf);
> +	struct list_head destructors = LIST_HEAD_INIT(destructors);
> +
> +	/*
> +	 * Lock prevents double-free of worker from here and the teardown
> +	 * step at the beginning of gpio_mpsse_poll
> +	 */
> +	scoped_guard(mutex, &priv->irq_race) {
> +		scoped_guard(rcu) {
> +			list_for_each_entry_rcu(worker, &priv->workers, list) {
> +				scoped_guard(raw_spinlock_irqsave, &priv->irq_spin)
> +					list_del_rcu(&worker->list);
> +
> +				/* Give worker a chance to terminate itself */
> +				atomic_set(&worker->cancelled, 1);
> +				/* Keep track of stuff to cancel */
> +				INIT_LIST_HEAD(&worker->destroy);
> +				list_add(&worker->destroy, &destructors);
> +			}
> +		}
> +		/* Make sure list consumers are finished before we tear down */
> +		synchronize_rcu();
> +		list_for_each_entry(worker, &destructors, destroy)
> +			gpio_mpsse_stop(worker);
> +	}

The code block is very similar to block in gpio_mpsse_poll() above.  Could
consider to use a function to prevent duplicate code.

