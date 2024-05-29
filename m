Return-Path: <linux-gpio+bounces-6783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1158D2C1B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C25C528775C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 05:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EB715B963;
	Wed, 29 May 2024 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="cBCP8gOa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223315B575;
	Wed, 29 May 2024 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716959632; cv=none; b=jBrqDKZdCBcnIliigJwxSdRf1TmRa0QhqeUrLXAHJc6oJoU5qg9NAheTplt5AGvi2sKavXCJxf/3ri7Y5l0MPShn0sR2hKnepTBafWvZLkM0gHUnrPCR3Kmu5UDQhS4o6b/zj3jgBBrK6xPBPZfElke9D9uZgJ1Af/DrVteSb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716959632; c=relaxed/simple;
	bh=7m5R8xBEsR7gKu+JfTyNhwOA4wOGzMtlaFLo+8zMc5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PuIs+w3pu07BMTeetDm/u4f4Jagb005dieet3hHdn0qB9amRF3dbJzIzgrrJJkWZq1NgKBrE+KjSw6qm0ev3mKd1Bwzk8ph4qByqSKyjCwnHf+jSkZzAy+wn9+B5v7Mbowqy1HxnNEibkaHRbb4GXFOi7jYOGztBvQDyFp0VY4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=cBCP8gOa; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 354BC2014A;
	Wed, 29 May 2024 13:13:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959627;
	bh=h4M8rZbowMLRerjP3q6tibaxSn7JV3KdcB7/Gsd+7Sg=;
	h=From:Subject:Date:To:Cc;
	b=cBCP8gOaeRVNkWdCtFQ7WeZ9NFuk53Mx0bIwLpK+nUMuLbR9+YC260XEDN0pyOtkV
	 WM41jOPl5V+cuTf5P5Gdq0LCD2IIjzAbtcqyPhdfCr4OIdz9kyfxPWzCGs24Y3hBGW
	 ZvA7L0tBX8sCwGMWnotaDdUIptUkoKLmiAHqY/XwV5aBtnY7N7MpWuMO14TExcM0dG
	 afMnV6n5tZkIN/ANFVZ1FEFD/jw3tnBng22BejSAI/Hr2WbT4ORO+G0j1hWvUH0XpF
	 uRM2vQjV3+RxF8a6uJrvPwWidNTsZNYv7sRmpv6dIm0Yz8Ph+MnwsPaz5byrJjAX0Z
	 xO70/T6yc/bIg==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/4] dt-bindings: gpio: aspeed,sgpio: Miscellaneous
 cleanups
Date: Wed, 29 May 2024 14:43:19 +0930
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+5VmYC/x2NQQqDMBAAvyJ77kIaahG/Ij2kyZouyBp2Uy2If
 2/wMjCXmQOMlMlg7A5Q2th4lSb3WwfxEyQTcmoO3vmH6/2AqeIeVFiyYS68ol1kqaT6LRUjLYv
 hc+iDozn56N7QYkVp5t81ml7n+QeTDH4eeAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Hello,

This short series fixes some SGPIO-related devicetree warnings currently
emitted by `make dtbs_check` for Aspeed devicetrees.

One change documents `#interrupt-cells` and a subseqent change makes
it required. The property should have been both documented and marked
as required from the start. As the change is technically not backwards
compatible, I've split it such that we can debate the required status
separately.

Please review!

Andrew

---
Andrew Jeffery (4):
      dt-bindings: gpio: aspeed,sgpio: Order properties by DTS style
      dt-bindings: gpio: aspeed,sgpio: Specify gpio-line-names
      dt-bindings: gpio: aspeed,sgpio: Specify #interrupt-cells
      dt-bindings: gpio: aspeed,sgpio: Require #interrupt-cells

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240528-dt-warnings-gpio-sgpio-interrupt-cells-685a0efd2c0b

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


