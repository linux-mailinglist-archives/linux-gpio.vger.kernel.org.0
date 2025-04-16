Return-Path: <linux-gpio+bounces-18983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DDA90B70
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 20:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B18333B60A1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 18:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9549522423B;
	Wed, 16 Apr 2025 18:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LD1GMJSQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A5E223704
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828819; cv=none; b=I84B5h1v7Mv4aTCnfqzJIg5P0Q4hrsBjGAvtsVVwS6xZPRIUYA7qK+MXVngZcylJdsL9WMDdOCYqM2FtZXIuspruIJcGdjlnyiS6VpAucHS2OxNnj2jOgUt1YzoxnZYh1q7TuHCCOQaM16luWSesOpPPsrAQ3nbusouvQA272UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828819; c=relaxed/simple;
	bh=I0EC3INMQjYBg9VGIiLtTG4Lcuu/qjJUk/7T+xVwA2c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z32atGO9OPLkaeT24/n7E950ZCuYS/4mWvWjzOPnsJZHjz3hSC6SpXCD7U+Y8KhGrQ4LWljA+7evImm18+LRd8ilugw8380NBNQ+5nefReqrJNHTKx3k+5tokKIMboYQ1ERM2I+YHgbiBCpSbZW2UWzHbUEuh6xrcltgkDsMgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LD1GMJSQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb415dd8faso149497666b.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744828815; x=1745433615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=LD1GMJSQOrBW+IW3DUebNTOeBoNHlzgNfHC6N+Cy/2/K3acmAfdsvgYhMSVUb2TlVe
         Yk+gUdmx/w/dvO6YltaqRDKqg5FHljjnniE2GorWOmwTLiKVYxj0SVG+NXEpp+JuXkOR
         uOVGcghvdhcGTzCxXN2i0t48Hwwg08Q3ehyBkLhJdfgbzEQzz23z9qTq2NtepnaN7P13
         UpYykxGF+EyY50WwA1Q5Vmf7CoR6Uo8dB7mhZbFjataonD8Bg8fxvMB142n54y6RK5+0
         XTeA/YZbmEfn+3atBwgCnAKmAb7b+veSiNS3H215KE6Yz0R0Nkr+Izd58UCs6N/xNw+3
         fT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828815; x=1745433615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=jssoSKd00WVNm35TOoGzBJHDy3vNGBFSp7oazhhB0Er5HvsCmCX+kTF0Peu3Y5rjG/
         rFmcZQ4jzjvpxaqSHhqs7BhS+0t2vVSIXtfbhVzSRWOW5JvzdNq30c1ePudI5BBgU+ZI
         XuwCpQ/dPgTV49ISKvnTLD68405oi4yaIToYo9b3qERS3eRmIoIMvKHdcao/9xym5aNR
         sXmtjYFtyUHIJ6wRT1lF5pJQjQUcgCXlOkLfDQn/Qa/ZQBUwOgZ2qaGuo1L9fWYQz8ga
         Hp84LsdA2kbjo64FQr7s6Nnki1uvjXPWSE+mu2tNw1LR1T8TflWqRvTtn4ux9kLzEzwd
         sq9A==
X-Forwarded-Encrypted: i=1; AJvYcCWBOa7rBomBucp9OCuPzhQqk+O43+ogZof4FDTrhVnvkgwBQsHAILzaCLO4fmgAGcscS+lMRdHJ3bDS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk5rpxtkZrV6+Jk3hFYQOqR7J69Tw4NzJjVb928X23TDm2fGP1
	1JjVX8NjZ70S34IakcWZpLCnM1+LPbrABTz0xgC1bAXFeNIMP5xOoA/l+JP5T5c=
X-Gm-Gg: ASbGncthSWUzaOaCfXn5khVcBPZ+djUP2DZ4tMHqEduEK1hhZRRtKOXp3m0qRtCNP+y
	qu7oncx4iGqaTZvQAElD46KPEma2yRRwfkFABVUzhPkZefVM6utcRxhXEy8XfSAes60k+J0HLPb
	6WFx51bQjwYDVO5tzwg+b8L6pbc6lhM3uUoiPhvBxZpqJSXWEx4nlKBpj/uq+JevsWRQdbX/FM3
	eCH+BQLUJqPtMWD+wFIXBR+TCUSUXG0uqPch0uH3PoYkVtjPaXSFtXC8mPk0eAV1kWKHeDA7w//
	nnshhlE71PjLckzQjeNSvNsi4kGAMc6CVhtWoandpJhaRgIjV9EG/drl9EWf/gNe0Lk6u0Y=
X-Google-Smtp-Source: AGHT+IHvwwjkQBu7DihmtTvqsvfxr52Defd8zqRFD9EThPH0EkutvTV+muEgyvB55Eg0nTCHnjLeIA==
X-Received: by 2002:a17:906:f5a9:b0:ac2:cf0b:b809 with SMTP id a640c23a62f3a-acb429ed4d2mr324522566b.31.1744828815585;
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d34a5a8sm174672666b.183.2025.04.16.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 20:41:37 +0200
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
Subject: Re: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <Z__54c628WTjznoG@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
 <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>

Hi Stefan,

On 13:55 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > Add clk_rp1_xosc node to provide that.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> i'm fine with the patch content, but I think this is necessary before
> Patch 9 is applied?

True. Thanks for pointing that out.

Cheers,
Andrea

> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index fbc56309660f..1850a575e708 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -16,6 +16,13 @@ chosen: chosen {
> >   		stdout-path = "serial10:115200n8";
> >   	};
> > 
> > +	clk_rp1_xosc: clock-50000000 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-output-names = "rp1-xosc";
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> >   	/* Will be filled by the bootloader */
> >   	memory@0 {
> >   		device_type = "memory";
> 

