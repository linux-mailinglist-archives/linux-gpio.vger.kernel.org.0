Return-Path: <linux-gpio+bounces-6979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96A8D5168
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB027B25AD4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8241656B91;
	Thu, 30 May 2024 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBuxL4QS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA550293;
	Thu, 30 May 2024 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090971; cv=none; b=UqsOgIXTZRZGULBUALwwi8N5qIHUqNEjilZfUy3xaiIfk6fGzOuegKhf34Y+UNoxZfPjGVc5Fw/u1hCMf/7W766esj53uzuM/l6YAiDqWSKYVoYxF5G+f7G9lFs99WyAd8sWjZ+MIhrfgTsPa+I0IBLaFkTr4JqmGRPPA5ng110=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090971; c=relaxed/simple;
	bh=e8LysPKZPuNjB650eDlH9HcUJ51fys2Pk2b5iZXcG+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HYPn9tj86TQARVR3x0WVz1M5lv13zVQTAIfcqpBobIoLS7w+OyrO4g2RyVYSLsMdgN/yQv7PIhGOCG8HE9WBKlFmaX1+Mb18KMmUGCr98qfVRtiYQX/eyVbCbXEQyb15HI4J4yfECVcL/lOV10s1MLEBJsLez0Yl4V4yLSl1F6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBuxL4QS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b51b367so7461395ad.1;
        Thu, 30 May 2024 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090969; x=1717695769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Os1X2jJtLs2nYm4m8LVuoPdT66cqgzspX0Tk5JTyw=;
        b=aBuxL4QSDDHgd8lKZr0cHbO/U2K3JOBECfFMOIFcRAOd/XinbnOM4s1mNFiFVKn5w0
         OebGvjscvOAGWZiHjRf91MjwQ5JKcxKT3pYWspuThugOJRonS5PtyQV7ZUKKid3J6oW2
         ha66agOP49Ssb17gjgUaQUSCEv8ux2LDUgtB9g7Mt0P5plmz+VkCQ/yVoDXwPn9qSy9N
         irnEih2RjPyAHtiA0avKHX2DriTnZMQ5S8qd1G2u7xg2tE30Xx21aWf70J9b/z4DfMQ1
         3L5c1mTiu8OS+cTGGDTs0hJIOVrU+FHcRho5wR4dw2mqDip0OjNwRFABM7nUdmaaWngg
         /uwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090969; x=1717695769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Os1X2jJtLs2nYm4m8LVuoPdT66cqgzspX0Tk5JTyw=;
        b=nP+Nvcc8mnarqZb6h8Os53RGe8h6NGf5pE44zfHYiyRImvMw9EBwGQ1SYeuznhf9jO
         WMp6yFeLpvMTSC/QP3IeZzOZUGRRsP1xrywh3uQl2yPmCzJMfS4rALbwVfKd7cpowMSm
         MVTdatA942Y7IKXGyFYUJZhJtiI0buzTSCCC1naEGbVjtsOnOhBZB1XEaX/ONJtUx2ip
         MCtZnG5IIFe2TJGHlX+/4xBTIdCHU3umTOrfYseXpWBw4LyDQdEPggvbi/rvvsDYyBPS
         vPuC3qHT+PS6F5YyOfKG7BzFfIpGYKj7Jssc+l+r4KIiz/gi6fOcPB8keYNIQyRy1oSA
         2Nfw==
X-Forwarded-Encrypted: i=1; AJvYcCUlguJB6jZ0mveM5C1jXWMOQShnYVii7qrMt/QGOpvmeTFVO2fTyEL9/ZU3coWOucpjbuXIyhl/Ta7jy/myihY/5Y72F2hKzZ6yaLYISghN3uhvxdFYGrRhjDH5Rv5uu5TCcoU+5tg0FJy6zdGzjSNAh9U/Jhl6NTTFiYzSOqAvF/VJLWw=
X-Gm-Message-State: AOJu0Yy1IClaNVlvT6hEgKixDtdvjEU5BamVr7oOUSMCt679pG+HDQ/K
	7HXP6WBNFRJ59QRlqd9TLQVsDcm2nbVLM1epJLh996FNmSEZuZNZ
X-Google-Smtp-Source: AGHT+IEYglsUs5rMKC2d4kqgC4rHfl+ZClvS6Ll9PNa/2dKtId3hCMH+0JPmPxKq7eumQ3OMRLVS1Q==
X-Received: by 2002:a17:902:da88:b0:1f3:2e31:f83a with SMTP id d9443c01a7336-1f6199328c3mr26622945ad.46.1717090969408;
        Thu, 30 May 2024 10:42:49 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 14/15] pinctrl: renesas: pinctrl-rzg2l: Acquire lock in rzg2l_pinctrl_pm_setup_pfc()
Date: Thu, 30 May 2024 18:38:56 +0100
Message-Id: <20240530173857.164073-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

To keep consistency with rzg2l_pinctrl_set_pfc_mode(), acquire the lock
in rzg2l_pinctrl_pm_setup_pfc() during PFC setup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 1cbf97d416bf..2be088bbbd9f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2541,7 +2541,9 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, b
 static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 {
 	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
+	unsigned long flags;
 
+	spin_lock_irqsave(&pctrl->lock, flags);
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
 
 	/* Restore port registers. */
@@ -2586,6 +2588,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 	}
 
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
-- 
2.34.1


