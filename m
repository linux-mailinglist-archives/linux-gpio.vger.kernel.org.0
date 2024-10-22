Return-Path: <linux-gpio+bounces-11745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA689A9E22
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 11:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19EFA1C239BC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDA7198A2F;
	Tue, 22 Oct 2024 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y6cUtWkI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0117B51B
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729588546; cv=none; b=Vb2ZToZTnPgpDKyiiwWC5YiJHVay8zCswRMerZ382Kwt2phFP1o/MblEYfiKK3kubALhOMhNTSBKXPI2mrd96JklhDM2fmbsbt1qOVWjQMccBe6FUsXVJoXlQ4MRZZh1Uf5yDd84vrw0+tnoshrv/NRSt6ztsUAt0025Qt7U4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729588546; c=relaxed/simple;
	bh=Uk8Pa45s/KheSrUEOKOicHeanGteTnbgslk7ul9tBQs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmKN+m7c0K+abhNtrXySYzHkUgOn6oPN64oD38T7nugFntl76qT4xUf74KixBlz/NpS6HXo0RQyXnQLKC5VUMur2cK34fsRx05alk+sfAb5fnT46Y8JBCOOpD5cEawO+WI8IFLVzfFDVgLKkG1VsOQJVBVDRAL1gu0qt4jhHje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y6cUtWkI; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so6670255a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729588542; x=1730193342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsPzi2IAagO7nqzLDsgxybyAdjpi8ZWkxbmu+EWhc0o=;
        b=Y6cUtWkIgaRVKYVYdl2h1UzqB19s2QfcONrnlSfVLZQZImtmS0Yck8MI9MLImZpIA7
         v2bmHG2UcW8G/u7HTtFtuuGyXeF/V2jNevD9rJH5ftn0DPvYiDc427c/ooUQDsJog2TV
         xBB75xu/PxyYqYd3PoxXHVZ+6AFDvc/vwQBI3OSiqIzduh3jc+xMKyLA7vlXjjrgBZjO
         CecWDRBdvdfyzxd0etVZSyBxG7Se0E3EU/j+bCOjrUycAV7bDboxdLZ1wKeHwA2E9Nen
         E4scyprJZv82bMxmnofMxR/UpuZQ6YNI8Xmc7sIYqzZtv+gppIeRlCHTRo18+1EFHm01
         s0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729588542; x=1730193342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsPzi2IAagO7nqzLDsgxybyAdjpi8ZWkxbmu+EWhc0o=;
        b=HSoNSjiGlsT/lv521GGe1LWWwjU1XHHWEBMpVgsQEjcYlOHAXvjf4uLdxYvxJTCkYL
         hq40/LDrOufcGzLV7qjG355yh+B+aiZwTdfDK82iyGreFDakw+T+kMo1TttsPxcgOwdt
         AVtTaYsb6K77qRDJOBx44jptfdyZma7gxZdXH/quBOF5cfmAW2TkEOcwz/qC9b4Sle34
         qNbRLUf7nihAMK0wr6npLnUqum1ixLTY3zqrWfpdGU/gAzROdOjR4CTW9wu2TN5zeqAp
         K4H5Bv95dBg90fi4QoQ71kGMGBK6F0JyglM+xspwLKIkLbBvgctDjlLDoPKbUn7SA6Ut
         tcIg==
X-Forwarded-Encrypted: i=1; AJvYcCU8kqY6Mumbkze8wsXAP5oC3uP0mnYmqcNzS/dHbDghXzsnLSYWO1Fupno0yMkM/zmpPCW6+EZwbQtA@vger.kernel.org
X-Gm-Message-State: AOJu0YzqJr0hi28RZgIzKuOPIgdPQdBJdn+2oEE3/saWgu++7xI9pmU1
	W2bmafcEwss4GfcMru9a1ysWHeyyOy3ggV6uoMm/dFr3S8cne6YwInHldjmnA5c=
X-Google-Smtp-Source: AGHT+IG0UbTdshGjhe1cBG9B7a7reFtp9fnVda6ehg+mYut3t/cw34W4iDARXx7x4hjoKD2s8wnmcA==
X-Received: by 2002:a17:906:6a29:b0:a99:e504:40c5 with SMTP id a640c23a62f3a-a9a69bb4776mr1542963966b.39.1729588542016;
        Tue, 22 Oct 2024 02:15:42 -0700 (PDT)
Received: from localhost (host-95-239-0-46.retail.telecomitalia.it. [95.239.0.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d8381sm308924466b.45.2024.10.22.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:15:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 22 Oct 2024 11:16:02 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: Re: [PATCH v2 03/14] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <ZxdtUm_uoFvvKtVl@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <e1d6c72d9f41218e755b615b9a985db075ce9c28.1728300189.git.andrea.porta@suse.com>
 <flxm3zap4opsjf2s4wfjwdj6idf7p6errgtiru4xgbgkfx4ves@xxiz42cghgvr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <flxm3zap4opsjf2s4wfjwdj6idf7p6errgtiru4xgbgkfx4ves@xxiz42cghgvr>

Hi Krzysztof,

On 08:24 Tue 08 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 02:39:46PM +0200, Andrea della Porta wrote:
> > Common YAML schema for devices that exports internal peripherals through
> > PCI BARs. The BARs are exposed as simple-buses through which the
> > peripherals can be accessed.
> > 
> > This is not intended to be used as a standalone binding, but should be
> > included by device specific bindings.
> 
> It still has to be tested before posting... Mailing list is not a
> testing service. My and Rob's machines are not a testing service.

Sorry about that, I must have missed that file when rechecking all the schemas
after rebasing on 6.12-rc1.

> 
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/pci/pci-ep-bus.yaml   | 69 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > new file mode 100644
> > index 000000000000..9d7a784b866a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common properties for PCI MFD endpoints with peripherals addressable from BARs.
> 
> Drop full stop and capitalize it.

Ack.

> 
> > +
> > +maintainers:
> > +  - Andrea della Porta  <andrea.porta@suse.com>
> > +
> > +description:
> > +  Define a generic node representing a PCI endpoint which contains several sub-
> > +  peripherals. The peripherals can be accessed through one or more BARs.
> > +  This common schema is intended to be referenced from device tree bindings, and
> > +  does not represent a device tree binding by itself.
> > +
> > +properties:
> > +  "#address-cells":
> 
> Use consistent quotes, either ' or ".

Ack.

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 

