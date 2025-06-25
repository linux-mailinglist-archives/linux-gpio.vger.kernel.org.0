Return-Path: <linux-gpio+bounces-22205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634AAE8865
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 17:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230E91BC6E3D
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8275286D75;
	Wed, 25 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qVHkq5Ux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220182641E7
	for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 15:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865837; cv=none; b=rNu3nQKqkMPcVe/U+8wkpuMCq2C76z7EShye0Pp5XmYmm+u6w6AMQ18tI1q6CgVM/1zJRi+RV3nqjWXA6nKskAVzkdKIsqjQYGksYpoAuc6/cBNGiuNMh/6jmDPakxc/lUXvJI/pW8g7NY+h4G6zpBeNp1Q3yLgS87Lr8dm3zp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865837; c=relaxed/simple;
	bh=yjqVnElvLhbz4DdRAKnBfuhl/bLIZJAgyllx9k9B5Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pb7ji702+1q9lvPOnKMBh1UB10GwNPpywnMd+Yq64KvOfecIwzRLM5GyPXZ4cm0NVb0tuBFvDbl8cVqTbj62j7wIPY5sGG5yZwKJyyeXPeKtnFAD+hSPeZ22+QA/3gyF1ylSYLaOktbimrR5mhCuZh/NJ8A1IqB8+3Ox5XnbGdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qVHkq5Ux; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453749aef9eso8215825e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jun 2025 08:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750865834; x=1751470634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMA8eNGz9CmY37K3I8dXArzy1BZrOLOrsNjDvA/YF6U=;
        b=qVHkq5UxLPh9tLIKe/24+eU2pmTaWyfSY/MPJ/wiDj0ZzTZu2AnUzRG1ppFrAt6hq6
         btwr2GCqhMa+Ve2kVQCTb5Or+45mGKr2JAfHKqpqlXhNElMvkyUlPk2NSgJjzU5PwH0Y
         8FwgfunRqU/dqlGixBHNMOR9qBsf1ZQ0pNs9a27CQoGwjkL9VKA0hV4O4e6dt8Tqo1jn
         aDsj9HWF/9gxCxSMFcgxQNWpTxc8UCnAHE2tWeSIRB4izLJUEO2yq7Z3DClKgjLL89Im
         GQu9DotgsN+L+aERDqkTb3ITe10F/3ixkh0QEw7Y1DwQqJIo7bihhKCJt2KuyW57JRoq
         9rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865834; x=1751470634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMA8eNGz9CmY37K3I8dXArzy1BZrOLOrsNjDvA/YF6U=;
        b=dR4kBgfZOE52lzP6YW+5UjeZpsw6TofzwOoGyKlUwkxT5rWqzT1ePyk472dljZCXbp
         XjAhh+MPCyz02U1F8qNzI6pX7gYPi6FFZc3W8gM0E24m5RR/bAkjk+5MrmgGbeKgOuU4
         4X1Y/K6LtWUaovUG4XJwr8Oy3hnO2az2edruAgQ0GFMkJEVl3Or4y6bC9iTy92GOiaxt
         5mMzv9RJloeoRTW8imDz5Uq4NH979kiQyoYpwBzO+zt2pTvqKBRmCNT9FY4glD7+Hi20
         1KKMxHdt1L9GCFiXc9kYmWRP4wSgvHHCb/qjvV2JSFnLLu8xWtTphyph6FLADssAtRao
         9HwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaEe1s59ul6bLVB9tmeXhzbCALF5cUItRbthTeeKD1Q+bIbjnoqs0xrAD4LCxa8JV9awuGlGDmfeS1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+brUeL/OG67U0S3w7q3lHAm7C3rMsZ7wPJ24uo7aIACJZRzX
	Xrzwf3dVYlxXa9P0z5J7KdiJowehRi29wluxqdiqh1mI32VD77p0BFDDRnvQl+jJ18U=
X-Gm-Gg: ASbGncsh2iFlXgAX4/d0gXAC1DFtqWhznfXXNakkFlWS1NqvsO/rrE0UavAVl6cw0JM
	5X+SPSWdVGis8Jgh1Qxblx6AHYPl3FAC8fahU0eFAZj/l9nZzGjAvC7/OkINtrQiW/Ml2UIMvLA
	ex55I8MejC2IxCyMXm/HMS1DkAFxXjC3zTUOc6UhR73zIRL5LwMSuLaj3kSSY9SY1glb9Ysn5cU
	hxUB7fdRU/TTZKRsPcXphS4khd9v8OEHmkc+DF+JrZDE5OugRlgvvhDi9t7tdxL9tbU4Pf+052b
	NeLNsIC68Y9j6zTzJmSJLoWc6e+n5i8djSYfJlK7O8Y35uFkHWD1dgiXlkd9aX0=
X-Google-Smtp-Source: AGHT+IEyAQy2Weocb3F2gHn0O7zMxxg3OozuxdDTX/kVYZzfMZiMFU7kb1Dl+HGzXGygVB96lY2BQQ==
X-Received: by 2002:a05:600c:1f91:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-45381b06235mr35839895e9.29.1750865834126;
        Wed, 25 Jun 2025 08:37:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45383576716sm18793245e9.12.2025.06.25.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:37:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
Date: Wed, 25 Jun 2025 17:37:11 +0200
Message-ID: <20250625153711.194208-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Having discussed this with Bjorn and Konrad - it seems the consensus is
that it makes sense to set this flag in pinctrl-msm. I'm marking this
patch as an RFC/RFT as I'm a bit afraid existing use-cases could break
with it but I suggest we give it a shot and see what happens.

 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3ed..b78492dc05adc 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -293,6 +293,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_function_groups	= msm_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,
-- 
2.48.1


