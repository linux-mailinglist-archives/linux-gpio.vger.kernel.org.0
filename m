Return-Path: <linux-gpio+bounces-20745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E97AC7EB9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 15:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A10391C024E9
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F96227B94;
	Thu, 29 May 2025 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A3v8zUXn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21722222D5
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525315; cv=none; b=c3fxqhYNj0PoitvOOgEm+ocvUzFnrJMzJqeL3uH8Q+iSH+XFxLrG9oIpkTZoMng7HxJrkQA1CGWRNtVDZjXWWo4qRQ3Mdifr1IZPYUGVntwbv9xPs0CBYFWtnKGUqFTX21kd6XQCBz/t8JbyF6z2zaYCd8gXbgbkviM+hWHKY/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525315; c=relaxed/simple;
	bh=dxaIdhwkxrcOH7PEuve5FxQGB0PHBCUqWE1E/dvQymc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUwQSzN90EHnCeN5mf1aepZy/rc3LpK9X791oH8S1urkvOOg02OBBP+VifNERLIClPGYjhtJeKd0UEwcCG79DuVGOJXDTgcG+9ty4eoPS6B4xgDiHRn0DPe48KPyE0CN2TV7r2PYUhwISv6ikAHLCVyWwFhgrjZC/rSIeLUTKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A3v8zUXn; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1623441a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525310; x=1749130110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=A3v8zUXnzauQLe9ygE6mTbuXx1BUCCXTZaNjNvsVuhlJM4xdoOkcJZVNMEHC21WEDR
         oMYMuh6MVkOPh3tuPnDWs1noaLEPe2ioTEJQXn8E1p9L6RasaWKK9QHPk/ln0EOk09fN
         VEx08SFJHeYBdvO6QuKBXlyJjwNfITKmr6qnoyTsioaxGdxDwrFLHXfumzowGdqWBusE
         7oBr8AhYUM8JSI3APz2CfNeUkn2LfQyQWloaj7yEPiqWTooDA62nUc0Fr0ue6wnz1PoK
         GCoULDD35NKBw87W4rVdP8ZADod79bcKFVf9+VFckjV5RhFS/xJKOon8BlGh7AWeBprf
         m1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525310; x=1749130110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=NOl80y1cJjDi43oLeLV0nNWfloBAyS7XkDT65ZBx4na4obvHrgff1IZwR1qFO988hv
         iDEKmBaoxJLKqC2JEc2GPgHg3Gbb/m0nDO7BQ/pkTBRB4mwBI0lnxBgZEWJlX5jBZAKZ
         JTPGc+WLESE6Qo/cM5enT46CrdC6PNNYlzkItA6YelniaeDa+Hu5JCLhSsyn83JEoiPv
         mQGF7u412XCS78ekLNMOwkYC6QMToAsYU5FbSC44w+CRY1MXRdkFC9XxcNBpfLsWf0li
         U2zEmxySu5WEPeG/HcFL7sB7be1EH9guib88l733C2IGX1v2jEGgtH/Sz+eR0dwW2U/1
         K/NA==
X-Forwarded-Encrypted: i=1; AJvYcCXOt63QEfiQxZq05Y7uJ/s4el74sytAhLSsBplTxSnnl8jNo/Aa2XRxvuq2fHrDO99pka2QGFz/g40z@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpmxOCzj2JkKTX3wQhipQyE5SEqKXNb5WqQH2irELP1Wz5kfJ
	JC6+YQ8EelwEX2m3gfen7iNlLltcDxfkNPWIgiFeQ3/WVECKkeVsPuwmUJfR7/xL93U=
X-Gm-Gg: ASbGncvYyxx7Mtxq9lA0Rw5oqXzqud1IpCvvgdkKPzJ3QFEucfLC00LGljyVrGg7kCK
	9tGT3gyLMq6CrrtDw4wVcLxlEQ2/izNIsmV71+cL6+bTljLXy8DdHWD3iEjScGnUOu1TM+HhYE1
	RtTsyrZ/8NpBQqHuUhmH8pvIZfRbsfvm40oQ4Pns8fdsiaYVdWIGXej28eR5dkjAnI++lH0tgZY
	pU+lyw1+xZP4IYr7eBBhHCwlwF/QYhntjAhDa0A/KMJbJMVR55uPxeB6VEMy+mvwxzn6yswbZvQ
	YEvxvRr4Bw98ml7TGgSXaeUeSXg/2ed39OD9QmeC8QI7CMvn4Nzv6R5bzd/70ShiRgddAz3nvYP
	1p+Mk/138Z+YwQ6pFBMjfnCHtK4lx+7TD
X-Google-Smtp-Source: AGHT+IHK4Y7PatnxnQUlnLwZj15PpOrDfyPqPLYipWAui/kq0fXHKQv8bz76vrMm7M/L8eA7f812UQ==
X-Received: by 2002:a05:6402:27c6:b0:5fc:954e:bd4f with SMTP id 4fb4d7f45d1cf-602d906bc1amr16501831a12.8.1748525309931;
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9587sm2364236a12.15.2025.05.29.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 15:30:04 +0200
To: Matthias Brugger <mbrugger@suse.com>
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v11 07/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <aDhhXF_MNn34Bu2N@apocalypse>
References: <cover.1748522349.git.andrea.porta@suse.com>
 <20250529124412.26311-2-andrea.porta@suse.com>
 <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>

Hi Matthias,

On 15:24 Thu 29 May     , Matthias Brugger wrote:
> 
> 
> On 29/05/2025 14:43, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe if the RP1
> > node is not already present in the DT.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > In this case, the inclusion tree for the DT overlay is as follow
> > (the arrow points to the includer):
> > 
> >   rp1-pci.dtso <---- rp1-common.dtsi
> > 
> > On the other hand, to ensure compatibility with downstream, this
> > driver can also work with a DT already comprising the RP1 node, so
> > the dynamically loaded overlay will not be used if the DT is already
> > fully defined.
> > 
> > The reason why this driver is contained in drivers/misc has
> > been paved by Bootlin's LAN966X driver, which first used the
> > overlay approach to implement non discoverable peripherals behind a
> > PCI bus. For RP1, the same arguments apply: it's not used as an SoC
> > since the driver code is not running on-chip and is not like an MFD
> > since it does not really need all the MFD infrastructure (shared regs,
> > etc.). So, for this particular use, misc has been proposed and deemed
> > as a good choice. For further details about that please check the links.
> > 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> > Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> > Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> > Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h
> 
> What changed in this patch so that you didn't include the Acked-by from Greg
> [1], or is this an oversight?

Nothing really, just an oversight. Thanks for spotting that out. I will resend V12
with it as I also notice that are some inconsistencies with mail Message-id, as a
result of subseqeunt invokation of git-format-patch from different branch.

Thanks,
Andrea

> 
> Regards,
> Matthias
> 
> [1] https://lore.kernel.org/linux-arm-kernel/2025042551-agency-boozy-dc3b@gregkh/
> 

