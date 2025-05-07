Return-Path: <linux-gpio+bounces-19737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97ECAAE060
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 15:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FCE57BB1C7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BB6288CBA;
	Wed,  7 May 2025 13:12:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EEF288C11
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623523; cv=none; b=c6DfcOYoXcjjfMu5zsq4B78TAxvkhP59MIp7XZMFJ21decUyrLG7MZoROGTTr1JDOCIKChqQFfatQG0NGwwoX2ZotP127U0yHfZRiIlN2NrdQryJ57Lrf4o38Z/E6QNMhcEwdhXGlerr3ds+RYn4G/IArv/9/dSIqXekyn+RUuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623523; c=relaxed/simple;
	bh=Bcx87XXw22NK2Xa6S7PVVvrfLgGGV87BhDphswnNFIY=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=b9WOSgXXK8GYe/o/1WHm0R9JLL47Z2CAIdDMbcfj+sM4wcFeHtkI34ZluvMEcGcW7kQU9TX6a5QN+BsseC9MG12A4WK68D68lMXRKnoQ7v/eXhRpU9q5491sThOy19BS1SBzYDpYT9FO/zDXwHVvbDOd6ff12p7ITl5z8JG4LjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeZ5-0007je-Jh; Wed, 07 May 2025 15:11:59 +0200
Message-ID: <1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de>
Date: Wed, 7 May 2025 15:11:58 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: linux-gpio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: AT91 GPIO driver reading back struct gpio_chip::base
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi,

just stumbled upon this comment in drivers/gpio/gpiolib.c:

  /*
   * TODO: it should not be necessary to reflect the
   * assigned base outside of the GPIO subsystem. Go over
   * drivers and see if anyone makes use of this, else
   * drop this and assign a poison instead.
   */
  gc->base = base;

and thought to mention that there are drivers that indeed rely on the
base, e.g. drivers/pinctrl/pinctrl-at91.c uses struct gpio_chip::base
to find out which bit to set in a register:

  dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);

  mask = 1 << (offset - chip->base);

This needs to be fixed of course, but I don't have time for that right
now. Thus settling instead for writing this heads up. Maybe someone is
motivated to fix this and then do the equivalent of

https://lore.kernel.org/all/20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de/

for AT91 as well, given that the driver is DT-only. :-)

Cheers,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


