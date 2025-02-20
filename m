Return-Path: <linux-gpio+bounces-16338-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147BA3E28E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 18:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C82F1884183
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB13212D66;
	Thu, 20 Feb 2025 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YBA/LN7t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF851FECCD
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072801; cv=none; b=ORQBz7uWmt2zirVJKAWSSyTpI+lvUC2AEP1u6oc2U0TEaIAdo+f0jycDat4O/kYHEcDvnSo4B9fRgM0j84jJY74uKrdQoWSwdYRHBKLoP5/f36dY9WMZY6WpChi0dzVYSTv7LuP1P/5EWimjZznG5GG9A3Smjy5tZPhTN8JeixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072801; c=relaxed/simple;
	bh=tdSgk07Qmyb1E0a1lw0F1X8xB3gcZzChTJbUZHLvlvw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXNi/96+G+l9ph3tQjTPwQKXIE6SsQajmc3fSYCrZygFhZp++AwszbMxiU/rb/ahpADF4jQmodUPVmpyZQDkSwtuPgqA8C5pPyws6ImWSBWBwYZ7VwzBSp2PHwQYSImTJcgY/jf+W+mlRBUSvX8jkXRgoWZENLf5Ta1YYlccTnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YBA/LN7t; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so4362926a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740072797; x=1740677597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANYY81S4UUbSzxGp9vX0hw/u/obOtXq2bTCgGH3coGw=;
        b=YBA/LN7thNd0kfJi6YUgXpWSohTH4hfKCGstG7P6rVOIvoqYVImMOkWF2SLD/TvS3l
         zpzriDHW07QsPXQXaeYTV7dArcZpAMR00SnpouK21pHa8IZMfcHCKN9aIW0tYLBti9nL
         8TcxgOH9SH9ZtwiVdF78otXhfJo0Db4W2ZMF41U/afSvTQIYgGrNe3dk6luNCA2iE42X
         G0IfBQ4yS/WJwvG6cnMYDSRA4b7cl4AVk0fLBiedZQkYQdjIaBUZE6rSUso+xS9LIAf9
         tllmocprm5GBV2KAAwnWvpRF5cqADPVnBL/l7qrNdktdMSYVjojg4vzhoU0OCcwZLthF
         3HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072797; x=1740677597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANYY81S4UUbSzxGp9vX0hw/u/obOtXq2bTCgGH3coGw=;
        b=u5cdAKBbGPJpv6dPlEEFr0XZcPETfFuGIADOoav38ROf1TOaHp3QPbFfltwMahoa9k
         Y5xhtWsUzVSGwLw5BKM5MbGTdkjIQB+F3QvFcPsWr9TpM5IOjicjsCTCIoy5lAXxpOeK
         Ka3OtFziaWbaOUZfk0m4CvefhQ7ePmgOCIWgjsQ8LaskNm0vfSQ0McFdk+VXUgpS1V6x
         tXHqN1rx4fgd6HQmEYdVGZBLu7CDNGGAu+Xu52atViyuymd0B3WG2ry9igrClDAeYbNP
         9MWsjLrZi6hZVAS1gioFcWXzjhrmcDxqEE59ddwA06sk9ZH9+oHgmftvxy5pH0aiLa8r
         mmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrXedN0PCQvc81obCAvpME2pHY1yY+5JiVRwIWN7AKbm1vkM4ode5iAbraDEzbcZDECw/K61y9xat/@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+Fw1NQMoCbmTk9lL64J/GPS6B5t+w+Ce7jMlZDaP+N8j0D9L
	bIfH8s9tLZyqSIT1PngjmGPBkubW7KKOCiyEhxBK0TFFteRwQ3UGImyBougxi+U=
X-Gm-Gg: ASbGncsrkx1zEAi00WC1PLMyo4zU1W3PAWUQohZgk0WkL8aeqwbIbNcAkVaHeLaNS57
	WwI3K8hkuFSPBzusJ+zoQtSLUK98s4aNsbh1gSxOEmF8+c5Rd6DyqxUIlmSwvw/FPugB861H0t9
	o3nraP8JniR/2qRpHw9o9mhk496ksnJ6X1UPxDCnm7LG6J2dElmEMUeDjkVQ1nW18ImqPveLFF3
	DLfXFWDjlvcMPg4v73NX1PaeUXC2hY4bIGpcL1w38PFaaZpAOk4Q/is2Xr+SxszFIu5SBTY7Zc8
	AQRHP9lerUwistPbN+6QSyDpKQl09T151rbFLLpqhp02bYxL2CnpnAouD3Y=
X-Google-Smtp-Source: AGHT+IFcZuFtypbIC0ocwrn0UjtnE5zIzW4WQOLazDAdOMAwrDA8BDnjnnZ6hgx+i5rr6QtaeBrAFg==
X-Received: by 2002:a05:6402:524b:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5e0a12baa86mr3394933a12.12.1740072797358;
        Thu, 20 Feb 2025 09:33:17 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e076048c05sm5023923a12.35.2025.02.20.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:33:16 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 20 Feb 2025 18:34:21 +0100
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
Subject: Re: [PATCH v7 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z7dnnW4npJmfOVE0@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <d1362766e3e966f78591129de918046a4b892c18.1738963156.git.andrea.porta@suse.com>
 <87525350-b432-40b3-927c-60cd74228ea4@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87525350-b432-40b3-927c-60cd74228ea4@gmx.net>

Hi Stefan,

On 15:21 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.

...

> > +static int rp1_irq_set_type(struct irq_data *irqd, unsigned int type)
> > +{
> > +	struct rp1_dev *rp1 = irqd->domain->host_data;
> > +	unsigned int hwirq = (unsigned int)irqd->hwirq;
> > +
> > +	switch (type) {
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %d\n", hwirq);
> This looks a little bit inconsistent. Only this type has a debug
> message. So either we drop this or add at least a message for

I think that this is indeed asymmetric. That warning says
that the 'special' IACK management is engaged for level triggered
interrupt, which is mandatory in order to avoid missing further
interrupts without the performance loss of busy-polling for 
active interrupts. This is explained in par. 6.2 of:

https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf

The point is that we're not stating the type of the interrupt
(edge/level triggered), but we warn that we're enabling a mechanism
useful for one type only (level triggered).

> IRQ_TYPE_EDGE_RISING, too. Btw the format specifier looks wrong
> (unsigned int vs %d).

Ack.

> > +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = true;
> > +	break;
> > +	case IRQ_TYPE_EDGE_RISING:
> > +		msix_cfg_clr(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = false;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> It would be nice to document why only IRQ_TYPE_LEVEL_HIGH and
> IRQ_TYPE_EDGE_RISING are supported. In case it's a software limitation,
> this function would be a good place. In case this is a hardware
> limitation this should be in the binding.

All ints are level-triggered. I guess I should add a short comment in
the bindings.

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct irq_chip rp1_irq_chip = {
> > +	.name		= "rp1_irq_chip",
> > +	.irq_mask	= rp1_mask_irq,
> > +	.irq_unmask	= rp1_unmask_irq,
> > +	.irq_set_type	= rp1_irq_set_type,
> > +};

...

> > +		irq_set_chip_and_handler(irq, &rp1_irq_chip, handle_level_irq);
> > +		irq_set_probe(irq);
> > +		irq_set_chained_handler_and_data(pci_irq_vector(pdev, i),
> > +						 rp1_chained_handle_irq, rp1);
> > +	}
> > +
> > +	err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id, rp1_node);
> > +	if (err)
> > +		goto err_unregister_interrupts;
> > +
> > +	err = of_platform_default_populate(rp1_node, NULL, dev);
> > +	if (err)
> > +		goto err_unload_overlay;
> I think in this case it's worth to add a suitable dev_err() here.

Ack.

Many thanks,
Andrea

> 
> Thanks

