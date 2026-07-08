Return-Path: <linux-gpio+bounces-39666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VFLnAGs7TmquJQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:58:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 546AE726157
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:58:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b0UifD3A;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39666-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39666-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74285303779E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45085435AAD;
	Wed,  8 Jul 2026 11:57:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F43313E36
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:57:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511838; cv=none; b=oxVJA8gJdzm62avpbzR1tAvuWBCNxxz+8hmNCLvfi3ylijyeGookZ2YsFYLyyX2GhrgF0h8JOlAW7QyZEPRYpTgh/0WzZ473s98LWikFg8QauR4YPQUYWl64xTHyPZt/cI/bZF3Chnsl9A5BLhsFKa1Pl5LFFMZlQ8iGCnWUXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511838; c=relaxed/simple;
	bh=fbjwMwKMvN8p5HndK9IZ90IjiWhpAoHmsuYKU2gme/8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2dW3YLAkOyDVxHSg4+QRljPoC6WqaFXWtIIFpvica2Ch3ND4qcKLaz049AtEqIiL07yCGCJTi4CNPCA8j3eK9ros2B4lFevinMDyRccin9lYjV7JjzcAd2iPipVqz7g/rEH/CoCoV2s+rxahrm3BOENDMBngpH1dc2fpvOnjmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0UifD3A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E381F00A3F
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783511836;
	bh=YVb6/vomQMxSBK/z30qtE5e1om52KmJ9TV4tVit8ZWU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=b0UifD3AOhiiDLpklmfn50NCe5EyY6OAQz4Cy9Xd09qwe/v79aFSAcFJ+LUtckAPP
	 LGpagUGodm918OMCCwRrA0YPc4Ewh/OR8R51VIwqmfAVaGVy0bffbjwZcs6q1UGgnR
	 6SD6bwU8zAnoPQmgPRK/t/qJK5DGLaaRZlWtjy2JR7Yzsh063Cl7/YEzWTdhFOqiGb
	 3L7uEChPCo7wSjvxn5le/fAYpH+EmIvVZDg/+Z0glgvVL+3qk8yBYE7b8amflnTpc2
	 6A3IYBG0jNDu71rMVPLbnbcdTzvtq/LQ16Ut0cvEphF/OWEgFGXDLiiHOczGt/YZR4
	 RNesdiJgptByw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb2df5cc1so477444e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 04:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro4b7jD2ZUFSTll2zas3cIcbnuRf617Nkpbahxu07dvD2R0q1+iV0suLaBGavXc3IGIcgIfnv1YLXPQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnXcRJKH7viSyaj/2H2gPwXoKP9ODATWZuKL/U5b3PELdX2C0Z
	bxBjYxrJwqVplv1I4vx/ne2JWA8H+Ym1+h7FuVtg7XlrN2USUR0NQzQY6UgJq4tS90FX+mivtsg
	OJazK09FJ+RuHaWCMfS652TttyzRsGPoSnOwGB+9xqA==
X-Received: by 2002:a05:6512:8046:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5b01147f555mr478408e87.24.1783511835452; Wed, 08 Jul 2026
 04:57:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 07:57:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 07:57:14 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260707230651.1138887-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707230651.1138887-1-rosenp@gmail.com>
Date: Wed, 8 Jul 2026 07:57:14 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdPiA4am3VGeCThqWFzA06ck1ZCkjjEOadPViM6ntvzqA@mail.gmail.com>
X-Gm-Features: AVVi8CcYQkgJlSNcP7jAPaEIX2HdWiA4LkUszEmW6LN-kXgwHwGk-1nUmb_y5FM
Message-ID: <CAMRc=MdPiA4am3VGeCThqWFzA06ck1ZCkjjEOadPViM6ntvzqA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39666-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:andrew@lunn.ch,m:ralph.sennhauser@gmail.com,m:thierry.reding@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ralphsennhauser@gmail.com,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 546AE726157

On Wed, 8 Jul 2026 01:06:51 +0200, Rosen Penev <rosenp@gmail.com> said:
> The clock is obtained without doing any sort of cleanup on remove or
> anywhere else. Use the proper function to handle this. When it fails
> with -EPROBE_DEFER for example, return so that it can be handled. When
> the clock is not found, it's NULL and not a PTR_ERR. Handle that as
> well.
>
> Fixes: 757642f9a584e ("gpio: mvebu: Add limited PWM support")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Looks like someone beat you to it[1] but your patch seems to contain more.

> ---
>  drivers/gpio/gpio-mvebu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 329275d6518c..cdf7eb46ae5f 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -833,8 +833,8 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
>  		offset = 0;
>  	}
>
> -	if (IS_ERR(mvchip->clk))
> -		return PTR_ERR(mvchip->clk);
> +	if (!mvchip->clk)
> +		return -ENODEV;

Why -ENODEV? Is the clock optional or not?

>
>  	chip = devm_pwmchip_alloc(dev, mvchip->chip.ngpio, sizeof(*mvpwm));
>  	if (IS_ERR(chip))
> @@ -1194,10 +1194,10 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
>  		return id;
>  	}
>
> -	mvchip->clk = devm_clk_get(&pdev->dev, NULL);
>  	/* Not all SoCs require a clock.*/
> -	if (!IS_ERR(mvchip->clk))
> -		clk_prepare_enable(mvchip->clk);
> +	mvchip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(mvchip->clk))
> +		return PTR_ERR(mvchip->clk);
>
>  	mvchip->soc_variant = soc_variant;
>  	mvchip->chip.label = dev_name(&pdev->dev);
> --
> 2.55.0
>
>

Bart

[1] https://lore.kernel.org/all/20260707160030.385137-1-dbgh9129@gmail.com/

