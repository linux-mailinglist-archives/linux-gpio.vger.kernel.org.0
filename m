Return-Path: <linux-gpio+bounces-4659-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB888D05A
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 22:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E854B22C42
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 21:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85DB13D89A;
	Tue, 26 Mar 2024 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zgij5KQM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69361BDE2;
	Tue, 26 Mar 2024 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711490047; cv=none; b=obSlAign9VzQekBdAXQv1r+jTik8dQl9n84pZC71GF7qzzrxI6YTI0l5oLZcVWDsO0X3R8mgSTR7yQxEVDDSIrb1J4DYW2TyPKT1b1SIw1Je8UAujGc7+6C3/xUN/l4k57SLhNfNCdnGJ8o49beEZiDygWMJJqfstwRf4zBA710=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711490047; c=relaxed/simple;
	bh=0YogUJwlOZxXpf+6tmPxP7JEq8wWzuFiKIVXwOOILUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so3PLhhq6ru/SvkLJgiWQpIn1arRezZVPoK19eDAT36YXGFR0sjDOj2FS4hKTmoZYbv+egpZDAJTflUPOVanWUFFJUSqadGFcrvkGCYKUg8Z/zI2bGWTYGIWxB2MmSSgfWFDfty/S2DPXQlDNhq8gEOJFheHruiqUPIYaGOPYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zgij5KQM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB29663B;
	Tue, 26 Mar 2024 22:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711490011;
	bh=0YogUJwlOZxXpf+6tmPxP7JEq8wWzuFiKIVXwOOILUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zgij5KQMPN5Xuvg7wBCtC62cMUuBOx1ORvCnsklRonM1fjtNZVPHYVVc10AiX0QF6
	 g06ESUM9RZXsW/vELsL3IZXcgKyldtYzqY6we2u5OipTzafysVLPqw4V4H1AXsdHBh
	 Y/YkN5mJSHqTug2YOXJ7qtK5uKo1jOJaEWoFHhD4=
Date: Tue, 26 Mar 2024 23:53:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 1/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add missing properties
Message-ID: <20240326215354.GA15295@pendragon.ideasonboard.com>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-2-laurent.pinchart@ideasonboard.com>
 <20240326213053.GA3562515-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240326213053.GA3562515-robh@kernel.org>

Hi Rob,

On Tue, Mar 26, 2024 at 04:30:53PM -0500, Rob Herring wrote:
> On Tue, Mar 26, 2024 at 02:49:01AM +0200, Laurent Pinchart wrote:
> > The raspberrypi,bcm2835-firmware devices requires a dma-ranges property,
> > and, as a result, also needs to specify #address-cells and #size-cells.
> > Those properties have been added to thebcm2835-rpi.dtsi in commits
> > be08d278eb09 ("ARM: dts: bcm283x: Add cells encoding format to firmware
> > bus") and 55c7c0621078 ("ARM: dts: bcm283x: Fix vc4's firmware bus DMA
> > limitations"), but the DT bindings haven't been updated, resulting in
> > validation errors:
> 
> I don't understand. We treat no dma-ranges the same as empty dma-ranges 
> (dma-ranges;). If we didn't, *every* DT would be broken.
> 
> We should never have dma-ranges without ranges either. 

Please see v2 :-)

https://lore.kernel.org/linux-arm-kernel/20240326195807.15163-3-laurent.pinchart@ideasonboard.com/
https://lore.kernel.org/linux-arm-kernel/20240326195807.15163-4-laurent.pinchart@ideasonboard.com/

-- 
Regards,

Laurent Pinchart

