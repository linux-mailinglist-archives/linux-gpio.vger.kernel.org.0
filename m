Return-Path: <linux-gpio+bounces-20165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD4AB75A6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 21:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC671BA53A5
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 19:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE7C293B69;
	Wed, 14 May 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ5bBUjs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D064293728;
	Wed, 14 May 2025 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250337; cv=none; b=h0wo8IlcgQjONIsmtzY8H4i2NUQtx5H1oSSQloJax8uFVkMKPPgzNnhdY1mEbuHZgte0zgS/r2InezVmC00pi0fESpb74U4zX4vHI5QIfja8lS9ces2Q+gi23yuiYr86jROlgN5qdl5CXPFxFPQUQOoNQcJXQwTrHkLE62dL//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250337; c=relaxed/simple;
	bh=h0tNaL6qncESrFjbYyWC3nmtw8NiJhI90khkkfSvdXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d23SKD1zzbQ+luwDl/0F9w9X/LDdOyrUsSdMwccaPneyrXwAhCy9WX72cotYxL36ho3b1Qb/G9PMFfH06QUSdjzxc7obTYN0T8ZoEp8AYtRRICqiaSNGm29R6z/zq4oZ5Zavynz9+/2/mwdn+RstIame+TQ0H+7QFUrWc8K8BEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ5bBUjs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so1479175e9.0;
        Wed, 14 May 2025 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747250333; x=1747855133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZSG2e6Oo70EYCNnyg2ytHClvaVnzvr6s5xKl7gP7ks=;
        b=ZZ5bBUjslrEuULci9HVu3kgpw+TvS4t+H2wYecB/bLLZt+iH6T4XVvDqzPv5bJQuIi
         UcVpeFPz7ret8dZAdNIk4cSPIm1yEa7dT08/IYpre8ylnQ6uLaPNkwLirXiHH9PvPf03
         1ki05fyJ8vCxYBledfFTAVAT9iBjVd3Pfn/76FwE7XezoDZZO4T7bzSo928Yegej8hzv
         5sPQWgrGcj2BCqqajBcmxNyUt1W79NXEwgA6vUaYPf6lCaog/Bg59hBuzSybqpZjmYfb
         inG2eSsE/JHcWXB3Kjxo9o/I8Sk66rT+VznLaSEYOwLJC5q3vDHxnZBCAdAXuNbCeNRd
         lY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250333; x=1747855133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZSG2e6Oo70EYCNnyg2ytHClvaVnzvr6s5xKl7gP7ks=;
        b=NkOajNx9N1u8ewiL90H6hVbrUuf3NmGFO76inxsLzBlpgvDDPemBtSQRBzLtkzgkCX
         NdbPHC/CWtvnpUae0nK6pNzYOp3ojvXGvfYUhUG1Osr9CBHNoGv3NVm+MadV10Nf67T/
         I9/eWDTRWLH1NNTpS0iOVJYiZDLd9ecNbBNYSQDiF31VSZqLfBmwiR6WnTph1lzfWpAL
         p9wIWbMMmxaOxo0qd3e/lbfAfBiaN8XRbGsWfDJQAmzJasQjf1Bl+up+D4LYpveKyLxL
         XFvKqoH1pQo6ovt/8EaJ4IdR0lhF64YjMw1EChk1B3sjWWLXvT84d8Q5JUFfxsxLciqS
         embA==
X-Forwarded-Encrypted: i=1; AJvYcCUW7q/6cPhaltesMRlvKAJiqnNoOj5n0JddGB/WtsSYsiXax1ja44zneEQBeOsbug8Lub8tpOGKhYBPH7Kk@vger.kernel.org, AJvYcCX283N4SNpJajsW/RNTqyqc/5mIHUG423NaYjIs4wni2enZUPQ0f5S6bioQ0q2vW9Ry07qI7XwWhvpM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2sdt9s6aojO7K4iQpeC9mD+rc7WmBEACeHKEsEof+oK7CLnuJ
	Mh7XHg21Dbfd2HygiDZw1xG5kM/D8O+ryXsPTuFN4T6FxNr//AWu
X-Gm-Gg: ASbGnct+QkWoNR7lhFDtdp3wm0YPDVTU0zRLdYhw7QsZ92yK4W2eynR+zImK2jYoel1
	WKsjZLKZt8pbMdccP9PhhsoMchg5Vra2vkeQny3d1QoNyE0WpkHbWCyqHFyx1vwYAkkQieR6/7o
	Ybv7M10FZBPHNNyI+YepegW88GUYYEqLQoqkOI2FN7aSGvXCqh02hKrGF1mYUWVzFRxNkeuceRN
	wSoE/z0hUL3kdOO9RDxwNfTFhm1FHx/ApwyOAXyGwPry+6/Lw/OaVwXUp1E4dQ8msdmXSxp7/pV
	Eiz/YEJ+6/JnezAvHdcBGVpesvfeHY3VOQzb3zTfcIgrYByxmA/akjlS01JM9s0VfC+lV21BdcL
	otVyP
X-Google-Smtp-Source: AGHT+IE/FzeiZP6erIxPU2QEOlCFHyMatTZe9U11qci64whMI6XJiG749EI5iSektYWhvPKKGSJZ6g==
X-Received: by 2002:a05:600c:c059:20b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-442f285d105mr24526685e9.2.1747250332437;
        Wed, 14 May 2025 12:18:52 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm38707525e9.35.2025.05.14.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:18:52 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 14 May 2025 21:18:36 +0200
Subject: [PATCH v2 5/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_pmx_gpio_set_direction()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-pinctrl-a37xx-fixes-v2-5-07e9ac1ab737@gmail.com>
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
propagate their error values back to the stack instead of silently
ignoring those.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - remove 'stable' and 'Fixes' tags
  - add 'Reviewed-by' tag from Andrew
  - reorder 'Signed-off-by' tags (result of 'b4 trailers -u')
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 2e88a0399d1a205064b58890db6477e2202bf311..aed0069b085ced5867993e95e0244df7ccda556d 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -472,16 +472,17 @@ static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = range->gc;
+	int ret;
 
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
 		offset, range->name, offset, input ? "input" : "output");
 
 	if (input)
-		armada_37xx_gpio_direction_input(chip, offset);
+		ret = armada_37xx_gpio_direction_input(chip, offset);
 	else
-		armada_37xx_gpio_direction_output(chip, offset, 0);
+		ret = armada_37xx_gpio_direction_output(chip, offset, 0);
 
-	return 0;
+	return ret;
 }
 
 static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,

-- 
2.49.0


