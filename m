Return-Path: <linux-gpio+bounces-12500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBD9BAEA2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F4D1C20E72
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 08:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639901ABEBB;
	Mon,  4 Nov 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L6D+oWFY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838771AAE2E
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710476; cv=none; b=Te+n7EsX3MF+OMI6t1ESGLAAHgm5PNjuqatuAsmEIIKT1YBw9AoTovLpTYL0/TyBAwCPaej6FBymVBjCf02P4gBcEnp33ssEibI3KDYZP8udIw9wYlmwKIX2OZPQ6sxrY9lY8RzHhB63oGhitcMJfRX8Y0J8gDuvtVXDihAwZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710476; c=relaxed/simple;
	bh=J1lybsdywqSajY8+XO5SA+Jx3q7N50JOGpD77qB0vPE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+RLA3TFPNASdK9657vo06B58sfaog0rs71/xsB0K+L8Ku5T0EP1mSIjqNlr+XWgYclQaHVejyjSFHJkyen6yHuGNSIXEhWzFHYCh75+uXWQCu2tl7dv1gm1wlWPN24FQcye7ZrXOCE7bGO1ADVcJI8mRozImJhDCPJfDph+GD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L6D+oWFY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a628b68a7so630435066b.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2024 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730710472; x=1731315272; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVgtF+RQO3Bp9xa0wTFVgwHh2YZ5qiUAa82quET385A=;
        b=L6D+oWFYL/dRJ3QfMl0QDc1JvClifZsvCwEHs30ScF0oZECySUsxPxUVLXQ0joHblQ
         RJIJdofH9n/APZwIgIPcSs6V9tN6/uz+38DZ+b1OgnKKDo99k4TC+/cQAyXpmpGIUigk
         3pLqhBtRPOOrFwOse+8qTeYoHSWOLR30ffATYgoCdl4e6ZL8Hhac2kTnJSDn0U57K9p6
         GLpzEZ5WkIe3bHW+L0Fkp7g1atHUjJ2R+ousYm6dJX1KbHFIwHCkmXxa4Nw60K0AB8kA
         wii2qixJyFbJ4qd5DrdMBKNqKPewui8aC6ySOWOl7vKdU58U9e4xZEpASWnU2kQVNmpB
         fdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730710472; x=1731315272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVgtF+RQO3Bp9xa0wTFVgwHh2YZ5qiUAa82quET385A=;
        b=nTPq+463InDeRKKmgrlQtt1SAjZvZRugE1+c+Tgpb4j+LIhNZ2Z9o1+PQL5X+lrN00
         /rYwTEb4wzYT45sepGHAfeMBa+Q1XtoLZ1+7dfgt4kdW/WokM0vU8PrKteBEb7J45V3I
         Sq8KseHVVp7bREEdep7dWzk5PMyEro35CtlBCEw15/8uCuV2pZ7uP0zUGotpBqSQ9vSy
         ptm/bG0fgOKtDy0KM/vapkepbxozp+DEXrSfdGdeFWshBzH87xp8LaEUmlIKG6xT8r66
         Nq308CFDaMwi50+96BRyIYJGDIKTsKAcyzmSsI31Yy/82RVuviNrq83GYklEP72my9EB
         oyxw==
X-Forwarded-Encrypted: i=1; AJvYcCWkORbgA6K0S/HGtk/oUYGzC7TIey/uxH8RUwSIpokZUAwfrlLYNuN26i539yYkPax7Qadhsmm9pNrj@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYH8JEjXDbPTnS8m0QgWmN4xwctIHxq9+uKJo/BrfbfsmzRqi
	RFQTaoTZ37u/Sl9iYvVUhwjf4B7ME9GRktm5SOcF529yjfuwe9WNdGMFi8ghS1E=
X-Google-Smtp-Source: AGHT+IHHWwU4nmC4hKYGVohwmL7B6wm+EPEOdY9CCLcF+bYsvgn7lE94cff864zN3lJnYIL8UQ8UFQ==
X-Received: by 2002:a17:907:2d0d:b0:a99:61d1:348f with SMTP id a640c23a62f3a-a9e655b9703mr1085525566b.52.1730710471755;
        Mon, 04 Nov 2024 00:54:31 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5669a18esm524386366b.216.2024.11.04.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:54:31 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 4 Nov 2024 09:54:57 +0100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <ZyiL4RnRC1z907Ly@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
 <20241102170908.fa5n6pz5ldxb66zk@thinkpad>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102170908.fa5n6pz5ldxb66zk@thinkpad>

Hi Manivannan,

On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > bridge, the window should instead be in PCI address space. Call
> > pci_bus_address() on the resource in order to obtain the PCI bus
> > address.
> > 
> 
> of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> bridges), right?

Correct. Please note however that while the PCI-PCI bridge has the parent
address in CPU space, an endpoint device has it in PCI space: here we're
focusing on the bridge part. It probably used to work before since in many
cases the CPU and PCI address are the same, but it breaks down when they
differ.

Many thanks,
Andrea

> 
> - Mani
> 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/pci/of_property.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> > index 5a0b98e69795..886c236e5de6 100644
> > --- a/drivers/pci/of_property.c
> > +++ b/drivers/pci/of_property.c
> > @@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
> >  		if (of_pci_get_addr_flags(&res[j], &flags))
> >  			continue;
> >  
> > -		val64 = res[j].start;
> > +		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
> >  		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
> >  				   false);
> >  		if (pci_is_bridge(pdev)) {
> > -- 
> > 2.35.3
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

