Return-Path: <linux-gpio+bounces-9659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64096A162
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57B57B23659
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46C7187561;
	Tue,  3 Sep 2024 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q0Tc4FtZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01C13D281
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375405; cv=none; b=I+brqOFJ0QlWPR962Uf7JVBUBSDCEEIV4ew/xvjK46O0EQOGy/NmDyHxKm/a0HV9L7e/feRY/5/wvR7qXbtty5g91LsDewckJN67/sdEdA4Iai88DCZ0lD+xEfCJ21vH3GwttkT4Fh942oTYYxl+U7TB8zM+hjvNy2ajEK/PANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375405; c=relaxed/simple;
	bh=gXdcYhlkFiZc7PZFYt6CuTb/sBzByoIKPWKoUDitZO4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an2GDVuCeoO333DSfwLs80MDzboKrHjINd9uUseKAnft7imlqSLPQTp2gTCJhvnlC4hcfQAeZsTuHdqZ/FezAX2uAB2OVan/bJKnzlJxJyC8coJFC/BsUBGkeaz2RSA5Sco5+CF+hO4QzaEwIBcdJv/7+j8Fmg3z8OMyVU20db0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q0Tc4FtZ; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-2f4f8742138so61797091fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725375402; x=1725980202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DIv1iCvMP6bRoC9RIud+CJguG+zl0N1bX8dXz6wFLmQ=;
        b=Q0Tc4FtZ9SyE23cE51CxIDm3wr4xpdfEF1VKGG6D4hTRBcgGU5VbqgJQ2ZOvvsiokB
         O897E9H8Ceu35GO2fLP7wWkVj1zNiOz8o/yzTXtv1IQpcjEu6FZE0i20hK5UhLjGfpm3
         Tz6y34T9Z+D6FaXMRl6+35GiVoDPpbhYuIjsnFnc64aLPewU1Wpn9QNkXUdtRMzZjRF/
         UOo6xTuJ2HKJHVHXFdcjiVlLeFiRL5Uvov8jurz90Zh9bm/54N4qQ0PIecWdbt1GRigt
         wvuLIAD+7FbwJsD2yJkqpyEEpiIUpSI9lBYP8DhbFcnzaN5Kg/pp8wcDzR/7FMWCasNB
         wjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725375402; x=1725980202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIv1iCvMP6bRoC9RIud+CJguG+zl0N1bX8dXz6wFLmQ=;
        b=XK8lb6t8wkkfKZc1KxhYW10De1aRFH+CG/W55IkERkwtQ7Ntrqo2PX5TZWHrr2ED05
         VI8BoXILkfpxHr/qjYyfAlFt0ARDtOlByANxmPE0MtMO+ZFYa5nvMjU2BdNC5QN3ppaD
         dPtzIE/ahkgH/bbEMKTzb04yoyVvOuz6NZnz5M9lteACINObpmksncf381PaQ4/YA17z
         ETTOYkfcSqnnML0Em0AUg3mFH1KgHA1MyTTvvrDu/3i4yPaKWnI3FCX2GIH9B0qc/hYi
         xDQJiX8QgC4MsY/j5h8yaLXtr75+O6+zxmfCoC7sSqOcYZITqOlvKbDdwUYtaVhIm8O5
         iE/A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/Clx19UbzIdx6Qwdu/5xo75pm5zADOoH0eW4I5hazYJ/Q8YR0gH/VyWz3WEbcnOX0fae7IMxP8mQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwB3JgNws11cAEOb1YFbfubdRd+kZ3svllVU9f1DyFzr6/kPeSS
	L4myzHaDiNPqYuKmG7hgxC4MoABSjjwfC6irRC0iAcu/6bCi1Nv0TZFoVnCeiH0=
X-Google-Smtp-Source: AGHT+IGPXzXKjSyzj6ohNmy2x1Ly5xLLwbpSN9O7C4k6PqMn2bhMNSeS1m3Dv1qGKiKQSC913q2XHw==
X-Received: by 2002:a2e:4e01:0:b0:2f3:b76e:4983 with SMTP id 38308e7fff4ca-2f64d4aa546mr6486601fa.22.1725375401093;
        Tue, 03 Sep 2024 07:56:41 -0700 (PDT)
Received: from localhost (host-80-182-198-72.retail.telecomitalia.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a29bsm6517320a12.17.2024.09.03.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:56:40 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 3 Sep 2024 16:56:48 +0200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <ZtcjsHnIb7iuDfhw@apocalypse>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta@suse.com>
 <lrv7cpbt2n7eidog5ydhrbyo5se5l2j23n7ljxvojclnhykqs2@nfeu4wpi2d76>
 <ZtHN0B8VEGZFXs95@apocalypse>
 <26efbff0-ba1a-4e9a-bc5e-4fd53ac0ed99@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26efbff0-ba1a-4e9a-bc5e-4fd53ac0ed99@lunn.ch>

Hi Andrew,

On 16:21 Fri 30 Aug     , Andrew Lunn wrote:
> On Fri, Aug 30, 2024 at 03:49:04PM +0200, Andrea della Porta wrote:
> > Hi Krzysztof,
> > 
> > On 10:38 Wed 21 Aug     , Krzysztof Kozlowski wrote:
> > > On Tue, Aug 20, 2024 at 04:36:10PM +0200, Andrea della Porta wrote:
> > > > The RaspberryPi RP1 is ia PCI multi function device containing
> > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > and others.
> > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > actual OF based driver implementations for the on-borad peripherals
> > > > by loading a devicetree overlay during driver probe.
> > > > The peripherals are accessed by mapping MMIO registers starting
> > > > from PCI BAR1 region.
> > > > As a minimum driver, the peripherals will not be added to the
> > > > dtbo here, but in following patches.
> > > > 
> > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > ---
> > > >  MAINTAINERS                           |   2 +
> > > >  arch/arm64/boot/dts/broadcom/rp1.dtso | 152 ++++++++++++
> > > 
> > > Do not mix DTS with drivers.
> > > 
> > > These MUST be separate.
> > 
> > Separating the dtso from the driver in two different patches would mean
> > that the dtso patch would be ordered before the driver one. This is because
> > the driver embeds the dtbo binary blob inside itself, at build time. So
> > in order to build the driver, the dtso needs to be there also. This is not
> > the standard approach used with 'normal' dtb/dtbo, where the dtb patch is
> > ordered last wrt the driver it refers to.
> > Are you sure you want to proceed in this way?
> 
> It is more about they are logically separate things. The .dtb/dtbo
> describes the hardware. It should be possible to review that as a
> standalone thing. The code them implements the binding. It makes no
> sense to review the code until the binding is correct, because changes
> to the binding will need changes to the code. Hence, we want the
> binding first, then the code which implements it.

Ack.

Cheers,
Andrea

> 
> 	Andrew

