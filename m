Return-Path: <linux-gpio+bounces-28966-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897FC7AC24
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 44B38368773
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B93234FF45;
	Fri, 21 Nov 2025 16:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwte5jL5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517034F48A
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741341; cv=none; b=BjFQerU1OPqiAevG/vxtwlwC6P9lKF9l/4HyS1WUfPuO9hNMtx+h1YxCpwJZxqKIndreZWbkFoWHHK/sGEIjamF90cuYXjWCpzdwQsLH0mvuzYtItQOZ97vVqy96hfDHjARB3LVyykGRHco3TJjnryXHZTDFQtFrSbJgvIt3GhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741341; c=relaxed/simple;
	bh=Iw6l252MZl0FeFc+DclTkJ87JJ+JB7I8jUGzUzGqMrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tatb5f2uKnYw1jIW9CXPOxqIvWNvV0DjaXfCCEwvxZByWLJPpteSeYG3ZzbGvCmdKwy3BiitHKVYGSN7yig+HJuBjF2fA1A0tJ9ikX642S+s0TjP9q3EAfabmvqSf7y83rlmYwdo63dBG6eKQsUdr6rAnSCkK67HlbppfSDvllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dwte5jL5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b427cda88so1556309f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741334; x=1764346134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/ScgVps3JYSEsrwjx9vO4q3JpMQ/hA7wm9emPNcXcw=;
        b=Dwte5jL5WgsbA6mJwHBF0j41UHbBL09KBnlTcoD3pL8LcI+092Jye4KUya7fQKE6t5
         1gpeSHMcY84fmvYYEi57Tupktfg0I4BUPvCvXJcdrXMhx6LR93o1DZovXaBemB3e43KP
         awKYDx5bS8iPTYNaBnmHeZwwZ5qZ1le/7QlwfFA0U/1nMVS7BWBTBPYIL2rhYjX0D3h6
         zvpSXZR1OeI85/+AcEvfrZNj0hVMowkd6iy1J+lmHHBlXD6MUXkLzi7F/WxH5hehbSsn
         9o7KZyyEhg+stJ5s6nT4KjEjT/1+3tNNc8xurLZnm4vtFWndGI50djBVXjaSoS+2ALG5
         0IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741334; x=1764346134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/ScgVps3JYSEsrwjx9vO4q3JpMQ/hA7wm9emPNcXcw=;
        b=j46G4WLbRYkUeTcB3Vd96VPKJmIurVDA529spzBn/Duu2boxne6xD03qNLqbCE6MQq
         je8G2zD8J5ICCeZMOsw48rtFl80qiE687xKjZobYEi+TCurmeyXH5j6iU6JSKrrb5c9v
         c7kSalFGRwM5Pb9/zCiy0jaE8sTiuxjxwh2o1IvqWmPJEP26R9isQ2up84dwndzW1QN7
         ehTgJgrM9XwD7tePaiLojrYXJIk5LZcAK6kgGOrJxO0gBO1Jx+Qi5XN9qONuxMtyLRTi
         vGRGkUkr8vkWKqWrBMO+cMfHAYuV1CvUDc03DhKtTjiWbLqqadnmMrw9kI73kEI7foHo
         KhMw==
X-Forwarded-Encrypted: i=1; AJvYcCXx+QQe+EyoIhuphc8PHNb4V70k/kE6F6H3FSPUgTYoShluDRbVo1htsyeEv8X77Momimx9TrlgSL5s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mkNhAwPiKd4T2b3mMhq8X1OLSuL+cCucyqkQOZ3DNt+x0Sb3
	hXTyuZ3pJvMtWq8nX1rFra++wQtKTLsaIB3AsCtn/Q7TAZlsaUPhvdPk
X-Gm-Gg: ASbGncuxcDRUM0cFMM9xS4J/+ceEOj0FC31XhLKD1y2QBVXedWMtudW0P5txQR+3umy
	4R6xRQWv+ntPfzICgxWy+WZFauBhKiR7iN5CCbMEymg5sZx9b8vhrOCoZTysnyrTu851z/JHOMK
	E5s4Cm2xP/LcX3dSCMeFK8Os95dYcAWejXPNXIrbAuGpbRy/w50dnmbfNy+tncE9tC2Pq51ey61
	nab2jqg91XMxq0npQTZKwENJSXQtsC6cuiGlIEK4RWPtJ/3aIGv5KK+gBN3bJxLkYafZEvODTuf
	FBUQFN/F56LSsHFmFYlzjBdEDialQoT3Lma610Dd3jVcf1gq1hPP8trE/fhfI8sIeTMuNRf38tH
	jB4zWwPanRFSy6qxvwwwtbObRkrGd9pJ+JVvGyayrq5oDmaYqBpvUamdZJTuyekpkudIPzCCPT4
	CszZwaQaIFygUQGZtN6h7+5LtDGXTnJqi4jQBgCXz3V00On7yOPHuGDRJRScZSFaAJt7oQRAk=
X-Google-Smtp-Source: AGHT+IFkkMDNDqVwLmiqVKk/voVeyLEFueEAgcn0XcYCXcVY+pFazy+U4WRItnCC6JMVveasHarPjA==
X-Received: by 2002:a05:600c:1ca0:b0:477:75eb:a643 with SMTP id 5b1f17b1804b1-477c0165b4emr37258095e9.4.1763741333994;
        Fri, 21 Nov 2025 08:08:53 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 13/15] pinctrl: renesas: rzg2l-poeg: output-disable request from GPT when both outputs are low
Date: Fri, 21 Nov 2025 16:08:20 +0000
Message-ID: <20251121160842.371922-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch adds support for output-disable requests from GPT, when both
outputs are low.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c | 10 ++++++++++
 include/linux/pinctrl/rzg2l-poeg.h        |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
index 3dd8bc3465b1..f66f69c5b1f7 100644
--- a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
+++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
@@ -89,6 +89,9 @@ static void rzg2l_poeg_config_irq(struct rzg2l_poeg_chip *chip)
 {
 	if (test_bit(RZG2L_GPT_OABHF, chip->gpt_irq))
 		rzg2l_gpt_poeg_disable_req_both_high(chip->gpt_dev, chip->index, true);
+
+	if (test_bit(RZG2L_GPT_OABLF, chip->gpt_irq))
+		rzg2l_gpt_poeg_disable_req_both_low(chip->gpt_dev, chip->index, true);
 }
 
 static irqreturn_t rzg2l_poeg_irq(int irq, void *ptr)
@@ -347,9 +350,16 @@ static int rzg2l_poeg_probe(struct platform_device *pdev)
 	case POEG_GPT_BOTH_HIGH:
 		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
 		break;
+	case POEG_GPT_BOTH_LOW:
+		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
+		break;
 	case POEG_EXT_PIN_CTRL:
 		rzg2l_poeg_write(chip, POEGG_PIDE);
 		break;
+	case POEG_GPT_BOTH_HIGH_LOW:
+		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
+		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
+		break;
 	default:
 		ret = -EINVAL;
 		goto err_pm;
diff --git a/include/linux/pinctrl/rzg2l-poeg.h b/include/linux/pinctrl/rzg2l-poeg.h
index 311405b0137e..ed3e08f10834 100644
--- a/include/linux/pinctrl/rzg2l-poeg.h
+++ b/include/linux/pinctrl/rzg2l-poeg.h
@@ -10,6 +10,7 @@
 #define RZG2L_POEG_GPT_FAULT_CLR_CMD			3
 
 #define RZG2L_GPT_OABHF	1
+#define RZG2L_GPT_OABLF	2
 
 struct poeg_event {
 	__u32 gpt_disable_irq_status;
-- 
2.43.0


