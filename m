Return-Path: <linux-gpio+bounces-4650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E9888CAD6
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 18:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D12325BC2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Mar 2024 17:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754F180050;
	Tue, 26 Mar 2024 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g/iGNIkw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A31C6A0;
	Tue, 26 Mar 2024 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474107; cv=none; b=t/tpTujbeNBaqvEhkMQIzFQtHwhv78gZtxAZcVX2T88Spe3ApR9QdcjteumJFFydNpgczezD4awC62/NZ5bbD8BA0d0QcF6CQuInXjaC0DnYbMPPiKK0o6Kgd6CKGubDFb/XNiyjRMT7KNa2PBnFF47g4qxryNu8GOoYM9mbOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474107; c=relaxed/simple;
	bh=ng7QZtf1ABTqWg4hcmsUuvCxVtSHM+IA9YtVMluYCg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIJ6N7QValxwbbxLVq4QZbnQLr9T1bshnECp5IRl+8mn7V7YgDvU2cetVOhg919iagatfB4xt9erNXa78Z5oOMMTB3v4hkd7h2gzA5lcTH6V3oEVqrs06R/X6bqG9L28MUN3xhaHeLQ6cAk1USQLkhHzOnUQQNQ9KK87NkToS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g/iGNIkw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7031863B;
	Tue, 26 Mar 2024 18:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711474069;
	bh=ng7QZtf1ABTqWg4hcmsUuvCxVtSHM+IA9YtVMluYCg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/iGNIkwk72HVci7+FUjHRrHzGnWwelu4POV8SHwuuyrtZsCzWg2DjAkewB/CO06O
	 L/xAgyXrL5KfxEM/KjIj2SyZGuwEFrANTSKCT5Rx2duwidk5IGTEYuC8GdI9wOtu4w
	 ARypB+6VaNc8IoqJrvIFeSkytk/mpCb9jyxYN7to=
Date: Tue, 26 Mar 2024 19:28:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 2/2] dt-bindings: arm: bcm: raspberrypi,bcm2835-firmware:
 Add gpio child node
Message-ID: <20240326172812.GC28895@pendragon.ideasonboard.com>
References: <20240326004902.17054-1-laurent.pinchart@ideasonboard.com>
 <20240326004902.17054-3-laurent.pinchart@ideasonboard.com>
 <8f4ef49a-74a1-4e05-a2fa-f6bc29e80c5c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f4ef49a-74a1-4e05-a2fa-f6bc29e80c5c@linaro.org>

On Tue, Mar 26, 2024 at 08:09:46AM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2024 01:49, Laurent Pinchart wrote:
> > Unlike the other child nodes of the raspberrypi,bcm2835-firmware device,
> > the gpio child is documented in a legacy text-based binding in
> > gpio/raspberrypi,firmware-gpio.txt. This causes DT validation failures:
> 
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: raspberrypi,firmware-gpio
> > +
> > +      gpio-controller: true
> > +
> > +      "#gpio-cells":
> > +        const: 2
> > +        description:
> > +          The first cell is the pin number, and the second cell is used to
> > +          specify the gpio polarity (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW).
> > +
> > +      gpio-line-names: true
> 
> You could provide here maxItems, if this is known, but it's fine as is
> as well.

The number of items seems to be always 8, so I'll use that value.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
Regards,

Laurent Pinchart

