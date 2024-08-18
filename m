Return-Path: <linux-gpio+bounces-8783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF74955D5D
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 18:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0191C208B4
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 16:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B15814601F;
	Sun, 18 Aug 2024 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rnbld1JI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BE13DB99;
	Sun, 18 Aug 2024 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997167; cv=none; b=Q4e5yERZJDcG35cGCMiK7rN1P2yYt/tZvofshNKsq2MmuciXcoOcIlhLRbrQqRSdZetYBIrEc+NWPa3STVS4Alkivn9wAsJFulIuRSsK1zK4r1cFzd50i7+ZwtT1dIDkvZA2Cm0EPiRE7538pLKqJ6JGiFFwf5Pp8hQ4s8FnTIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997167; c=relaxed/simple;
	bh=CB42urVV5UCfzZa3KFQDJSFaLAZYUCRfVMmdLce7vCk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErATs8dba9JohBLwyzxT5Dfy1kzCH7S5yGSdjRKP52vfk4QEeJFuWcxtV//So95KqT4tXETIFo1QholtswYsSZU03OU1N2tIA3IRsFi7Us+rockizmYQ7YYcvnRY4NCfitChUWCNQZyyqhRo217X6Ka3h2//yfky+e7WLQdcQZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rnbld1JI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42808071810so27318405e9.1;
        Sun, 18 Aug 2024 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723997164; x=1724601964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9uf9ybAkd2LS8fUBYd8Lu828Q3AdDP0nqtGsXfOMW14=;
        b=Rnbld1JIk+7+M5N/Pf5nRuBTauUqFbc/24DNt5Mx9UkMSL6RDheNcuJbVtU5lWacTT
         ja6Tm7/ElAGIkPw52wnPAq6wAnstJccdJyb5xDWemXzgP0OGlgfj95HAqbfQLb5Gwmee
         xuDVUrUOe2MyUzEcJtrmPmezervpvcahzBFi0bz/SZMggQv1j99cSeaxlb5Nvhb86SEa
         wvrMlGmhlBsBKMb6pFqTiN/fB6kij+tZUvlgzGDzRMRnXkJNCl5jq8rX611RtqieYWyn
         vysx2Wc/2wWrQqaSzDmcj9ME2rdl/mCqLjDfhmTT9NzZ0sIyRRv2u4OJiP8KykgmNbbC
         0G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723997164; x=1724601964;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uf9ybAkd2LS8fUBYd8Lu828Q3AdDP0nqtGsXfOMW14=;
        b=Qttv+pyRXemucNGXETPI1kwCCbZvlfHyG6vuVznoBW1WbX8+SX8j8FGCbSMcKud5J2
         Zf8O8f7jYxoNMKuulAzOZp/WpGNWMh99ihhHWmk9VM3JZ8OeQ8iVxhrXFlecCEvdTEgr
         wm0QSbimiCOuBzPuDmg8ykJccqv8RMrDy9gd0k0Len0l9W+MsJf2A7Ng3tolPk8/Iq4W
         1gDfS2IyrUdgAJT0t3qwg0K98/Dgsu8IZw9mOfIBn0/VoenYXI0nJ+2DpxuNWWGi7L0Z
         lb4f9cmKUgh+7Wxv/SF8D6iJ1sYONz47EEaVXQc0keK+pk2HuwNwzCunQqmr9lXzOxQ4
         1ZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXl+Bx6e9X6B5WmCoCENpOPbOFk2oGBPOwSzeK6j68KJ8I9lMLPiyzTBYzqJLC0AFRoYLDVqLwXdv4OGFfz5KDdZIpLbe7EcqCs2Q2mlWWCAUPorUyGmm52hlUlcf3vEbk62LaEUw=
X-Gm-Message-State: AOJu0YwlYw+RjnOBJxOL+CZEhyfrkWXxigulG9VMgs4IcG8b+s8lL/bc
	4CCf7mcai96Iu6uMjOXRi5/AwXCHIuN8gdy7IbLEto39lhvpK9Ic
X-Google-Smtp-Source: AGHT+IGgPlNsfcN1LNMf0WwO+CHJcYD87ZYBeRC5EFBOgLJ+FKLc4rIeKV5tr9T9gyTFiIB+WuPWOg==
X-Received: by 2002:a05:600c:3c9e:b0:428:1e8c:ff75 with SMTP id 5b1f17b1804b1-429ed7e2306mr53474745e9.35.1723997163447;
        Sun, 18 Aug 2024 09:06:03 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-47-255-50.retail.telecomitalia.it. [79.47.255.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ac074sm8334097f8f.106.2024.08.18.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 09:06:01 -0700 (PDT)
Message-ID: <66c21be9.5d0a0220.2350c8.75dd@mx.google.com>
X-Google-Original-Message-ID: <ZsIWToQY5P-vaXzP@Ansuel-XPS.>
Date: Sun, 18 Aug 2024 17:42:06 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>

On Sun, Aug 18, 2024 at 06:02:28PM +0200, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 02:48:05PM +0200, Benjamin Larsson wrote:
> > On 17/08/2024 23:39, Andrew Lunn wrote:
> > > How messy are the GPIO and PWM registers? Are there N blocks of
> > > independent GPIO registers? and M blocks of independent PWM registers?
> > > By that, does one block of GPIO registers contain all you need for one
> > > GPIO controller? One block of PWM registers give you all you need for
> > > one PWM controller? Or are the registers for one GPIO controller
> > > scattered all over the place?
> > > 
> > > Could you point at a public datasheet?
> > > 
> > >        Andrew
> > > 
> > Hi, per my understanding there is no public datasheet/register reference
> > manual.
> > 
> > But here is the division of regions of the registers in the gpio block and
> > how it is currently divided between the drivers (according to my current
> > understanding).
> > 
> > 1FBF0200, gpio/pinctrl
> > 1FBF0204, gpio/pinctrl
> > 1FBF0208, gpio/pinctrl
> > 1FBF020C, gpio/pinctrl
> > 1FBF0210, gpio/pinctrl
> > 1FBF0214, gpio/pinctrl
> 
> A typical SoC has multiple instances of a GPIO controller. Each GPIO
> controller typically has 4 or 5 registers: In, Out, Direction,
> Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
> contiguous, you could have one DT node per controller, rather than one
> node for all GPIO controllers.
> 
> If the hardware designer has really messed up and fully interleaved
> GPIO and PWM, it might be better to have an MFD. The MFD node has a
> single reg covering the entire range. The MFD would then map the whole
> range, and provide accessors to the child devices. Hard code the
> knowledge of what registers are where. Given how badly the hardware is
> designed, it is unlikely it will get reused in the future, so there is
> no point putting lots of stuff into DT. Hard code it.
>

Problem is that the MFD will also affect other stuff like watchdog...
thermal sensor/monitor, clocks... They really messed and put in that
range all kind of stuff so we would end up in a very big mapped range
and lots of child for the MFD.

-- 
	Ansuel

