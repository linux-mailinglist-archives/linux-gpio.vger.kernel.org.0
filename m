Return-Path: <linux-gpio+bounces-9480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E2966C89
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 813791F23FA0
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89AA1C1ADF;
	Fri, 30 Aug 2024 22:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dp1v7+aW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0AB1C1724
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057198; cv=none; b=fnA2xwtX7m4zOCkwjPyCN42wiUT8FaTwVYe+tZs2elylaVk2aB/xur2OcqfMInH7WKk7iSa8h0iUbgz9jB34nEl4nYX3SFK7/KJkLMu1dyeZKl+LAbl85KTYZ8K3iDDbPl092sz/N02btAooeLfKXxziy7EcTO87741Tqbmyw2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057198; c=relaxed/simple;
	bh=DqAVqqLfjpgjASo+CIfe1feDonNcG4Odo1DBuX7wdR4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxQjgPqeTM1ZNcUs2POOJabBdGO24q048EfNsoTHeJ3LmeDWU/8ehG42vpWj7PkFEjYc/X2M0d1eBtR5Rvg/UdZ0HsOQ4lKiLaWo8vbT8WbD4ED0CsFWGlHusWqU+qfJat1+Chr91QjpkKALDMoXHWT7ApffdYA4nc8ds3tHHr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dp1v7+aW; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86933829dcso284623266b.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725057194; x=1725661994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oK95C0BSC1jzK2D55nrE90clLVhwEM+Y9bSdjRWpEd8=;
        b=Dp1v7+aWJz+A4cKaT17oli44/yP7f2EW22bHOILyblolzuTJO8ufFE9h6WAZImPwqB
         FvIP6MkS4VBTdglAlZrkkemaTnAP17V9CI7Akrcz6QU3vjSzMSyKleqKcmbnO9iwcdxH
         Qn/8Z6lagO/ez613Qk6hVmWoA3v/ETIgM4LbGNi9D4AGRabXoIsWYqWAV+onnKHYgcp1
         I55prglG9jD1jTFlh0ezT84sinyOk6ck64uOBbuXon4UejFLuYgRWMu7IAYy7EnTlKMF
         7BMHrMYhVM4xX+7bC3jEsBzlLskQRblwFvT0haTOTx2nwEi6YuL7AmptvwKLlBeKkwiA
         P+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057194; x=1725661994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK95C0BSC1jzK2D55nrE90clLVhwEM+Y9bSdjRWpEd8=;
        b=ep2xeacMeyC8doQaOpHb2B1vwD+mtfM5Aqz8s4RsGo7JilyHzK6NBstBUv0Q27vs2t
         UxdsZOQyDstvrRSYhDgcoI5nwLduE+H5tNdZDFccwq9XTwt0Qa35ekOiRUPbN6oMtxFb
         ht0IIJU7icZj4qmGNa8L7/I3VbPJYGf9N3L3AGRqu3gXV18extxJH/yUzsxosMeZwHUV
         M7srO1ay41H0gh+V1LBr8YBhxi17GKOVUbbpyFu4JjbRbVI0x2G8bVxfReta1R257zBn
         w7gHltnvZgyYBvwQZWS3CI/tTwvJWvJOhUXFYwipP6albljMB5ZXJuwFYYxkU47ptivc
         bFtA==
X-Forwarded-Encrypted: i=1; AJvYcCU4omaQMNg2DuPjhECUrctE+Hg/zk/5Hx0fJ0oWlE2oeTTZNwwdYIclxheX1f1l4XeO+UK/hfO6QtED@vger.kernel.org
X-Gm-Message-State: AOJu0YyagOcsyHP7X0KAqYWNrMXHASCPt/138Bl6rlR3oqX2am6siGmJ
	8LQ9n/tUAWs3tdSzcnre92o7KF15dWsOe6EfpJawLYzi5cx9Xq8rEBQ8IP18ksY=
X-Google-Smtp-Source: AGHT+IHqkz6MDPFM4AoearcdXDKhXOMUBNtVV9Zz1IeP9NcojNkgXiXqwILRRdgqIEEC3J1YsUnnqQ==
X-Received: by 2002:a17:907:2da2:b0:a7a:a5ae:11b7 with SMTP id a640c23a62f3a-a897fa63905mr698523966b.49.1725057193226;
        Fri, 30 Aug 2024 15:33:13 -0700 (PDT)
Received: from localhost (host-80-182-198-72.pool80182.interbusiness.it. [80.182.198.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989195e8csm260291966b.105.2024.08.30.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 15:33:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 31 Aug 2024 00:33:19 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 11/11] arm64: dts: rp1: Add support for MACB contained in
 RP1
Message-ID: <ZtJIr-PCWSQWWjaK@apocalypse>
References: <cover.1724159867.git.andrea.porta@suse.com>
 <a3fde99c2e522ef1fbf4e4bb125bc1d97a715eaf.1724159867.git.andrea.porta@suse.com>
 <c3cgkrwnwkrzr67viuvo66ckkxc4ehcye4zomcqdwy2h4dabol@wjp4cd4clm77>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3cgkrwnwkrzr67viuvo66ckkxc4ehcye4zomcqdwy2h4dabol@wjp4cd4clm77>

Hi Krzysztof,

On 10:43 Wed 21 Aug     , Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 04:36:13PM +0200, Andrea della Porta wrote:
> > RaspberryPi RP1 is multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add an ethernet node for Cadence MACB to the RP1 dtso
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/rp1.dtso | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > index d80178a278ee..b40e203c28d5 100644
> > --- a/arch/arm64/boot/dts/broadcom/rp1.dtso
> > +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > @@ -78,6 +78,29 @@ rp1_clocks: clocks@c040018000 {
> >  							       <50000000>;   // RP1_CLK_ETH_TSU
> >  				};
> >  
> > +				rp1_eth: ethernet@c040100000 {
> > +					reg = <0xc0 0x40100000  0x0 0x4000>;
> > +					compatible = "cdns,macb";
> 
> Please start using DTS coding style...

Ack.

Regards,
Andrea

> 
> Best regards,
> Krzysztof
> 

