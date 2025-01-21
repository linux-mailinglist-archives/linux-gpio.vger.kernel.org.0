Return-Path: <linux-gpio+bounces-14960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BBA17961
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 09:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E789A3A91C2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273451B87F0;
	Tue, 21 Jan 2025 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HF5znpdU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC21B85D7
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448969; cv=none; b=p0hOBd9KdY3groyBqu9FSdxuzMvj0pdfvR15xsSnk+/obeMFRWqHnxLLLj/4PGkyqD0CS5oYqTDl9rtqFmUTHoIC/QgOHtZAonGTkYTdmsCIQTyFDjGgsFo54vGhJ6PpGaz4gyNUGd0XJWNu64uKMtItShPmJ+aETsl3lTFoQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448969; c=relaxed/simple;
	bh=btTsSgCbAPnhnTrI4HdjrpnhkhsKx37tGtdBNk94yms=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKWdWDtgLFa+qUjuxn9tf9uOjoE5F/OpChkvXCRmkbaiMRBOzH+anrDUqCwEP/+wNkowTbVc9yZFXEVIwW83+CDzksGiSNRfyQVDs8bWCodbW5cWKcc6GLmsx8tNaQsChO8rEnSXmt7hwqr1AW5NUe/8UEdO63mrarNCLDNwbko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HF5znpdU; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-aaee0b309adso800540166b.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2025 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737448965; x=1738053765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=;
        b=HF5znpdUsdaV6qLC9lBW25Mt4f8DohDD1Hv7Xil8TqKPGDeyrYwnuiHERZ9qsA7RFj
         hzcjMIBllI4/HO1rhtP3NvR0q8s9VIEnk2B7BENXK4O2lkUH2zSeg9C4VRCmZYR+gCL8
         eEOenBONGYMFWHn6QpvSJxeRafK7EEfASUC5nVZQyNLQkJz+Uj22VO3xI97fzlH45H5U
         Wyxv0Qtca0MP8clcOQZK4qUVxSOKnuJBEHlSrhdpQEyf+3/rZRxKSQeVMOwYHjPxzgqE
         uskuEfRKQTTd8/ZnfIQxJZXJ5pPnLZQBVqdg0jmA2dFEwb/YSTCqTqWzDTdtQXFD+BTx
         FKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737448965; x=1738053765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=;
        b=MR8qNno7+73q/JBD4bQGceHv5Hg1Q4HzrTzKdG+3rUk6VQbHs6sD9XMCaLGWNAQ11R
         WnRpTKs77uCyxf41QOG5dL2d79I98ai8LHKX9DM4s5MhXAKcfpI+8j1KfbPtfPmL8jIq
         uMb01fDRsR/kKty90AMmsbuFZ7hctXdOGnSpxsKfGxVTQgRpdIOWGAivamD9avgqp5Vp
         9Ebr3UIDx1GDsLWTjjw+eu07IOvuUT4Y18rd3+ulBdWeHS9sB/f0a7d4tEiCiT+hRleb
         c/BicNzm/o1Y/bKfWJQthh5Wk/bruWByPUoXP5d0RVHqwpEpEd/Ys+9Y7T7ytLpodKR4
         MA1A==
X-Forwarded-Encrypted: i=1; AJvYcCWY+pJ7Fcy53T3944fEQNZyYef65C+O26MMLjn6cciW4Bos6G5ELHRNxKi3MeujYDFPc8kLz5k1TH5t@vger.kernel.org
X-Gm-Message-State: AOJu0YzgK4v7gI30rqMaigXqZJPwQGH9xeZhG9mxJvbtUOOatfKAAtZq
	pmY6Qu6mheymYcLDz0mR/2tsrJvgRwTYhvOqPSMMWKyAKOeRwTdN8pLFKg8O1Y4=
X-Gm-Gg: ASbGnctM8qS/7JHfhFt6ZvJsfOI3ML10puBgv44C7khqzu7/aovimzHcXQ6iPa0W29/
	mqzlRyL49J7+dtgRx5vIp3lctrjnRk57FtpfPz/QwMznBZgksN3h31fzwMWYVO3V5QeP9a15ipe
	Gplu5f0UDF5nbITbbBgsQbhOf4PKAEO02dsRWeqwRyuEPY/iaN6C2uxMoSsb6BKr09KtCdh2/jZ
	RZidBs5CeCLf08Gk0xHvc7BJxrRkcKhMal/MAmQlTH0eKLAZnZl0XzErBvYFeTChIfvLIC1Rn+C
	cvEjFJyXOim3QPu2ojnUrCc2CZca7S3omMgNu7O6
X-Google-Smtp-Source: AGHT+IHJoMEfBlMLvkr8KlEq8oWlxXFcL1m1dYtTgkFptyAjoAjldlyHkpeVawKUvQ8QmvdxpOWQWw==
X-Received: by 2002:a17:906:5617:b0:ab2:b8c3:be3c with SMTP id a640c23a62f3a-ab38b3fb0dcmr1352712066b.51.1737448964785;
        Tue, 21 Jan 2025 00:42:44 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c75baesm719449966b.1.2025.01.21.00.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:42:44 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 09:43:37 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <Z49eOdVvwknOoD3E@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011722-motocross-finally-e664@gregkh>

Hi Greg,

On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > 
> > For reasons why this driver is contained in drivers/misc, please
> > check the links.
> 
> Links aren't always around all the time, please document it here why
> this is needed, and then links can "add to" that summary.

Ack.

> 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf

...

> > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > new file mode 100644
> > index 000000000000..3e8ba3fa7fd5
> > --- /dev/null
> > +++ b/drivers/misc/rp1/rp1_pci.c
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > + * All rights reserved.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "rp1_pci.h"
> 
> Why does a self-contained .c file need a .h file?  Please put it all in
> here.

I agree with you. Indeed, the very first version of this patch had the header
file placed inside the .c, but I received concerns about it and some advice to
do it differently, as you can see here:
https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
so I've changed it accordingly in V2. So right now I'm not sure what the
acceptable behaviour should be ...

> 
> > +
> > +#define RP1_DRIVER_NAME		"rp1"
> 
> KBUILD_MODNAME?

Right. Thanks for pointing that out.

> 
> > +
> > +#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
> > +
> > +#define REG_SET			0x800
> > +#define REG_CLR			0xc00
> > +
> > +/* MSI-X CFG registers start at 0x8 */
> > +#define MSIX_CFG(x) (0x8 + (4 * (x)))
> > +
> > +#define MSIX_CFG_IACK_EN        BIT(3)
> > +#define MSIX_CFG_IACK           BIT(2)
> > +#define MSIX_CFG_ENABLE         BIT(0)
> > +
> > +/* Address map */
> > +#define RP1_PCIE_APBS_BASE	0x108000
> > +
> > +/* Interrupts */
> > +#define RP1_INT_END		61
> 
> 
> 
> > +
> > +struct rp1_dev {
> > +	struct pci_dev *pdev;
> > +	struct irq_domain *domain;
> > +	struct irq_data *pcie_irqds[64];
> > +	void __iomem *bar1;
> > +	int ovcs_id;	/* overlay changeset id */
> > +	bool level_triggered_irq[RP1_INT_END];
> > +};
> > +
> > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > +{
> > +	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> 
> Do your writes need a read to flush them properly?  Or can they handle
> this automatically?
>

I had some thoughts with RaspberryPi foundation folks to double check it, and it
seems that there should be no need to readback the value (unless we want to go
really paranoid), so I would avoid that since in case of level handled interrupt
we would end up reading the register on every triggering interrupts.

Many thanks,
Andrea
 
> thanks,
> 
> greg k-h

