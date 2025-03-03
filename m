Return-Path: <linux-gpio+bounces-16974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC2A4CCD2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 733033A5A94
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C75423536E;
	Mon,  3 Mar 2025 20:40:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC41F3B97
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741034407; cv=none; b=OvMCA6lsilxa4JOhZT5G7p6WK/0p36rmveg/VV9t48LEeXg7+/hNPGZVZh/3aAySUxfh54M0l0onXVEejA1eXNHKRDzYDnYHpv+qdUb2BRkzP94s7InRofq4sYe3zud92b7teUFlw9O47zr6jTwtLfLBxaWebQiSHt1olb39t7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741034407; c=relaxed/simple;
	bh=i+4vzDAwKSaMfi/ovnUBvvmVaZh1IBvmtd9sXhnC+kc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkJURClt67OCEiPlTu3G1An143Zy9nouyZQL7mxgFC7utR6jU3N4U8SR8oS0lOU3n3gJ5kOFEZKGtCU8wEADD6cujCbCTpsQi/dXIh0N8/90Mh2V0sIh2AfjMnQtrBwATADDIENlxfBTTZvnZ07SiY4WEofyJov1+Ji3M1Rm45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 9c90cca0-f86f-11ef-9d80-005056bd6ce9;
	Mon, 03 Mar 2025 22:39:33 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 3 Mar 2025 22:39:32 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v2 3/3] ieee802154: ca8210: Switch to using
 gpiod API
Message-ID: <Z8YThNku95-oPPNB@surfacebook.localdomain>
References: <20250303164928.1466246-1-andriy.shevchenko@linux.intel.com>
 <20250303164928.1466246-4-andriy.shevchenko@linux.intel.com>
 <CACRpkdbCfhqRGOGrCgP-e3AnK_tmHX+eUpZKjitbfemzAXCcWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbCfhqRGOGrCgP-e3AnK_tmHX+eUpZKjitbfemzAXCcWg@mail.gmail.com>

Mon, Mar 03, 2025 at 09:00:39PM +0100, Linus Walleij kirjoitti:
> On Mon, Mar 3, 2025 at 5:49 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> >         reinit_completion(&priv->ca8210_is_awake);
> >         msleep(ms);
> > -       gpio_set_value(pdata->gpio_reset, 1);
> > +       gpiod_set_value(pdata->reset_gpio, 1);
> 
> This drives the GPIO low to assert reset, meaning it is something
> that should have GPIO_ACTIVE_LOW set in the device tree,

Yeah, the pin 27 is marked as NRESET and description is pointing out to it as
active low.

> and it might even have, so let's check what we can check:
> 
> git grep cascoda,ca8210
> Documentation/devicetree/bindings/net/ieee802154/ca8210.txt:    -
> compatible:           Should be "cascoda,ca8210"
> Documentation/devicetree/bindings/net/ieee802154/ca8210.txt:
>  compatible = "cascoda,ca8210";
> drivers/net/ieee802154/ca8210.c:        {.compatible = "cascoda,ca8210", },
> 
> well ain't that typical, all users are out of tree. The example
> in the bindings file is wrong, setting ACTIVE_HIGH. Sigh, let's
> assume all those DTS files somewhere are wrong and they
> didn't set GPIO_ACTIVE_LOW in them...

> Maybe add a comment in the code that this is wrong and the
> driver and DTS files should be fixed.

Or maybe fix in the driver and schema and add a quirk to gpiolib-of.c?

> Alternatively patch Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
> to set GPIO_ACTIVE_LOW and fix the code to invert it both
> here and when getting the GPIO, but it could cause problems
> for outoftree users.

Would it? We have such quirks to fix a polarity for other drivers/devices.

> Either way, this is good progress:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko



