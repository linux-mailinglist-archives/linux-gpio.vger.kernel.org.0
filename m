Return-Path: <linux-gpio+bounces-38663-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WbzhIwChM2rOEQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38663-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 09:40:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 069BB69E262
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 09:40:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=JYsgO2H+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38663-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38663-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34919300BC8A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 07:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5BD2F8E86;
	Thu, 18 Jun 2026 07:40:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE11227EA4
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 07:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768436; cv=none; b=rSVWqFAim93b/w++ncJIuzZT2HmnL0UEWChbuP18mOWF0mXpuzNAqDrHSsaiYJ6H0ZhWUYu+YMQNzBmZIhDDIm3m2tnmyG/IqixndWQNPE4EzfEFru2Gadsm5f4sYyUsUyX2getY2oxz03tNwydd4iZ2DVZoG65YUhnRTGwTzuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768436; c=relaxed/simple;
	bh=TLSPGn1X7APXd9mpj0fYFz1rYawux3LLayDrWOYO0ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nllhn8D3covTpwS3nuswdcE0yIu0Q2ALpSKT6nqKnhVvdD7BQdVNHqV9YFjxExF/orRWY4zb/R4q9kLcvYMWSA64eVV/79TG98qf0Kv0YEyXYh21YOBIbVEB6x6Ec/xKy7qlrdGEjIuMZZeUqo6VwiwImVp0LMhhbbqBMqdGKjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYsgO2H+; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845438a46d4so141301b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781768435; x=1782373235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=;
        b=JYsgO2H+9W25tl/F93lGCX5P136yH0NlCS/IpHGDEUHWjjtsvDKaF5FQyC54dNH45/
         V2/Vunoa4ShKFaa78r2sZSSOhv4p86CljSN0gcdHwOOFOnnUfDuIDeVqL8FszwnkBp/N
         C5qWHrn4DDY6iwC6QDkeAyTJqPcv2oABR+gYy9kjxSlu8JFkM0tUL4ZXugaOCf/cCK73
         3GRirqrksmt40JoSUV7hWBfVZ8WkneAZxuo5/FDygebVvenbJgIUVodxOaE7cinbwR6l
         B6ig45cPaVxV3boh6FMSDufowr8AQGlMvaHts4vsCQ9PGZQrZbmZ2iLSx+eBR239faqe
         raZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768435; x=1782373235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=;
        b=I1ppkjlX8LHBFg+44U+viZsKOtaJMTD5v9V1Qfcip4K0/XZuFbjtg77X5dNk9/jhUj
         exXaHgEayY4/cOLav2yMPoQ0172ZOV4GpKaj/ZVCkgxVISmOkTFQGA+PZCJRYM0UU7UI
         6iDz5b3V3yU6w3Jwcz2Az+avPPyPpaoRHIu+1j6t3wZ2AMxSvLq/4zhRcdfcpzmK6DoW
         uhYTa1RdeAn8k5Tjx/7YM59fc2STjoEOh4tT7SxO4DfX8OjtFHkP9sCz9tGSw5agCuvx
         4VviLUHgMp8TdDBpgNBb2ZzF/4ipu7+tpQyeL+RPiuxWyvX9Pck6tX2zRkw3vsrcNfsY
         kBgw==
X-Forwarded-Encrypted: i=1; AFNElJ9vtSSdeeNer7J4dtMdQXu44UTSz6mdbI3j4Dm8IYuuJjIQKbuWa2HiNB6V++PG2HH7gQUxZ108Lr6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YznqmVLmW5y9tdv0ThKiLP2vcoCWl4fsaG/AbEbAbTG9sceFIvS
	2z7xAM/e4jBMOgQq/IkoG3zXiZUFhgQgQGnjaEWYR3JQ5fcRAa15H82v4HanhdcdhTE=
X-Gm-Gg: AfdE7ckysNphl6XW/FMC4Jv4VHNDOlRYjU1SqVF9x8DkgvNWmQkjIoEzOgVhunmlyYw
	8nURhf+zUEcHRwtux4PMXNYsRAtuJ0+skptjCkBiNuMYiErORyEKSvqixWKA2CU2s8tc1EV4F7U
	H2THpCTGjEXHCB4JTQyXyUVNiOaOxCwLxfySSprBbbx7Wu8dJVemQjkjm3oK4UdbKYBgIQH6P0d
	G9HxGcSONpFnBRsLk2uAUUyg6rPMmBduPOamuyQF1w7t4XjT26S6TccB9N2L8XubAIgpB1E38EH
	lRooXHa/APtoEJcU+l+sC6njDi3kP+Tt5Y+yZP5mxASxDoLj4sjsQwlnolpYdS32QyMeDZThuOI
	X1MyaJgoD4WVNAirUVzoPK5Ss/Os/QF7bW5XE1qi3PsOlybwdFu3oGVfoOpDazymCdXtajOyAZt
	a7rfT/96uxyDGk
X-Received: by 2002:a05:6a00:cce:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-8453b0df8eamr2701471b3a.7.1781768434721;
        Thu, 18 Jun 2026 00:40:34 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17785056b3a.47.2026.06.18.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:33 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Herve Codina <herve.codina@bootlin.com>
Cc: Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:herve.codina@bootlin.com,m:vireshk@kernel.org,m:linus.walleij@linaro.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:linux-arm-kernel@lists.infradead.org,m:soc@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[viresh.kumar@linaro.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38663-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cw3waaj6xxkx:mid,linaro.org:dkim,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 069BB69E262

+ Herve (the last guy to work on this driver).

On 18-06-26, 10:34, Runyu Xiao wrote:
> Hi,
> 
> While auditing GPIO/pinctrl irqchip callbacks, our static analysis tool
> flagged the SPEAr PLGPIO irq_enable path, and we manually reviewed it
> against the current tree.
> 
> The path is:
> 
>   irq_startup()
>     -> plgpio_irq_enable()
>        -> gpiochip_enable_irq()
>        -> spin_lock_irqsave(&plgpio->lock)
>        -> plgpio_reg_reset()
>        -> regmap_update_bits()
> 
> On PREEMPT_RT, plgpio->lock is a regular spinlock_t and can become a
> sleeping lock.  Since irq_enable/irq_disable can be called from IRQ
> management paths while the IRQ descriptor raw lock is held, taking that
> regular spinlock there looks unsafe.
> 
> A minimal Lockdep reproducer preserving this irq_chip::irq_enable carrier
> reports:
> 
>   BUG: sleeping function called from invalid context
>   irqs_disabled(): 1
>   plgpio_rt_spin_lock_irqsave
>   plgpio_irq_enable
>   request_threaded_irq_probe_path
> 
> My first thought was to convert the PLGPIO register lock to
> raw_spinlock_t.  However, that does not seem sufficient because the IE/EIT
> updates go through regmap_update_bits()/regmap_read()/regmap_write().  For
> the syscon/MMIO regmap used here, regmap may still take its own regular
> fast-IO lock unless the regmap was created with use_raw_spinlock.  So a
> raw_spinlock_t conversion in the PLGPIO driver alone may just move the
> PREEMPT_RT problem one level down into regmap.
> 
> The repair I am considering is to keep the gpiolib resource updates in
> the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> dropped desc->lock.  The driver would keep per-line shadow state for:
> 
>   - IRQ disabled/enabled state
>   - pending IE update
>   - edge direction state
>   - pending EIT update
> 
> and then synchronize those shadow updates from irq_bus_sync_unlock()
> under a mutex.
> 
> In other words, the fast callbacks would only update local shadow state
> and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> regmap writes would be batched into the irq bus sync phase.
> 
> Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> you prefer a different fix, such as changing the underlying syscon regmap
> locking model or handling only the IE register path?
> 
> The draft patch I have locally is roughly:
> 
>   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
> 
> and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.

I haven't worked on this for a very long time now (15 yrs). There are some
people who use this hardware, and so it is not removed until now.

Also I am not sure if RT kernel is a valid use case here for this SoC family.

-- 
viresh

