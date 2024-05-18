Return-Path: <linux-gpio+bounces-6454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE248C91D8
	for <lists+linux-gpio@lfdr.de>; Sat, 18 May 2024 20:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81CAE28116A
	for <lists+linux-gpio@lfdr.de>; Sat, 18 May 2024 18:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B669747F6C;
	Sat, 18 May 2024 18:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iT+5fXQv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6F341C86;
	Sat, 18 May 2024 18:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716056506; cv=none; b=L7NNwD68ZKRZQp52L9D7STy4FSKKXo8wVTZEFX3TwPlsCctYcON7YV4RJCzO0sWJV2KIg9mExrP9GUHH7wkfYW1jDcOOI1qtc1biu2YLdh8+nWKCKjP/Z9lhbvmayRbhK957FXj7OzMODlHvTS15iQYbEiI9vdTFylsFTvVE0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716056506; c=relaxed/simple;
	bh=p3h5u/IVsvH0vIbr3Xwlv0JzU0DAvSbDNiUA7D2r6pQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d75XzHPWzgydPxql+yGMUVMHbD+9krJ/KnsTcEa16mpmB9gL1xDE5CZYRK4sN7xsOJLQdnLyeKipxfn/w8m6v1/w44h4NIGxfPogrHRashzdAj1EE8lUQqhdJIKzKWZyZHjmssU5Op0U7bl1nyTYQpICgR3E8RCbmavwaYKh6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iT+5fXQv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5231efd80f2so3261264e87.2;
        Sat, 18 May 2024 11:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716056503; x=1716661303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pW9B94zJnRhpVNyWNpsuX/D4931Cs7QCYfW0O+N9uiM=;
        b=iT+5fXQv0VhgCw4DdoRsmGeS/8AMQfsUa6KZdpWhShe0Gb3X1nyIkypO+omfKb72+9
         jGp1YxADVVcPh1mGyT0v2w6+1vRYxUIYhnX8dkZsXxBP58TlrnSC2Uq4NN7ZZKidlICu
         HNBdGyYw7rnl2ftc9tEDOldKfaDdurIYFKATHRl17Mvpx5P6N4UJAlwRLAUYYTUgEBMB
         FK8bqhMSiEi9WMZbIq2xutYbMplHU/WbznAaRnCW6G7mF4/piJgVZ5gGJVtUDKoMFMAs
         ljfchcAoibGqYUCJEqE2ahCT04F2mtpqrKTMcsDhehsuWYchYa670Ht28CiPXubRtUqf
         Fr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716056503; x=1716661303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pW9B94zJnRhpVNyWNpsuX/D4931Cs7QCYfW0O+N9uiM=;
        b=uP+GjEdJfAnTzV7g66l03MAtHHOamJ0zJ2RgX+sLt9+RjKrLizlx/C/7TNvTsyYnnR
         XdD5usDB+EGFuWs2mwc2aWvRUUwxOCV2jAyvYUhUx8liG3RD+WR8adG8vfcCwhye0tj1
         u1LztsEo5AgmsAgxFvG0FMGVae/4cy1+ETwG/TRQ1wqj4BFKzpYW2iVq5fYKhmkmxDDp
         VRpwtTej7fma5r654GXu+cMffyQJBuEwZBjneGXD+O//yx6Jyufj6Jd49MZVEF26JVAL
         OdLuP6Ppqr4nT7ofaMPiZHbEEArS+KuBVrCcj388oZ+2Zhf3uPRk6FI+3gw2pyAiPpCx
         lLiA==
X-Forwarded-Encrypted: i=1; AJvYcCWZJGboWl9j5XVYxT6R4O8JqaSSBCTJLTlzpVgdwHe4HY7jPyoW+MBLzS+Qre62RS7k+CsEngubtXnSlfM0F6yi0dg2PFumsjV6kwwNhuoOCb5zk8Detk1Owb4yL8p6ltakc1Ob3Tz684vs8hnV9ZiJkKisQiLmoIOcGqT75+xO5RVyfgM=
X-Gm-Message-State: AOJu0YyZA32DpczERWZ4ZyLgq48BI4AcWcWUqttOiYTU9GYTBC0E1XUl
	p5/v8PmuKymjz63X7RwV+f4XjwWA0t5l1SD99LfzdzzK5YRzWGElsYHn9TXI
X-Google-Smtp-Source: AGHT+IHI5mQSeLUOrN5Uv4YEGmIblQr1Lsj2jigrNR1QVIiH6OqLBKOZKY9Q7HbvOXO6cRn45xUaWQ==
X-Received: by 2002:a05:6512:3e1e:b0:523:2ed9:edf9 with SMTP id 2adb3069b0e04-5232ed9ef10mr13643052e87.63.1716056502571;
        Sat, 18 May 2024 11:21:42 -0700 (PDT)
Received: from pratik-IdeaPad.lan (customer-145-40-29-195.stosn.net. [145.40.29.195])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-521f38d86b3sm3730798e87.210.2024.05.18.11.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 11:21:42 -0700 (PDT)
From: Pratik Farkase <pratikfarkase94@gmail.com>
X-Google-Original-From: Pratik Farkase <pratik.farkase@wsisweden.com>
To: 
Cc: Pratik Farkase <pratik.farkase@wsisweden.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratik Farkase <pratikfarkase94@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: gpio-zevio: convert to dtschema
Date: Sat, 18 May 2024 20:21:37 +0200
Message-Id: <20240518182139.22623-1-pratik.farkase@wsisweden.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Zevio GPIO Controller from text to dtschema.

Signed-off-by: Pratik Farkase <pratik.farkase@wsisweden.com>
---
 .../devicetree/bindings/gpio/gpio-zevio.txt   | 16 --------
 .../devicetree/bindings/gpio/gpio-zevio.yaml  | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zevio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
deleted file mode 100644
index a37bd9ae2730..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Zevio GPIO controller
-
-Required properties:
-- compatible: Should be "lsi,zevio-gpio"
-- reg: Address and length of the register set for the device
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters (currently unused).
-- gpio-controller: Marks the device node as a GPIO controller.
-
-Example:
-	gpio: gpio@90000000 {
-		compatible = "lsi,zevio-gpio";
-		reg = <0x90000000 0x1000>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.yaml b/Documentation/devicetree/bindings/gpio/gpio-zevio.yaml
new file mode 100644
index 000000000000..3a6e428b7bf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-zevio.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-zevio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zevio GPIO controller
+
+maintainers:
+  - Pratik Farkase <pratikfarkase94@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - const: lsi,zevio-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+      gpio@90000000 {
+        compatible = "lsi,zevio-gpio";
+        reg = <0x90000000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+      };
-- 
2.34.1


