Return-Path: <linux-gpio+bounces-13364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4739DEAEF
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 17:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDB8D163CE6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 16:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898FE14E2E6;
	Fri, 29 Nov 2024 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SXKYN/KE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2998545BEC
	for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732897671; cv=none; b=iW8wd1VEepD9/rzAIJWY5/uZn1jHkwUuMQZTXoG2azhM/X4fahxvNksxnD4neNmvveqRqe3i3kSl5Ey1qe9OyVYyfghacmES3aycEy6v3C9o6aEBJqcKpQJdUBWwCIKKFIoRpF0oEw2O+g5Nomd/ccAP0AiAzupjg4NuOxgjCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732897671; c=relaxed/simple;
	bh=5w1O89chOqgyMhWZqb9VM6E+m7Ixqgv0RFEj+OZES/M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+56deaHKE9K2SjsxXoVJTboG6QAYPE/IPeAPMZipZcBfSl7i9g7AgEbJeoUqsAsM2ecxd3sGNxtqEW/oknVpj6Ys/PchaT6xwfcc7OmYhRNnH+jhfxE9ORt10bT5Tpsyju4rGt6pa4UqrsO0RK13et0RSo9tl9WyLlA/NOQ/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SXKYN/KE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa51bf95ce1so396142166b.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 08:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732897666; x=1733502466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwH5v+3GE18kFTNrayT4BgfE0WPSq36ccL8dVwg+Yh0=;
        b=SXKYN/KEOyynrFJcDSY9fKinPxPtzm7uWRAULf7byMbXWKz2zCJu6+aQnV0Ep6+Wpz
         UWoux77G37vEbXIdP0h95EneTQqw8W2nAx5UaY/ePqEfSOrxE9elLbGEcs/ZIqsv6bqF
         Y6Ukh96oPrRmCQvTdqpOU/xxQW0kIQIsYqzpkA823EiuH7tr+sBr8y/aZY7OEBoPuO07
         4yeVObIAAL64qCdwaLxiXHktmKeQrd/sagClP4y8JbCRwV36elsRVvcFRCncLiiHcx1g
         NDURsOThUhktc//Il1++bMjEk9NqtJYNbliGeWiyN9/7LaoAe4Js8NNjnaRwr1ql/4DY
         EUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732897666; x=1733502466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwH5v+3GE18kFTNrayT4BgfE0WPSq36ccL8dVwg+Yh0=;
        b=U065vHJ1siuCYuU6Q4N2TQHcEBiqyzCQ9TfXwDFBGw63bQP2YSN21FHnfAAslbAMuz
         jdVnUGZENISBTyffwI/L0ECHm4eUtZdBM3deQ64z4dl+Bt0bJSPD7fKTyrCqF3chqrTC
         CYmhpSTx0bKv5KjyTCGxgg4L6x0Ou0vbxLX5Z+YHUXIyLEOQviHiVVTHKxcnKi2RdAn8
         /3DG+hMZDdHSJTbcZfOi8Xp/RDm19JmV28I+Gq4HqNcKrMhUYcE5TrclPvTCdrcNxziU
         YIyaS7T2sAL3Vz+yBwtEI2BeTxCV1WQ6oPW7sEq7fmo/ncsivs6E+5UMMTm6S3tCIZN1
         ni/A==
X-Forwarded-Encrypted: i=1; AJvYcCVRI47gD03bJeYHLxwdtaKuK1JajD+5wdwrgqygKMoqo19lzgGYoR/eS9X898sIC687ueNDja+vTYpv@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZJlNvXEs3hTNyotQwn7k9CWAwOrSI/W04rqrvHG9Xu4v7+s2
	M0DIpYVDUhJCw7yNy6YTKsLj00es2u56zqa/bpqwwDnPBRWJkcOz+AinmMfgyX8=
X-Gm-Gg: ASbGncswLjEfO4CuEfQHRJN0STcDMpbcoA5Iovw9wGs/TxkiJxVt5HLi4wHEFS3K0hm
	ru5OEe0FOABvh4tKjzB144RIEIAMA6NqPslQuNlgAwIwvA05o3dTLz0ba2p8TRnLd8he7unRun8
	bgrvczgS+4TdNFpk9nO1H4yDggI5DRXN95G7d+iH+tXXjJYIhTo9W+Xcc4/SQQYWkbR8T63AETe
	HqfNPlveI4uhKkbuyspSMRT0zvY5PTdNNH2CXv/e0WY8hwAr9MNzXDw+H9CHg2yktqHMTXBUVgj
	R76RyG+KShZLa23v2+BM
X-Google-Smtp-Source: AGHT+IFdG9GOu7z7VbF3RaWxqyGcxIpQuKws1pr8ZUhjgAPYuz3ueFSPxNUGdj5E67EBohC3LgYQSw==
X-Received: by 2002:a17:906:318d:b0:aa5:1957:3431 with SMTP id a640c23a62f3a-aa580edfbfcmr1150158266b.1.1732897666347;
        Fri, 29 Nov 2024 08:27:46 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c193asm189510666b.38.2024.11.29.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 08:27:45 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 17:28:19 +0100
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
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z0nro2vMNxoU35GH@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <c48e6b9b178cdaa01b92ae82e8fd24c2ba5f170c.1732444746.git.andrea.porta@suse.com>
 <c5575991-eab1-40ef-a984-b23076b09cf3@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5575991-eab1-40ef-a984-b23076b09cf3@gmx.net>

Hi Stephan,

On 19:35 Mon 25 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 24.11.24 um 11:51 schrieb Andrea della Porta:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> >
 
...

> > +          Support the RP1 peripheral chip found on Raspberry Pi 5 board.
> > +	  controller, USB controller, I2C, SPI and UART.
> > +
> > +          The driver is responsible for enabling the DT node once the PCIe
> > +	  endpoint has been configured, and handling interrupts.
> > +
> > +          This driver uses an overlay to load other drivers to support for
> > +	  RP1 internal sub-devices.
> Please fix up the leading whitespace here

Ack.

> > diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
> > new file mode 100644
> > index 000000000000..508b4cb05627
> > --- /dev/null
> > +++ b/drivers/misc/rp1/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only

...

> > +#define RP1_INT_SYSCFG		58
> > +#define RP1_INT_CLOCKS_DEFAULT	59
> > +#define RP1_INT_VBUSCTRL	60
> > +#define RP1_INT_PROC_MISC	57
> > +#define RP1_INT_END		61
> > +
> > +struct rp1_dev {
> > +	struct pci_dev *pdev;
> > +	struct irq_domain *domain;
> > +	struct irq_data *pcie_irqds[64];
> > +	void __iomem *bar1;
> > +	int ovcs_id;
> /* overlay changeset id */

Ack.

> > +	bool level_triggered_irq[RP1_INT_END];
> > +};
> > +
> > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > +{

...

> > +	struct device_node *rp1_node;
> > +	struct rp1_dev *rp1;
> > +	int err  = 0;
> Please remove the extra space after err

Ack.

> > +	int i;
> > +
> > +	rp1_node = dev_of_node(dev);
> > +	if (!rp1_node) {
> > +		dev_err(dev, "Missing of_node for device\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	rp1 = devm_kzalloc(&pdev->dev, sizeof(*rp1), GFP_KERNEL);
> > +	if (!rp1)
> > +		return -ENOMEM;
> > +
> > +	rp1->pdev = pdev;

...

> > +	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
> > +				    PCI_IRQ_MSIX);
> > +	if (err < 0)
> > +		return dev_err_probe(&pdev->dev, err,
> > +				     "pci_alloc_irq_vectors failed");
> > +	else if (err != RP1_INT_END) {
> Please add braces for the if case

Ack.

Many thanks,
Andrea

> > +		dev_err(&pdev->dev, "Cannot allocate enough interrupts\n");
> > +		return -EINVAL;
> > +	}
> > +
> > 

