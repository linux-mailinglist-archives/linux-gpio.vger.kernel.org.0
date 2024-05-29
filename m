Return-Path: <linux-gpio+bounces-6787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7778D2C27
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9710128785F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 05:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4653915CD6B;
	Wed, 29 May 2024 05:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Ogf7jb0r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB115B96C;
	Wed, 29 May 2024 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716959634; cv=none; b=kCmjqV46MQcErNu6VBHbi55jWJsiKq04nV35rkeXNU7stmynPTr2EqyzBrKyCX9ndQlo6dczGryQyjCrNIlVDuBK2DgwuCUcRLTr9N16ghxpVdiRhtWr+8XYg60etrZZGxwOtmDxqgHZYoRcLHUwsiRNeHR33HJW35othSYO+No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716959634; c=relaxed/simple;
	bh=DNmFw/89eKVtL0FVlNQdhHMc+b/d21jA4hq+4viHbxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrL3/OD8ZkABPRVLF0ZF0QzKdfpBYANplvcb68pWODnUjWYV6e5irYIKyOv+SuYLtZO0D00MZKhbnu78hw7PjXlrgzbl/mMzmM7p/YP/cU+4grzNbn5DeMXa2Gyp6ddDuugpCrsAtoQryDrTBk2UyzNybzvb/en69Q5Nhc58B1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Ogf7jb0r; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 00E64202C8;
	Wed, 29 May 2024 13:13:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716959630;
	bh=P8gBf6jRS53rX70PCjwXjULQnqD4pYqLyrNQvX02Huk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ogf7jb0rwfeRUAkEBHkEOilwFfPZtc+QdoNrArChblbzGnE7CDo46q1yyT0DH/Ynf
	 z5n9pmVMBzEXkzjtkjG0izFzI1kSxebGxNUXFvTbPHoicrexeNxg/g2BRg0reUlBvr
	 TzUfLfF++c7HdZb/Um7ygIBpum0TyF4Gh7CMdLmoTEP3Y1kOs5WtG47/HNteyXEK5H
	 ITUSb0lRKidY9pqHKZI/VT6P9Qdqpra5M+UyYMdvnRevOX/5pGpBuMnwizSsfbMjfm
	 APUQrzWs2NCjULoUy++v+NaqFRZH51JSWxkfwvQcu4ML1TRmqoHKqmceMl9OI+XEcD
	 CtDR8KeQQ1P6g==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 29 May 2024 14:43:23 +0930
Subject: [PATCH 4/4] dt-bindings: gpio: aspeed,sgpio: Require
 #interrupt-cells
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-4-91c42976833b@codeconstruct.com.au>
References: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
In-Reply-To: <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

It shouldn't have been the case that it wasn't required. The kernel
devicetrees already specified it where compatible nodes were defined,
and u-boot pulls in the kernel devicetrees, so this should have minimal
practical impact.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 02c02ef97565..433b50bd5484 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -62,6 +62,7 @@ required:
   - clocks
   - interrupts
   - interrupt-controller
+  - '#interrupt-cells'
   - gpio-controller
   - '#gpio-cells'
   - ngpios

-- 
2.39.2


