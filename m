Return-Path: <linux-gpio+bounces-16862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66036A4AABC
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 12:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73DCF1895EAD
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 11:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BF81DE8A0;
	Sat,  1 Mar 2025 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKAZzmvE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF501DE4E3
	for <linux-gpio@vger.kernel.org>; Sat,  1 Mar 2025 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829428; cv=none; b=aWvriBCbzF6l4eQyK3ZMCmfYpLQAmDYHwSVCPoKWkiqwMt9FoM4zK7JZxa1EgxAYGqdD9VqQm9eXQMPl5co5gwYD7PfjJWSNPWIN4s0QXSmHqfa1Z0yGNIvEbY3/LdcvN90HJfu89+Hj+8HBTo8XtqjoRYZX+bbeipYxUPIsx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829428; c=relaxed/simple;
	bh=evUvX4RMBfKC8FqkgyOYIu49UpyYWqsRchzfwT3wFVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bQRzduHyIy3DOg3BQdjRqc7FS5rrrTPgQDj3sAi4itRb5ua1S8/cCVAhvFr6oSPUANlh7KOBnw8+d5/8wNCU5ZhEzp+TgwtPfUHt2MGWrgWzTTWwtYh3SuE01oOFZr1Mv3bONW95xU7maoWQaIyIeyccieEFEbltX1byGJ5t+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKAZzmvE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso19138915e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 01 Mar 2025 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740829423; x=1741434223; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZbaxd2WRcoQQt1caRaFSEAx+9Lny/NjRCBroTTZogk=;
        b=BKAZzmvEnRwuhsv9v4/KVlBMZnCpKTqe54ZB754nB34LVLjvwh9yquL6RlB1ZlWf0r
         F5Fem34fjyR8qWVS9AzF0tjVl3pv0RTfcoatq3z0ORs2iax9g2u/1Ybn9CcJJtvwfsuS
         q8gTMSyS2C0mcpmuU8I9ZlW4yWcm2RHFef96B0nVLLVnwAJ81ZtKTosArCZLlGxQhGux
         rkjlkdLAcQUP+wSTE/8PzfkoRTa4aE6tndAn+N1QNJynh5EODK05MxWZMzjSA7sbr6dr
         KPPpcnj0VvO8TAMH+m5W2WPmOmK+s4aPxqbyVzznxQ7nv7lJdHfYZlB9dBfcoXAgTKYa
         nlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829423; x=1741434223;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZbaxd2WRcoQQt1caRaFSEAx+9Lny/NjRCBroTTZogk=;
        b=WuOQW0zDjpUfXhroE/KcQigoq70B4bVQE8n81zEAFqVCq2YHZ4qD9FTc8gNrWTsC1b
         nrqPgKmF926CPnK+/Fi9RW//h+tjnekMptuigfY1mgq+a0gZAUE9iC9eOSorLeHXYnZ4
         N7SUcbYv02gscdLuJno07y06OcLJkAeOdcCcmiDlP9F0y+hWJE1cvtBmTBQlSWPuAQMx
         dp9G37eDd0gkO0CL6VXbRqCnspGBS0YT+pL58dmeSIS4eieaeknyszCXPEM8CIKggCaD
         PmpX/qMG2Exv1tjBrYsduIbGqOeITQi1Ztxx93oR1ld1inn9g/r/wH1oUDN2cpBXbmWv
         0csw==
X-Forwarded-Encrypted: i=1; AJvYcCUpueFz5DBZHIvKaK7ySSjocQrdqzwCJyej6hYplFnosTltLDtvsiwP03ylAfto4muucfIRdxHiy+Yh@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRnU+FHnU8xUIY2Alvh0on3+j3S9h/P1twvNjPxKa8/4BZ3UG
	eYKtaC/gNRKfSY4S3AmE6JZLtrpZxwHF0tUOBnI2lm38sNMFNlklk09ssY/ezhs=
X-Gm-Gg: ASbGnctpFwivYt6KZlwzvSXBK7gwqPIRcp+sZbhyyk/cvP2l33DNrEVBoId+8tHqY2M
	vpjQ9Ix1+z6FQMjfTVBL1TQtxvkFMih7uCakMM1IJefURM6+pSS5L/cy4ZGJrPIZcR5DPDVxQP7
	Vk1vjCPAcNl/1dn3Le/JM/XZnYiAhZQsUtW7CTYhg4kfXEPDVL5XUiP7WOS3eMxdrxMiZbibogw
	EBVeG60KDLhHPVcbOcBL950seIfF4C+4Bn2f+jZpqYpIj9o8ABEEtar45br5U7Qh/MlzQakL7qh
	f9urFr0FGn7RLwJoPZboJqqJFdnJnIKfbBde8SgHnRhfqCKsshdwqy7kA6OhqLkU/Cc8kBJtRN4
	=
X-Google-Smtp-Source: AGHT+IHj61UYuOocbWw/qWMpr+RAho3zm2+puTeioLvnRLnuw4Nm2xW7pb1mJ8SKDz4411HtZ7isXQ==
X-Received: by 2002:a05:6000:1a86:b0:38d:dc4d:3473 with SMTP id ffacd0b85a97d-390eca384b1mr5985832f8f.51.1740829423579;
        Sat, 01 Mar 2025 03:43:43 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796600sm8002871f8f.20.2025.03.01.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 03:43:43 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Sat, 01 Mar 2025 11:43:18 +0000
Message-Id: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfywmcC/4WNTQ6CMBBGr0Jm7Zj+QFBX3sOwqGWASUhLpkg0p
 He3cgGX7yXf+3ZIJEwJbtUOQhsnjqGAOVXgJxdGQu4Lg1GmUdooXDj4VWYc5tXHgOmVFgo9Gmu
 t07b1dV9DGS9CA7+P8KMrPHFao3yOn03/7N/kplEhte1Vqadxl6a+zxycxHOUEbqc8xc35uC0v
 QAAAA==
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=evUvX4RMBfKC8FqkgyOYIu49UpyYWqsRchzfwT3wFVE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnwvLngUxy+MXzTvUcVPQf/Vn4XqYkl8kM3dwFf
 DmYVxaFXSaJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8Ly5wAKCRDO6LjWAjRy
 ur9qEACDSxzR9tumJKwuhzgEo08hXMNwYrOiJWy/GhOTxgmk29YjAovMmjaayFfJqUgF7V6beFA
 RS8OXsLqcO17SXY0d8+7nvES0yXgElnsfTy5oWlfypPngGZBMH+Biq/7EvmLugypVzKweBk1eQL
 iRIFYE2ni3ce+dpFxDC5nTUXJ0B11DYR9t6EIP8Dct0YsYZ4NaCR9MWefbPleW80/Tk95sAaRdg
 kbOPiWLJbRUC6OMqxC4wv9KlsjaHY2QnUfMhbX3bekG2kSoZW3pr7oEB5wr1ZQfvzV4BF4rpJWy
 w/gz8M1oJe+mW43GReWWF1qlsMcmKbVFTbwSGOlnRZlrC7H6XA7MEm73BoNnV/dm4ujVKqez6KA
 tNTQbdaQz5/Arem/o4eNCTdcR7bAixbuhs59y5uF+iIL2ShlzZGtjYTfhHK3XpvmcS5Clwfws1J
 PKbznYWGc1YodbsuGi3reJJAAsT8vLDmSWc6HBTpWchXnF4OTcU5aDkMKwJSEvd2KlbNNQac021
 Xd+aKXq0mvd9gUZZUCUeUrC7itF/yLQNy3yHdDNVR4VJihubXy94XNjCiX58Phmy3rMgSq976Kj
 M5h01vqEECANqtD0xLX/F6NP9ybFg+t7xohWnoLPZGokCX5v/EcMtf5UFUh5VxBM33oUaPSV+zK
 CfwOuaI8VtCo3lw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++-------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 293 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  51 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  12 +-
 5 files changed, 321 insertions(+), 197 deletions(-)
---
base-commit: f7da3699c901aea6a009d38116d24c67a4c9662e
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


