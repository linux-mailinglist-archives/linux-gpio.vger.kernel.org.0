Return-Path: <linux-gpio+bounces-11521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091BB9A211C
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 13:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26831F2469D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 11:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EA81DC1BD;
	Thu, 17 Oct 2024 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejxogFT1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B41D9A63;
	Thu, 17 Oct 2024 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729165196; cv=none; b=UZ+GIv0BHSmuUf6ZI8SQrbUf6mjjxHAktusODwLuGLjWB2redNribY82/TmnPe77cHlD69kop0W5mWVDS2WlgOJOkN1U3wZER56G3SCOjIDkU/8N4ZhXFeCb6Bac0Gh6U0UFn/ITM8s4QCd8ykZzAtnTYa7n103UX+qSHRMMTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729165196; c=relaxed/simple;
	bh=ZM+GQmScKTO9CCTK7eWxy1efNsPTqt7vxhJZmJa8IKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EO9FcxJ4GIRpEOsAeti1eQ2EhA/nG4KIHEJBWlZpW9nEZD2hliOGUBGY1vAn9BQ7Y9rOLGVKLHwihA9f2uqKr9xlGX+I1J+R0xAISVnK13Vi41kBwfRbkgfrjqKp6gPd+uaN54PPfbohrKo4SIfPaLkGza9Kbmzxfemo52qB/Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejxogFT1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315baec69eso4815455e9.2;
        Thu, 17 Oct 2024 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729165191; x=1729769991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtcWZjFWCr+3plb6g0CnGBT71iiUiGqc8kg3xOiLHtM=;
        b=ejxogFT1opCsf+hUh53HC4o4rglL7evZuKGKZLOt3kSLNXGZjda0U5UL5h8fNAujnI
         Lq+mE5uXjYl1GF2JLcyfCOq8Gbjtxi8AvcvbnHQafEA3ojcxHfiXyf5jveQ7Rh0OkSKL
         HJnCDac18oL43AKLBdQCg5kH/znVCUgxrTRS6K6FoyERNLKhIS2CwDrxwxgUf3Pr9yg6
         pRv++jCpxQCMHEEYPJ4i/mVpXM+9ktSe/8BnfnVD1ij33afDoLoZHuCis/SVZHlJZD6r
         f1F20oIpgYSgsxAjQOYCCUJmQm1MerThWfi3ARj2EP2VT9wUhgbdT1AxQf3Ww5gZ4CR0
         Kfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729165191; x=1729769991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtcWZjFWCr+3plb6g0CnGBT71iiUiGqc8kg3xOiLHtM=;
        b=BuBsaaCZLzGdRbcBfsaQ4WsNNXwYqweWIPlRKF+exm1mbBFZMFWgxz3KgpmxZAUfO2
         HrK1F1WVh7DuOfwBAVhMhVSElqKxtf4zzF1aftNYNlk8V62vAPcacj+rMLxNkiNmTNIn
         tnn5TiKBHJ+3+MIH4bHSGfu/mVbI/03+l7rX/LuCe3L1O2lWcUKR84i91FymKmLgY5IS
         JsRER+NtIie0rk5ipwQWMNN1MQwnVl2wFFTUk083zgM3wPKAOTOOmFhYyYX/7DirbBkW
         yGkDCsr3sO8EeI5uSwW3jpw5I1z/1eSRcrEuzGMUceRvP+HivMoy5Hi3rxZIi7Qxp7BR
         zC3g==
X-Forwarded-Encrypted: i=1; AJvYcCW+rR8Nkoc7NVVM7RDw4VuJQMYtjB9O6X3QQaqJtoZ5Zu5wokJbhG+kUNtFs0KrrDGZrTwBc0e+sOcY@vger.kernel.org, AJvYcCWB2gAeeYFUwV9H5rH0ORpcYDvJVDg3TvYtayI2o5gV3uB4D78l/+HP2F7avVkuoEvRRN8kNrZNLXQWDKi9u3DEjkE=@vger.kernel.org, AJvYcCXIYuD4E6fUc5pK4bBwK+lYurze0Bix1jmJ2YakrkTXr/Rb1YtbEx7n/8bAQDpDyqMEmr2CI9WRlFdQJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Lk/j33lboufyOOf0lgDk1hVuKCPjUfOgIGVGkF0fDkRxjA1U
	jOfjtYzlTr8smB/eSNu4+fILC6ZSrRFtIj+fuffeDL1xtulezoCE
X-Google-Smtp-Source: AGHT+IE4W2oVMvYqCn3CNsCQCsKnfZXEwQTrg4Gj7EWKW0quFbdwKQxU3mCuLo6luDI5xt0QWMZTsg==
X-Received: by 2002:a05:600c:58d7:b0:431:54f3:11af with SMTP id 5b1f17b1804b1-43154f312eemr32846005e9.31.1729165191246;
        Thu, 17 Oct 2024 04:39:51 -0700 (PDT)
Received: from prasmi.Home ([2a02:c7c:e309:f400:f6f5:4306:392d:908d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf82b1sm7060399f8f.72.2024.10.17.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 04:39:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/7] pinctrl: renesas: rzg2l: Use gpiochip_populate_parent_fwspec_twocell helper
Date: Thu, 17 Oct 2024 12:39:37 +0100
Message-ID: <20241017113942.139712-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5eefbace7d91..8ffb9430a134 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2433,21 +2433,6 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	return ret;
 }
 
-static int rzg2l_gpio_populate_parent_fwspec(struct gpio_chip *chip,
-					     union gpio_irq_fwspec *gfwspec,
-					     unsigned int parent_hwirq,
-					     unsigned int parent_type)
-{
-	struct irq_fwspec *fwspec = &gfwspec->fwspec;
-
-	fwspec->fwnode = chip->irq.parent_domain->fwnode;
-	fwspec->param_count = 2;
-	fwspec->param[0] = parent_hwirq;
-	fwspec->param[1] = parent_type;
-
-	return 0;
-}
-
 static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 {
 	struct irq_domain *domain = pctrl->gpio_chip.irq.domain;
@@ -2649,7 +2634,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	girq->fwnode = dev_fwnode(pctrl->dev);
 	girq->parent_domain = parent_domain;
 	girq->child_to_parent_hwirq = rzg2l_gpio_child_to_parent_hwirq;
-	girq->populate_parent_alloc_arg = rzg2l_gpio_populate_parent_fwspec;
+	girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_twocell;
 	girq->child_irq_domain_ops.free = rzg2l_gpio_irq_domain_free;
 	girq->init_valid_mask = rzg2l_init_irq_valid_mask;
 
-- 
2.43.0


