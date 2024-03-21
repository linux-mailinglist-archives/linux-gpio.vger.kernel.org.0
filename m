Return-Path: <linux-gpio+bounces-4500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC1881C8A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 07:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D48D0B21BC6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 06:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BAA4AED7;
	Thu, 21 Mar 2024 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xnhe1zhW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C147A76
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 06:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711003127; cv=none; b=mBqq9V1qYEB24WNPnkSnJW6AZf2fKu0mT7gn/t1iE1TrI1ACegCvHOeLADxd/h5fM4IIReJkI4HlCPwPhEhba87lqx5E9P2DXoewhbdYCCTSDFgavF11oG5ngJuudFbDFkFQ/GryTIIxqp1HLCpCsPJBTkb3qgf/ZdDzlrfH2XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711003127; c=relaxed/simple;
	bh=YbgeCnjIUVi5GtTDPEGswB6RMCMBOV39XcZrT3taDIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mo0/95IxDjPl7BFsAASnplZ0Y2vPAa0B3Qe+l963+lk7LEcjuwGXZHnP6xszZQ0aughiJCvxuisdHxu8eDwiYoSZBYBjkwjRK68iLemq321V+0Zv8/nDQXSrWQQdGVnKLIoBhx4vFhQIiuvbAQ/2u3DZW6RZnHYCg9cXrLQUg/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xnhe1zhW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4146f3d4145so4206955e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 23:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711003123; x=1711607923; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4hwGF+QXFX1Vxi6snkUitGB1YN98VjNP9St3h6PXDQ=;
        b=Xnhe1zhWr/ctT4VSATHHth64Y1oyivJsUpq0Klfm7KMmAYWqhD76eqWtnTtikXm/+E
         dQ0gRymXH6wWm9TrNUBQL4bBG+KPOTrr0s9V+ytgOvN30ED/2KnThPTse6F0YuM75KsB
         0FFVYUwg40Bq5MRsyvTp7XtjMkBpoc8jb1SMWAKzsP/buuhd+qMMMQw5WND8737LIUf3
         prSeMSTJl9mu0beZTotT2yvuAMlyKjs3yvC4G/afBklIAG2JsopDogIcVJrfdKiqr34m
         jy/71hz2/p1k1B5LCNC9WzXdcNGCCHhfu/hOx+rQmhmI2CwfZvB2qGcFReNK30/hUPi2
         8Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711003123; x=1711607923;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4hwGF+QXFX1Vxi6snkUitGB1YN98VjNP9St3h6PXDQ=;
        b=JgDofmT4z3GECJfsBAzEXwg6lfh9k29G47JfOaVnLtKv+o0pWi29qrOPv094aFQrq7
         P8C6CUEdMFku5LVP+twFAw3PpXktHM8vWPh+PoJVR68H5xDTUPQQhbCZHS1j69DknVmo
         ty7wbDqGRjJWXMNX42TOl/6Tif5GSO66wEIwEiT2UDOZnsxEiy+uZ+6CtqUJHM6s2IW6
         BUwxylgXYrK8HHx2/jDeVevKbZ3RzdRbZFPUz0+YX5qlE0Zk4NCNOVF+O6eawQQmH5h6
         3qg5gPh9DOR4wPYAo/j8tocsnUKdsXVsJH36l++TsIfYGeBwFeCkof/VgJIT2cv6IzbG
         egQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsBzRc5MX3Qaz8kxJy7YSP5MUCeZSCDqGM7LB8Qv9r+yWewc44UZlEAIAKBw8w9KeUBJvy8RM/7pdASt/w0IwVvsSq7fM2ZLeDBQ==
X-Gm-Message-State: AOJu0YxDfEowJDe5JSbw8CK8Pne1fSfZUM0WwUCMsupG19wQoe3Jlom9
	mV0OSSlYI0I8WzmXTymSJQCElFjgvnXB2zv+jw4v5dJxhg68MdnvPxrplVaQbYw=
X-Google-Smtp-Source: AGHT+IEDUPehHJz4ek7JwafnO4x+wLZIk1n91Eb6COngAaFGxoPjYaT3KfsS4Jezl5GNE0okIbeNVw==
X-Received: by 2002:a05:600c:2484:b0:412:e50f:acaf with SMTP id 4-20020a05600c248400b00412e50facafmr615178wms.24.1711003123461;
        Wed, 20 Mar 2024 23:38:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b004146a1bf590sm4502963wms.32.2024.03.20.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 23:38:43 -0700 (PDT)
Date: Thu, 21 Mar 2024 09:38:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] pinctrl: core: delete incorrect free in pinctrl_enable()
Message-ID: <578fbe56-44e9-487c-ae95-29b695650f7c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "pctldev" struct is allocated in devm_pinctrl_register_and_init().
It's a devm_ managed pointer that is freed by devm_pinctrl_dev_release(),
so freeing it in pinctrl_enable() will lead to a double free.

The devm_pinctrl_dev_release() function frees the pindescs and destroys
the mutex as well.

Fixes: 6118714275f0 ("pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I spotted this during code review and have not tested it.

 drivers/pinctrl/core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 6649357637ff..cffeb869130d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2124,13 +2124,7 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
 
 	error = pinctrl_claim_hogs(pctldev);
 	if (error) {
-		dev_err(pctldev->dev, "could not claim hogs: %i\n",
-			error);
-		pinctrl_free_pindescs(pctldev, pctldev->desc->pins,
-				      pctldev->desc->npins);
-		mutex_destroy(&pctldev->mutex);
-		kfree(pctldev);
-
+		dev_err(pctldev->dev, "could not claim hogs: %i\n", error);
 		return error;
 	}
 
-- 
2.43.0


