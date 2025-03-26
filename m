Return-Path: <linux-gpio+bounces-18017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D866CA7190D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C8511794A8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23951FBE83;
	Wed, 26 Mar 2025 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRFjUKte"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407A1F9F70;
	Wed, 26 Mar 2025 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000015; cv=none; b=PKLpTz27f6J4pILxlDiWwV1zwIAU3SwjteohbL0tbq3hLH6h5loDHEqxl9T2IjgENjzhzv7JmM5Njb9d7D+rHMehv5HqHCptr1+/wlpxl/AzG0GkkLzeedqyw1xFXmJfP3cm9Dk4CopwE1kCS9zmnKfWGsH6ZYo+wNqezGGh9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000015; c=relaxed/simple;
	bh=uoersSX0rR7OKoFV4lC+SCpJcNumJDxwESTf/Qh1qIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xy5qxO7UundDtWmjQzEbjrhY6SrFZuy+yRkaJfolzzJbNG5TqhSDTjhWewWX+/oGcCeNst2evZE9TqJK3XrCdPArMJyl3xfJoCwfv0VoABYB2LB7pGHBGCnF1+BfZZGvXt4zRpflyXQdCXW3Ejp0Z0dpa2cKmuyEwBDvfB7gcnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRFjUKte; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso6714095e9.0;
        Wed, 26 Mar 2025 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000011; x=1743604811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/lomG6J/G1Z46g4mIoWdtRmMOjFhTy33WeBBrymFoI=;
        b=QRFjUKteoYqQAsynFo4DhQEE36GcpZMxhK6lbemdefOKgOporW7XawvDRvKXj2tL5w
         bzsN9gUBngGCrwpUljfE0auZNtyk4wQyEiCB92nkYvZ6O3u7TPVbjgIKz+qtwVR6k1Qy
         DDpA3gfP4nKVou/yJO/hNZZxeUwdicyFlMgBKXbzlBnCA8QVvfuHwslbd/dQwkXddant
         VNGtXUJGB5wOrJW441njaly3QNiougn5Z4NUaZtXPwzoDd+1DZtNAre9jQKUb6twhyiW
         nxoAWXTwE74ArpLnGs+atO/0jgdTJeJ8dtHoUOlgot8RNwIfJJQCJVQ/hvfg01Jh0c07
         Q2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000011; x=1743604811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/lomG6J/G1Z46g4mIoWdtRmMOjFhTy33WeBBrymFoI=;
        b=tytvmTthsIRga59f+uQreR/+LYnPW8MPCdbkADfqXQWELBXrHdCd6F7sjU97g6UZW6
         5TtnHuwThW1lM3/sULlojlr7ICWzZ9QLRldARXE3HUa9Sj4my0nEGqXQzLaNNrwEom3Q
         gexQ9eRzTHL3nw3kMrMElHJXgXkliIwDENUM//39Z4zWeAfHR1J+AZdwU1EBNz1adTlk
         U5SWjhMMXQ5jNdleyP1PiO2LyZtkEcQO6k+WNHpLhWiaj6WV1VZJBVASGxhDSnqbt8oR
         h8bXs2Uli22qzaDk92lYcL6rl3uZv5vqdezo56aFru3+2pQiRhb13+caxuOjoDLFnyzK
         Oy5A==
X-Forwarded-Encrypted: i=1; AJvYcCU34E7yLZ7XaD+dhEOFvYRqgM05GJASUNOt5PHuQeSw8x8iEwQvCULI40FRCRlzYJyOqDNVI8zEilNi@vger.kernel.org, AJvYcCVqcPxaCM4mHtpu7Lpw7l9CVtiSQzGfsyYeBLUu68zj+DsoZbrOZkoBNvnfQNBtqrvHdRooJyKU4C5z@vger.kernel.org, AJvYcCW84Uwax+UqK6QYBGxhNiy/QMFDCO8ON8eJz46WJa/8JhQz4oWRyN8HRNdSEm+kiArbp9CrYqaeS70hkcLQ@vger.kernel.org, AJvYcCW9qrvinurHDV3A8Z80zkKeQYJnvrh01J5fdP8vEuQfhWHYsSrwaJonk7lhyAT/5oIwPZiIkKkvBUF7@vger.kernel.org, AJvYcCWJdP2/8SgQ3w6UQLFujR/0O7OsYjdzQnvIjWrDjrKrCJSoz/TL7CTgloA+OMnISPac6o5fqJN207LAh7kJ@vger.kernel.org, AJvYcCXSTPPrTFeBlBmn/SPGtCKpz5wddl2S64ccNkUNin4yOkclj/1XNrLXLZNDxbwjmShSJhDQ/PJCBDMWSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+6y6x5fUC2Db/vCAQ+XEKjcIx23449D+D4UTgJxeUAL5B7wwE
	y6QLJ27Jbk0tIKNabKWlpH1/iL4RcF4uVy1RErgI+u8qT8utLFfx
X-Gm-Gg: ASbGnctHls24uCcG/1MncbSACjLv1lxZGY4kFwmVpFudDueKkpESKIIip8n7VYmcxQU
	hTO/ZFHYj/1obdx1ljv+ap79I+en9Z365GlUSJxQUhx5VKnab2+sbuX9LoFN5drg9WTcQYMz7ih
	H3D9rlEVNLSbCRd5nEudMckNFgrUJC9ida2kwiQt/GyBjF6GQ/RxVnhYfNDWXAKYB5ng4p7qrDi
	ajgYmjcryJpPgzxN8JBMGOIH1tn229TJldhF2aKM1l/2tpkoTXw2x/W1mX7ywAZXdtn9LTtsJjv
	YUpDlSmYTuMdln+4jmQ/Ap0kiJ3+i5v2eSQuvzku6S8mPEx37inN61HcKFXsknfXITmRG665EuP
	1wV8=
X-Google-Smtp-Source: AGHT+IEIcUFLZuJ+CZrWTt/yKGPAxWem+MKUwzWCtkifX+BMYe55mgN/WTi1vPZkmR0ezxHKuAOQsg==
X-Received: by 2002:a05:600c:1c07:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43d77643440mr34306375e9.12.1743000011301;
        Wed, 26 Mar 2025 07:40:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 11/15] dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:41 +0000
Message-ID: <20250326143945.82142-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the pin controller found on the Renesas RZ/V2N
(R9A09G056) SoC. The RZ/V2N PFC differs slightly from the RZ/G2L family
and is almost identical to the RZ/V2H(P) SoC, except that the RZ/V2H(P) SoC
has an additional dedicated pin.

To account for this, a SoC-specific compatible string,
'renesas,r9a09g056-pinctrl', is introduced for the RZ/V2N SoC.

Also add `renesas,r9a09g056-pinctrl.h` header file which define pins
that will be used by the driver and board DTS files.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 ++
 .../pinctrl/renesas,r9a09g056-pinctrl.h       | 30 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 768bb3c2b456..5156d54b240b 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
               - renesas,r9a08g045-pinctrl # RZ/G3S
               - renesas,r9a09g047-pinctrl # RZ/G3E
+              - renesas,r9a09g056-pinctrl # RZ/V2N
               - renesas,r9a09g057-pinctrl # RZ/V2H(P)
 
       - items:
@@ -145,6 +146,7 @@ allOf:
           contains:
             enum:
               - renesas,r9a09g047-pinctrl
+              - renesas,r9a09g056-pinctrl
               - renesas,r9a09g057-pinctrl
     then:
       properties:
diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h
new file mode 100644
index 000000000000..206bba07c288
--- /dev/null
+++ b/include/dt-bindings/pinctrl/renesas,r9a09g056-pinctrl.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/V2N SoC pinctrl bindings.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A09G056_PINCTRL_H__
+#define __DT_BINDINGS_PINCTRL_RENESAS_R9A09G056_PINCTRL_H__
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/* RZV2N_Px = Offset address of PFC_P_mn  - 0x20 */
+#define RZV2N_P0	0
+#define RZV2N_P1	1
+#define RZV2N_P2	2
+#define RZV2N_P3	3
+#define RZV2N_P4	4
+#define RZV2N_P5	5
+#define RZV2N_P6	6
+#define RZV2N_P7	7
+#define RZV2N_P8	8
+#define RZV2N_P9	9
+#define RZV2N_PA	10
+#define RZV2N_PB	11
+
+#define RZV2N_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2N_P##b, p, f)
+#define RZV2N_GPIO(port, pin)		RZG2L_GPIO(RZV2N_P##port, pin)
+
+#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A09G056_PINCTRL_H__ */
-- 
2.49.0


