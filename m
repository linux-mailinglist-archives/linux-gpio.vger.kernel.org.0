Return-Path: <linux-gpio+bounces-29593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E20CBF74F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 19:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E8E300F5B6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 18:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8E4326D5C;
	Mon, 15 Dec 2025 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAb+sZvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53CB311956
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824054; cv=none; b=FsWVV+qHQZHm3u/yU/B3+UDfCfpEin8cUJD9/tyoyOAyxYeRt3rn8dDNm88j7LfjzzaKCYxIUCv6KOmbA6Kw2IcM+f4NjCYGL1b6X/qPqZ9KPlB4Bs2f62Jei0BKSwszgB+dTitvzXgzJhryIY1gIg/qaygA3TRuKKP5TjUS2Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824054; c=relaxed/simple;
	bh=lIVXipTQUVpTOtDEFUYihhyCWJmbz98l7oWne/NFb7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNTR6gvdK1oc0h8YQakrtx7ZG72yrV7zkOTHzsD0SXOnpTST/BEK6Aze2dgKgh3T+uNczbNzBY+Dk7aVitxaDv0owAj3i2Q/9SbpEnbgqjz/rFoRNvzpYG75ZwWepBF0dMoSGFvTDPXVlP9o/TjCXwX/XcIWrZbEOfm2SVSw/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAb+sZvA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1419842f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765824051; x=1766428851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CyBTq9jLEiMDCmEowsuiPxhEFRUD4GVU2KPfPukCJE=;
        b=nAb+sZvAqbk0+0fa7+lJd27J73fsbUCOsQmoXfZLkJkJOpvLUtNqD6W9lSr95DuyYp
         7XcNEOgdMomo6hL1vuXtKpfWoAG4OZb+vQoFDkWhFDhlx20AQTeqCRBkt9XWiUhlr8Yz
         kBuxgsQNwSIa+KHKVtTTFevZ96md6N8r34Tx16re+dB2o1gOCDW0yLrqUs8Bh/5Y3njA
         aOKbtWZMQap4Y60d1Ugrr/Kc2zOTnvhdnhu9vXYkkFco6pK/9KqqahxdJyMJnFJMJ6ii
         Px2InM/DARYhXax97Ua5qHnkNs4hfRrkTbw7wVh4jybhsuv1ACNripFISh+rWvpMMl03
         K6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765824051; x=1766428851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CyBTq9jLEiMDCmEowsuiPxhEFRUD4GVU2KPfPukCJE=;
        b=SIucBt/TpEo8a3A0Gr/JjiNG6O9fXeakI4przl0kBFXLc6IjJ02T6bV8+6Uw6UOHz0
         kSOc8kYJj3PxBPBA7q3t24Mp8JyFXQyo0GwYuLqxgGxvEejvy0SchaghROUO2zz7dnkX
         xX2QRdHvECI/aOlkmyCuCE1f87xdemtVTDC1u5+YCtqaSiGsbXN+tJuBg4eChNXYTwB6
         7iNp0Tr15wI6hDNvtz6JkNeOzqO6NXYYF7iFA0bNBu/vw9mDiaEk/TK/3WBArsRXklaK
         cE7uvcIqB6+SVsPIYwUE4oeS6ZdeowGaxVbvxfKg83s6P4dz/TscCH99Kf9JkFXjmd9z
         3Dog==
X-Forwarded-Encrypted: i=1; AJvYcCXp72L/yG8BXA0I25LSlQw6+aX/ZYKvDL1E/1LIpoiXjIsxOW90tpxgsd+Qx+441wvAR52zLf9Uy+ZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9t99PLd9czV1j+LxNb6X4D6DyRS4/mYKkYZWL9x9d/I/v6/a
	ojoovY9aErJxX9vMKklX0ChJ2+z3RTYCO17Zmp0R9HuPXzjP7pzdXDdhi8wmTYIgu7Q=
X-Gm-Gg: AY/fxX70arqH44uKdKJwQ8urHgBF0JyNMvBM631d9pg17XMj9UEVUCb51AAgrs1ngMJ
	Fs6vU7//KxYsv2CyemYP5LXQVE/0O3dSdokGTO9L2csri7GnUdIIaV/Q5FKZxO3Xv3hy6SbEWXc
	PVywTVb3oLRIjLYFKmbQ5B1ANbpNWN+ELAePXk46WEcw9D73KIBASzZpX6jvrBg2jDIQRInLwDY
	jURin5PtUReV0kUps0kR2Kw8MjzJyGjWPWVN8uEyVKMs/whYlDpxnk4xnXUoNzje0cYHB6lPuqH
	hQ3E20WRsqHOBkLh6XCngIXX3T7HX8XpQc43eBpxue27ivYvxQ0GjajIZhIr/PznziJ1Mj/fZxS
	x/WkpCLaLIsOQSWHfWkzMRobPoAVsfx3fJglAeGiFP+HnoNfSsGCizQDlaSjAJhIgKJeML5JUPt
	Ny9lovwYKfKnMtd/915Woa5CNEZIx/4nQioC0NWTg47qVCWX4Z+5fhmY59g02Pi1zy
X-Google-Smtp-Source: AGHT+IFpW6CxSU45/d3ozXnd56s4i9wy9U479O5ED3vRIcHNNAFa5Ur26ZBdU+1QKOAT3KavHokbqg==
X-Received: by 2002:a05:6000:230f:b0:430:fdb8:8510 with SMTP id ffacd0b85a97d-430fdb886c1mr4417808f8f.24.1765824050820;
        Mon, 15 Dec 2025 10:40:50 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f268d459sm15401602f8f.32.2025.12.15.10.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:40:50 -0800 (PST)
Date: Mon, 15 Dec 2025 18:40:49 +0000
From: Stafford Horne <shorne@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: Add compatible string opencores,gpio to
 gpio-mmio
Message-ID: <aUBWMbKLMWO2Wv_B@antec>
References: <20251214180158.3955285-1-shorne@gmail.com>
 <20251214180158.3955285-2-shorne@gmail.com>
 <20251215-skillet-perceive-2b564a29ed71@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-skillet-perceive-2b564a29ed71@spud>

On Mon, Dec 15, 2025 at 04:57:45PM +0000, Conor Dooley wrote:
> On Sun, Dec 14, 2025 at 06:01:41PM +0000, Stafford Horne wrote:
> > In FPGA Development boards with GPIOs we use the opencores gpio verilog
> > rtl.  This is compatible with the gpio-mmio.  Add the compatible string
> > to allow as below.
> > 
> > Example:
> > 
> >         gpio0: gpio@91000000 {
> >                 compatible = "opencores,gpio", "brcm,bcm6345-gpio";
> 
> What you have done below does not permit this, it only permits
> opencores,gpio in isolation.
> pw-bot: changes-requested

Understood, I was not familar with the new schema. I was trying to follow what
was seen in some other patches, now I see where I went wrong.  I will fix this
and use the schema validation tools to verify.

Thanks for pointing it out.

> >                 reg = <0x91000000 0x1>, <0x91000001 0x1>;
> >                 reg-names = "dat", "dirout";
> >                 gpio-controller;
> >                 #gpio-cells = <2>;
> >                 status = "okay";
> >         };
> > 
> > Link: https://opencores.org/projects/gpio
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > index b4d55bf6a285..0490580df19e 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> > @@ -23,6 +23,7 @@ properties:
> >        - ni,169445-nand-gpio
> >        - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> >        - intel,ixp4xx-expansion-bus-mmio-gpio
> > +      - opencores,gpio
> >  
> >    big-endian: true
> >  
> > -- 
> > 2.51.0
> > 



