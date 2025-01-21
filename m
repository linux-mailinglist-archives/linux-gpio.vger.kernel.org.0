Return-Path: <linux-gpio+bounces-14974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78516A17F88
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 15:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D3147A2B5C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9081F37D6;
	Tue, 21 Jan 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I+z6qQ2E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC563CF;
	Tue, 21 Jan 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737469121; cv=none; b=TUI7FNmGUAT3CFp4pZi1Oyh7EiW0omcFPH4kERByS9O3qH5yEfw62TU1BG4rSRLS1WiNuF7xQIaipVJzWe2Umrq2iq+N35KkhoNmb8TnbuROklFqDOlaBH1zXi55PFeVQdWmhJQ8LFDjmYISD8BCYcS18FohTmYjUubGyJyWftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737469121; c=relaxed/simple;
	bh=5i/X/Iz+JTYsKD4chZ95l9x8evxZABASz1O34jduQyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbfCJZqzulk/7riMb9OQTfO+xatp7iVxyzzZ/nw7jJP5nJIguTe0uWD7505yJ0cde0XOtk/eHcCwggNrJR63wKK8UmeCStp7Lwx2k8B9HlxRtZuTtsgR3PkILQRh/upck1UeRvnwWETT4Knu/APB4G7sX8Xva4GM3fcehNr3iG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I+z6qQ2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F920C4CEDF;
	Tue, 21 Jan 2025 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737469120;
	bh=5i/X/Iz+JTYsKD4chZ95l9x8evxZABASz1O34jduQyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+z6qQ2Evs42wV2TDzuc5tlgJ/P7u60q697JMC2ZKKTj7gESHiAbzkyGy29VHM+6X
	 qmZjOt1uiBPFDO1bs5n3G4OwLGg/1t71x2AWSp880rxO1zrFvmig8Z/xS97RqVcMdn
	 SqEHZJtLpYm2VMWN/o6CK8K2x4lvj8mYJodj9qKU=
Date: Tue, 21 Jan 2025 15:18:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <2025012157-bonsai-caddie-19b2@gregkh>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
 <Z49eOdVvwknOoD3E@apocalypse>
 <2025012143-rippling-rehydrate-581b@gregkh>
 <Z4-oORWO4BgOqibB@apocalypse>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4-oORWO4BgOqibB@apocalypse>

On Tue, Jan 21, 2025 at 02:59:21PM +0100, Andrea della Porta wrote:
> Hi Greg,
> 
> On 09:48 Tue 21 Jan     , Greg Kroah-Hartman wrote:
> > On Tue, Jan 21, 2025 at 09:43:37AM +0100, Andrea della Porta wrote:
> > > Hi Greg,
> > > 
> > > On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> > > > On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > and others.
> > > > > 
> > > > > Implement a bare minimum driver to operate the RP1, leveraging
> > > > > actual OF based driver implementations for the on-board peripherals
> > > > > by loading a devicetree overlay during driver probe.
> > > > > 
> > > > > The peripherals are accessed by mapping MMIO registers starting
> > > > > from PCI BAR1 region.
> > > > > 
> > > > > With the overlay approach we can achieve more generic and agnostic
> > > > > approach to managing this chipset, being that it is a PCI endpoint
> > > > > and could possibly be reused in other hw implementations. The
> > > > > presented approach is also used by Bootlin's Microchip LAN966x
> > > > > patchset (see link) as well, for a similar chipset.
> > > > > 
> > > > > For reasons why this driver is contained in drivers/misc, please
> > > > > check the links.
> > > > 
> > > > Links aren't always around all the time, please document it here why
> > > > this is needed, and then links can "add to" that summary.
> > > 
> > > Ack.
> > > 
> > > > 
> > > > > This driver is heavily based on downstream code from RaspberryPi
> > > > > Foundation, and the original author is Phil Elwell.
> > > > > 
> > > > > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > > 
> > > ...
> > > 
> > > > > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > > > > new file mode 100644
> > > > > index 000000000000..3e8ba3fa7fd5
> > > > > --- /dev/null
> > > > > +++ b/drivers/misc/rp1/rp1_pci.c
> > > > > @@ -0,0 +1,305 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > > > > + * All rights reserved.
> > > > > + */
> > > > > +
> > > > > +#include <linux/err.h>
> > > > > +#include <linux/interrupt.h>
> > > > > +#include <linux/irq.h>
> > > > > +#include <linux/irqchip/chained_irq.h>
> > > > > +#include <linux/irqdomain.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/msi.h>
> > > > > +#include <linux/of_platform.h>
> > > > > +#include <linux/pci.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +
> > > > > +#include "rp1_pci.h"
> > > > 
> > > > Why does a self-contained .c file need a .h file?  Please put it all in
> > > > here.
> > > 
> > > I agree with you. Indeed, the very first version of this patch had the header
> > > file placed inside the .c, but I received concerns about it and some advice to
> > > do it differently, as you can see here:
> > > https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
> > > so I've changed it accordingly in V2. So right now I'm not sure what the
> > > acceptable behaviour should be ...
> > 
> > It's a pretty simple rule:
> > 	Only use a .h file if multiple .c files need to see the symbol.
> > 
> > So no .h file is needed here.
> 
> Perfect, I'll revert back that two lines to V1 then. Please be aware
> though that this will trigger the following checkpatch warning:
> 
> WARNING: externs should be avoided in .c files

Well where are those externs defined at?  Shouldn't there be a .h file
for them somewhere in the tree if they really are global?

thanks,

greg k-h

