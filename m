Return-Path: <linux-gpio+bounces-17352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A886A591D4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 11:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC6823AB6AE
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 10:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6819229B36;
	Mon, 10 Mar 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCwiqut4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E3226D1A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603725; cv=none; b=kDzY1AEMdKfNbREGOvQdgnTYqpOAY07pLEYk0dzkoCOa4lPX6cwJzbaIXKcwPjViMu/aAjWL4zRNFs/yRlSjyH8pJp6Eu2BWojMQy4gH8/uhM2ih+FUZK5oRPEyKJDHViv7ZmIt90z90ERNzH1C4lUzgpsranFqGHmjqHjKXHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603725; c=relaxed/simple;
	bh=ThNQa8FfIWCfCjBqxfnY7Y6HddW97gUTMSNhwoQo/9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNC8slP4tPiDJIzXmLeo1KDDuIekHLDkS8q/q3hs1NOjq6OJd7IaAdbkqWSKwAEGV1FPFAU6hRz6HxR9d9q7WwHtgs+UPGs/BfrVz8dgc4e1gHlm5qZxATBBwoYzvWNq/FbYDIYsCmNwkE9Jh4Y2qqBDE+BC2hpj8uNSvoKJdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCwiqut4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso23270555e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 03:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603722; x=1742208522; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=;
        b=QCwiqut4grrDAhnmpyyWOGtoPFSLlO6LwON7v336QIUYd6H34bIxpWF1qu4Cj5u6Gu
         D4exXJWcPTqAN/BTxUscdwV4Tm6W162STr8QWJGPyWznqJXEMllOCwgQ8Q1XegGwhWXQ
         Kqf0pjumGWzC6WkyHEgyvIlWbXhHLrN0zUfSBYSvuUOHtumBcwWb2kDmez9mYMwadwze
         j7Cpr8cnrCvJj4ZbGQ5G1/KnnSwSP+pgnJvTbnW6SRYt3RNzppGwxwXkOudvDzqChLZI
         uAKKBdNTbqIiIpvT3FPBiuKdJh7ETxQ+G2J3OR1wWDvb+m6WQuisczeh/lYtUjtw3zs7
         /zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603722; x=1742208522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4FBTBE+KNOkM+Qcs2aGG4D+zzTC9l6YOpjrjTql9Ko=;
        b=iiv4QSzwTPk23UQuEBpULEU6a+z0VYzqG1nrWlE5sbFfk3OYiq3MGkrhDmQc8wDjbF
         wLxy1zH/cDxVj2Bmsm34bmjxzWNT8bf6JEickVMX57/086/QURB1cdZuQOEAi9hxZYu4
         NjbQ4bJPuQaFBi3Qy10Szn3jXX/aGyUW/ppJ6RcAZ+3rFcD804jlHMTOyB3m5enTN1nr
         Np6uInVysOMKtbps4imlD4xc4PbR2juXtBFE+JoUSpfoi+eVoxerT2+n6lOuGqiSm8as
         +54h8b6+G8WVsP5cghebH/bPAuxMO0NYoiwT4wVtBXpBoWBbf/UNkEJ4TiZCAkSxuqgU
         EJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUD4E3gaG5znjH4ewg8g/q3Tjgfm8lg48lljFG3I9vSY2sP8LqxMrTagGM1E1uX89jGSeN4dnGIJwda@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuzz1LFmXe1oGvJIyB3RJa9Nfh4LNIFwzEGUpAgfSRKbS+GNUY
	v/TUbjdgAOjcK91veLQDy+dIEvcXWd2MLP8WCwSkhGJUKxcKmJ3XYZzlRZcv738=
X-Gm-Gg: ASbGnctZEXgNT/xkUW6zyMwsP6JA/dK+2ZeMZ0v35LFlIwuGT7qAIZHFKsyhyfWGGhD
	bwYjBgc3/XMIju33tPtpA/NBLDQT5Xo0W2JTD11DuQrIDRdmb2S9WLB5szGf0Fl16wQlhvF4De4
	+826JC3sMPFHcn5PpoEo57ehk5ivCOhpK4pSW67LuA8W+RDYzZG7AKRzWmXCjOvYfPpDtMzEwBy
	X5xnqlVVacJGGPmD48QBlWBRJPlZlnDtvfb+SOkScQu4RODz93zxj8nEWjw4Ci1sWHk91w+aOWc
	TK1Hj5vn9pz7R19cRhWjOHIYc3/2ihYBEpmo1uSaT7vgl3ZhFw==
X-Google-Smtp-Source: AGHT+IETFwDZNdnH20Q7Y3z4UlrnseZbh1WDkk70tSsdvhJaGXXT+NyRi65tIbPyOgQrBEERRB/G5Q==
X-Received: by 2002:a05:600c:510d:b0:43b:c0fa:f9bc with SMTP id 5b1f17b1804b1-43c601d93e7mr74449995e9.12.1741603722155;
        Mon, 10 Mar 2025 03:48:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ce3f573f6sm57354855e9.0.2025.03.10.03.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:41 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: bcm281xx: Add missing assignment in
 bcm21664_pinctrl_lock_all()
Message-ID: <dfc15d59-7fa9-4f96-aacb-37c3df6d420d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The next line checks if this regmap_write() failed, but it doesn't
work because the assignment was accidentally left out.  Add the
assignment.

Fixes: 60d69769c851 ("pinctrl: bcm281xx: Add support for BCM21664 pinmux")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index 7c8f8bd7da12..9ea20fde3a24 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1498,8 +1498,8 @@ static int bcm21664_pinctrl_lock_all(struct bcm281xx_pinctrl_data *pdata)
 				rc);
 			return rc;
 		}
-		regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
-			     0xffffffff);
+		rc = regmap_write(pdata->regmap, BCM21664_ACCESS_LOCK_OFFSET(i),
+				  0xffffffff);
 		if (rc) {
 			dev_err(pdata->dev, "Failed to write access lock: %d\n",
 				rc);
-- 
2.47.2


