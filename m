Return-Path: <linux-gpio+bounces-23016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A79AFEC58
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0309C586094
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5AF2E7F28;
	Wed,  9 Jul 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y3Jg6bF7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507722E972B
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071962; cv=none; b=EDFMGLzAm1sxsRDt9T+YviL89N+Es5+4bosFq1LKyX/MhuBZP4WdSNSMLayGr4AOJ1xIvLdL2cVrme3arFnAVhbuLuVQRCvOr1t7W7SU5hdp0r1CZqmFTQG2beP65btWe0lp3FKBMoI/Uhz2JsgYocAFtnvXLYofRM4iRMKc46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071962; c=relaxed/simple;
	bh=h9Y9QsarkpXYFnUZLolMrTl7+euN/vM4YyfIdXkl13s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9fG1IPvbQMeAFsgX9bOd1ZEjWIn+SBy4nkjE5DiVEBc/T4qctkuwMXExicei8uPjD84zOzxeVJXZK71XNGYjDV2ajVDcAxTWOeg53XSfjiRk4pl2+816L22TLaAwzYEmcIMaTIvXZYaT3V7P9KB2pdEKOMcyvlbqPhuPGZuBio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y3Jg6bF7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453398e90e9so41222575e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071958; x=1752676758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=;
        b=Y3Jg6bF7d7y9+byyvlbQjlO71shSz7ZezydV9BSbvJBt4i4CnIdb7ewhHx/erQKCO+
         akb3CFTkWfU15VMUUT5T/IvpkZMOUTBO5VnhQlKz+vIfAfYTxwKlYZQ//4I7EwTwfVJb
         aRcOGHutXleQaaJK0nKVn4Ps/yKfRtayb5O+tG32VCBaPeXnvDJ7SuyCXUIJL+kA0sD7
         2NHhq1brPS/ABsttY525wI77y8jQ5vpnKBjdMZc9JLdH4quYar4fLP3LmYAPvfgMcCZq
         yHlhQMN3jVEAjzkPH0LoQtNj21THyNtWrwS+z/yTb+dcI+x2GaWLP2s+OP1jpB/gyB+0
         6yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071958; x=1752676758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=;
        b=dUwa9DpP0nckMs9Reop1en9MPYlX1T5jZIYI9KvcQmNQMQtrPSF1iTYzvztP9JRRUY
         JW2GPjiovhQCBzAjGKyMiJXosmft48fhf8R/4nYQxkRYqUVVYNK6HgEWb7N9fJLLpMcI
         Il+JyO6hoflv31Y1JjUj3ZpGbbRFsVooaRnMhEKBbVrwZBuaSbcPqhZk1jSv//SY5bCU
         meHqpdm62tWkvEQfWJmTkn2in+dEoLNC9uKkThUhQB1bBqfmA4k63ogpsWrXwK+x+v/A
         VTQQ4e7K2IGWQc3BRuQWIDoU+GThmXfdv4QwqmBZ0OOAXCsKP1zAhWy9u/fMVPsbx+MG
         7TBQ==
X-Gm-Message-State: AOJu0YwIDJDYweGnm35K/v/ArbZAbHr3yjAwbX0YRvCrP+JagdREcytr
	CTo98aHUsgjgJk8wFwL21DfL1xF5wtXFFqVuRnsAwXHEx+9ECzlV/Q/yBopX5VLQ4qQb8sALM9a
	vg5AyJw8=
X-Gm-Gg: ASbGncubu/O0b+QPWRItQ0x5nFo3jhB0aoopNLm8KJf7AlWcXGaue+g7v2Kvnsj2a3C
	XqOAwipJO+qQFqL1SKFwD2EeG+nU625Y6TBRmnkQFKY+Xe4p6jOwGFT99lAXPNIEYtdHnU+iCK1
	ta7VeVIvSYpA6Q4tvUadFfbYEEtzNgdj7/7BA1z71hHH7ejmsMFr/lyYtdZJaJg+OGga76eUziN
	t8NXaTZHB1emJTm6Yt/tqi+VPI3SQ6M4ZbTvk33v3vxpIlMUQGawS+5hOGlE1VJh+7iY84V5XGR
	TysxHA94tH0vAcAhiXy7QWcTpuRPSpBncLEdniKqqb6NJdrCNeNSDP0=
X-Google-Smtp-Source: AGHT+IHJL3AtHw/EonyubylYUgvsAX3aEA1kWb+hfmhi4rwD64AqP18DXBVWa7fZWLEMijUB//O7/Q==
X-Received: by 2002:a05:600d:19:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-454d5c8ae6emr21757475e9.7.1752071958441;
        Wed, 09 Jul 2025 07:39:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:08 +0200
Subject: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iQ18p+opwS51aj7kQgPPUv5KuYwgsHKMpCHQbdUzIuo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Hh53vwVwSAhW66U/ZVT3BJ1K+Xx5actm8W
 SIfx8mfLfuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 coG7EACGCen1sbTZOcLtihqfgfleRvxd76y5gasx5ejhY5jN73Ryz+vjJHtDwd0l8c5SrMksrB6
 t7OuK5xDmCoMqMKP5oOyeqLRRCAkG+Bmb5B2OQB1nzWC9+7adNNl5rNXdk1UlZJum3AJqNI2xaU
 HzQ2ZDMceCyhG/Rb6B4qmWtfdLKiwGQTSjKvy2FoyiKyP1Kkg9mta/0tJcbaoCJ4KIGpY35E1Bz
 vNq+LbVz1VduLsXlH77XQUw5YQApX2JOKQ6E31YI4F6oiDHonqOoshmaQi+J0BEZYUgZEJIgRGe
 U0vwdMdBK4dlY3yHw6HrK2Tnqh8kawBRgh7OeZYoldO7ICasE0MkR1/VRArAynV34jM/THvbj3H
 +plh1jmtOLBgb3t3xLuhkdAjsXU7lLuznLsCsL+cweuriClQTCPwJtO/CuPSxCxQ0O/D4BSRZu5
 cVnckT4XlctODT6EkMNWLvzHgb/PAfHS0ZpGItYuV+nSdQ0nI653/gECD1stS1bkCeVnT/tJ0nJ
 WcFn6s33bTLewA0UiRkRJa3fwOCoP8hZripGucl8phvCVzKI8bI+ueBfR9B0nZzOJjwDDtVTdjj
 Xun95s+UXln6QtpXMasLGtGzUdktTreMUdgPihMF9TwaoN0biXPnFeXfQt2JXn4vWrGO9/mcIM6
 vn/2GgtvVmDuNAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7010be8d1ace062fcf7743e539d2065d4aed856b..ad572c923e2ab8caed134207ec02c4107d4dc2bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


