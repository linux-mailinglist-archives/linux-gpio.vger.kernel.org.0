Return-Path: <linux-gpio+bounces-13772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C19ED196
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79F4161F8B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13F81DE2A0;
	Wed, 11 Dec 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RP6DwWAa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7BD1DD0F6;
	Wed, 11 Dec 2024 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934482; cv=none; b=o6eVhWbzv3DvaQfJXRwjzotllHQSdr+ORbTdBG9FPnmS3z92amENDZI10mqZl9FTJzD00kz40YXeyH18YAwowKlql01EfhqffbmI+v2bYc15wd9X04maPzQTeOpKMVFQADwLFjMKYsC0WSEtFnbWK3rmAb0piwSoTXtsrKC73W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934482; c=relaxed/simple;
	bh=Uvt+xO4mjtJ/nsz5b3dWBGZ1QttcbioYU/hdTDGFLG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s776kSJE5sdlAv5alqTqyKzw4rJ9qB7Do/3YdkzdlGSkEiFx+2MFgP3gu20jlO/zs9hsxFOdHY8ADz+B5pD0bcSalFqoEi16Zq8cEhjR3LH6uc6z+e5A3EvGgMfgtyIbGgBJBWjcCOYi2TGOWlnv2uJI8HpeCWC32WaXwR/7HqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RP6DwWAa; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B6FC240008;
	Wed, 11 Dec 2024 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733934473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AViKE+IyOFawE9/8u97WTB205yA2yY18fxRqJGUc4KQ=;
	b=RP6DwWAaEl7ycWuw2h1bIS/OLTIOs6jvswGnPDsmEM6QyJKyn2/UD1ZEw3SP8Ft0g5plES
	v6r0Jb7oA/j8xhzxVVu0V9z8c0o7oHSmISr6NUSKdpSJ8hN98yYNAOT/8/wy9HdEyeD1BN
	0IqYpbw22BYaPaOKt7G60ppeZ4jN4dl/bEnnTOBQcxVTxbUMbtH7kZZgsI5+tiozntJ2I6
	WExfwjEBoWJT58e0bwW8yxvNMLkBaQiz4Q9MeQ88Yl4fmyb2f3pWLZeahzD612DtvjLZg5
	Dql1unJNJHzsqWCAnLDL2/FTgigtWoOgiK4HjE/Ogq/lgsZI/v+pKUgsyVjAwA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Dec 2024 17:27:20 +0100
Subject: [PATCH 5/5] MAINTAINERS: Add entry for AAEON UP board FPGA drivers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-aaeon-up-board-pinctrl-support-v1-5-24719be27631@bootlin.com>
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

Add the AAEON UP board FPGA drivers and header as Maintained by myself.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..cbe4cfbe110d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -185,6 +185,14 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON UPBOARD FPGA MFD DRIVER
+M:	Thomas Richard <thomas.richard@bootlin.com>
+S:	Maintained
+F:	drivers/leds/leds-upboard.c
+F:	drivers/mfd/upboard-fpga.c
+F:	drivers/pinctrl/pinctrl-upboard.c
+F:	include/linux/mfd/upboard-fpga.h
+
 AB8500 BATTERY AND CHARGER DRIVERS
 M:	Linus Walleij <linus.walleij@linaro.org>
 F:	Documentation/devicetree/bindings/power/supply/*ab8500*

-- 
2.39.5


