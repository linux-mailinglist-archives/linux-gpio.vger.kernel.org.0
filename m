Return-Path: <linux-gpio+bounces-28018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3DBC311A8
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 14:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F749189F8B8
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 13:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF6D151991;
	Tue,  4 Nov 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+3dG8E2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307B11CA0
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762261275; cv=none; b=eg871AYjYKB3ccrrQIZce5or9YCvAmt9CQQhl5hGfiXeH6BSD+AkLkAYURIK49Z9aGzKeeIwIgDQuZjl9Jh6hsDYdeOzU5C1FiS3ETrXQ7MytXuGnMz2RG7hjyfis/UnETxPGPHkl99evUm/z9u1cHIf2zXX1kKOFCeqB6gi7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762261275; c=relaxed/simple;
	bh=DisSCnGvNmZ0DAUtiqi1+F9k+ATS6m0uqPYkT/l9tQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kyI7KqxaeUCHowkSYWrkwD+ShrRVmwdImZQwMPIEVkcmmL1bD7PZ2kIwl97EfkzEeG1yxE13BJs8rxHoNlbiH2pfVMxuZqm8PKokhIz3aRAOGldasTlDlwGxTO74z99tSjXW2sA6v5fGuULtsaFWY0Fs42rSAf9iFMWLjEVpWW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+3dG8E2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-594330147efso1488539e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Nov 2025 05:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762261271; x=1762866071; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTM/niPCKpdoYFFHO/ZhiF4TIGtu4nLsIhfH8cqBhL8=;
        b=b+3dG8E2F2XM0P0wXPzXbvMJp+Ou7TliteTzc56Le8/W4QYfylkz5ULE2vxcGffIe2
         Eyo8566b9Wa/Wa8UWJ/kfaJhbrF+cc0eo3fqbcwfVheBUrGGIMd4i60zoj5va2AKGb4Z
         5H94BXy2xLcuHfHx++WPvv4dhutmq3/x/bP79lvFcIfUV0HlNwSPYsTU6vfVShMnTnDZ
         E7fCwG6xXLPfrGvPyZ3fXBeRFYUOKEYDKE/fhMYifSJFbmjbMmQfxnGlMYa1/qjbcC9I
         L+kI5w9hHohJypQcxWngSX8Gm8QCEUAsUxq5Xt0gn+eV9OGsEI5BhejEx6+9AfMuZYMP
         85cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261271; x=1762866071;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTM/niPCKpdoYFFHO/ZhiF4TIGtu4nLsIhfH8cqBhL8=;
        b=pmD2WgNxzeyyvF3rmAstyW1u1sW30qVxXWwWKFc/HHaMQ8m3W3dHUKj+et/g3JV3zF
         WbgXnoAKJ16jtxeMhKkv8XUzO2LBQFNTeR/WKVjjndduzMPEhxMr1JWAylUptngPktAa
         os0wHdABDFgG480wVfvVNL+k3ubD3GT9ef6FW7RIa6H1s/jg0ka+MiXlEt2fBqnPV5OK
         M4stYR7ALrWUqkXMGHanxbnbHsipXui/c17P5JP0EEZsey2cMiQKrpmp+mmX8YypmZWw
         8Drir1fDdCBJNIFjHARluN/S/3MEhbKt0V9P/dtIqhL2R2i2tmQeNN8jYWP8DRCuNobq
         G7zQ==
X-Gm-Message-State: AOJu0YwH16E158SqNI79c9OevoS0v9OPsceGzz15GJUYBB2KoUnX6DLQ
	DWEY6dFSAQh8WvDGM8+Sb+ifd6bNWE5OWi/W+6mI+uTZLah2o2hsv/6p9wmObrcuAaPbCfrYJHa
	nUSHUiIk5Uw==
X-Gm-Gg: ASbGnct2XY6nq3fKBX9KmgDaLatzDgKsCGVzxFJ3nBHTKvn6AKTNB1Nh/UheM5WetTp
	PFhFQCzhlIBbyD3c9zoGe7Cqx6uMZbgYXpG1JckWUQdTac095tflNspr2ceBbUo2h3gJnkUnefv
	l9wzWz4Zy0ya+Ou5MX7WgztxBLuoVfA94QJyB0ggD+XjaKO/7JVLgrzUy13ZNfl3vNUhYWqHgvc
	Wda7gAQRu0jY9stvIzJAaPfoJ+kemCjHGbkr6CDh1TfKRsJYyzg0GWPwZVoq+v9Fn9GdH2G8xDW
	wDP9kEeMfEj5qDmJspOVyX0d2kcGtxquFwH/rVz4KG0qztLmW0U+P8fRSMS0VBVNVVxS6VzR8CA
	r/lJmEge+rpeCG4fE9OZ73du0LK3PMLzb5SAgQOEKjSZ0w2rvzh9aPvCvVGy69p+mZwzakKMCJl
	k8RVsznxwf+y4=
X-Google-Smtp-Source: AGHT+IFR2BgsT7Ctn89CqtGdExegDQDk8J8tRCHc5LDO8TEm4g9j6sIhxf0wRKUhs2+/qAhoozCz4Q==
X-Received: by 2002:ac2:4f03:0:b0:594:1cac:a025 with SMTP id 2adb3069b0e04-5941d5586c3mr4434671e87.54.1762261270809;
        Tue, 04 Nov 2025 05:01:10 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594344dbd3bsm731510e87.85.2025.11.04.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:01:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Nov 2025 14:01:03 +0100
Subject: [PATCH] pinctrl: cix: sky1: Provide pin control dummy states
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-cix-dummies-v1-1-331fc0c71115@linaro.org>
X-B4-Tracking: v=1; b=H4sIAA75CWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwMT3eTMCt2U0txcoCbdNNM0EwODVOPkVEsTJaCOgqLUtMwKsGnRsbW
 1AEwiCJ5dAAAA
X-Change-ID: 20251104-cix-dummies-f5f400e3ce94
To: Gary Yang <gary.yang@cixtech.com>, Peter Chen <peter.chen@cixtech.com>, 
 Fugang Duan <fugang.duan@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This exports and calls the pinctrl_provide_dummies() function from
the CIX SKY1 driver.

The reasons are explained in a comment in the commit, in essence the
two pin controllers need to go through explicit state transitions
default->sleep->default despite they only handle one single state
each.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/cix/pinctrl-sky1-base.c | 15 +++++++++++++++
 drivers/pinctrl/core.c                  |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/pinctrl/cix/pinctrl-sky1-base.c b/drivers/pinctrl/cix/pinctrl-sky1-base.c
index b03e10147b09fc4b69593d5cd9851b74ba1aaac1..a5b583f10441e42cea34c275bc61fb36b949c0e4 100644
--- a/drivers/pinctrl/cix/pinctrl-sky1-base.c
+++ b/drivers/pinctrl/cix/pinctrl-sky1-base.c
@@ -560,6 +560,21 @@ int sky1_base_pinctrl_probe(struct platform_device *pdev,
 		return ret;
 	}
 
+	/*
+	 * The SKY1 SoC has two pin controllers: one for normal working state
+	 * and one for sleep state. Since one controller only has working
+	 * states and the other only sleep states, it will seem to the
+	 * controller is always in the first configured state, so no
+	 * transitions between default->sleep->default are detected and no
+	 * new pin states are applied when we go in and out of sleep state.
+	 *
+	 * To counter this, provide dummies, so that the sleep-only pin
+	 * controller still get some default states, and the working state pin
+	 * controller get some sleep states, so that state transitions occur
+	 * and we re-configure pins for default and sleep states.
+	 */
+	pinctrl_provide_dummies();
+
 	dev_dbg(&pdev->dev, "initialized SKY1 pinctrl driver\n");
 
 	return pinctrl_enable(spctl->pctl);
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 157510157d47aad96b459abf68cc0e4eed957f2d..83254a95ef1741eaf4784ba4e5a95176af497845 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -70,6 +70,7 @@ void pinctrl_provide_dummies(void)
 {
 	pinctrl_dummy_state = true;
 }
+EXPORT_SYMBOL_GPL(pinctrl_provide_dummies);
 
 const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev)
 {

---
base-commit: 99224c151c19b74e1930d236dd348b6b22a607a5
change-id: 20251104-cix-dummies-f5f400e3ce94

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


