Return-Path: <linux-gpio+bounces-33418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLTpBNsetWngwgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:39:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 699DB28C32A
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 09:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76A6A3019B97
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 08:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B754A20C00C;
	Sat, 14 Mar 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgnxNAc7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC94F881
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773477505; cv=none; b=ZER3kWNq4MArNHYj1/ZVQunV0uKwvkPRYY3alWoIRs9Ddjvp2vaTXkLZZG5IDowdl4AxGuTt488c3l3Z7LG1qJCBEa754Tvy231Ja0kt9ON4xUstjIwN2Cz7sik+yTvJ1bVUNEzgWsMYlWrtdbY7PZF2wNWfRYhLwehXSlbskho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773477505; c=relaxed/simple;
	bh=zs5ayvvkI5PTSLsGJL88a7+jQEKfQg3DX6WpRBk/6/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdW/f1oyqt0jm8XiaC5K5SId1SgoYzhekCEn5jeINwnKfRDOkNwd0mE3kC3qVe3vUdzKGSzmmsCAmy1RGFdG9jut5GkGM3VclLL92y5M7YbVorZWRxRjfRC9eDXBKPC0r7iClIfJbMXjTJ5ODedkPGHf6fO7pt6HHY7yI6IY6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgnxNAc7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A3CC116C6
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773477505;
	bh=zs5ayvvkI5PTSLsGJL88a7+jQEKfQg3DX6WpRBk/6/0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=UgnxNAc7tAQWYiHcp5jJ2xvCpg1e0jf5AX9GdeHFfrS7HciaU9D4E4aZHr5jxtImp
	 5nS0/gaBUxA61/0Rl8F1mT0OQnn39+zfnp62f4dBkEnF1KVtc7LRUpe9sF7VsMwXFc
	 7yPwYlfZF5EZFI9g9Ph8LAIzAeSqLQtnyXTpHdhzz8cpe+aEFsUU1ZGftbixTRW/LC
	 oj7xHRdpJe3v6Q94STrUW37Ms4HnajEPRwu++rcUCfMXufhoEbp4+pMR4B3jLeNUpI
	 3pBoOJcYjuL4//elETUStMUlUsWKl47BLIwu0uoc694FneDtPf/UAFIpGn9f9/56Hk
	 yAaefljBFFKsQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a133502accso3778867e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 01:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6FUYdE0W+7+j5M1Fpmvp2KkEgBAZf0KUWqPaV+ZzmUT2VXTu0kL8oRS3gMM8dJVPSAzUftcvQZW4G@vger.kernel.org
X-Gm-Message-State: AOJu0YzozxoasHTyLwMXzTbnnt2kT0ygupInqnNJJFxvzOR/8c0h27Sw
	0Dkf6GIV2VWFKNHu0eiCcz7AG3CLqtXkz13g+ut9Ft0zSKNy66/oFtw2rI8SBVUwgb5y2eFJbey
	nVnb0jDKBnLJwTLXoSCqKBGdd5hpqxdw=
X-Received: by 2002:ac2:54af:0:b0:5a1:27a8:be28 with SMTP id
 2adb3069b0e04-5a162af644cmr1432283e87.11.1773477503501; Sat, 14 Mar 2026
 01:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com> <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
In-Reply-To: <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Mar 2026 16:38:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
X-Gm-Features: AaiRm51E4965eeb0L_fn-2SZNoUKwdxVpJdCBkpbsBdc_UAFU6x4kPtBXXnJXuo
Message-ID: <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33418-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 699DB28C32A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 1:14=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywara=
=E5=86=99=E9=81=93=EF=BC=9A
> > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> > register frame. So far we were instantiating one GPIO chip per
> > pinctrl
> > device, which covers multiple banks of up to 32 GPIO pins per bank.
> > The
> > GPIO numbers were set to match the absolute pin numbers, even across
> > the
> > typically two instances of the pinctrl device.
> >
> > Convert the GPIO part of the sunxi pinctrl over to use the
> > gpio_generic
> > framework. This alone allows to remove some sunxi specific code,
> > which
> > is replaced with the existing generic code. This will become even
> > more
> > useful with the upcoming A733 support, which adds set and clear
> > registers for the output.
> > As a side effect this also changes the GPIO device and number
> > allocation: Each bank is now represented by its own gpio_chip, with
> > only
> > as many pins as there are actually implemented. The numbering is left
> > up
>
> Ah, is this a userspace API break?

Unfortunately, yes. This means the easily computable numbers that one can
use with the (deprecated) sysfs interface is gone, and also the pins are
now split amongst multiple gpiochip instances.

However if someone wanted the old "one gpiochip for one PIO instance with
evenly spaced banks" scheme, I suppose we could put together something
with the GPIO aggregator driver? It won't have same base pin number though.


ChenYu

