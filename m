Return-Path: <linux-gpio+bounces-18984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B0EA90BA0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 20:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEA6B448060
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 18:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E113224AF2;
	Wed, 16 Apr 2025 18:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IKUzxydq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A52236EF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829344; cv=none; b=J2Txri8tSZBtBkUKZyy2HAoiqxJTkysoy2Vzm5/TIrvhUg5xgIVKzgaRtQnD59XeZlHK1iQt4XeNsQauXUkRxqo1XAYDtmrQwvW1UKwu/H3hI3nqHCmkp820TpSMKC+4uB0KBZb35zDXuZBsq7b8owHa7PliNZQexwfredMB0fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829344; c=relaxed/simple;
	bh=EXCjPLcg4xl78qWeRmj3mUHlXXFwXPIFpwOC2+wxRRo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLAVXQ6vA/HfUmyenK0qWa30FQ4E3gyvR158RR1oMyw+eexg0kIsgi5dHZnt7/PxF8+yNK3iR+28Z3GYp3nhzvR/7uuwhsMm/8GuFflO+y9tACBjTw9p8IJnqYWQFkxEVjxJfnut/kg0XTT4JwOfnpQ7DqVWwp+uHk52PyxlDE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IKUzxydq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so12553123a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744829339; x=1745434139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWQ82odYg4rALaAgqnCLAExm8ViQ8XuviYu9g41oMgY=;
        b=IKUzxydqlso7LWKbUkfM2N6CAKL50ldhUIbZgzgA+XeVNg9mRnIQxdIXnZKjaVnuFF
         +W7F2epa67kMHwL1e35OR6dhvDisndM6zBISP6H7DCVm5uFEqwEx8lBAFWUiTew706DI
         wjkee1DaNCAVzVI16yJfJb/nqXaxOzDqKjl93dLSofxNbvf9GS8DjV9VU4FleM2j3kS4
         vSFIdZmkkwkWYqpQbd2/u/gvySUy40msrwPTzw7gh+vec5i/INFLDHmY9ibD7Y4t/qBc
         EoUICwakAbq4mJsm7CRyrzQkwDHEK4gXqogX71JfiOCnRApmaWFt5m51UFoGTHw5WYZ4
         CtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829339; x=1745434139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWQ82odYg4rALaAgqnCLAExm8ViQ8XuviYu9g41oMgY=;
        b=f0wMHSMgLUdUJgT1MzkWqOD3GqOwTsepGYdAvqFWL+sDAqbGl4fFFdvJ5HXuQeuPu6
         VnD0zl6WhVkGhd/jjp5nxV4AlNKbtOoovhuxkASiF5rjnOG8kNLPaPTXpSQaUMm5IoS6
         2gq2qwGrgdcvRFxf87xwZI9abinYGIA6qB0LPK/6c8LlpqSR6rdUhqYL/ip20J/fX/LK
         F83FWLEMk/aeK/uE5cGpoT46HkZRzAB5pwnuBzF9zxWg4kpkfEWBiJqzqLTZwXPjF7uj
         nJPN0oh3tR0cdJ9trql3viCX/G1Lg5B72XzFc4HIgGafZ0CXG2cQQWcJA7dV/KCBi3xS
         INJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy3hHsuWtehvofXFNvhuQGKYVqT9jTA5yoqmdyV2C19tlz+Jqg0jGMRZC+zL7N8tURz8ZfOu62K2+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwkmvxvBWKJZta9YedBClHGkhhRuQsyikojKNnG5hzhCnnu9Mil
	2xk3aj9EC4XavdI0G86CFoMumflhYyv2npux9DAkQNKN+cjCYAoR+x4CU2R8Q68=
X-Gm-Gg: ASbGncuy0MTeVQKRSYqTBs0nPqNQ8sa16/pc5IawXqfazbiH2udgtO5e5r3spOKQ6ia
	Fz01zc9ZcwXojDgsgbH8/AVWWZecgmM8npPN9h0yWjpLP2dHegWJBwO7MAxHqHTlH+DV7leGZjB
	x47PDtdRlxQFmD1L12HPh/DhBKafiMpvmBjV6R2EAyT4qejDZYL2HWwSeX/MFJLcTWfKYD6lqc7
	LmKan03qdbXNBiL7pP/hk+M8r8QfRRV5snMMEp3IOKAcWxcvI3TOqi2f5dXX2+3hWMaFsbnHvRF
	y/l1/gRJfojTkoaO4kjvHMkFrSi8c5T2t2h+Wenjyibocz6Rzi/WM3LDE90aMomdDAms2YE=
X-Google-Smtp-Source: AGHT+IFqmJdOPJLqDBbmxHa4DqyKzt2zjQMRwOR1WFej9DRiHJ4e5/qp3awrDfh34SZMze5F9yH1XA==
X-Received: by 2002:a05:6402:278d:b0:5f3:7fe3:6838 with SMTP id 4fb4d7f45d1cf-5f4b75d87ccmr2873138a12.22.1744829338542;
        Wed, 16 Apr 2025 11:48:58 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f4c72ecac8sm574252a12.44.2025.04.16.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:48:58 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 20:50:20 +0200
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
Subject: Re: [PATCH v8 09/13] arm64: dts: Add board DTS for Rpi5 which
 includes RP1 node
Message-ID: <Z__77DivbIHIPiNi@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <c6498d8cf8dfade1980b566e99a9a91551fd8b53.1742418429.git.andrea.porta@suse.com>
 <526751d2-c7e8-4097-9454-c9049b880225@gmx.net>
 <Z__sMg-RJ6B-3OL4@apocalypse>
 <8da98fc4-f24e-40ba-b705-9faf31766398@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8da98fc4-f24e-40ba-b705-9faf31766398@gmx.net>

Hi Stefan,

On 20:18 Wed 16 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 16.04.25 um 19:43 schrieb Andrea della Porta:
> > Hi Stefan,
> > 
> > On 13:48 Mon 14 Apr     , Stefan Wahren wrote:
> > > Hi Andrea,
> > > 
> > > Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > > > Add the board 'monolithic' DTS for RaspberryPi 5 which includes
> > > > the RP1 node definition.  The inclusion treeis as follow (the
> > > > arrow points to the includer):
> > > > 
> > > > rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b-monolithic.dts
> > > >                                                  ^
> > > >                                                  |
> > > >                                              bcm2712-rpi-5-b.dts
> > > sorry for the delay. I'm not happy with the monolithic appendix.
> > > 
> > > How about bcm2712-rpi-5-b-rp1.dts or something more self-explaining?Regards
> > Sure, good catch. I'd go even further saying that we can rename (or merge if
> > the destination file already exists) as:
> > 
> > bcm2712-rpi-5-b.dts             ->  bcm2712-rpi-5-b-norp1.dts (or some better suffix other than -norp1)
> > bcm2712-rpi-5-b-monolithic.dts  ->  bcm2712-rpi-5-b.dts
> > 
> > so the monolithic one, which seems to be the 'safest' option as of now,
> > would be the default dtb. Do you think it could be ok?
> i like the idea (include rp1 into default dtb), but not a fan of negative
> logic in naming. Unfortunately I don't have better idea.
> 

Hmm ok... I'd propose 'bcm2712-rpi-5-b-ovl-rp1.dts'. Could it work?

Regards,
Andrea

> Regards
> > 
> > > > This is designed to maximize the compatibility with downstream DT
> > > > while ensuring that a fully defined DT (one which includes the RP1
> > > > node as opposed to load it from overlay at runtime) is present
> > > > since early boot stage.
> > > > 
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > ---
> > > > Right now bcm2712-rpi-5-b.dts is the overlay-ready DT which will make
> > > > the RP1 driver to load the RP1 dtb overlay at runtime, while
> > > > bcm2712-rpi-5-b-monolithic.dts is the fully defined one (i.e. it
> > > > already contains RP1 node, so no overlay is loaded nor needed).
> > > > Depending on which one we want to be considered the default, we can
> > > > swap the file names to align with downstream naming convention that
> > > > has only the fully defined DT called bcm2712-rpi-5-b.dts.
> > > Could you please move some of this good explanation into this dts file as
> > > comment?
> > Sure.
> > 
> > Thanks,
> > Andrea
> > 
> > > > ---
> > > >    arch/arm64/boot/dts/broadcom/Makefile                     | 1 +
> > > >    .../boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts      | 8 ++++++++
> > > >    2 files changed, 9 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > > > index 3d0efb93b06d..4836c6da5bee 100644
> > > > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > > > @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> > > >    			      bcm2711-rpi-4-b.dtb \
> > > >    			      bcm2711-rpi-cm4-io.dtb \
> > > >    			      bcm2712-rpi-5-b.dtb \
> > > > +			      bcm2712-rpi-5-b-monolithic.dtb \
> > > >    			      bcm2712-d-rpi-5-b.dtb \
> > > >    			      bcm2837-rpi-3-a-plus.dtb \
> > > >    			      bcm2837-rpi-3-b.dtb \
> > > > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> > > > new file mode 100644
> > > > index 000000000000..3aeee678b0bc
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-monolithic.dts
> > > > @@ -0,0 +1,8 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > > +/dts-v1/;
> > > > +
> > > > +#include "bcm2712-rpi-5-b.dts"
> > > > +
> > > > +&pcie2 {
> > > > +	#include "rp1-nexus.dtsi"
> > > > +};
> 

