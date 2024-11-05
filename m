Return-Path: <linux-gpio+bounces-12568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A07309BCF5A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 15:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27621C22D3A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 14:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12051D6DB5;
	Tue,  5 Nov 2024 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A/L5QOZ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A561D54F4
	for <linux-gpio@vger.kernel.org>; Tue,  5 Nov 2024 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817077; cv=none; b=SqX4CV19x5PDomgVvuipa9Zdjj30WRr0GfsWbFIGpmRnDUXdK8hJHN8e1ctadCKN5HCI8Tm27opZO+Z1g86Emd1QL7LnkDz6GYysQuIHlXcZrxJIh0TFboRY68fMz3LSEJpuxsqHSEDY7wgM0gcd62+9vrgbHo/G3cFXQY0w1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817077; c=relaxed/simple;
	bh=XN8QvmjRYeFWUTEFIpNV8i5a0X+dKopOVH8Kub55aIU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTK/NyoefJpFZmN9G78k/vnxEToryI9RqlZcW249FLobBAS4E73smBu/gPxM7Pm0YzMZbp4pxopczsEqE1pO4Ci04KqDZxUUKirQeK18gIdaoK8ANhua5ATprLM/YPXqGtCE4DSLo8/hrMhw1ZEMtEXxZifLrPUR9BKv1GZfiJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A/L5QOZ3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso890374266b.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Nov 2024 06:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730817073; x=1731421873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ta4J6k5jVAMZKZSpLijGX731ZlTwallmszrkrr+XXw=;
        b=A/L5QOZ3FSpiHDXbZMSm2ijbcoVoXzXe47BZ9yCDwi8Chh3/inu1cZz4j1apI+mLFf
         +ldKcFDRxhcM5U1APtwjtvVlQ4MemvkjLV5xwkTjivxpueHC9GQxLKUo+ipmAvaxippx
         rvef1HLhWwmcpPtrG5w6w65LOLWx+kZebs7Ppg1ladFgfm5My80N3NOPMAqLBkM84fOH
         0dwiOUeGgEXiW0niK/60jrWWxbjWbztW62yTZWpCsd0k4AZ4J9zeT5457vwJewwIJ2Lp
         uaf181cqCfERC9Jw5PF1JgCEWEvxXKLIQ1qC2oRV6+3tiPyt5OdjBEcQ6wvUDhXD59BZ
         MGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817073; x=1731421873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ta4J6k5jVAMZKZSpLijGX731ZlTwallmszrkrr+XXw=;
        b=M5leP0IRP/qawvOqDRIko3myzAJ+u4dENrdlsznO2Rnsz3sQ2KqqeUmwExSVFBwV4O
         CAnwj4lvv7FxQ2txdphYr6Hz0rqHHQIfyLWxktzSWOLGj1+vqB+wjkhwVEyjxF+RVpWd
         I7332jxXHr2hzwI64ZKOrbRKi7FUqrcpqxGK1Q60wEIJEfZxoFd2t5GLHtI8oWo6nBWc
         23YDqJKdJcMe35ePOK+S7v19GzjL60VTvqnahG6A5yqQcxzpyz9/BU+XOE7lCc78SzSB
         Az390/UXAGSay7Lqj/DkFjz89U2OGGlq8VfwET9G85mJUgJz0bpmsPWgcYf/0A5Cp0me
         bcDw==
X-Forwarded-Encrypted: i=1; AJvYcCUmo3q4vMT4o8rm2jyT60jl8a/5yVJCFywV6FK1YHI6KDdnytnBm+GJ8Vw8jlNzIfSZq10XH4MuGjQV@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8Q8WUyB11FDTc0y+IM+YA+YGB5UNBV9dd8gaoMVK88+gV46h
	JJkpbdNB8l3G+25nynxGnNdK9RJ207bDtkyGxBaw4e5WmRv4e3RZF7tBBVcZe28=
X-Google-Smtp-Source: AGHT+IGfFIA7pHiw/bQC/D2ASD/c0vYvs4DJcTYAQN6+XwmdDdmF15vw/BW0JRu8bqizSc9PGJFmeA==
X-Received: by 2002:a17:906:a84a:b0:a9e:8522:19e1 with SMTP id a640c23a62f3a-a9e85221c0cmr968110466b.62.1730817073143;
        Tue, 05 Nov 2024 06:31:13 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb169fc18sm140394466b.10.2024.11.05.06.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:31:12 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 5 Nov 2024 15:31:38 +0100
To: Stanimir Varbanov <svarbanov@suse.de>
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 09/12] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <ZyosSv4ecKxohSrM@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <1f4cec50493ec5d3168735c0a005771787e5cd59.1730123575.git.andrea.porta@suse.com>
 <4a474dae-6669-4678-87dd-e0e9692a749b@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a474dae-6669-4678-87dd-e0e9692a749b@suse.de>

Hi Stan,

On 15:29 Mon 04 Nov     , Stanimir Varbanov wrote:
> Hi Andrea,
> 
> On 10/28/24 16:07, Andrea della Porta wrote:
> > RaspberryPi RP1 is a multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add a dtb overlay that will be compiled into a binary blob
> > and linked in the RP1 driver.
> > This overlay offers just minimal support to represent the
> > RP1 device itself, the sub-peripherals will be added by
> > future patches.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > NOTE: this patch should be taken by the same maintainer that will take
> > "[PATCH v3 10/12] misc: rp1: RaspberryPi RP1 misc driver", since they
> > are closely related in terms of compiling.
> > 
> >  MAINTAINERS                           |  1 +
> >  arch/arm64/boot/dts/broadcom/rp1.dtso | 61 +++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 06277969a522..510a071ede78 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19383,6 +19383,7 @@ F:	include/uapi/linux/media/raspberrypi/
> >  RASPBERRY PI RP1 PCI DRIVER
> >  M:	Andrea della Porta <andrea.porta@suse.com>
> >  S:	Maintained
> > +F:	arch/arm64/boot/dts/broadcom/rp1.dtso
> >  F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
> >  F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> >  F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > new file mode 100644
> > index 000000000000..8d1bbf207a30
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > @@ -0,0 +1,61 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +	fragment@0 {
> > +		target-path="";
> > +		__overlay__ {
> > +			compatible = "pci1de4,1";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <2>;
> > +
> > +			pci_ep_bus: pci-ep-bus@1 {
> > +				compatible = "simple-bus";
> > +				ranges = <0xc0 0x40000000
> > +					  0x01 0x00 0x00000000
> > +					  0x00 0x00400000>;
> > +				dma-ranges = <0x10 0x00000000
> > +					      0x43000000 0x10 0x00000000
> > +					      0x10 0x00000000>;
> > +				#address-cells = <2>;
> > +				#size-cells = <2>;
> > +
> > +				rp1_clocks: clocks@c040018000 {
> > +					compatible = "raspberrypi,rp1-clocks";
> > +					reg = <0xc0 0x40018000 0x0 0x10038>;
> 
> shouldn't this be:
> 
> 	rp1_clocks: clocks@18000 {
> 		reg = <0x00 0x00018000 0x0 0x10038>;
> 		...
> 	}
> 
> ?
> 
> And for other nodes too...

For that to be @18000 instead of @c040018000, you should also change
the "ranges" entry in pci-ep-bus node, as follows:

ranges = <0x00 0x00018000	//This was: 0xc0 0x40000000
          0x01 0x00 0x00000000
          0x00 0x00400000>;

which is of course feasible, but I prefer to use addresses that 
resemble (at least to some extent) the ones in RP1 docs.

Many thanks,
Andrea

> 
> ~Stan
> 
> > +					#clock-cells = <1>;
> > +					clocks = <&clk_rp1_xosc>;
> > +					clock-names = "xosc";
> > +					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
> > +							  <&rp1_clocks RP1_PLL_SYS>,
> > +							  <&rp1_clocks RP1_CLK_SYS>;
> > +					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
> > +							       <200000000>,  // RP1_PLL_SYS
> > +							       <200000000>;  // RP1_CLK_SYS
> > +				};
> > +
> > +				rp1_gpio: pinctrl@c0400d0000 {
> > +					compatible = "raspberrypi,rp1-gpio";
> > +					reg = <0xc0 0x400d0000  0x0 0xc000>,
> > +					      <0xc0 0x400e0000  0x0 0xc000>,
> > +					      <0xc0 0x400f0000  0x0 0xc000>;
> > +					gpio-controller;
> > +					#gpio-cells = <2>;
> > +					interrupt-controller;
> > +					#interrupt-cells = <2>;
> > +					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
> > +						     <1 IRQ_TYPE_LEVEL_HIGH>,
> > +						     <2 IRQ_TYPE_LEVEL_HIGH>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> 

