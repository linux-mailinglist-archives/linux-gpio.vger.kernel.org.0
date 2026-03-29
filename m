Return-Path: <linux-gpio+bounces-34370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J54DguqyWlT0wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:39:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A313E3544EC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8A77300788F
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 22:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3658361DA2;
	Sun, 29 Mar 2026 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a85LHOyH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927D277CA4
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 22:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774823940; cv=none; b=T7SD9tKNaqLcfwbxtKOmQ4c1h1pSFmIgaJsrEJwt8j1rnkH/ujZkHw3oMeVTpcsry76+vFsPGV4KynHq8STa/yS2CddBDhImgJYBEwMWtEM7loBFPWcstkmZ6CSprOogiHMJE6LiFgacJ8c0xnUxukYC9lov6wFaGnobmHUE6js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774823940; c=relaxed/simple;
	bh=i29DEr+cmezm28yicchzfOLgpY1e17qMsYz+akHVLMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmjbqIG0Xp04Z5BTVqfUUXWoIFGSxadNxF57slSRY8qxy9UuNmdZeLaJYtp3BnWHSYFbPw9G4Z/0hidtRr69TfwcbImOechnrRLz6zFDNWu2wnwPyfWoBHBu9pro1aUenhJxLU7BmF0msSKDk3iQEP5TFfSwpgccAHNXpyOqYTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a85LHOyH; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128b9b7e3edso1912467c88.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774823938; x=1775428738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIaCRwsPiPLGbHW57vve74Uei7PyZwajOXtEVAjCMmE=;
        b=a85LHOyH+4K7mj7zgCILRDQ/Q4Q/mEgptLKc8va27S0sLXjfSmYkvBXujQ4Z8SyFcu
         EPpTKHaIzrAm/HJIZZT/7u/Fx4oBX1b7WXJDyhv3mQvYtdG7OkG4YzJtwOfNu6ZaUjCJ
         Srwn3Avm9v30sKjDlQ2lJZzri72n9b5NLRCyspb5pXQxx3szjwtBVEEHBsyIx91PiORl
         J4jPWuScqu/tdNHKD+ExOuROfmztCOyJIpa0nexyczDwFkRrcwOaOqXb7JZkQlhjCA1p
         DziKNlsHsBaHZCsvuBE83MqQLgjXQISpFRSOztWGIkbPmHi64FRPDHxRDRMfYN4KCPtb
         8Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823938; x=1775428738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIaCRwsPiPLGbHW57vve74Uei7PyZwajOXtEVAjCMmE=;
        b=kf2EQRTY+nicA/Nqe0Ls09PJ1q2KJOrEThS3rzKKrvGEfHpnvVIHDxP31cjKSzIaW7
         2KlQMh+DMtklHi/C8A5fGzXVqX4HBgDAbJ3lRpQjbjyXbhHjJ66SlSvCHxMYmIv2+0VZ
         VihUUyxirjLPooKdLHwGupki4t2bHEnVIDHFgUacHqew7k0JGBJRCcq7FUIYb2ugA7vb
         CCfvOfOvftQYZz5Grivx9ScP2LmJBepJWWOOKBOnihOofS5qxmdwJv0P17S2GbAcrsOI
         zi6FoIdDF4tvrLzVS0O99sqUoo6kuT0gEGsZTamAm7Zu7t7u0MimtxuP4A0b9a2Ljt4y
         IdCg==
X-Forwarded-Encrypted: i=1; AJvYcCVNgACPnkutfnXKjUNcZSEIn4vzI7vtJwqC/5SM5aa1ohJceey7VrjFImf0oyIQB3N4XRJXfcmwTEfH@vger.kernel.org
X-Gm-Message-State: AOJu0YzJIGoiCn8siJJVtmciRhhmxsrB+wDaNAIckcaPMDz5rTMu+j5T
	AC62Mmxx8SGWJCLrViXVV/FvE0gPvxxlEZRiuady8j6ZM8h3Y+v5nAhV
X-Gm-Gg: ATEYQzw2W0o/v9tLVMo69kQFPRDTGGqKvw2VHcnvd71OornRO6rxBgy1GLsDclJRRQN
	sud+k2OhZZO7WNie7iEdm0yYduKF4xHVj1U9wXsNRJkOnUYK1GEicAd+ZvgGvbIFjeWsV28TA6S
	cgdCkvgpFyrRBcaAsp9t1fgCHk6HKAX9JgBRVRZm4pL9rePXFQlN4N+d23tT+aJRBTUqC4W8wuN
	peopuutNU4fL/9NNXaQUMLQshl8y5mmGSGk/IZYKSjMOBKa0/vWycs4lVcqrNQA2FYCCbjrNdQZ
	F/9z4KlctdGY5BMB53mR4vpxzCn/zl4dO/lpkFMJyYJ4dHI1NjxzGsQGFf0lYWEi99URDYjoKWy
	kJ2EvMRurXW0R9yEocGoDparPcAlVse9/3O/WZqySaXqjPaHrdIr9WR5D9EJ+p8bnnwiCR6+jr0
	Fb+L2uHAt3HRtToDoJbPGo+TlJODDTaYn83snjWUax56XRFETnVCBCHvyl/B5Z3Q2/
X-Received: by 2002:a05:7022:6190:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12ab2928cb4mr5161322c88.29.1774823937606;
        Sun, 29 Mar 2026 15:38:57 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm8212926c88.10.2026.03.29.15.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:57 -0700 (PDT)
Date: Sun, 29 Mar 2026 15:38:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mips@vger.kernel.org, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
Message-ID: <acmo7_clKRWzhyOi@google.com>
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org>
 <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34370-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A313E3544EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

On Sat, Mar 28, 2026 at 04:55:47PM +0100, Linus Walleij wrote:
> Convert the Mikrotik RouterBoard RB532 to use GPIO descriptors
> by defining a software node for the GPIO chip, then register
> the button platform device with full info passing the GPIO
> as a device property.
> 
> This can be used as a base to move more of the RB532 devices
> over to passing GPIOs using device properties.
> 
> Use the GPIO_ACTIVE_LOW flag and drop the inversion in the
> rb532_button_pressed() function.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/mips/rb532/devices.c         | 47 +++++++++++++++++++++++++++++++++------
>  drivers/input/misc/rb532_button.c | 35 ++++++++++++++++++++++++-----
>  2 files changed, 69 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 4f027efbf27b..3f56d9feb73a 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -16,8 +16,10 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
>  #include <linux/gpio_keys.h>
>  #include <linux/input.h>
> +#include <linux/property.h>
>  #include <linux/serial_8250.h>
>  
>  #include <asm/bootinfo.h>
> @@ -38,6 +40,10 @@ extern unsigned int idt_cpu_freq;
>  
>  static struct mpmc_device dev3;
>  
> +static const struct software_node rb532_gpio0_node = {
> +	.name = "gpio0",
> +};

You need to move this and registration into arch/mips/rb532/gpio.c,
export it and use it here: Bartosz is against using gpiohip label to
match with software node name and prefers identity matching.

...

> -static bool rb532_button_pressed(void)
> +static bool rb532_button_pressed(struct rb532_button *button)
>  {
>  	int val;
>  
>  	set_latch_u5(0, LO_FOFF);
> -	gpio_direction_input(GPIO_BTN_S1);
> +	gpiod_direction_input(button->gpio);
>  
> -	val = gpio_get_value(GPIO_BTN_S1);
> +	val = gpiod_get_value(button->gpio);
>  
>  	rb532_gpio_set_func(GPIO_BTN_S1);
>  	set_latch_u5(LO_FOFF, 0);
>  
> -	return !val;
> +	return val;
>  }

I suppose there is no reasonable way of making this work with
gpio-keys...

For input piece:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

