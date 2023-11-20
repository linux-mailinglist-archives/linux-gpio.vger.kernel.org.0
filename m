Return-Path: <linux-gpio+bounces-236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 150C37F0C1C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 08:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A9F280C21
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 07:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC0533C8;
	Mon, 20 Nov 2023 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bk9qi9Qz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF31194
	for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2023 23:01:02 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-332ca7f95e1so91828f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 19 Nov 2023 23:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463659; x=1701068459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvVQDVzWJ+CyhFQxQLIJ69wjbv3n+I6qePm2Xo8n7Gc=;
        b=bk9qi9QzACH/BjI8KLeYj1qmi8Z19+IYrfoLnRLkNekVWH4HaGkhpuHD06YD1O/9oQ
         YYyEvjo+N9syjmKzHk/eypepK/2oawWZhRrRRLNTUDiua76k9+xWwVE3Wy6A/oX+LM2y
         BMgXowShkOfctxdSjSFrl7VQobPucQmwbPYPiQYQNuLE7s4z+tNS/xH3IwSO9hW+3IkM
         DaUaOeTzfWQleXVLn/OSfdbVSRNplnj3QW4FmP3OButZe+uciNht4PVCzBsAwbYQBDyi
         npM9XA+nnEbCRbIVE0pc5Fvjhr0tdvBVHzRwGGfccxTzacp2UtSeLUyM0aCuC8p5PdNS
         5duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463659; x=1701068459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvVQDVzWJ+CyhFQxQLIJ69wjbv3n+I6qePm2Xo8n7Gc=;
        b=XEe3vQXyFb/QkvMd97WHsTIRuIv9SR2ZB4U70b1UoF/5+hBVrVRRoSyXotyGKXRklG
         P94w1FPCDs8nWgdDYWk0fez1K8WL38TLllY/Pyb2ZKVXphOC2BWpKKb4FbNx15yRNp+B
         VonpCrB57YryEALNc/a5Sb3Nj9LyM88vxB4Mnxi0sVJIZYFCocTVysW+W1idFZyJ/U3q
         3D2vYDwlqIu+gcTNW6fNKxwT/Vbxe9aBtH1nEpPRtBb2mqh+gZvxJaQEwV5DknsRkDEZ
         4FSZ067THD9Qj4SS/X+QuD3TR/rLggXTc3kBrEWloLN9S6Gc3B7YBvrq1vs6k8eqteEA
         eduA==
X-Gm-Message-State: AOJu0YxP4CjBuqeKj4Dtwl3xYYM0RwrmwdonA62Sb0rohmAoZxcP2Rq9
	rez89DDiO67ZWLR/zgtOhv/84w==
X-Google-Smtp-Source: AGHT+IGfTPFlP3Fps1jXx2D8NtfyUEZnxAphWc5ESbDftl9ZuQTNbxAvSON6SHmfbEPMtENC09wVUA==
X-Received: by 2002:adf:dd8c:0:b0:32f:7db1:22fb with SMTP id x12-20020adfdd8c000000b0032f7db122fbmr3678754wrl.28.1700463659555;
        Sun, 19 Nov 2023 23:00:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:00:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	m.szyprowski@samsung.com,
	alexandre.torgue@foss.st.com,
	afd@ti.com,
	broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com,
	sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 01/14] clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset()
Date: Mon, 20 Nov 2023 09:00:11 +0200
Message-Id: <20231120070024.4079344-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Code in rzg2l_cpg_reset() is equivalent with the combined code of
rzg2l_cpg_assert() and rzg2l_cpg_deassert(). There is no need to have
different versions thus re-use rzg2l_cpg_assert() and rzg2l_cpg_deassert().

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 38 +++++++++++++--------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 764bd72cf059..3189c3167ba8 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1410,29 +1410,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_cpg_priv, rcdev)
 
-static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
-			   unsigned long id)
-{
-	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
-	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int reg = info->resets[id].off;
-	u32 dis = BIT(info->resets[id].bit);
-	u32 we = dis << 16;
-
-	dev_dbg(rcdev->dev, "reset id:%ld offset:0x%x\n", id, CLK_RST_R(reg));
-
-	/* Reset module */
-	writel(we, priv->base + CLK_RST_R(reg));
-
-	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
-	udelay(35);
-
-	/* Release module from reset state */
-	writel(we | dis, priv->base + CLK_RST_R(reg));
-
-	return 0;
-}
-
 static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 			    unsigned long id)
 {
@@ -1463,6 +1440,21 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
+			   unsigned long id)
+{
+	int ret;
+
+	ret = rzg2l_cpg_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
+	udelay(35);
+
+	return rzg2l_cpg_deassert(rcdev, id);
+}
+
 static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
 			    unsigned long id)
 {
-- 
2.39.2


