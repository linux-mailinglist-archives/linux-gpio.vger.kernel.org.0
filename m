Return-Path: <linux-gpio+bounces-540-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2437FAFDA
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 03:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2221C20B1B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 02:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2754A31;
	Tue, 28 Nov 2023 02:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap1YtmNq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB591A5;
	Mon, 27 Nov 2023 18:03:04 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-778ac9c898dso228324285a.0;
        Mon, 27 Nov 2023 18:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701136983; x=1701741783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nydx7/1u9y7SOcr8uGxNgKtY8IJYNLdrwjHk8OM0u2E=;
        b=ap1YtmNq4fu7t+BZPCiQFsoFjSmfcyOMHN0IG4illoMfmjntNujodz/28Q+8FKp/P8
         fK6X+27CpiFiJ9lgbLFK2IsA4k8wAv6sPoaMF2inoJ99krtrO+qKxBCO++vQzFs6VgSi
         j7cAB+vqMBh80xmJHeo0p92dJhkX108lmCndklbgaoMtegxI072ewLlnErAsUYJSMKTZ
         JDqypjWBi5o/5iiVoy70s3JK24yseF2a5ndBEj8nsMrgQ9AuxjTxThvcTdctzGuEfBaK
         GgmLE+941TWqNNi459Nyi8vwlqke4y8otQWXmHavK6jePbm4q6NFalrgZnH6orMePWH4
         zU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701136983; x=1701741783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nydx7/1u9y7SOcr8uGxNgKtY8IJYNLdrwjHk8OM0u2E=;
        b=q9mxJurGsrThEvo6dyKUnQR0Jm/FMydaJKHPkFMSLqUkLv7XQwJDCD3zDZ2Hkq0WR0
         JQTB59bA4hhqAfl0Kh03l/mtfBr3FNw97cVOp7HDKducZ7y1J1day1K2GaA0fG//IrC0
         84uRLhyismgQJveMNQFd+JZcSgaEeU+19TTlPZIuMwwxK5c/hJPNZ4NxTrO/wABQ83om
         enbr6SWnc8JZ2p+XeANdo2QWU2qQRRHZXqliSC9qAdzpnbTPKg80VlOpN6UlJyhpo47Y
         KV+U+sgyUDqk7mEO4QHM1QlDmGTtNPv3ar5Vfx55LbuRppFs1StksUSuucKkxicpfE0I
         5Ftw==
X-Gm-Message-State: AOJu0Yzlfb8wKokE3ZQ/Az4mYHO19f8b04Qm3SIKC3akPYpt3R9M6SPu
	Vh/eCGBfhbTCCr4w6TWth18=
X-Google-Smtp-Source: AGHT+IGNRRy7NLesOZPy2/LBns2jVN5tw+C3Rz05L4f/QeE/oLMazsKIsT7sqjl18j5ZuQ0RcmCaGg==
X-Received: by 2002:ad4:5042:0:b0:66d:1219:f2ab with SMTP id m2-20020ad45042000000b0066d1219f2abmr13100508qvq.8.1701136983507;
        Mon, 27 Nov 2023 18:03:03 -0800 (PST)
Received: from localhost ([2607:fea8:529e:7800::a768])
        by smtp.gmail.com with ESMTPSA id jm8-20020ad45ec8000000b0067a2c103711sm2739749qvb.25.2023.11.27.18.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 18:03:02 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] pinctrl: qcom: fail to retrieve configuration from invalid pin groups
Date: Mon, 27 Nov 2023 21:02:04 -0500
Message-ID: <20231128020202.728156-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinconf-groups debugfs file dumps each valid configuration item of
all pin groups. Some platforms and devices may have pin groups which
cannot be accessed, according to commit 691bf5d5a7bf ("pinctrl: qcom:
Don't allow protected pins to be requested"). Fail for each
configuration item of an invalid pin group by checking the GPIO chip's
valid mask.

The validity of the pin group cannot be checked in the generic pinconf
dump (function "pinconf_generic_dump_one"), as it does not directly
interact with the gpiochip or the pinmux callbacks (which would give it
access to the request callback). Instead, an entry contains the ID and
name of the pingroup with no properties when all items fail.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
First few lines of pinconf-generic on SDM670 with this patch:

    Pin config settings per pin group
    Format: group (name): configs
    0 (gpio0):
    1 (gpio1):
    2 (gpio2):
    3 (gpio3):
    4 (gpio4): input bias disabled, output drive strength (16 mA), output enabled, pin output (0 level)
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 395040346d0f..0392b99d8be3 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -358,6 +358,10 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 	int ret;
 	u32 val;
 
+	/* Pin information can only be requested from valid pin groups */
+	if (!gpiochip_line_is_valid(&pctrl->chip, group))
+		return -EINVAL;
+
 	g = &pctrl->soc->groups[group];
 
 	ret = msm_config_reg(pctrl, g, param, &mask, &bit);
-- 
2.43.0


