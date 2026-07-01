Return-Path: <linux-gpio+bounces-39278-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XRGBMHXHRGps0woAu9opvQ
	(envelope-from <linux-gpio+bounces-39278-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:53:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 126176EAE04
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:53:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DczjMUBv;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39278-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39278-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75964303CC03
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E569F3BF66D;
	Wed,  1 Jul 2026 07:50:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEB23C060F
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:50:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892227; cv=none; b=lpIDqF9TBLSU3Ol/xJjW4hpLUqF0C/k2WIsYQoGxG2UCjrfj8Wy+9rvSQte3ZB48+D6771+PDs0wHywMKrowrDqqjXLRlcakzCAqC5t7w1pm1j8RPyapvwH7fxfKo8Susg4D/cc6u6Ku9+lIDQ1QCw0R2tvzJ0g14L4V2FeCCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892227; c=relaxed/simple;
	bh=KbUG/Lzj94CuSVCXFQWc1VZGNfdldF0klrQbP7ulC9g=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InSRCzkiKE+emItY47Iwnh25lKxWFzgksJYrhauh2J9ldkheBVHEqugHioCUQLXMOYi8P8fPKqWMXJfT0h8cxRoemFNeoCnZh+EDKOtyCAbrAUtp/uclCoeqGkxIkJ7gWjud9QOKW0zlx6s9ycOdAgvobLEbD82imy+yRM/tQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DczjMUBv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1901F01566
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892225;
	bh=xWoQa8RFTTk84aEoAC07qJog4uQPcmRTcxfNGLNDxJg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DczjMUBvKfp5CMbsOROhYOGCOLsZpYRnR4v/M3FcrVtZ7ab5uweJIGfIFRAulsUab
	 RQyOOY9042JI8cfD+xhwBMIrVwgaBGnKuFFEiapdo11rUNdUrRqaRmffpzzfxieieI
	 T/0aqk0CcKZjuzJTm6sbYauBENXBRGY1J8L3MfLT06EoG8bIya0xqXHaeiMrDG4LLF
	 xrtfqYoz2mUp/RMDIxrUwEZMdoaPLaT4/4z9gVNtlYguLbrghReud4/Ano4SYiJ4pb
	 qJM7A0Nz8PrS5WA1ceOhrWNQoO0p6gPnjjQgD0YxRt0AWSQA9wQsBDEMNZUwVXRDpY
	 t+ceRvuSwytlg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b2be45e8cso3076831fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKs8tTZhUWLu4bh4kkEOsFJ9s++caKlOWmME4RX6uyKSibNAOewILM2xeGYiuQrJACkMdkUcyURyty@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3Qw6vYmarQ2wNCoP3ywbAGHo9tW0pNusA8JUyQjBpe1XPN2g
	dLgAky6EFP4j10tgTkpzoYx+AehfWuis2KKKw/ClCd2KtzsU3syXIOTYLaexnuSAsHY8Ov7cU+R
	N5UqAp0RZ4sFQV7wXjJ5MnvxFdi3nKEtGMZhAvgsrxQ==
X-Received: by 2002:a2e:864f:0:b0:393:6934:6104 with SMTP id
 38308e7fff4ca-39b340ed172mr905801fa.19.1782892224586; Wed, 01 Jul 2026
 00:50:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:50:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:50:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 03:50:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfQDX7qNzmYP99RqvYtwVa9KsxKu4qq+8TD5Vz5FvrKOg@mail.gmail.com>
X-Gm-Features: AVVi8Cf_I55n91eLuPB2Yr4k-M3SBY1DoYVILdNZ89grAvuz-pPqlnv6xDy3sRA
Message-ID: <CAMRc=MfQDX7qNzmYP99RqvYtwVa9KsxKu4qq+8TD5Vz5FvrKOg@mail.gmail.com>
Subject: Re: [PATCH v12 6/6] arm64: dts: s32g: describe GPIO and EIRQ
 resources in SIUL2 pinctrl node
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39278-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khristineandreea.barbulescu@oss.nxp.com,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,kernel.org,bgdev.pl,gmail.com,suse.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 126176EAE04

On Tue, 30 Jun 2026 14:54:03 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Update the SIUL2 pinctrl node to describe the additional register
> ranges and DT properties used by the updated SIUL2 driver.
>
> Besides the MSCR and IMCR ranges used for pinmux and pin
> configuration, the SIUL2 block also provides PGPDO and
> PGPDI registers for GPIO output and input operations,
> as well as an EIRQ register window for external interrupt configuration.
>
> The driver supports both legacy pinctrl-only DTs and
> extended DTs with GPIO and IRQ.
>
> Reflect these resources in the SIUL2 pinctrl node by adding:
>   - the PGPDO and PGPDI register ranges
>   - the EIRQ register range
>   - gpio-controller, #gpio-cells and gpio-ranges
>   - interrupt-controller, #interrupt-cells and interrupts
>
> Keep the hardware description aligned with the updated SIUL2
> driver, where pinctrl, GPIO data access and the EIRQ register
> block are described under the same device node.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

