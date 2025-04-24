Return-Path: <linux-gpio+bounces-19273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E4A9AE7B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 15:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 638347B2908
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 13:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0AA27456;
	Thu, 24 Apr 2025 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c1f9R+W6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06717578
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500000; cv=none; b=DtE56tkGumUaYt3nXnAySLKNTux1UM4CVmHBdmanyzbppBhlSlC4sEnXpD37EvjrF/8iRh6IkpyQ8nL6eLEdrTz1/854Eh+YZKo3e9aLm1En26cl5aW3jCgLn9f8TcOPzw4SA2DxvZinmMZQTZDEvAf/Lli5YymdlUIlDEYXOV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500000; c=relaxed/simple;
	bh=1lcu/hZI51lv5eCbcklnWaY+olahIvrkWxpxSfc/o5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6oGzxgAIkhMcOuMOmTODFWCX2kFzMCtP6k9wluv5e3KUdCOzbNE8RMFwuJxovsolroyUqecYwFEJBacUQrQ4LCQsr93xjWTmd9UcQkPtb0AwKFWxAmGO7TafnU/7i3LJ3JgqqDCN0BqD08+W+o0V3JMPR8XZcELUIkPPjcQpC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c1f9R+W6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso4538145e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745499997; x=1746104797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IviQGI5EQTn/siTes4L+J7t7qyt4gOGyvxGWOmyVk3M=;
        b=c1f9R+W64NXeG9Zg2FFrA2dCX4OyEceEPtvm95Rw0ZbYiHtFR98GnaUtsvmOC6eRlf
         bCtdSmLQ+5C/4BgPhqFDXrHxNigXPvbEUgFuKRswChI27+7V6IUYQrCYWC7hAQ+p51fg
         kF8LyoKTYohrKV8+Q7p6mXSAHXs8VedwPoLJbGMKxc/dtAtKTMRhqY4X6c9XCx7wHd8Y
         NxeFfCBW1EmYR2GZzLphVfaQ7QXZRysjC3Hz9qiED1H5Nk3vzDTttU9hE0bpJMQ3tqDb
         BRrKphJEy278fTYOWFdAf/QzySBmLtRn7IEorAbNMniKe3hlKk0YJhTdUr0Wrtjr5BSs
         PVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499997; x=1746104797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IviQGI5EQTn/siTes4L+J7t7qyt4gOGyvxGWOmyVk3M=;
        b=g/8yqAGCp2GXeFC765B4fADiE24z8gMIwWjqYAW9Sl2gGvSYL39zcWt1xi3i48pFN6
         yj3O12vOPBw6BP/SHpu/XNXAa0knUx+PtQOUCjRJCZl6M4kNcWUGC4WBCMKgXilkDO42
         8trYwSWOAS5+/xMjMZ+XXYAazbikm0F57Uw7z9Vb3QXpWNtT7WiY6KyuD/5St0JAmQGh
         1rPmE5aBpnHhppyrCNxpbju2vetMegUap3/3Y03Krl+uCdOa5PiLW+jEghBlFuvADa6x
         EwQ7U4wx8s4GCqmaNF6bkrwnIfU1695znDoaxUWVaB2tKW41ZPgBcxLUew2q9bKQj6KS
         Hwsw==
X-Gm-Message-State: AOJu0YxsXxFM0FyitZzLus1JJ/nNIFx4I+M0yYNP+bqqMasM8Jcd/jJr
	dNsuy5673h/twV1oOCgzjrkB8xy6OIomwJR2Grkta4iLzvLjcbfyLzzYzS2qkmQ=
X-Gm-Gg: ASbGncsVXPwNPALJErmac/IfOoY3PhhfZ56uSpEDt94btudUOJrMLSIyGzlUp1mdI42
	wy8JcxQ37WgYJPqwcXz7/RZP70bCEWUm0QN0zxVfy/6hTTcGyeTspWol76PVnk7pS6RFAvhkTnK
	9geqJILbgDHMTI8o2e8RgYaQR12wtEDPBT3WgSMLXdWJ1vTxnD3PaH0ttKfu5APAn1VCnvV8x7t
	c99+EmyTY4SPbeHXmDm7wyb2hj9sonCez9OPZ0XUuIJqGXAKJDlzEmNda4tkG+8KKOaYJim3b5I
	8CQA+xNAI+aCqwHdxzm7pGS3UDyJM9FT1RWMV3jgkokD
X-Google-Smtp-Source: AGHT+IGZL0W3B3x6zTwb1Dsqb9IhqD/k3h8EgHcbWh10GnxLjJcbB4WW2qCyHYKlsVmlw944qxpLLA==
X-Received: by 2002:a05:600c:a405:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-440a19b662emr918055e9.15.1745499996590;
        Thu, 24 Apr 2025 06:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad175sm20427485e9.24.2025.04.24.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:06:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 15:06:27 +0200
Subject: [PATCH libgpiod 1/2] bindings: python: add missing newline to
 pyproject.toml
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pyproject-toml-pep-639-v1-1-8150d3d807b1@linaro.org>
References: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
In-Reply-To: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
 Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=774;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7N+05yOD667aLwIxBZsf+VeaZ0gSTB3y3HzBIyqo5tk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCjdaR4Rv5/fm+M2BC0LttgAAYiYxTh9fiOGgg
 a2hfZQ1JgCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAo3WgAKCRARpy6gFHHX
 cnHAEAC7gsOaAqms4uj9dmVaW4X5yN0GGsl06i8TYHg71lCE7h7J0CRWqLDfLDy/+C9A9HygHxi
 JYumRXD2HaunERvleGL5XOaAfbx0Z/P7yJ6xGEU9Y5+mYY2QXcBD5jc56WE9Avnzcnvpaw5wETC
 y5SDFO5XnTOiRzkGhpKhsfWDMz+IfgKOXBSTH6jfDMvDhSp55wKO+sFjCmfyA+h8e+RehW1E5/2
 2UYE2e56SgmHD8kPHu4fjO6hBAT2OTW6CCT63wQ62sxePjyH4ST0Eh/SMCUL+4d1DwsgQxbdu4g
 H+T3VELyqEQj424X5INbfXfY5H5vQ/EcFxvPjIvehCN/TXbU+5LDDZOjpxv1kpafqsDl31mVjGS
 zMO1BhPqu1CbTM6TEDK32uDjvL32UlPoGrNMbazjnx0WjRc1yY59xu1TR2DdgGlA2XGw1VF34mJ
 78h3CebIKNz/XRsC1hahPPCmXub36VO66sxhQsHU+zyIMibToCYSZB6vy13TDOMPCNAAxeK8OKN
 t6vE91FvkaNW0aUvXo9OPcxOQ7JNfJlH/OAXgrszTVQ2qlG7+SWXEa5WNP0lrK+rVintr5kX/2a
 wMIBPYZQ+CRmaZ97o7w6efmKTr2ti9x5XM07IPePDV6Uoj0XN4rLs/HTIB/IBzSOacHPWbRLAp0
 MApeaXg61Ot584g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's a newline missing at the end of pyproject.toml. Add it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/pyproject.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index dbc0c7d..8f025a7 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -79,4 +79,4 @@ ignore=[
 [tool.ruff.lint.per-file-ignores]
 "gpiod/__init__.py" = ["F403", "F405"]  # ignore warnings about star imports
 "tests/__main__.py" = ["F403"]
-"tests/**.py" = ["F841"]  # ignore warnings about unused variables
\ No newline at end of file
+"tests/**.py" = ["F841"]  # ignore warnings about unused variables

-- 
2.45.2


