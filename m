Return-Path: <linux-gpio+bounces-18119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 100A9A76318
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 11:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55567188B01D
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 09:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B97D1DD0EF;
	Mon, 31 Mar 2025 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KRiVozBi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DC259C
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412832; cv=none; b=p70bXpmEy6RYWCwns3DrS3YRaHICW4IeklZYotFQBSBIpO5HpL3nA4obAe3+2PegBDKI5Thss9GXtkuR0uGOvL0sLpPoYl+DNqap/jtpBDAS1jj+4xKZgjpg5sXZgMLFc3j8qbkOxKfoYkT20x0khwc047Hyf3fM+0+8FQuDkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412832; c=relaxed/simple;
	bh=FH4g3fvpXV3lHKpvSvhwmjnLhb7FANS7ey999xYBE4E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egS2O+yk5YEw1+fkZCoSahSCDroGQRcbPMUCeHzIXcePYw0f9FVTdKFwj47vV01n2zs0e4rxRNjWqGDBnMIdxqHqTaSYkGEhv3x2Y+EJbWj6EFugfo8JLZFV9tpBVb0dR0YYSoWTAjP4l8r1igNT6R30afpo5EhF23ASYeDoWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KRiVozBi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so673290766b.2
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743412829; x=1744017629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=;
        b=KRiVozBiaD6Kw3Pe2tHxOX3+sF2WPnMfxe0qGzETpUM24tWd+QSYBSVGbtoOH+Lf/v
         +R3mO75sLVqqRD1xFpXQBHW4As8vEdAEylmTBrkzoqpnk1WNOkCUbSDImGqk3izW2ANz
         tpjuW/L7I/Objb1MWNXG7mK+GkgoscDi/8K8Kc4Wa2wT8y2qo8sBAeDxWPxXfQOgV9Y9
         KB6/5qy/9zWilcUFunTXHLVUZZF7mkz6b8+Z8VRVXHyXiTxn5bWvs+3dkYKuZw5rltDU
         A0BfzLCeqaYRDnGdUiq7KSGZUsrjwJnRQGSyLmEcJ61kaI7wvFyb9YEnXfI9EgO+iyE2
         sMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743412829; x=1744017629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkzLnbFVOYDObQyUvRiCdFcMVyW9LHfEzzCWp7sSsRM=;
        b=tKV3CWrKHRptk1/qTY+jw2x2aamaoqBJVa4j0Nlc+5nWpNVKFsuam+p37JFCYl7TYx
         SD790XmZ0TfU1y+ibyvANkk+ZPF+yOfR9j58Rne6iVADHmecci5U0b28LM9NA3KijBWc
         qRw28+ZTSrOqDc+yk8iqHhvoxCnfpt0zPVapH4dzoADeDKieGjvRuEziUL1sMo13zrnd
         K490gLVk4yb/DRoApNci/mHHxdH/Pf/cGv4Om7F4yfpXEWzfhCkJaf7lN+b+BF8XwTui
         MCHoInyBU3onWcvoOW9F+lZgoTJhU9IUv+eCGMfXokWLRzQQw0KSS92Jaqqt8HGEvQhN
         o2gg==
X-Forwarded-Encrypted: i=1; AJvYcCUMs1GWLuv9YBnC1TfqKTH/bGglEhz+mUXMYXa74+6MMqwCd+yS0msiUzyGKgICfzQ5bQ1qLeNodLGU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhy+UOqg8rd1Yz078U7mPT4JbhPvmLybP3CSKduCUxraLO9AEe
	ZZK99zSDzkjrS/ijbhB9HSPnRXlNfu7wVY5hF9Tnp/O5uirX3eovqNV035uY0lE=
X-Gm-Gg: ASbGnctVUMVxFfZJzJiM+DNeLlL69w3fZdvS/tpG5r6wS1ZNhSfsXDn4Kuhw2q5l/hz
	q5cCCjg5N5AYYhLZ+tpLhDsppeJXhBfE4osmO3XlHD2MeTaoRkfOiGPjl5Q9rleSnUvS5XHK/CY
	jb8k4cl/dbdlqYw+w0FX8LThUcLbDuPdWg3Os5FSEWoGIBW2B7BCfdXvJ0HXXNsTBg8fxffgY9m
	Pfuq/ud4PjIuuSGYvYDLnKKZenTpgUVZuqt90V++Ig8WI6fs7ze5vSmWW1eOoa4LOyxuO3LAeRc
	YKEvRkcvz+9R9sYEzHiolyjXfhxi+fk1xGlrgR8Le5cedfk4Zg749L/ebixKiNhkdgW0NeMGjED
	Sn0QDxAiYFkTPlDraIBkmBTI=
X-Google-Smtp-Source: AGHT+IFw4ZQBM4RCOBDHsaOKEO0WJ/K/tqyXI3QtId7X55gIJKhmKgjgqUxtnj7DaAzH7tFUE8PTlQ==
X-Received: by 2002:a17:907:8686:b0:ac3:ef11:8787 with SMTP id a640c23a62f3a-ac738b910e3mr830432866b.54.1743412828665;
        Mon, 31 Mar 2025 02:20:28 -0700 (PDT)
Received: from localhost (host-87-5-222-245.retail.telecomitalia.it. [87.5.222.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7192f0c66sm591000666b.78.2025.03.31.02.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:20:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 31 Mar 2025 11:21:45 +0200
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z-peqcNpvIbKa1MT@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
 <20250323114945.GD1902347@rocinante>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250323114945.GD1902347@rocinante>

Hi Krzysztof,

On 20:49 Sun 23 Mar     , Krzysztof Wilczynski wrote:
> Hello,
> 
> Thank you for sending new version.  Appreciated.
> 
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %u\n", hwirq);
> > +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> > +		rp1->level_triggered_irq[hwirq] = true;
> 
> [...]
> > +		if (!irq) {
> > +			dev_err(&pdev->dev, "Failed to create irq mapping\n");
> > +			err = -EINVAL;
> > +			goto err_unregister_interrupts;
> > +		}
> 
> A small nitpick: "IRQ" in both of the above.  Not a blocker, though, so
> feel free to ignore this feedback.

Ack.

Many thanks,
Andrea

> 
> 	Krzysztof

