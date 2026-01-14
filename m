Return-Path: <linux-gpio+bounces-30556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A3D1FA8E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C00903040217
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222D726CE04;
	Wed, 14 Jan 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2Aet/NC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745CD319610
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403664; cv=none; b=NorgSrSSpmBWSfZoDCo2zN6irIep0q1YNxAyrxeGTwrs/vPSkxdTpiznA6SH/AeVnTawyQ6l7gVm6YmB0M5BAjZZzk4aRTYDGpZ/U7IfWOIIxYAo4b7tc4ke7+LNk9RP68JUYxM8oqgF5/mQnNWqA+agKr5o4fqXxwyYPgw0/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403664; c=relaxed/simple;
	bh=i1sxNWay3OrLSO3MFPSI+TEryrt2fH9KJo4+hr4Oujo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dse6nbcVJxxPAclWbHq9Fq23j8YkU/C18y19fCP5ttGD+CcvF36jDL+bTRrDebXC57vcGfaYWXBQbqC6S+YiizDPDmZzNcqLZ9zTEs3atn1spYWzc7N0fsqgLLi0015qxKnaq6Z+EoSoqA7pRve2BCEARv5FqHRiuSje5AXQ+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2Aet/NC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so3553815e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768403662; x=1769008462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b8JXi4AZ9AeOAP9TFfNlUgwjeng9UHzVaIg37xeoa0=;
        b=L2Aet/NCnTLdq96q8bIc8VeauRAU8UeZYJoRZEtl4Je0AKsqv5BdI2kEk4+UuQYPxr
         JYqiWU61wQfQZoEwplAZ0LFgONlo/zVSPpMlUNjqr5Z5H9S31YOgUY0OS+cmuiQAQPXN
         Xrrv7F3nZ5TuDCH2keAKsuhMgmXaXf1RWu6mcVDzXF0DcnUWRe4shNIdlzAZLAK87m2q
         YFddBaMybE5AQqo/pQXUc5EaChEX4Gatfg5hd1gEkplBz73Rqs7nlaim32/1he5H3GOx
         CDWVg4WS0vkW0OHE11m9DNXoLNEBhoVou9fZ35RU5MX4SlHiWZ93wruNLC+ANCQYNEVR
         o3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403662; x=1769008462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1b8JXi4AZ9AeOAP9TFfNlUgwjeng9UHzVaIg37xeoa0=;
        b=oP1ZohXaCvSiwyfjmYrQQhWL9PUIFfk0Zsf3CEuLlwvO+r4pcPEOeEXyR90ZLgAIc4
         RyuJUcaf8Tgnia4NywbRKxOfd8NckeDe0sHhsADD4o70sJp8TDnQEJlM5eLNidpdjcB5
         fhN9au1um1fxOeJLkNaNgT5ZbBCVPX+zJgI4+tU+rLffToL+57ziLZEFj2D9+8doyqeo
         8b4EI/0TlVyoTiMeSqCYN1O07/TYTyjrTAIcmghvodqYA6B3UUhz4uUsXo6H3MB1m6K/
         98pHPAb+dB8zY+zQy7TXYXG3TN1I6WbnQW/WhVvgPCtNjNi6SpPlv4tQDPUOFwgOjPog
         cjZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjQjv+JPAh0iAh2L7COtqeIbO4jk1xquwZrZfaNuO9Q+pRb03weHeECvo+3CARS7riNvK0FJAs5DIA@vger.kernel.org
X-Gm-Message-State: AOJu0YyUBEc87RDBu2GLq7TxY5jh15VCNTZY2bTGgXHoVn2cxVvW7SDZ
	wAi/MRsGJq2aq4mRJ3nv6Iuwbc2YXijgRoF0KskHYo+06iiO6F1SYfOJ
X-Gm-Gg: AY/fxX7inH2NgipzY6ent1yymKwztSl0zneX9YagGiY50LWTGAfmFFfCtNpyN+u2egD
	/i20Qh//GYVTIRD3JggrjX0LEjYM3lN1xq2gyLu2N2sSHPRVuVlKw2HFkdlr1mNV5DwlIro3F5t
	SmvzdxLYAy+N0BvH7cTymE7YDwAsCikHLpFEQVAD9WJLvKbOi3JvgLBFgBJuESKQlyKHqSIj0YU
	LmLR/QXg20d63ZyEqvfWxlzecud8rtoZB6xB1STRurbmtat4glv5aMz3BjH6NfeLaz01rcOYaUo
	j6Txa8luYwf9iIAbPnCrvVZbxSXlr4MKNDTiqWwnWQ2PqH926RQyMe0uET357vpKIUaPeXY5vJX
	YiBI0Mg/YhO8sz/lupB0cqmPYiM2oQmUnVlHZ0GNA2zqjPqxfyEq5HZ29aTw7/ARuQEeddjysT7
	vUrfKG7IksaNpfuZ4orY+qOYGb97sEij7QGu7GZg82RrBUGSJ/uda2/VVSZRriYMb8oZIisbDKr
	xI=
X-Received: by 2002:a05:600c:4f56:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47ee33993eemr47277185e9.31.1768403661606;
        Wed, 14 Jan 2026 07:14:21 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee55d4279sm33909775e9.8.2026.01.14.07.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:14:20 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
Date: Wed, 14 Jan 2026 15:13:10 +0000
Message-ID: <20260114151328.3827992-2-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260114151328.3827992-1-shorne@gmail.com>
References: <20260114151328.3827992-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible
string for opencores,gpio") we marked opencores,gpio to be allowed with
brcm,bcm6345-gpio. This was wrong, opencores,gpio is not hardware
equivalent to brcm,bcm6345-gpio. It has a different register map and
is 8-bit vs braodcom which is 32-bit.  Change opencores,gpio to be a
separate compatible string for MMIO GPIO.

Fixes: f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible string for opencores,gpio")
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v4:
 - New patch.
 - Rebased old patch and rewrote commit message.

 .../devicetree/bindings/gpio/gpio-mmio.yaml      | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index 7ee40b9bc562..a8823ca65e78 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -18,16 +18,12 @@ description:
 
 properties:
   compatible:
-    oneOf:
-      - enum:
-          - brcm,bcm6345-gpio
-          - ni,169445-nand-gpio
-          - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
-          - intel,ixp4xx-expansion-bus-mmio-gpio
-      - items:
-          - enum:
-              - opencores,gpio
-          - const: brcm,bcm6345-gpio
+    enum:
+      - brcm,bcm6345-gpio
+      - ni,169445-nand-gpio
+      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
+      - intel,ixp4xx-expansion-bus-mmio-gpio
+      - opencores,gpio
 
   big-endian: true
 
-- 
2.51.0


