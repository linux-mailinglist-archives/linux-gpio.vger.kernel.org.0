Return-Path: <linux-gpio+bounces-21868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC626AE0346
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 13:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 311F87A1D05
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 11:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7847227B87;
	Thu, 19 Jun 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqHabYfS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6845225407
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331905; cv=none; b=Ag46xS3xV9q9JUzBUWvx6GzHoN1Br0odpCeBLmgqsOaRk8M28D+zweDj+If/lQPToAlWuWV0kOo8Gn1Djreb7b9MOoD7kynIMWBSMMf/tXEqox4E/HCax+nqMSVEZy0GfDaV98drbj7HFlUYL6SMqL+7nDzEwGzl6Vr8WWd8PJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331905; c=relaxed/simple;
	bh=p1fLHj7WBxZzvDsPJQ4utwW8hjFuRfSNWUs+7XlQwHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hBC+NNfxJkJgxDvUsulbOMQ9cJZIScClvWZY5YyXDK7BHn1k1omjThycfSe0A4qvpFzlF0al+diJ84fmQu2RaMW17kBhEm4RI1r+eGhZZqvH+ImNWKORl2FxHg8uF0S+kahMOg+OnDlahkBgCbNl1+OI4AWcf5Bxa6/o5ZSrkUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqHabYfS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a582e09144so486708f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750331902; x=1750936702; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0j2cSu3NdVpMVKYyw9NJm/4tDS+f0TiyVQZ6Bh9mEhs=;
        b=lqHabYfSjuuiUwksdvNSg8Lp83ft1QgAmMNA315U1YtusY53vWWYmIKD9Np30StoZE
         67CO/hHJNMNKTG34Hu/3IIPnFlTlgHzmJLYHdyG6eLHzxKReTah8ha5y9aX5r01MykVS
         6c+phwHnXriuvm6wBtA7lRZOLvZZCd5VIz1fdWnVqlqwHAGsV1QNe/gl9jorx9zvB93a
         HpXOF5SdeEOBF3Rn7aVYaA7zBgS+As6qS+TZ2sV/ArfewxpOoEEbk98UXoILTT4sHe+E
         GPm4k0Pl/0N2jv77adW1YeKt4GXfneWo1JU/8tIYHzVKSJ6v3cRJRCjeXMt6capg3wim
         zGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331902; x=1750936702;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0j2cSu3NdVpMVKYyw9NJm/4tDS+f0TiyVQZ6Bh9mEhs=;
        b=LQ3s18pECLGkyayAcNlkuRyaBKU+RcDuzXwBM4stgQSdWEoGuQ1Ep0vmlckbcjpPfV
         dsAkpsTZhPYa9m4JhcmISimaSSFUTY7qrdkmnNvtNAbaW/9xD9/Lb+ujOX3XRwALf33W
         3lw0zkx16U9xSH+6LA7wMzUfpkGABRB29cSwFi5TXZhCVdgTY8mXN4E+d8swzY1+/Zlv
         lvkY0Hdst4foOTEj6ROCv/fc6RztPxaINRojIOG9RQ3ydXLE9lw3MawaFZmR4dGYsAxN
         JPmq8MzbxXlP3TbeGyg86H0tQ/Z1voLYnmfHoteh9u7vPah0KDmVJQsHWdCcWsJTwpVN
         n9DA==
X-Forwarded-Encrypted: i=1; AJvYcCUTEwA1suGSxm/rp+8FwsRJRtkrkuZD+OICoNY8t01kkoPPM336K74RnuL+buXg4Uo0h8MxlDFv8wG0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3LXQb7gFWVPVs5xsc+5h4oUxVp9ZH2urvQOuJUch7ZFO2Lw7
	o4En1SuPIJTMuWboVn5gOWDMjXuFmiUsAu9W3jRLOytVQ4FO5LcA87AIK/3XOv/8QLA=
X-Gm-Gg: ASbGncumsgPr1ul0KZq1ehF567Gc1KxkO/kEwHgKSxv2kq8BvPQvaqR45igtS53IEzo
	Tq/J2m5M6P685Dld5fNBTFqTb7maT0oNcQMt+3mNsQ+VqtKgkO9zwOWlpqlRyHEMph3Zsi1Y5GD
	nr0d3o9ZthvuKuGMpezWKZth4R5Q2OLv4bTG55beXmkYBSTycL210fFmF+OHkZKrJUlsxR8qEiy
	i6ip+FTBeih8utNY6FUWgn60zDov9QYJXXyOm2clbzZP0uEpZCyPhgwcsjT4MQyF8P/vgERC2on
	IOkUEfXVnzQAMUCmoMEAR2vRdcOKZE06fGjPDXRCtOsWAyHJALeDO6a9mIFs11YQ4giYRYgpxvZ
	Z60ZW0oFChaj1dlhxwx3L+FBqdwk=
X-Google-Smtp-Source: AGHT+IGwpV5p0m50gZC15PUFj3RIHD8e2fc5imI9ZePiRScXMe39Wj/psDyd7PdgqpyizfOuUnY4mA==
X-Received: by 2002:a05:6000:2483:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3a5723a50dcmr17516019f8f.35.1750331902026;
        Thu, 19 Jun 2025 04:18:22 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8c41sm25674375e9.26.2025.06.19.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:18:21 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK
 registers
Date: Thu, 19 Jun 2025 12:18:14 +0100
Message-Id: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbxU2gC/x3MMQqAMAxA0atIZgNN0YJeRRxqjRrEKo2IIN7d4
 viG/x9QTsIKbfFA4ktU9phBZQFh8XFmlDEbrLG1cdTgrGQIWeKJm9cVfRWInB25GRzk6kg8yf0
 fu/59P7knebRhAAAA
X-Change-ID: 20250619-gs101-eint-mask-a4c1162de9b6
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=p1fLHj7WBxZzvDsPJQ4utwW8hjFuRfSNWUs+7XlQwHw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoU/H73aaGrTalZO8s2XRrswNZuD5hjSmpTXNun
 XZqkZQxQ8KJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaFPx+wAKCRDO6LjWAjRy
 utDjD/9jioNxxKYtV9tUtqZXI3eK7B1WKAXFLrnUVJ8PlzLQVmGj6f9fzskWxdst8bePe1CEr/K
 +++kbEKCHhbeMXGyqspUYFtktkvBzr8sT9WWr+qByXu9eKXwsqlU33UPTt6nGz57Z1BO2t0hWlH
 yc0ZeDxnK12Zr1q7FAUUywe5XkxUFVevz/xpCVlELbQA0TGfKcpJiOU89f9vf4InxbNc6HZmdoR
 WP2lwAJCGDCcqVKGDLT0pI9AN0dP3oyyzSQq0JKFV0WRZettpIeXpJeW1cyh/79xJ49k47X1Pmh
 RZbwSUTowpa7L5fN5rvBztE0zJK8WZYTfVWN5SgDFhHGchmEWNXNpcQ20dSyhTSgG4RIzjwGPM7
 X7M7SScOZc7FxqTRLxCGi0DrQp/mcCfLW8tFSVNypVBfuzDgqO1Pu7f8qyLzCl882BUUj4lLCTI
 ADSDwZ4H5ejUFmiauusorMeTPZDU78OWroTv8PzkahQTZ5YfmMJUjgkYPEj32UM5vlkFSy3tI/2
 J4FXNH3bvDyORynih7Ayx4e2Om3exiitQYMg5iFMhRIpYHktqJEUeFebRxvCE57jSQSJUrQgBeo
 TGYh8kbwD3jSIxCLTm9cBsyEbOJYK41aD4JLQXv0lSkb2+A4GJ/Q6Qacztm2XkJe0E/P72X3mdF
 eUMFnkEhlIs6amQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

The following series adds support for programming the gs101
EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 to
gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it has
3 EINT_WAKEUP_MASK registers

EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]

This is achieved by adding gs101 specific callbacks and a dedicated
gs101_wkup_irq_chip struct which is triggered from the existing
google,gs101-wakeup-eint compatible.

This code path can be tested  using:
echo mem > /sys/power/state

With the functional CPU hotplug, this brings us another step closer to
having functional suspend to RAM upstream.

kind regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      pinctrl: samsung: add support for gs101 wakeup mask programming

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 100 +++++++++++++++++++++----
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   4 +
 include/linux/soc/samsung/exynos-regs-pmu.h    |   1 +
 4 files changed, 95 insertions(+), 16 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250619-gs101-eint-mask-a4c1162de9b6

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


