Return-Path: <linux-gpio+bounces-829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8A800B9B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 14:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2D3B213B9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 13:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF282D633;
	Fri,  1 Dec 2023 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZvoYezt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBB510E2;
	Fri,  1 Dec 2023 05:16:28 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso2097964f8f.0;
        Fri, 01 Dec 2023 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701436586; x=1702041386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5l4PLs5fq2iOORKwjJCX/3NWfa03zarQdKsLZDtVEc=;
        b=nZvoYeztf7imlKMou3/7CdxtcY06s6av1D0uliPmyuaMvuWevQJ5pWJPs9wWcfvDlS
         M+CtQL9k4gcpXGPljPoAR47Z8ZN4iLX9lAWtoUdg3YqTU9aNJsep3dOJIomyURJpXp4S
         9EMZpTBEOmePKbm4Z0B69/7TXNs4+gVnZqSROgJ8caiMhEQ5Cze3eUwz59ldrnpEdKo/
         yub1w/tQ0A16g8SGFYtaX0bPhKIENsfIYkXZyW5c56zgnn7USIHaE1JDF7ZNe3r0ON9C
         SDqY97RgOIcrh0L6eVo/HYTYwAkZofhxO0Xx0CZIa+7QrajiEk9dHAbpQYSv6WBX1eum
         NPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436586; x=1702041386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5l4PLs5fq2iOORKwjJCX/3NWfa03zarQdKsLZDtVEc=;
        b=P6pJixs5uKy0FKWVkq3PoG465R2F+l4V80Oi5G90SLRmGPjI/KU+o8kBLfHKTHocA9
         Qvw7zfYDt5/bdQtly6hfBXVyNERFF/8uxUQQvXkreeOYNC8Qxc7r9To2opYy+v43P5zk
         htF9poKnBy9NgOjvYtlub+ZRSEXmBRdV9apRN1v0aJf8Ug/mLTP+rwZ+FpDeh3Q1NIgK
         fINufRcNTtKgk9b5sO3TjyAlLAnw9E4S+CjvabNYi0Ejn9h2qEo8Tt5c612qyyp3PB3a
         32fUJIalL+rX64blaGj0I2EzOfRRFhQ8cQFX9ZBIMtQzCSArQvVqCI7UzCzJ6qjmXFrd
         yO8g==
X-Gm-Message-State: AOJu0Yx48fEipDElhTzGLPPSw06nOTqaJc/PzxX86pkQXd77TiBqSQ1i
	yRBhRalyAoI+wn/hhJaA6nU=
X-Google-Smtp-Source: AGHT+IGFHBFbqH5osZlxZuBfMWde0sWWX+h48EXeHAzLRuF+VW+iOm/S1NzSCFL0u0ZDbGzQbWx3Dw==
X-Received: by 2002:a05:600c:21cd:b0:40b:5e4a:236a with SMTP id x13-20020a05600c21cd00b0040b5e4a236amr766057wmj.108.1701436586518;
        Fri, 01 Dec 2023 05:16:26 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040b3dbb5c93sm1451723wmb.1.2023.12.01.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:16:25 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] riscv: dts: renesas: r9a07g043f: Update gpio-ranges property
Date: Fri,  1 Dec 2023 13:15:51 +0000
Message-Id: <20231201131551.201503-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/Five we have additional pins compared to the RZ/G2UL SoC so update
the gpio-ranges property in RZ/Five SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index a92cfcfc021b..09ef10b39f46 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -46,6 +46,10 @@ cpu0_intc: interrupt-controller {
 	};
 };
 
+&pinctrl {
+	gpio-ranges = <&pinctrl 0 0 232>;
+};
+
 &soc {
 	dma-noncoherent;
 	interrupt-parent = <&plic>;
-- 
2.34.1


