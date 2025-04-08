Return-Path: <linux-gpio+bounces-18502-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9181A80C00
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 15:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1689C4E6F32
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FC327EC99;
	Tue,  8 Apr 2025 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S8ztezM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3480027E1CB
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117157; cv=none; b=WKiDl5hGZEOsZpWJ5SQ7Rl1b4mPByTklSD8kh1h+ySaaZ4qqUp8iEdu/+si7WuxdS+WuH+4lqgLhXyoU3gEhwMvr0S98nl6W/7x5o5tlq4r9VO1aMcp+P/7iqxKqgQ8ZCVROPhSdGS+wv+Iyqb8tQNisY0TFCN1o+/Isl4XM1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117157; c=relaxed/simple;
	bh=FQZjWIuKGxUW5PukAyM0+CslUNDfnoA/RUSx9EJ79nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJsH47xf829V3AFbrXvfcVGMjzrHWu0epuykJvfbfIqfkEe6OksINlqO8wZk3gRIuOJ7IPE73CnqY1vSENacAfX5quX+2sbaVfAZSoSEfeYH6SoYNTFkv6l94khsIZ1i6bdMiEymevnUTJJcn3xrKFYIG3BAmmlrkqEXY65JWUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S8ztezM/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso35567585e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117153; x=1744721953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xC7Jkoxgu+y5LjBLMSQ5GqgYTO+aEYr+nviHv0yufAw=;
        b=S8ztezM/F8BvH4p8AEW5bk8AlABlke8l+9gMqgmNDRYs/RonkZpte0SUdFEnxTzOh8
         o+4ocwl+o1O5oyPtLE76ZVS/EIzY+WZbw/n75ohYT85Nb+3udseN0S5a2bFAP90FE/TG
         kxArBJaGfGjl/eYLwO/kxLbd8LtW6JmwfvF+KdDb3JYn/ENOmkYfingOJEujclpPWjVK
         W4hL1mxzXSKvyvyduT3NxX6/PQLwI8Yf6ZT83U1wmAFN/XTkjAgBoF4oI6XDWfT2Vqe8
         Ty+XR7U5zZZPDrgvJk9nZCFZLjwhAgixMsRimLTd7RPAcCM4KlQtELWIvy/WfIQ5/Xk5
         4BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117153; x=1744721953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xC7Jkoxgu+y5LjBLMSQ5GqgYTO+aEYr+nviHv0yufAw=;
        b=J7GjFC2efpMbcG667XRZWRQEyaWYOhaccR1WsXW7itWehtuw5WTKisF85ag9oUv9N1
         5Bo6wpU9VwS+ZyXp15frJGINHjSTjot04pScQX0JsRaP5MucsbAPqkrJWh541m5ZI62s
         WFvAsJFAJCk6ds+v6Q/mpWUY2wOD64fQlvBRbzaWiKzvAk5ZRv/tHw+bnjAdxXmBDpHM
         2hYlIfUlmI+RxZURR/uPmkdpRqt78koUxd7mAqaMkZADtcsH+44u6CugYPYf5naEjI+L
         aKN5zqHAjwTPbd60CABpzYEdhAZXW+2jcA7UAc0o4BsDoduRsWL+dRxLe72Q9+aP2slr
         hB3g==
X-Gm-Message-State: AOJu0YzxhiQtbXBojnFtx3FlR2itbJdkSm3/T7EaH4EcX3GbUKXt9DvT
	/IKQonvNhdHSC+VcpGoI5MVUQytpADGilcaQ17ZLx6wUR9r04i34W971AApSPys3qBsyOrfuiek
	gZ8U=
X-Gm-Gg: ASbGncu8QVGOp9dGzdeADGikp4utIxmLZwlP/OXVbBVkYd26+7m7JguJeLSSFgNUaI8
	1DRbHyY4JbdhA8EGiLQ39QtfxP3Obfc3/80vZvZJHEybbr//iL5be7KbxM4k2CT4bzgqhGcJtD5
	AE+fk+56357t/8mdn8SSSGt/WY29+LmkpGzBI72rsTo4TVWZxBro4NRj8UVtWG5inNb3IJeP9OG
	SaFshCKB8FbwPDcVR1BoIrXcdY131S+lcQMeZENjDTkScFOxEWbqYbK+eS+7ussl0G+p3G/Xgff
	LNlpxHW2249+3fvy2jqY1r9ElPgdiFjsaP8q4Q==
X-Google-Smtp-Source: AGHT+IHOqKUDjWNFzhyrC1vPbVn5ueeBqsa9rjMrKDRuijSChqNRcfKd91U8xq/H8SCGcZzERbsKmg==
X-Received: by 2002:a05:600c:1e0a:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-43ed0c50ab7mr173508295e9.16.1744117153502;
        Tue, 08 Apr 2025 05:59:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:06 +0200
Subject: [PATCH 6/6] gpio: tn48m: enable building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-6-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=709;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NWqzy1FXeHle8xe6Nk4bTIHcxAly3mq2NB21x2oVzRU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2bGh9ZxwiI2EISS23+EhVRG9YEgD3ghI+fG
 0MwrEA7+AaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmwAKCRARpy6gFHHX
 coI1D/9dcwnJ/zuLo6kyKNpJE5neL/nTWHDIwgg13uZwMo6vetsEZmpwCRfzHROL8+PvNpV8Znk
 qOfwAt/0eLTUdlcao4StcSeN/Hl0215B9dWbGqKto9o0suyt77HZcb5kntu8sL+Thi4AujMX3W/
 phe68wxiPZSWdoBKhYXQqW5pJdD6leDH6vxoWts/LFi+GI1BwZueblTYKVIz5E8Moo2QO935QTv
 TtMX1PLXUp0cEkc2D3xE3d94DFVXP16Ka0mcE1eQA80gf4FDVCpgHclb3y1mAZOCo/QMXwP03a6
 imflZvpy3lhS6R5a9FBeSCbWvc7ybaDHVrjnGC1yl/xUXjaX1ITzyXAYsV50n0hh3VJIEqy39Xf
 DRqpjqT+tqL5phwqG3mU+Z2J/t2qFMFbI4thftwBh3dZkWRDAIE9wHrFZmOYGe31bdNg5mh4Smd
 dSfovVg7UvYn7Xq5MCdMW81byAfd/Ld+GHXfTvHZDwOWYJAz3a15Ep3s8IjuCFtp3LIzY6bJ5t8
 eLhbNwBAgjZAqDKcqMBTMzfmQmhHvgmlqLm5CjqnHiEKqx9J+HOwFk8P3ICrxeS3YOQu9uTIHh8
 Qi0QB7D733oSVOpjaEBFL8bkP70QAFUX1U9RSwwxOy62lEKy7fEq4qv5xdpVbFn5j7qCgvIbPPJ
 rU7vnFXzSMFTZ3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5258f260b527..b3d0bfcca1ef 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1526,7 +1526,7 @@ config GPIO_TIMBERDALE
 
 config GPIO_TN48M_CPLD
 	tristate "Delta Networks TN48M switch CPLD GPIO driver"
-	depends on MFD_TN48M_CPLD
+	depends on MFD_TN48M_CPLD || COMPILE_TEST
 	select GPIO_REGMAP
 	help
 	  This enables support for the GPIOs found on the Delta

-- 
2.45.2


