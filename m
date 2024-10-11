Return-Path: <linux-gpio+bounces-11184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB299A34D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2276285D55
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633DA218D70;
	Fri, 11 Oct 2024 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhV3Ep5a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5082185B7;
	Fri, 11 Oct 2024 12:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648378; cv=none; b=SOBjbugI4gBmOVkv1Ty+9bh2Qq7LXhaeD+JByhgOhTkCN37et2DLb5Mtp2dquIGILZRj6IV0SXyBljBtK3nLFf7SirIF3+LCFqdKonxEfiXrHXP3h8wU/T06/SNDdM5cZtK4MUNK0fUUSCngCQr3T6qHbkfdnYs/72jP0h4BoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648378; c=relaxed/simple;
	bh=txxHF1POvbs9W+OU5ZPdwI/MxfhkEGXSiHGfOnqmcK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fht5Hl8ojwVFKuOKp9Ct/cogXvyYkPFr/A8ZorYL6IQYBtS4kMNrz6QJiNnKQ4ToRUB58YDQx6xFcFQYiJgCmpTygzuZ+GF4OeL5gwGjGE2LQQYWJJdkGS5UdXzsdCNxnmBNyLpr28HJvcYhIKPDYO6ZPIuc/9+m800leNrNFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhV3Ep5a; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7aa086b077so276392466b.0;
        Fri, 11 Oct 2024 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648375; x=1729253175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vva6vEuZrAd8wNjfiY39AqSAgZ267m7z8GvSRPwkzFM=;
        b=GhV3Ep5a93Hq+mz9UbpoxfhJTknxXNCuVq8eTbujt7J2hp2GY8BhwE/uicDfx/CDZ4
         FU6XFrsdqqeMklvSi6oEj0nbLAVNvUuJHs1hHnJ6g1EjtAUrgGWsBD1iw+ZwyBdfFh1w
         NOlVmHAtaTRDBmgakEAbje/oFEYxRMqeHgCfBRSLVMRadDP6Qt0/dR5xQH339BgS0HaM
         3EMId2ah0ZQWhPJ/zECHPK53t03NQKh3iA0UWsr5B+WYDE1kVExi+/BSBKFxyEMf1URu
         U/e76EWGxha99+F0RpitIsJ4xW2Ddlg5vP5F8zf8KmcdZm3Aah7IrpxBN0Sy36Elzzj6
         1sQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648375; x=1729253175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vva6vEuZrAd8wNjfiY39AqSAgZ267m7z8GvSRPwkzFM=;
        b=TSdruWpTWL5wOVk8bqi+irmmk5kE6ymvnybMowl9rifn8WNrXBaf1qo7wf9yWTZ0P0
         DuNTbr0szB//qMykuCwmBDxfHPSiF8rC7a4iRVuyIoVixh7lLN8pjU6PIynm50U9S5nb
         dZP4aNpLy03IyGYvV+APDRPx903ktx/TeLiPurcOUBDvudp6dfQdLjdSZ9eWVZqB5DVs
         +El/6I75cdvZ0n+mSkodPENgbQJkF2UfK3pls/bypLRKAwW/k8XIyjymmAP3nKE7E8BM
         QmuOht3gVv7ItDD2m09HI4+lBkFJftGO044MXeQOTNe5ROoNeuFqM7dEV6Z9SscOnOa8
         mfpA==
X-Forwarded-Encrypted: i=1; AJvYcCUSJGftwx+E4geMzgj1s7+dZt4f6TQRmZt7dBWnOtdBfs4lwwGzgdlOdwBbPD4YUw4S8QCmiAlUZki4E4gz@vger.kernel.org, AJvYcCUap9hgab36Y/NsbJLJj7syGhW0Ii7mFaTw14b2D5C65xttrKwLrOuQlHnYxqdzT4+nXt+7XIsAFfKk@vger.kernel.org, AJvYcCWx8b0j0UNwRICmpqCPUCSX6i50NjpjwQH14Mw8OS4BKPjJY128vxqMezQmcT+1Up31CTOzESsLmtjrag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2G0U81k5mTllKu+DHsZlRaGTqsid/7APpHS8vM6QlrIS/Yi61
	QBZg6P3xlLFMO0N0siizhQFqeoRuWtU8B+VzGezS7X56ywLQWozH
X-Google-Smtp-Source: AGHT+IFDW7u55StACmVfDydYmpmeHkLFILWuJRItj9IqAhOfa7oLhobk4myIP5qU7gvT+2wARIfNog==
X-Received: by 2002:a17:907:1c1f:b0:a99:3ebf:9371 with SMTP id a640c23a62f3a-a99b95f3d91mr196358566b.59.1728648374644;
        Fri, 11 Oct 2024 05:06:14 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:06:14 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 5/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Date: Fri, 11 Oct 2024 15:03:50 +0300
Message-ID: <20241011120520.140318-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011120520.140318-1-y.oudjana@protonmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 7ac1a85f822f1..4bfbaebb790c3 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
 
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:
-- 
2.46.2


