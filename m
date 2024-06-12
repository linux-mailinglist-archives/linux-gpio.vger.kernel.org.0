Return-Path: <linux-gpio+bounces-7390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1D90509C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 12:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0394C1F2210E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1441E16EC0A;
	Wed, 12 Jun 2024 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nz5ecIO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211416E888
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189020; cv=none; b=jMZj6flLbMuQipwvfh+nm44xQtzRRW2PhvrbO/2O8n//fVYoBfM6OzgWWZ4YfbNGmCf2eycWkM8wVgSTUEqGVPzv+5s1FnHve6Z7ZUWjLsKT6pSoo5Q6Zz+or6sqPXfX4bJXZAXp8vWx3XPcMdYNgY8kh5FfXc9XwPjAH27bXG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189020; c=relaxed/simple;
	bh=REYZcvusm3pkwQ7HGYtJFqKnsOvXK1eSq4fjluTiMa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooWxULEg5FYd+JzGvAf5A+hsKV/iciCrzPFzc9SYbWMyKNurJDbbU4JJXB6tupaW16vH6Gabshaj7R1qq+EXGDNbVWvqdDAs61btSdrxWh8O9b9rvBOVXaa5WTP1grVAZ8/Kup0VScbqu12plEvKNq02Cfe6Z10jX8ITukZbcCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nz5ecIO0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso71782261fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 03:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718189017; x=1718793817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=en5v3zZb3SYUynuEEvB5KY7fvjCtjNs2C99/5XHt5sQ=;
        b=nz5ecIO0pAY/S7aL5GGowJEQAAJHigWeTCvTLfrU434O6+lYLQ4pMiQpdHx44i7S07
         uLavFrc8a/A6vwKIlUUgnhSDKbvYSfhFody4I34hFYeyod+YcOFazPwgHQZ3Q7hJzuB3
         QzQMdFpLD/m2bOpX1vzEAbETmqydRUHx3BYtGH+WdG+FPFnvgF4F9zQcwsAaYOq1jipp
         xr1jdppunOWlitTbbZhalwQFI206a3PefqXcvmIJezYqHeXs/INrjzfFJlIHx5ZFP87+
         IovLV4n3tI4ikkID7le/Ag8TLRG4iDNkJAlIsO4PHpBCFMLH+VfeTMLE/NSe7hitSNIq
         iGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189017; x=1718793817;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=en5v3zZb3SYUynuEEvB5KY7fvjCtjNs2C99/5XHt5sQ=;
        b=nIDBzT5/iKjYcG4fZ7fjuna+HXNY3oXlZFZeNbxxbZy3EqWRUSb/smKEaUGJuEG0hO
         EYbxyajGx39ORtDtcH0757lS+kKIv9a/8rSsHFeL+bRIAA/Gg0tafT1wNyc5fCYt1dGK
         U7I/ksXzxviBDw9/bl2UOE+UStA6xycUKa4QZ2iMM0wJtI0h+PLPxMEfrHWNFHRcrsm8
         SKHMO3yb+kvIA7+RAl+TlJYcw5PcuAlvK8lbP9ezh0wztZEjVx5Vs1aRVp/CAkU3LMQB
         CCqZcCP93BeN58OkrpgI3ZK9bpNI7RMVFEq088isC96f7jeNiJLKofBf8JQxLIgaPTc8
         7LPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCS7nvWPGwlUgqOpFk8UvmuUJt01LpndURClKzj+ptFyn4AvCZWrzFOLwzk/yRPzAkWUl63vlUZiTew0I3QEHb9a1abJCMSqOo/A==
X-Gm-Message-State: AOJu0YyC0vTWXTmA5/MwFCfkaSKyuiXT8X6eVJepwtPXoZk6lx0WaQla
	Z++vTlMMJHHILx7DJ5v7L9LbYXeWK2mATOAlwHBWG2fZSuct2OtRXye652bpLzA=
X-Google-Smtp-Source: AGHT+IGAjGH7WuBg4zqQ4D62wvnr79c+GSlh8tV4aOGiyUMLTUamEwviTONC6JOitXK9+WCXuDW5Ng==
X-Received: by 2002:a2e:a796:0:b0:2eb:fda7:e35f with SMTP id 38308e7fff4ca-2ebfda7e40bmr8240381fa.5.1718189017181;
        Wed, 12 Jun 2024 03:43:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm21843715e9.38.2024.06.12.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:43:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:43:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: ma35d1: Fix an IS_ERR() vs NULL check
Message-ID: <840152f9-d3bb-410e-8164-4c5043e1983e@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The fwnode_iomap() function doesn't return error pointers, it returns
NULL.  It's the same as of_iomap() in that way.  Update the check
accordingly.

Fixes: ecc5bf868673 ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index fb933cddde91..1fa00a23534a 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -571,8 +571,8 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 static int ma35_get_bank_data(struct ma35_pin_bank *bank)
 {
 	bank->reg_base = fwnode_iomap(bank->fwnode, 0);
-	if (IS_ERR(bank->reg_base))
-		return PTR_ERR(bank->reg_base);
+	if (!bank->reg_base)
+		return -ENOMEM;
 
 	bank->irq = fwnode_irq_get(bank->fwnode, 0);
 
-- 
2.43.0


