Return-Path: <linux-gpio+bounces-12379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF09B7D33
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 15:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C561C21697
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 14:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9461A0BD1;
	Thu, 31 Oct 2024 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vi15AuLy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCCD1A2540
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385859; cv=none; b=VOhqGY9NlmsIrOq5EkHWWJvWF3tDW6uirz9GLk1g/xDo3E9uzo57B4gkw7fgTgBt27czuWR9rM5fWRVXjbSdJn7Lj5KMYn3l8njON88SDD8WBhCARsvStwC9+oKrVbjcnhKGfJN2SsBtWBu5tLdIFKnoKBIzwyR9CftlfaoSJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385859; c=relaxed/simple;
	bh=eOYQp7aWWVMoeFl5I5k3uYp1tjZFG3I0RD12yVcpB7o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RC+Y4H7PdxS9IdmHPv7vlczwKLIYWvmMKduQdUt3hm9Lz6Zw5vCvMZbhs2pgFGXIeWZ0A8SL+syKKMgY25z+O/wRLXhrtG25YCqbc+eb3gGrXHLaJuosW795B62fIWq6nwuzGWagr8/SxfBKlBic6e5hyHGO059SFwG1Ba9ijsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vi15AuLy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso1706985a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730385856; x=1730990656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdMedbl2sdFWgBMBruWMRMeZv3n9L1bFDpOOup4ylAQ=;
        b=Vi15AuLyh6VAKlAEi8jNL659YK53+ob0v7BHs/j3HBrOt64D2tHf3JL3hrTKjejlU5
         wtmpe3/90uF96dqNmuZ+L1bG+IDpGWicussYl4Pzs9py23GVISGURN3hlduAP2bBhPBc
         NLUNlYSeAxSIruus9VvwyLYiAcyEPcaedAE1+cPSrH1WZ3cqSrir3TjXE3FSP36eri1S
         28ROgW5qPwi+7XPTLnNfqlb3V89VtyeGxEIDk2R+ZHicmlc3WBVt6LiygR+LenoHGMPJ
         sHpPylptQagtWj+zVFBaz9L8tth2bcV70myeHpnnU0DBFPLF8UCXDdiFbnRtLfCQVlHP
         suxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385856; x=1730990656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdMedbl2sdFWgBMBruWMRMeZv3n9L1bFDpOOup4ylAQ=;
        b=OidumyzHu3MvF5sn2UmUu5iiSZBO+6jGv/XshoLF5GoB2DBnL2Hv63e3f0Z9J0AOx3
         TlRFBSpcEzJKtu0onfW4+USnaOikDe3amZxcthq/HKDDo8qNg0zXSck0w2hOLjwE5ze5
         F7PYu0kZNYf2ZSXuqcRhTxucOgQcIEC+vJXp2uMuTWJHnlpax7AU6ze+t9+SiBzFH61C
         enKds0rYLR1wGksC5hPI1NJgb8oTxtVFncV+EbLb0HnbJO2lr/L2uM0gF5/YPkbhuvjW
         H7cv5mPhEwol92W8AVuJYe44X/TEkJ5PMIUW7Be68sWTWEArZREyyx4zOGMXfXAjj7jf
         Y7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUXgafUavZ3S+R4p/vZln4C/3llxgviFSrXOCvt1z/hRTa8gOHA+H7d+kJGYHIXtgMxIk6ZgDTsZ/Z2@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPil75/YiZ7nHjPEJD1I9vMf8QxGuyysHe7RVgRSo/4ZAnu4y
	q7p1daR+biUuhLwcmICB+SS70kiZMmBMi6SJxhlsgGyohZx21vq831ib7qlfoSY=
X-Google-Smtp-Source: AGHT+IHrQIPsgatcH/eK9/hWnih/oaz1AFfeCB1NJO1AFOuD3BregfgaBS5jDWycv+GxWHT8f0qvoQ==
X-Received: by 2002:a05:6402:2111:b0:5c9:72c7:95a2 with SMTP id 4fb4d7f45d1cf-5cea971bac6mr2932118a12.22.1730385855511;
        Thu, 31 Oct 2024 07:44:15 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac78cd44sm634736a12.55.2024.10.31.07.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:44:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:44:39 +0100
To: Linus Walleij <linus.walleij@linaro.org>
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
Subject: Re: [PATCH v3 08/12] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <ZyOX16-Fq4mDeHvP@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
 <CACRpkdajY9efD_DMwoE0wpKDVf=+kcWzYQXOQMHC+pQS-ntsvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdajY9efD_DMwoE0wpKDVf=+kcWzYQXOQMHC+pQS-ntsvA@mail.gmail.com>

Hi Linus,

On 23:18 Mon 28 Oct     , Linus Walleij wrote:
> On Mon, Oct 28, 2024 at 3:07 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > +config PINCTRL_RP1
> > +       bool "Pinctrl driver for RP1"
> > +       select PINMUX
> > +       select PINCONF
> > +       select GENERIC_PINCONF
> > +       select GPIOLIB
> > +       select GPIOLIB_IRQCHIP
> 
> Just a quick thing:
> 
> You don't happen to want:
> depends on MISC_RP1
> default MISC_RP1
> 
> So it will always come in tandem with
> MISC_RP1?

You're right! Added.
However I will postpone the "default MISC_RP1" line after checking why
the pinctrl driver does not work when compiled as a module (right now
it's bool, not tristate).

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

