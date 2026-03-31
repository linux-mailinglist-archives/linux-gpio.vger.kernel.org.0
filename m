Return-Path: <linux-gpio+bounces-34459-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCzhHNuBy2lmIgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34459-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:12:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4831365DC5
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3AD0305F67E
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 08:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA63D6CA4;
	Tue, 31 Mar 2026 08:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBVZhI0W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6C3D8901
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944340; cv=none; b=Ko3M5TMNEKUOYeOpJtC+LN9/onEb0f3SeA8u7QxhXnRSYUl5cBvU00UXIPf9LPV4s3e+A/rt7Wuy6jtLMPyyw7WP0tC4TaysfXlCr23tjwMsqU7ese2/sExcbKl1j7AxbPQYOs47m/esxhvdqB/rZHcIrDbDnux4Oh4CpcagQhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944340; c=relaxed/simple;
	bh=TruZ+9hVD5QZCOIHd09PcJj54yMY9GXjQYch8VrW8R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIMzycR2nbPpYV2LMJZnxNnrlF4MNeC7VTEFhy5l8QIasgG+r/bIijU6A/MiA9guWg00HVyfl7V8USQxRmqNQAeEJbskzYvyTOw30ir+qZ7T24ODjy3ScJOvgpc+p6+Lgoi1XPjce1bs/hRdNuRcMOn8oW23pal2wSS24sZ0WGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBVZhI0W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F6CC4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774944339;
	bh=TruZ+9hVD5QZCOIHd09PcJj54yMY9GXjQYch8VrW8R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RBVZhI0WwRy9yMPbK0MNcoQ/g377WQMcZ/m1PkFH703Ijk7xCLssQJwYXSlxvdSpI
	 pESO96lvxET33LQG3RNgiIU07ZSvnGfpE0a9Hsz75+Ej/ukM0zGWDxA6R/GFl7onTZ
	 nk6ZyB8wuSdwt76PUhQRYHeFGnhvsB5/CsHaJVNM+1+mXYxEpa/oyUwkHERIe8+Se5
	 BRpaqhxUzBaKlwOzs4ZIursHJMFuU9hxrMVAd/3sGkIVVYReC7af4/wlsMqHS0TVq1
	 d9Ux8Xl6GnzQJ0TuDaNtmB6RMGPQqRbJn/pTz7OX6vcOqsI2PDGErSLoPHxug/PJ3b
	 ORtJXXwBswTrQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so6372215e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 01:05:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6ZjMbJk8oa88q9o28z80/XH+ydmPUtOSW7Da9j9gGDAFPFirRei9OhAnPSABXr0D5gvBdroBA2DUw@vger.kernel.org
X-Gm-Message-State: AOJu0YxnQcNo3H2+4wWYKJCG/fEAEl1CarxaE6KLwyTDcl1Ktch5b8B5
	0UZiBmk1f49v7cY3lS3jiNAX9zGdg9LNHOOk9fAcJOzjlavFUFraB0oKyV2ZU94yfXdKm8RSuU2
	12APD+MqWrZADypfIWDVaOZt1PFZoKYFK4X0DLKNTYg==
X-Received: by 2002:a05:6512:39d6:b0:59f:6923:1cb1 with SMTP id
 2adb3069b0e04-5a2ab5fa0b1mr5294875e87.8.1774944338596; Tue, 31 Mar 2026
 01:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 31 Mar 2026 10:05:26 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
X-Gm-Features: AQROBzCo8RcGlll-TwJeW4R3EP8LQfhE8vczB9UIqzQOWRLUVWnb9pXCBy5CUzw
Message-ID: <CAMRc=Mfg3KvifZgpD8c7kkLNhv3zgDKvHB=n_=MQJ2EtwRi44A@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, ye.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34459-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E4831365DC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:53=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.co=
m> wrote:
>
> This driver is used on device tree based platform. Use dynamic
> GPIO numberspace base to suppress the warning:
>
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
> gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic=
 allocation.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
>
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index ac1b939..08ea644 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -582,7 +582,7 @@ static int rockchip_gpiolib_register(struct rockchip_=
pin_bank *bank)
>         bank->gpio_chip =3D rockchip_gpiolib_chip;
>
>         gc =3D &bank->gpio_chip;
> -       gc->base =3D bank->pin_base;
> +       gc->base =3D -1;
>         gc->ngpio =3D bank->nr_pins;
>         gc->label =3D bank->name;
>         gc->parent =3D bank->dev;
> --
> 2.7.4
>

I take it you know first-hand that nobody depends on the predefined
GPIO numbering for this driver? If so, I can queue it for v7.1.

Bart

