Return-Path: <linux-gpio+bounces-18978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75260A90A7D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 19:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8008D447749
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486DA21ABCE;
	Wed, 16 Apr 2025 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cPZHhQRz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6B217F36
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744825896; cv=none; b=uyQ5fAByAAY2XLA4aBi12oL/ZQS2go1/0LN+K7BwknZ29Nf4fcF8a2h8vZPhJ4iTDR1t4rZy3PU+d3Y/fO3TG6ZNp0SapLjNhZT8zDh3i0QsOJvPn71Bz/WV39GGjskqbhaKJVjB0luBXj36QRp/uLXAK/OpsZrifetgc+43+Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744825896; c=relaxed/simple;
	bh=TBZ3+IULu0N+duqvjfzo4MbqJH8vZN2SCabf43+KQyI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2VThP9SBqinOoniOsAAvkBG5f0G8Vzm5AW1fTSpCb498gwxayz01BV5k+lY5XrJsOo2enOJwLVLYnprz/z6LDyNaY2UnkcLaGsKkF3CDI/GDlB3BWRP/MiAbLZO9QwZnElw6/93Tw8mPLJHK/9MF0aoHN8YPCSYFEla+64/GWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cPZHhQRz; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5f4c5eb520dso997918a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744825891; x=1745430691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=;
        b=cPZHhQRzzydDIk7JgVIWYDsaKXxgVTfyDSeP7v8JK8BDcHa2puEK1LNdNqVYhBKuFO
         rPWDic4nMpbi7UXdJ0mpxoF3fKY5dF0k8/9Vgu68txTMuYlwpOf7JelTsg5c9ipwlPeO
         BJepNfAEVEjQrpVfMA0TFqhm7L8CD8WEl/ZU2KFgFIJ2yegC61g2i1WbMi1wPijepvvu
         fJkh9d1Js9YEO3sWWrmlqFnhj/+6kDbMmOV2cPIFo8ByePmcmg62HQhcghoJicMoI4/7
         qqucvQxh4jWl7IWNIVanfIzUZSZmxOw5yf+ztwVNGDG2B6x7do/OYOu/JvJ1Zi0q9YeL
         F7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744825891; x=1745430691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=;
        b=DOfKJc7Cpw2Yz9F8JQ7LEhFxYEHDhqohM2rwEPxHLcEzXfzm8zAFFNIJrsyFEFGW9T
         8ZKDGKqsHprDJIeAGwTon+BNd81A8BRBMK1PqbJJ6jaT99ZGTDNKLmpu6gJ857O+ZReb
         iDAqW0Psl23YKJ/jPUFMXsuH2Mffnz+/XLAVuzj+ZoIE1/hFxeEf/GRxKYVxi8AQaAlL
         566bgwEbgMykZAfuH/C9WCaaHQemtJvMiZJPiJez8k7nHEKtMBmNPTFNvRuCaU87pRCS
         lSrjYJQdodPfIh6603FuKuDKJEP8Vb3zq9kqNlbVMjBm90RfvJG4o3gT2O3ic6xwVdlJ
         BwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn9zKfW8zLSRUd7DY+Wm4aWDgFvj4S+0DXtSYnPa2L9t1B5iN6UuUah3CksBFQ3sKedZpPwIS0yWBE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7agDt/9S6YOTMewI58F0YzLgiAhbktC4vn9F2KcABvFniiG0
	ybDqWgVZyzo4m+FptkNtTW6roM16wSSzvGCqS/NMXGGCcyNefGgCyjGoM2wWus4=
X-Gm-Gg: ASbGncuCSUrrjCgQHLaJ9e5uGEKrV9q095HdmfREwjOqvlpCJWM9fTY6KpC6YyFkk+D
	L6tMlO8wcgSebmwS37Pq/Ajwn+MgFKnomsYUvTVZD85nG+xKuQ3wYeVn/PXp47qXY0j55p5JsKT
	4YpfVMudpT1hOU8msRDXWFp7gMPfNzdXf6NQUkQF/8UyBsDl3udT5YlC7cRkyrN0P+37DkUtxpN
	BV3fvRVY+RqQT16hFmMF9o08NoJo4DimOSEdtdyFVouRgT0L9Y9lXffWb8Z8sq7UoumIqxsMuqr
	AwOdQKsNH24Mxx7E7IJ1wFBtAmmCXPEWAj1yLNXoBpeT3VfGwiwGwaSIf2qzDFxY1Bmkbxg=
X-Google-Smtp-Source: AGHT+IG8ocY2R4u3MSMUM8wLm0cAOVd+8ApQg05RyBRV3UoKUWOsni8cwFhkPXwWINMuR8awGmVJfQ==
X-Received: by 2002:a17:907:3d0e:b0:ac3:853e:4345 with SMTP id a640c23a62f3a-acb42ac181emr250869466b.45.1744825891181;
        Wed, 16 Apr 2025 10:51:31 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde06f8sm167165366b.61.2025.04.16.10.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:51:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 19:52:54 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 10/13] arm64: dts: Add overlay for RP1 device
Message-ID: <Z__udrXkRz-5DSB6@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
 <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>

Hi Stefan,

On 13:38 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> just a nit. Could you please add "broadcom:" to the subject?

Consider it done.

Many thanks,
Andrea

> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > Define the RP1 node in an overlay. The inclusion tree is
> > as follow (the arrow points to the includer):
> > 
> >                        rp1.dtso
> >                            ^
> >                            |
> > rp1-common.dtsi ----> rp1-nexus.dtsi
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > This patch can be considered optional, since it fills just the second
> > scenario as detailed in [1], which is the RP1 DT node loaded from a dtb
> > overlay by the FW at early boot stage.
> > This may be useful for debug purpose, but as such not strictly necessary.
> > 
> > [1] https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
> > ---
> >   arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
> >   arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > index 4836c6da5bee..58293f9c16ab 100644
> > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > @@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> >   			      bcm2837-rpi-3-b.dtb \
> >   			      bcm2837-rpi-3-b-plus.dtb \
> >   			      bcm2837-rpi-cm3-io3.dtb \
> > -			      bcm2837-rpi-zero-2-w.dtb
> > +			      bcm2837-rpi-zero-2-w.dtb \
> > +			      rp1.dtbo
> >   subdir-y	+= bcmbca
> >   subdir-y	+= northstar2
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > new file mode 100644
> > index 000000000000..ab4f146d22c0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&pcie2 {
> > +	#address-cells = <3>;
> > +	#size-cells = <2>;
> > +
> > +	#include "rp1-nexus.dtsi"
> > +};
> 

