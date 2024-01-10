Return-Path: <linux-gpio+bounces-2113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9182A05A
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jan 2024 19:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3571F241A4
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jan 2024 18:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679E74D59F;
	Wed, 10 Jan 2024 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lbg0e0H+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B6C4D580
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jan 2024 18:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso31830255e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jan 2024 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704912105; x=1705516905; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFUXY3mgVSfGBpcTG7FlJdmYxdRI+GVT2C0gkL18kmE=;
        b=Lbg0e0H+66RpqrsFiKSo8IfUkt0HeFysdZOmKfsLpRsDBVQjDS8ikN4DMoL7x8BYyn
         896rKuUEOPUbzdZHpYrcxyittsIAKz/1pLoDpDdzXyRSDPsKaob/z6Z1nWaW4lHufCuL
         exJ4x8e1xqzyRl8cmUaonkN2M9VD2b2xKMAL20HmazCWsuRT9Izaf0tjUuORbSABVxWb
         7UvYm/yup+dpuoI+/dIz2U8yWKb3Ckt92rtQfw0LuAgd44iJgoPi3g5ylA6J1JyDDc7O
         LGWae/FHySSziCpVEu7Q4cDTJ+85s1CVTivHTM+D54wbeUcOiszKATwjhobd0CwZv6K1
         yzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704912105; x=1705516905;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFUXY3mgVSfGBpcTG7FlJdmYxdRI+GVT2C0gkL18kmE=;
        b=cWs9Gm6ZvAi+BZoAYDFI/m80oLdYnsnBDTBnk2sWQ4sfS/UDno0cywxS9+cOb4XD+M
         7s4LgRHgYHJRMXrR3NbA4o+s4S8D7hQVLPIyo3eLZUFVyXqnXlw06zl2cBfdvTCS2eIP
         pV+QL23t97+YKocRmT6mBJHfutnu8sVqrCODBePmh8620wSBJSpkS7enAyzpk6Jso5uo
         JoV8jDTnPZq5rBdkznbd97kDUm+jsTUMMXPQfMoXh0FIjZXzi7b2TlQrfW4j1EgTkFYN
         xI/rkpdx5x4+pIFUfHQeMZY3KSF350nFm/Rcn7VN5jwPFxTENRDiBdSA6oubFzX1/LQO
         8PJQ==
X-Gm-Message-State: AOJu0YxC2FbJiDaIoMxrxfDXEFaZ//+PMX6iMHKr4l8na5qesCW/1Vi+
	A1y7IGG/W+ANSQymxwOQXIuXEq5hGX3T8w==
X-Google-Smtp-Source: AGHT+IHxsvSsfYuKgjq18TXM7EAmInXRbNUHe/2iJNQR3LVZbL9ImQqfMCj6LQoBHHXesj3fGGayPA==
X-Received: by 2002:a05:600c:4452:b0:40e:40fc:6d43 with SMTP id v18-20020a05600c445200b0040e40fc6d43mr957913wmn.98.1704912104738;
        Wed, 10 Jan 2024 10:41:44 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c4ece00b0040d5f3ef2a2sm3029695wmq.16.2024.01.10.10.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:41:44 -0800 (PST)
Date: Wed, 10 Jan 2024 21:41:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix double unlock in
 rzg2l_dt_subnode_to_map()
Message-ID: <f8c3a3a0-7c48-4e40-8af0-ed4e9d9b049f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If rzg2l_map_add_config() fails then the error handling calls
mutex_unlock(&pctrl->mutex) but we're not holding that mutex.  Move
the unlocks to before the gotos to avoid this situation.

Fixes: d3aaa7203a17 ("pinctrl: renesas: rzg2l: Add pin configuration support for pinmux groups")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
(Not tested).

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 80fb5011c7bb..8bbfb0530538 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -453,7 +453,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	gsel = pinctrl_generic_add_group(pctldev, name, pins, num_pinmux, NULL);
 	if (gsel < 0) {
 		ret = gsel;
-		goto unlock;
+		mutex_unlock(&pctrl->mutex);
+		goto done;
 	}
 
 	/*
@@ -464,6 +465,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	fsel = pinmux_generic_add_function(pctldev, name, pin_fn, 1, psel_val);
 	if (fsel < 0) {
 		ret = fsel;
+		mutex_unlock(&pctrl->mutex);
 		goto remove_group;
 	}
 
@@ -490,8 +492,6 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 
 remove_group:
 	pinctrl_generic_remove_group(pctldev, gsel);
-unlock:
-	mutex_unlock(&pctrl->mutex);
 done:
 	*index = idx;
 	kfree(configs);
-- 
2.43.0


