Return-Path: <linux-gpio+bounces-8880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54328958E14
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 20:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA15EB2296F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 18:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E079614F119;
	Tue, 20 Aug 2024 18:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XG/5LE3T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6514B09F
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724178698; cv=none; b=fGnAfx2V+WsywCbwSlf7IO29yv7gQ1gEOmVp0b5HHwIUrewI2YRAa3ElF1w8DyyD5CMwfgwKpieOciSwl5T47b/qJx8P5wtaDYy5VBK6JOoz9hypKtecOVqKa2zh+VTmoZdvJmKzzviFNrZG8qFjK+W6gUkJrmwXnWJysDVZAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724178698; c=relaxed/simple;
	bh=XSYdjKiKvyThLATmIh9N2JQAPLRS7wiEijXbWwiDs/M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWe7xMByqjF4y8WLSA1Zp3tIqmkJmWju5fh7KCa/1ZXP4WtBQ/0G1yBK0DDteA5oRRssOJXurCzrQO15vuvHFNX93CQiWiKNaqmxRrO1UWVn1LNI+qKBsXwy+AHCIg/tMSocsILnnGpy31ngojR33XiHcrhK4BwsZE7GOZAb3eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XG/5LE3T; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a94478a4eso1183910566b.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 11:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724178693; x=1724783493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C07kwkQPZHrXmRCk/7LVIjuwNmyBogh+obKLGkkmYFE=;
        b=XG/5LE3T3o+gzqyCCzm34nba+qmCfXalrQDA360AoPJk3mlkvXoCh6/QfeZvip7m88
         mjk3ucHDwb1pAgb+EPb5v+NwSsgFfp+LTToHWPRvGmwFGhvSKgH6uKsBqTSHIcq7ayfe
         igGCVo7l+Anll1eM0oRtiUphZEDoR+Sfvkjr7iCAN4UCUx7MlAUSS1Ogur2VJ3W9YkXg
         rtoaO1gBhVsVxBa3dMTKrMgQ7EwAJDPFJPhjFa5I97vK/G9xcmb35+CrJ9aJ/gqkTBWF
         O6g9ox9cp3GKkztqS2IAN3YAPU5DLU1qODsl1PoGrL1fZ+bCdUMj0TPUOTv3TRdDIgx9
         CLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724178693; x=1724783493;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C07kwkQPZHrXmRCk/7LVIjuwNmyBogh+obKLGkkmYFE=;
        b=EG6E0+LgMaI5cPcotjJb70yyKHF7OVHhAXF5Sk6FZOyJptAPQdL7L50skL/0rLvC2i
         jbVvTz58ceOlLtsV7XEhWzS5g1OGQ+qfsypjPdHojETGeO9Wtuqx6URQiP4c375MpEIF
         ZEAlmuObzAct3MZHf5LgkWMEqHbpqv8kcaafDcan1VzaigMgYUGv8iXCca9fVZwJI/4n
         mgkMbVp2jOk3p63ZUyikJlva6Uf0RRNI3CSGG5MbQLkxgri9clshse5GY61l7T0PVcm9
         w4xWBJCmgKnhTXPNSe4Py/svvKmVazx4Ca5boEDaEyC4KFTkRSZVSm/kwAxxclda9EQi
         DDCA==
X-Forwarded-Encrypted: i=1; AJvYcCWxqn1SvShRjKEEHJg4GPDoicWjm19/CE20sWHc917Hu5xpTYR5DvMQtSWo/fgw9lP5GzNYzSWGtCfM@vger.kernel.org
X-Gm-Message-State: AOJu0YzHYfwsL9VnPnoJxzngcCSA8tmyEOUXvURwunA+e5cRR/YvRyLf
	hxi7HFrYtJTeY8MGK4LMRoiXCYZ6xSjdaJU14SrCmO2X39giUfswCrYUk0SQdww=
X-Google-Smtp-Source: AGHT+IGOs6VYvfV4LBlh3n6XPG9LIKhdxKViotPxcCB+fUrUkrU6+w914efXSB1ZJv8NT+vGMTojLg==
X-Received: by 2002:a17:907:1b13:b0:a86:6a9a:d719 with SMTP id a640c23a62f3a-a866a9adcddmr29207866b.29.1724178693023;
        Tue, 20 Aug 2024 11:31:33 -0700 (PDT)
Received: from localhost ([87.13.33.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396940fsm796113566b.189.2024.08.20.11.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 11:31:32 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 20 Aug 2024 20:31:38 +0200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrea della Porta <andrea.porta@suse.com>,
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
Subject: Re: [PATCH 10/11] net: macb: Add support for RP1's MACB variant
Message-ID: <ZsThCh45-WX_TDmP@apocalypse>
Mail-Followup-To: Andrew Lunn <andrew@lunn.ch>,
	Andrea della Porta <andrea.porta@suse.com>,
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
References: <cover.1724159867.git.andrea.porta@suse.com>
 <775000dfb3a35bc691010072942253cb022750e1.1724159867.git.andrea.porta@suse.com>
 <c33fe03d-2097-4d26-b3db-8a3d6c793cd1@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c33fe03d-2097-4d26-b3db-8a3d6c793cd1@lunn.ch>

Hi Andrew,

On 17:13 Tue 20 Aug     , Andrew Lunn wrote:
> > +static unsigned int txdelay = 35;
> > +module_param(txdelay, uint, 0644);
> 
> Networking does not like module parameters.
> 
> This is also unused in this patch! So i suggest you just delete it.
> 
> > +
> >  /* This structure is only used for MACB on SiFive FU540 devices */
> >  struct sifive_fu540_macb_mgmt {
> >  	void __iomem *reg;
> > @@ -334,7 +337,7 @@ static int macb_mdio_wait_for_idle(struct macb *bp)
> >  	u32 val;
> >  
> >  	return readx_poll_timeout(MACB_READ_NSR, bp, val, val & MACB_BIT(IDLE),
> > -				  1, MACB_MDIO_TIMEOUT);
> > +				  100, MACB_MDIO_TIMEOUT);
> >  }
>   
> Please take this patch out of the series, and break it up. This is one
> patch, with a good explanation why you need 1->100.
> 
> >  static int macb_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
> > @@ -493,6 +496,19 @@ static int macb_mdio_write_c45(struct mii_bus *bus, int mii_id,
> >  	return status;
> >  }
> >  
> > +static int macb_mdio_reset(struct mii_bus *bus)
> > +{
> > +	struct macb *bp = bus->priv;
> > +
> > +	if (bp->phy_reset_gpio) {
> > +		gpiod_set_value_cansleep(bp->phy_reset_gpio, 1);
> > +		msleep(bp->phy_reset_ms);
> > +		gpiod_set_value_cansleep(bp->phy_reset_gpio, 0);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void macb_init_buffers(struct macb *bp)
> >  {
> >  	struct macb_queue *queue;
> > @@ -969,6 +985,7 @@ static int macb_mii_init(struct macb *bp)
> >  	bp->mii_bus->write = &macb_mdio_write_c22;
> >  	bp->mii_bus->read_c45 = &macb_mdio_read_c45;
> >  	bp->mii_bus->write_c45 = &macb_mdio_write_c45;
> > +	bp->mii_bus->reset = &macb_mdio_reset;
> 
> This is one patch.
> 
> >  	snprintf(bp->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
> >  		 bp->pdev->name, bp->pdev->id);
> >  	bp->mii_bus->priv = bp;
> > @@ -1640,6 +1657,11 @@ static int macb_rx(struct macb_queue *queue, struct napi_struct *napi,
> >  
> >  		macb_init_rx_ring(queue);
> >  		queue_writel(queue, RBQP, queue->rx_ring_dma);
> > +#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> > +		if (bp->hw_dma_cap & HW_DMA_CAP_64B)
> > +			macb_writel(bp, RBQPH,
> > +				    upper_32_bits(queue->rx_ring_dma));
> > +#endif
> 
> How does this affect a disto kernel? Do you actually need the #ifdef?
> What does bp->hw_dma_cap contain when CONFIG_ARCH_DMA_ADDR_T_64BIT is
> not defined?
> 
> Again, this should be a patch of its own, with a good commit message.
> 
> Interrupt coalescing should be a patch of its own, etc.
> 
>     Andrew
>

Thanks for the feedback, I agree on all the observations. Please do note
however that, as mentioned in the cover letter, this patch is not intended
to be included upstream and is provided just as a quick way for anyone
interested in testing the RP1 functionality using the Ethernet MAC. 
As such, this patch has not been polished nor splitted into manageable bits.
Ii'm taknge note of your comments however and will come back to them in a
future patch that deals specifically with macb.

Many thanks,
Andrea
 
> ---
> pw-bot: cr

