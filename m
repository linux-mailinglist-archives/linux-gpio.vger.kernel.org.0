Return-Path: <linux-gpio+bounces-9160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D532E95ECB7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 11:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E811C214C3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 09:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EA313F01A;
	Mon, 26 Aug 2024 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KAfhreAF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB844145A01
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663252; cv=none; b=CPi926rr0XDP5K3zTDm9N0zVqUnkHoA1WJ9/zdTHKduZz3MTVBNyk106EqgyJL0ITPcw7sSLe3NlhWkwV/RIoKou9fhSrXT8gvSAJt6blzSSlJP/wbksAAdgK50Sh7kV/3XVzKGNp0CZZG1lGR8XLsHyjmroPq629D66QpGDY5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663252; c=relaxed/simple;
	bh=lj01/f2LiyRrUvTSa8/RM+ENuLL5BYJU8hMdCYL8sIg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KM6pVWPFbbBaY6lKJeA2FNfTBUQj6fieS+iFUYPEyWoadBCyQSFl5JVAEalNgeBOrjYkHt/ilQ/BuNw4XxZEEAiSUGkgFQRKWKzvKxYwCUriT+besMk3CWiTDdx7xBCJf3bpcUwdHa8ElYkSo7+7mIWFRCY3l7KTNcnPKaOHAVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KAfhreAF; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso49605751fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724663248; x=1725268048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqD5UWcEcVPtLKNughX5xFAsztARfJbyIdaLj7krJ48=;
        b=KAfhreAFNj29HjT2HRVug5yGbYqg+uXm/EbHaYsfpbUSmXpiiMp08OJpvLccNsKg6z
         53wRQAOco+Vc83bcSDlU7TzqK67Ajf03FnhkGDXqkGBA92jGKv5eM7HrWhJmj2Ke/GRK
         3naiX76Odxc44hk3Ag9NgW0nAmv4o1HaTXaCAo2yAG5/KLoU3/BF3ttU1XQldTxODXv2
         EW58aG/icuOW58s1stk5ivp43KqABTq77vJBj352iqoFbkskE+eJw8ZLJhg6mG8NsJpj
         e0bcY6FkT/RszqswcmBql1PCylwC+LPG3I8fKde+hmE1gPlpSxR0SfnvubaNW/OK4Xns
         6tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724663248; x=1725268048;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqD5UWcEcVPtLKNughX5xFAsztARfJbyIdaLj7krJ48=;
        b=LheyLVJcCLOCwawDM5EyKNHabtygDodBWx/kfqK6PPlIBqJTrxForGOYhr6a5kIG6d
         tL+WhLQAm/AGbuk9DQ/WpBpGo9KR5htNcQ2VqKJGFqT3CaJTnP/dQiPhkUG4h4QmMjHe
         eR74iTOtVJ7S46UsgBDhfbiew8YXvRNRTNvRhcR2d1jTSHS4voCzQ7NwmGdL34uqcXdU
         UTbsWOWRH0BFSft851kDb2U+L1ZbQtKiGBs10x5zc0WzS/lmv2yMIzAk5HkXtwqq0exG
         51pZ0L1Oigfvs4yjE9F/UZRyC2hrPM8IkqJVy/JeMqk2dLEeLrMFqsO0jyl8V/DvhZh6
         EkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYATd9O8F7870Wrpq3G7o113sazebBUf4NgaFkH3UNgvFXeg5F77GKkwIWZ7Q3lDy2TECxIkr8My34@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUzSOgUvb4asktU6UP6lN1QGR+rC0NKkr9AelDoxtN4rRb309
	wLjTsEpNAAZjOU6d5bEpGvhtImBAuGvpwURd+xPFMphT5TxVjhsaZIEKYktkEI8=
X-Google-Smtp-Source: AGHT+IEK0yN2RYKBDuaStUQnXKZRjXxJWE9pErYm6IieseugH4NhuZzdiuxipurv3igkJJwF0aMRAw==
X-Received: by 2002:a2e:b892:0:b0:2f3:cf43:c2a8 with SMTP id 38308e7fff4ca-2f4f579e8eamr76624181fa.42.1724663247306;
        Mon, 26 Aug 2024 02:07:27 -0700 (PDT)
Received: from localhost ([87.13.33.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2205e1sm652753666b.12.2024.08.26.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 02:07:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 26 Aug 2024 11:07:33 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 08/11] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <ZsxF1ZvsrJbmWzQH@apocalypse>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <5954e4dccc0e158cf434d2c281ad57120538409b.1724159867.git.andrea.porta@suse.com>
 <2024082420-secluding-rearrange-fcfd@gregkh>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024082420-secluding-rearrange-fcfd@gregkh>

Hi Greg,

On 09:53 Sat 24 Aug     , Greg Kroah-Hartman wrote:
> On Tue, Aug 20, 2024 at 04:36:10PM +0200, Andrea della Porta wrote:
> > --- a/include/linux/pci_ids.h
> > +++ b/include/linux/pci_ids.h
> > @@ -2610,6 +2610,9 @@
> >  #define PCI_VENDOR_ID_TEKRAM		0x1de1
> >  #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
> >  
> > +#define PCI_VENDOR_ID_RPI		0x1de4
> > +#define PCI_DEVICE_ID_RP1_C0		0x0001
> 
> Minor thing, but please read the top of this file.  As you aren't using
> these values anywhere outside of this one driver, there's no need to add
> these values to pci_ids.h.  Just keep them local to the .c file itself.
>

Thanks, I've read the top part of that file. The reason I've declared those
two macroes in pci_ids.h is that I'm using them both in the
main driver (rp1-pci.c) and in drivers/pci/quirks.c.

I suppose I could move DECLARE_PCI_FIXUP_FINAL() inside rp1-pci.c to keep
those two defines local, but judging from the number of entries of
DECLARE_PCI_FIXP_FINAL found in quirks.c versus the occurences found in
respective driver, I assumed the preferred way was to place it in quirks.c.

Many thanks,
Andrea

 
> thanks,
> 
> greg k-h

