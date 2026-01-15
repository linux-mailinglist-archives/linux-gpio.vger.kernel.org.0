Return-Path: <linux-gpio+bounces-30608-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBF2D252F5
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 16:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EFA430194E8
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 15:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996893AE6EE;
	Thu, 15 Jan 2026 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWvtb05M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550123ACA70
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489840; cv=none; b=ZqWVWBNUyvfAJ27PoLOvg9lR3Jig+iSnW+0dKbCv/TPYGjOgxvpWhMC+nzqrp7fWLkE8+4HXzULwu5YZ62UuK6Xmx6PbaSkTksS/2gn/8WZp8Cdn1u7NCjkwcf8qFXWouzg9sOgIQP/kI7io0PpccSvImuZjGMvs9fqqjfCxBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489840; c=relaxed/simple;
	bh=QL67zO2OXNn7d293fXZUWqsB5I5Tjghhi53EjdI7gqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ph0XYxq1fYFcUiNo+ydbnMC1l3ittx2d4rustliniQudZ3KwUL73DpWZz0uxCBRFqz899wcss2tDMyt1vWfBRRjbcpA7XSpqkyIfe/3qr+Kj7vqJwrdr58kBMpeQEJDXr8ihlDY8cFDG7Qg1MalvZFIyYFmVJ7jAsfj/310Ex6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWvtb05M; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432da746749so492607f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768489825; x=1769094625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KyUY1CKl3fCa1LRr33ngkD0vxuK8KXOZ0/VtJmlEFc=;
        b=JWvtb05MBamycS/ROxb2C9GOaRTqsNyEzgj8yvxERVPpYjBxqHtssz43oGNrrHppK1
         x+Hgz0A20Do5YsPM5ZKoPhBLNtMQSvfeBBu0MfGFrAxS6Iv4LSwve4YK1ytWVzDkijdp
         m6kf6YxlgET7199gdWZgbryU4luh8QzQX7WIdtBWS7orgETvmkOmZjA/WuTnt7MCatTG
         oUxiI6av+xCKhr/RYE7Xehk6pIr9sANw4u2/CBg3fKU9Xv4IXuIyNHnzRC2Ht5C4Yprz
         fTNTyT8bw0DMXeyG55ZulzAn1XAWyxgv+WIXdX1LmLkQ8raLJwqms0QgMYURTau3BVdW
         j0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768489825; x=1769094625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KyUY1CKl3fCa1LRr33ngkD0vxuK8KXOZ0/VtJmlEFc=;
        b=gV93Cn/TqXgSxvFXIhyWGibrf2J5cH8jOJIhc5i1naciq95HxO1yoq1EWPIchdCjWs
         FMGRCjAt2i5uR8PK6KPx23LlUWBeu0RusciQb3qy+qjC8sCP2C5dA9LG05CO+qGHaFpO
         3VplH3d352T17iG8Bzyl6g+O/BgW3zUUVkrJ2RJABNg7eB3q5ea8AJLxGm5w3kUT0GUf
         U9vNNRpNkQj498yX834EVvwxTMX4VR9rr3rGsPIAGxF2D26DSsBvEYKJ7GrcOOpY/Kf+
         GSxSFBWXBc8/sOClvqKY6eA3yLHLMaGvLD5kyZkFAA2N9jsQ1F1ylfuW8ZRq4z8Qv3os
         TznQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZnle5SicisEa/qNSjSF/fDt+VyLB9jbe7v2OI75Ld9TfiTvLmZPwSM38R2tvwguQkGxmHPeyOwVB3@vger.kernel.org
X-Gm-Message-State: AOJu0YxAwGX0K8pToDfjxScaKnsyK4ZI0Ryha0RtWnt6mNqDruMPuH6C
	aYfqMswTyIkiGu2jjojT+N34pOrqaG57t061ZaqXQUTgHOIzbKTbPgaO
X-Gm-Gg: AY/fxX7W+YRamyGB/ZoLmilKiOPRebQgrktJsiHGX4CBOhiO92QLBZdY+TYbrzRzdMG
	0JzsypSz+sVrrVK0ctnPEmEz754AXrcSdoIZ9s4iGEcJJwSVRj4pfqrGyILxaa9+KP3z8+BBKUt
	mnGMQUGvXgEW9geSOUS/kZuZZ5ez8E0Vv+clJcddaYbPQVb/DyKqugNzruVGtkZeLgUYkSphFa9
	bGMXvX/CaiJg+Fi68qcZkjvGEXsATvcr3gxLxq6cKD7EuRQFpNNIxKwKmEtipotknudd3dovEV3
	a3wZMXagSNigJVt9DwIL3CDRCy8gDsg1Xq8y4tnRvPt2ESX14EvGtgwKQYCxCAe2+J9GWuoH/tQ
	E4e5+Ip2quJuwyRAHHH/NfAvX7sHiLLCPqzs0gU6h7DzZdB7SH6sAecqIo6TJR2n/f94Dfx2DFu
	k9H3BVmwRjGPV8lvFykR24Ej+rSeXlekPpKVNWsAcbAcJPL+eiefsrO2uP/t5bHEWc
X-Received: by 2002:a05:6000:22ca:b0:432:8651:4071 with SMTP id ffacd0b85a97d-4342c4ff4e4mr7932953f8f.18.1768489825150;
        Thu, 15 Jan 2026 07:10:25 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a6c0sm6528481f8f.5.2026.01.15.07.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:10:24 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
Date: Thu, 15 Jan 2026 15:09:57 +0000
Message-ID: <20260115151014.3956805-2-shorne@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115151014.3956805-1-shorne@gmail.com>
References: <20260115151014.3956805-1-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible string
for opencores,gpio") we marked opencores,gpio to be allowed with
brcm,bcm6345-gpio. This was wrong, opencores,gpio is not compatible with
brcm,bcm6345-gpio. It has a different register map and is 8-bit vs
Broadcom which is 32-bit. Change opencores,gpio to be a separate
compatible string for MMIO GPIO.

Also, as this change rewrote the entire enum, I took this opportunity to
alphabetically sort the list.

Fixes: f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible string for opencores,gpio")
Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Since v5:
 - Updated comment based on comments from Krzysztof and Geert.
 - Added reviewed-by's.
 - Sorted the enum list and added not to commit message based on comment
   from Krzysztof.
Since v4:
 - New patch.
 - Rebased old patch and rewrote commit message.

 .../devicetree/bindings/gpio/gpio-mmio.yaml      | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index 7ee40b9bc562..1b2d253b19c1 100644
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
+      - intel,ixp4xx-expansion-bus-mmio-gpio
+      - ni,169445-nand-gpio
+      - opencores,gpio
+      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
 
   big-endian: true
 
-- 
2.51.0


