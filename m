Return-Path: <linux-gpio+bounces-17353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A05A59203
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 11:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68F1F3B0859
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 10:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8F4229B1D;
	Mon, 10 Mar 2025 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhNEV+Ds"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7808229B13
	for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603935; cv=none; b=dpDGODb+yhy8iIbLuBKn5O0DvlOssl5Ov9F7wDHTTafcvBob3twgi0XYQqezjFtrvyCebwscXV/riTkHkywYsLi6PpmDTV/bi0GXp9O4POV4CGfcVIW0aBaAOlYhMJBMOdE0u2a+v+HrPTqDFYptVyFQjXZqa1zxWwXLHu+dNPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603935; c=relaxed/simple;
	bh=vVKnwODUdAiwe/gid9w0DRJv5TpgZa3pSP8IVebCvGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZGygpIo9aHi5yv7R/4i9kZQH9Cbr23T48b0gPc9ZUA710gAOyxHNGpuHpJ7gSrCqF7nQvqzYQH1rg/BEmjfQIlDG3DhX1mMn0yjQPJ2ZiAfHSxOE23TsT25q7SB72SJ+FgZsq+g72cJTX9YeDXAYOb06wRHXStJOucUqpUsf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhNEV+Ds; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3236486f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Mar 2025 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603931; x=1742208731; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T60o6gi3usu2ntppRywUa3E8NpwOZr/s4pv7rr3CEFs=;
        b=QhNEV+DsQHmMFF/3V3N/rzgReacxeQcne8aEUk2tC7Vas5wbteFmTJWVIIfrPdSN5f
         TWcvtXZaHO8jm9WeefqnmRybkZOkTs2gRfhfMJpoIXDB0bQiO8kGnbJMXGSK2RNQKe9D
         XnG6PtuUl5c8a87o0PF7REyKQY1LBHCm+B0DmDED6kwpu7pNBgHO9CU540QBGHa/Ga9R
         N5i5f9pyZZrvJT/WOH0dOp48s2L2Ermc5yM8SXVzikbQrJKg/MZLvKSKq+stou4J5kDO
         LXz46UB8l/egDb2ug+8B3ylcNRNkLqdrkkzXDCsI7XugvvYXUwWx4mmQtpr7tgXUJvfU
         qUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603931; x=1742208731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T60o6gi3usu2ntppRywUa3E8NpwOZr/s4pv7rr3CEFs=;
        b=PYoKW7/Tuj46uo5axH8QsPUBM5D4KIuoXT3VvAlr+oeKyIQTdgZQyvZ2dRDROFYd+X
         4fXwQtvxMOwd9gEmrJsa/hb0P3c/558mP0Kv3ObkEnFkS/u0zHGDvZiPeXcAuEhI8KIP
         MatbcguR6vN/gGLrY+Xl9DSWt1EKxRMKlJojLFJk1RdKbr6JK4pg9vMP2aTWyznlSY8X
         KUtavQounL+rTdHQSjwy4eUvvaeNykFpjPieyV3/w4kdxGdmnFyWPKA8LOds96hu7KlG
         sHQFMwdZ5cjZa0s/3LbgLY9FNyUAAVlXC7pE1kKvrPjljbrfwmQ4KuYuXAW+Vd8kYIa0
         K3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1S1/oupy6l6eBvj0vQ6RrjuClDKZHslngDGm+dCgHbcZZQQ+1TiCIar1RJXI0JPG4f38dU7KATdcU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2lQk1u7Ma1yLUXt7cOxEEsWGh8JIgkeIeIFaFIErF4WRCplST
	BeNv1+pzMd3RpOMBo774GO1eTe3SGyqAFvEc9O9Nlu4GqhhWFUknsohA2nE+Zh0=
X-Gm-Gg: ASbGnctRJA1ANlnXs1CadmigaEIkE0G2kGsF3GImQtg+1OKBLwq2zE8jONcV7PrW+Q9
	q3QSTNhkfOhQOdF5a9p58O61l5gMkDeSjEJDk8HhDjeBe0c68CmQfbos2Askx4/BLKkZCvSOd8j
	4QrSzVe26NkDU/65tZKHZbZ0yEcnCxrdm7O8C9Vctv/rEivA5pSmwS6VBiuw3AG/XqMPjjLtuy3
	/pYWRxGkNVEGi+zCOuN0UsY6is/fDQMGFlP9SQceK0PU3ZYqur0w+gJk+4iov1CnJTK1L3WBQRU
	QneKqbNqwGfVvDN1GZdOSDrIx6/SK2LPBEUAr/0Y3Jr0SQGVaA==
X-Google-Smtp-Source: AGHT+IG9NsSyCGpPSYGknbpw3bJVRYQjo38717W7yKTXqETR+ruZNlHceeFZwXiH5qt7jRD0fRgUGg==
X-Received: by 2002:adf:cb01:0:b0:38f:3245:21fc with SMTP id ffacd0b85a97d-39132db1fdamr8297936f8f.50.1741603931088;
        Mon, 10 Mar 2025 03:52:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e2bacsm14468396f8f.78.2025.03.10.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:52:10 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:52:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in
 probe()
Message-ID: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The platform_get_resource() returns NULL on error.  It doesn't
return error pointers.  Fix the error checking to match.

Fixes: e97435ab09f3 ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-amdisp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index ce21ed84b929..9256ed67bb20 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -183,8 +183,8 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
 	pdev->dev.init_name = DRV_NAME;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
+	if (!res)
+		return -EINVAL;
 
 	pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(pctrl->gpiobase))
-- 
2.47.2


