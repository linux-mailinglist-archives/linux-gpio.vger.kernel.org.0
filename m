Return-Path: <linux-gpio+bounces-30176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F8CF6918
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 04:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BB9530855BA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 03:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D049D21FF26;
	Tue,  6 Jan 2026 03:09:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0A21A92F;
	Tue,  6 Jan 2026 03:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668997; cv=none; b=IZ21MbKK+dKp2zSVOLmU26LcUFE5ahtgN3qoBHOE+vP03jMU+iROqjDNiuLaFp8/GCsLqn9jNfqHlJJA2FzHizQXzPEHI+GqEPkUOhpwfksuU5Dbccl8mfH3tkAzADZqeiqr0qfVktHoVf4WAefx+vaGKXko+FEq218ZkOKzPqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668997; c=relaxed/simple;
	bh=dQLEa7ecvgpS7Ee7d4NqYI+6qr0ttpGStWj+q/XjdRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMZho/loRoxV6lHqQlNAjTZA0NakuVJ4RDchOsYB2GBR+55thRIcBHiqbeGcX0XzTAvzbcRwczp7yKcpb8gQ9Uuvk4Uhjb/7bIb1HXZSxkBN5Z39gttb4Tc03fRPRYzNUAsbwS5FQ0dwRfeV4reLu5daIT+gghSRzu1kCHY9zn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4F85E340EDE;
	Tue, 06 Jan 2026 03:09:52 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 06 Jan 2026 11:09:32 +0800
Subject: [PATCH v3 1/2] dt-bindings: gpio: spacemit: add compatible name
 for K3 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-02-k3-gpio-v3-1-4800c214810b@gentoo.org>
References: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
In-Reply-To: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=dQLEa7ecvgpS7Ee7d4NqYI+6qr0ttpGStWj+q/XjdRI=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGlcfPWiy8NgN1lhlSPSdjwYwFCYtvfH/5DNrT2W/69OX8ofR
 YkCrwQAAQoAmRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJpXHz1GxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjExLDIsMl8UgAAAAAAuAChpc3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9
 yc2VtYW4ubmV0QjVCQUI4QzlDMzFCNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqu
 pHWU277RixD/9RsZ4ahmHy3L2ndFBEy1vVFcQAtmJGnq0gTXtHFrWPd65233Xe3XCsKJbnkHq/v
 fH6/xL9qxBqVfclJgdN1NNHYRX6lk2sIJ4U+e4ZUj4O7eeEmj98mLz/pYj6yhI8AjfZUtxf8a6H
 ydknlqYSc+HGBpackCa0wgkpy40N4KMf5nY/3RyoElzbmI4Rw9OfuuD9OENFWlyXd7kf5YC9jTl
 qwgdmCnIQMTCLNusDVqPNk8eeLpzAbYiXIJ+KCI2bv3dK+9nTDlkZsLLZhOvyG6/lDI4VmxIxs8
 EcXHRc7is1kFXe2KvGkkucIBmtkRqFQ67xEORW07cMXn23GsCDJuKzm5CIOU4oWD0cWwp7tAXyl
 uA7jUBH2AqYwogH4BCeTZvilcsf4rAlpaD0QdX5t+Q9jFP9h7q0zmrDI5XdH9G2jr7Eg5BXfOYK
 SuEWbVjoZPxYjwY/a2iiUbaXI9e+RG1qNBOrQ/hAnU1BbxZCPY3vpJfzSWSP2iSrh2IyXh2njNE
 s+pqz9l6L429B4XnPy8GjlkMDXY2m0Wv/eQXFxQ+1eBu5X+yibGqd+EhfoqkYR4q0e9ZXiceQXy
 0d7taRhVSErRAi0hJ/2EXKbiRH3KlU68LcVreCz2I5uD0I+z67triiyeFyVIsXSUEF28EYhZXJM
 E/HuANwew1L8Cz4zp+4Eg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Add new compatible string for SpacemiT K3 SoC's GPIO controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index 83e0b2d14c9f..24d22d95665f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -19,7 +19,9 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: spacemit,k1-gpio
+    enum:
+      - spacemit,k1-gpio
+      - spacemit,k3-gpio
 
   reg:
     maxItems: 1

-- 
2.52.0


