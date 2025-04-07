Return-Path: <linux-gpio+bounces-18390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C2A7ED3F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30B0F18860B0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D83257447;
	Mon,  7 Apr 2025 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJIrTUpk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135122566E2;
	Mon,  7 Apr 2025 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053412; cv=none; b=CRxQthpWONoF+FiDPZtUeNtiRuLkXpW+YlkM+3NAU7ONH8uhZQRNbJLOnFXbNhsBZyAyX32416YtB56yrmo9jyM0b154lzH5EQfkZXGhrELi2VswATh08M+wE8urvZRcVm3VwfPDguKHWfh34g9OTohPDzPhf9YqJVl7CbFh7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053412; c=relaxed/simple;
	bh=4G0tp0zDS3lwwrqyWacRpyQl7T8CjJkqA8ZawXcdo8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6DkS4cWRTpQ/irS/gvx9IwxhZGUkBnJtBmMf7aOK8BIK3mzjoSDeVnwwI+xfPigpiqVATdZfowRaNR7EvUdC0gmW97pij/FCIrm++xz+9nsX9Ziof7F49KHND+ov3DlPnUDExSHu4dCBAQNvglAkrtWllavktcHOjDDdeQd1Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJIrTUpk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac9aea656so4118374f8f.3;
        Mon, 07 Apr 2025 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053408; x=1744658208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiJAX6hNL+cP3W/romgo1UG3htgFZca0SKkrB1sYy+A=;
        b=LJIrTUpk979/HZkwgv/LunCqyIC7ZmSiDVmGlYLnRs4kac9Z9RNbjcXAAi/ot3yi7X
         S76jOiclIAo8YW0rhVr3cE4QTnL1MhkFBFxTUZqAJKSq/qIvEDg39lutgTt9WZNrhrby
         AWriwHo2f7UpsWkmBnvMCfDSXqWa2aLkSy3wsIYobH5rOpUvJ3rUDoYWuI04HBbs9hD1
         WXwKeEbvbKfW7hX6yC6lYF+9gbwXc/NQyLUGjdGyHtNRPtObV56cKe3peST+U9ESUhih
         n1E1mBeK2XMeNev+D0pf+lRDOTCZjJZdMkxk/uwJZAYGKyKDZKEB/EbYcvMImHXXn5+5
         5wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053408; x=1744658208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiJAX6hNL+cP3W/romgo1UG3htgFZca0SKkrB1sYy+A=;
        b=N++RBZGRTM83DeJAF+AGdtu4mHqTIUVOlP9NyJ21F6qlt+kW66dhK/Bs4ok9NN40Ep
         XpdagN/79J1xidZ4aZvTMwlhR9q+TQN1tZ2rrsqTe8Bm6/lX+ObOv8UbAWW2rlsS2Pd7
         VJUFE595AJRMytjH9HU7LhX6WWjdnV7K4PR8v9kEjJXpuElvCWPDodQaWxDhu9vqpon0
         9NAY2piwHYU7Jr/TuyBWxpW39i/Axcj+RHShb3E72BX75WfWcG73cXsIDpJm1VwlzuqK
         fHJlTbDsGCRhWzrIce/5fR9+pSojBsz4GMVt5F0ZEwbix2/g8WjLvOj5qh7vW9t/IzT+
         x3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUvZZ7xHTGMf3HcXoxB2UnKQEWq4Wn5NykZgo1Kc5kM52iE99iIn901DJHKYFvBE0iwE3vzGjrUp43y@vger.kernel.org, AJvYcCVJKLenyqcCEz447PE9gVKmq3hVy4C5zoVCMCJbD6uiqT6BROdFgtuasYYLgjM3O4X7yK7L2+0XsSoJ@vger.kernel.org, AJvYcCW0frw9ZhU7zG801aqnmlx5NomFg199GQQS4469Q4vzegW0Z4ume5gcYgHjRZtDQ4rqwOBxzMQxdytcOupl@vger.kernel.org, AJvYcCWRke+rEcGrdsXRq70ElEibDwUmmqiIrwW3JNHCWBOC9d1oeXp/8ikHPotPlhTpYL5GRFXmljYWqxaHZ5PK@vger.kernel.org, AJvYcCWuLcqeJMwCtMmxQLbdr32vfi2FBfa0fLm8WRbjOJzT9717N8U+oRzQ7ADkVyO8o4Mno1AZ6hgs5FoC6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8hEBD/7t1cTBHEli4fCxOWHP7PF660N7f14XRkb/hrhWKCdHJ
	T15pBFnJa7ojaZFHhJi/rxxIkTcoNgntTSefkBtZgNPQQda96zF7
X-Gm-Gg: ASbGncvC4lalh4G0EZpfAV1TeyBK57nzJigh314ceg3EqFsf8AtUhG7pDINxJRWD3KK
	5s6SMxFAymC2R6uneGnskA2hveYRp3PrW345pDaz90Mm6Np6Uewl0Exzyqz8HNuvAVF+osNsBKo
	k1+bIMHuwC4Rdtjv1ng+1rxta+6qpfSSPORiBeiBQeBlsgeuq+AjFugOFiYiRG1aWK8Z2AbiOYq
	HgRzQ2M0JDflhjA4CVouPy7h9NNQXGYiNHFo3A/RJhLAUs7jGKWzPZr7e4ufVn3vFJ9ZPd2Z1nV
	sGtUdao+tIZ3uu43naa3scU3iB+qyDNljmkJg1bkb5MsR1spHW1awQKf4rfg7oKEqhgdrA==
X-Google-Smtp-Source: AGHT+IHo4qVu5mgzGcigWO6OsS9ibbnohWPLoLSaQblIbzbrKylMfARrZ8s6cBdyFQL4Rk7PWD5unw==
X-Received: by 2002:a05:6000:420e:b0:39a:e71d:ee34 with SMTP id ffacd0b85a97d-39d0de67093mr10253538f8f.37.1744053408483;
        Mon, 07 Apr 2025 12:16:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/12] dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
Date: Mon,  7 Apr 2025 20:16:22 +0100
Message-ID: <20250407191628.323613-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the device tree bindings for the Renesas RZ/V2N (R9A09G056)
SoC Clock Pulse Generator (CPG).

Update `renesas,rzv2h-cpg.yaml` to include the compatible string for
RZ/V2N SoC and adjust the title and description accordingly.

Additionally, introduce `renesas,r9a09g056-cpg.h` to define core clock
constants for the RZ/V2N SoC. Note the existing RZ/V2H(P) family-specific
clock driver will be reused for this SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v1->v2
- Added ack from Rob
---
 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  5 ++--
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..f261445bf341 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -4,13 +4,13 @@
 $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/{G3E,V2H(P)} Clock Pulse Generator (CPG)
+title: Renesas RZ/{G3E,V2H(P),V2N} Clock Pulse Generator (CPG)
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 description:
-  On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
+  On Renesas RZ/{G3E,V2H(P),V2N} SoCs, the CPG (Clock Pulse Generator) handles
   generation and control of clock signals for the IP modules, generation and
   control of resets, and control over booting, low power consumption and power
   supply domains.
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - renesas,r9a09g047-cpg # RZ/G3E
+      - renesas,r9a09g056-cpg # RZ/V2N
       - renesas,r9a09g057-cpg # RZ/V2H
 
   reg:
diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
new file mode 100644
index 000000000000..f4905b27f8d9
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Core Clock list */
+#define R9A09G056_SYS_0_PCLK			0
+#define R9A09G056_CA55_0_CORE_CLK0		1
+#define R9A09G056_CA55_0_CORE_CLK1		2
+#define R9A09G056_CA55_0_CORE_CLK2		3
+#define R9A09G056_CA55_0_CORE_CLK3		4
+#define R9A09G056_CA55_0_PERIPHCLK		5
+#define R9A09G056_CM33_CLK0			6
+#define R9A09G056_CST_0_SWCLKTCK		7
+#define R9A09G056_IOTOP_0_SHCLK			8
+#define R9A09G056_USB2_0_CLK_CORE0		9
+#define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
+#define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
-- 
2.49.0


