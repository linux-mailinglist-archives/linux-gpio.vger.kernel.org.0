Return-Path: <linux-gpio+bounces-23521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB4B0B3BE
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 08:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7731896436
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 06:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48DD38B;
	Sun, 20 Jul 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T6JbfCOi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AC8F5E
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 06:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752992196; cv=none; b=Ql0MwOSQM0U84tvm50BpQSzZhaxADV1GlB1h+tJBSyKQ6nSybQIMUIRq3/DEvJosOC5Qy5MGkXbl7wUpAcOnmDW2B/F+MkvXXoPHJDiqvV9wSKBKnlgoLT9uUowOocfXYYN3AbAollKghnQ1AVofM+LEv+pzOBte1xkDyxmUMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752992196; c=relaxed/simple;
	bh=KdIAPuZzGGYbcZAmbY6tlDJq/gImwHlZf831FZiKkdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IOgPP6pjZ/3/HhuQqdMzXwZ5LWSYV9NMs4Jrc9CExPvNRyAhGNCeAv5Zc+AdM+uFE/JzPFuZuu8Vvz1MMxqdW+x1+gbASS8zK7aiF7AdqCO8jl6yzirRRf3rEo6x82FKRKXj8aKvU8Vwd4BkKVRHreY02o5oFLcuJEL4vZ7pe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T6JbfCOi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d6ade159so24343215e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752992193; x=1753596993; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cz/FFqJKs6Jcg9Tx20b+Y9pgeliGL0QshJRwupzcJdk=;
        b=T6JbfCOicj3KlAZWxN0aqBBtlEZuY2+4Hk4WMKzH0MuWAdRq9sApcRx1MbvK/qzHmr
         fvzrjb4ykPceMVL/JBLv3mngSqlgSXT/lNujsreDVcIKCtjh9w8iP0DKCQ3s/bVMMW/R
         rYWORWaKFlobWJ9sZbB8Fb2zo6dAN2hGERFTQd9n/kq1Pf/hS+UlFdPOL3x09fQarnkq
         Flaj9gtBT3knrLV72FJizI8jrveU7MwaBNPKdzKSufCyjaSDyGtODZIzvT9TLR2cQcSJ
         Dk+H8ssknYOeU3bNXGMSjrZoxag884quuvkw6xQnLWJcHls98mVaSh5z+Ost0UofWaNM
         ao5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752992193; x=1753596993;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz/FFqJKs6Jcg9Tx20b+Y9pgeliGL0QshJRwupzcJdk=;
        b=GhKq3gXLZIfffsOca+h7eo5ROWUytCsiHj/TqUsEdJ3b3Sqrceosz7bXyEgfP+rwNk
         Lib6W3dWUg5l5p2iOnnA598sLp3QPr+bpN+thaUJxMaL2H7+h8sYugS52EP92EIndAJW
         bdJfrnbQ3HhD28XPzzJ9N/lS17N97UhwmWfzV/2jBKGOKkQRbSZZqI7x5aY4SY7s58Oy
         0osj6muBubH6Pf3Gzk61ouq/rt5yNpfZ9+n5UejXNy1wR+WaMKLF1BO1N+RFEQ1Raldl
         iSxm4kBSrDZZ62i5klJzjVha2McfGkJIk1oryd+Fi9gCny7FoeWvbZEnBIIlJft6/7i8
         so9Q==
X-Gm-Message-State: AOJu0Yw1bVkXAlx3/VpwpKVROLEc2Pf7Xzp4hsrHBClKzfBTVRijFYtn
	7LmmZrhlJuQGnOEVCODRDIzVcqvCILutwfielV/JWFrvSa5TXPFlwN3irwhvSr5mmL4=
X-Gm-Gg: ASbGncshaKzwSAaap1tnS0w1O55VQYS0WekEPvlo6TlouIEt7B3syZGRDkYIbGRQBb6
	Y4IPrIDBQAIUDi5E83iRrMbJhldrP5tQJvx5JlcMaZgsCI3Gz8LjtDKvfIe0CnRIJyNOwJRO8lP
	YcBl6/I628rqM6ULtiOmiRefZHDl5xqZB5i6vVYTfIibCVSCqBGcrU1TN9lq/ooCK9X22TBFxoz
	R9/ywLSlKjkJxxOcAFbU3vZcg3dTnBEj6iEwarLf7pp3u8xlrH1TGid8Isbc8HKXNM7lCLFZPaN
	fQGqc2ibK5z4cl4YSbOAQ7GlX1r+7rUAhnE4T8/akXu9IFJTQniL+ERk4bH1OjC4y6QB0TgYDA8
	yiXvNsM4EX3FBYg==
X-Google-Smtp-Source: AGHT+IF0sBGbf/XLhruJZR5uSM18xYcC9qbdOlC+kcXYlbRyWOedxFRKLH8LaDk+mLBleIFUh7VVFw==
X-Received: by 2002:a05:600c:64cc:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4562e3548acmr164386945e9.11.1752992192461;
        Sat, 19 Jul 2025 23:16:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9d6d:8f:5677:d93e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c5e3sm6751585f8f.78.2025.07.19.23.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 23:16:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 20 Jul 2025 08:16:21 +0200
Subject: [PATCH libgpiod] bindings: rust: make Settings:new_with_settings()
 crate-private
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>
X-B4-Tracking: v=1; b=H4sIALSJfGgC/x3MQQqDMBBG4avIrB2IqaL1KtJFqpP4Q4mSCbUg3
 r3B5bd47ySVBFEaq5OSfKHYYkFTVzSvLgZhLMVkje1Mbw1HOfhAXlklZ8SgPCeXhWXwtn+0zj/
 bgUq9J/H43eeJPniHHdtCr+v6A32FJJZzAAAA
X-Change-ID: 20250720-new-with-settings-crate-e8f2734af948
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SodKi9Fv9MgN2QMJBI9fbs7MdrVl90z0eid6ux7RGts=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBofIm6PjmekEg5lOWiFfBQfEkR+ZBK5LzQdVQV0
 sDF+L0BDviJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaHyJugAKCRARpy6gFHHX
 cpwcEAC3GBTHP6adAyIYyYr/v6y/jrZUUV0wQPYLcSyJqHGa+JjSQFvNE0z1Y+3eeAyzxw14KGp
 rWTznHl72jj2AoUs1vY4bgOG1Uzuj6Gi93QRmVYjUzGzVfHjtEP2UuI4S4B5igKNvVRxNwqvb0f
 FWV2P+iIHtNA4ttple6RS32Agnbuq75OmzVRsD1Q6ZXxNMCHr6PNghJfxBvs3YCdQlbE5kSs+EE
 umVKTg07U5INWypbtEPNHzNzPUcg9SqcZleIDw1tMMy/UzBG/Yzk3HQH5dW4G7ZZ19UAXUz/Ez8
 cB2ZlfMyqw71CMpl5nLqguNieBUZTtvafUEgQckuz+jxyMaogLoJvYEXmV2i5a+8bqxerFXtXeR
 lrPJb48/MyLo0mAsXvYnGl7MNxzz7vKjDgs+Ei/Duh5tAa61V1BUhnMtqtCeMtNh1uLzIKqg8o/
 omgLTjhnx4TnSq8z+wjCtgdA5c8Bdmw5DH0RrAtqry94jLSK3jkpmZpAPlVoFXTrnB5j4S5adwa
 aFpHwpBVGIsYfCpaxZ2zmlsAnU/P6mFLOVecOOaO0QJwb4nTE+opol5ARPuEmDlwseK1AmhC+/C
 v2GxuBr5XGowGRPZ9iaeavLjNCdvaRQNuSHumkA5Gx7L2Wcgr9YnxIOopP3KaLcACvFjm4xOc5F
 HDSVEPNPXVixlIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function takes a libgpiod raw pointer as argument, is not
documented and should not be part of the public API. Make it visible
only within the libgpiod crate.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/src/line_settings.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/line_settings.rs b/bindings/rust/libgpiod/src/line_settings.rs
index 4ba20d4556e1d6a017910eb3961927437b157b3a..7f271c3b7397c81d4d2e15fc8050582306ad2b5b 100644
--- a/bindings/rust/libgpiod/src/line_settings.rs
+++ b/bindings/rust/libgpiod/src/line_settings.rs
@@ -46,7 +46,7 @@ impl Settings {
         Ok(Self { settings })
     }
 
-    pub fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
+    pub(crate) fn new_with_settings(settings: *mut gpiod::gpiod_line_settings) -> Self {
         Self { settings }
     }
 

---
base-commit: e4427590d9d63a7104dd5df564dd6b7b0c784547
change-id: 20250720-new-with-settings-crate-e8f2734af948

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


