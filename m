Return-Path: <linux-gpio+bounces-19272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEDEA9AE86
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 15:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE041B82C99
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 13:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472D127F75B;
	Thu, 24 Apr 2025 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PQ+P/m5r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A81CFBC
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500000; cv=none; b=YC6E6FKFUqehMGVsr+WsvQD7pU4uFuRf96+4GaZeoVnPV1kBeXdN/sHy9jxQpotiFgu2sLEX/f9grgjHYH5uIphYFmRz5kkgnAgECQnOZMTWrqRGVpQXmMwfYS8jfy0HIzjoUtkN0lHoR4wHy5pxrGVns35rDSoVkrGIH9aU9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500000; c=relaxed/simple;
	bh=9t5d+UKcPJuG3ggPPB/KVGoXdJJgTDs2EQO0I12nqzU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kK5qWNnfRoSLyV5Ir1VK+Gp4izFtWJjp5W9MapzE0Zg/9Hoxu/9+z2oROPjy6VjluU1k7OHUZRkiPxxrejnVlxSnpbS+ohoz08i6j0b6Vw5F95DbB0zyuqNC/7aVaLfYQ1DvG1+Ir2uMAR+6rFETmHJvgTH8jMHyuqXA/q5fSIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PQ+P/m5r; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso6970965e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745499996; x=1746104796; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9eKtsTsbdx0JGqQNShucziaXZmFpN+G2Iz9W7geb0sY=;
        b=PQ+P/m5rrvZM2O9o3089XbBxSGqd5vvRyCmIPjvOL6nTISsIRGiVQKQ44JZLQ0J5mF
         NHW1zkUp4QqbK3Lzqe78V36TfAMFLoecJzPhpqctknfkaVr84puyvP2N3Al86pqXefXy
         /LB7htssewZ4rKU5di/GoLBCEhlXzzVBKG/L3csw1lsCEHyJySQOhJuOpi5YiPmrHsLq
         2F5QAJ5x1B9840+y4DpkEk1s9cJ8WjknNe6bHblg8h8JhhYXFfAORP/bTbZATk7g/pX1
         xdPij7P5+G7u03z9vNfAFAjVz6w171gt2F3RkwKDfo5TjWc/MccuvAeEk4rZk+b6lYw4
         LlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499996; x=1746104796;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eKtsTsbdx0JGqQNShucziaXZmFpN+G2Iz9W7geb0sY=;
        b=MaRM5EFw1K9q6GdgQ/wKmKmDvv4JqGlNJ0hBixFPZ9w4gL0kCJOI7so/LWtME9+T0R
         a5JVttiNVeYGUcPWIrkHO4giJqnBg92kqTfsu+TI/2yg4U1PGTe7Up26VcHrOiGMsR99
         s2NKh6Qp6X0svU8k9OVAjACKKYk/JxMx757sUGZaJABaIpoCWw10LuuW26ilcvAn0Nez
         /FroQQ/iCn+MdiyII4dCRzVueXxqaIxcQksR1ZUMV12EaepPDuQdHUZoh22ZVFnBlVZU
         A98ntsGDyIle40qZ06mS32QQadmxT4CGg51dflSSr5VOuBHFttTIpxponYDiK3KoEkO7
         KfTA==
X-Gm-Message-State: AOJu0YzVCqjqpQ8NCNQBPasGPsDJBfOUKbM1Q09WyFq2G50ofAIZ9Onr
	cJUxntuOBzYciOnBH8Kq9SXFDIsNNjjGUccEDejUPRcG7NWpT2e3qr311WfS1QQ=
X-Gm-Gg: ASbGncscVnNNVby3OOH1Gtn5yKRiMqL6z6TLdsinELrjrlV8ix0DNzFALDJt//gkD9f
	oFrC8QUvC5K+nohzzKxegaARFP+ddr38Zhn4akrlK3yy7Z/eodDTzrWTHqG/dYgx7bVgTlGU89Y
	agF4OyQ79x+XGDTg+lQRiB5jIiW2c4JfbaSGRcJYKl9WJhCOqETPt+SHwdgzBNqkSny8OGA6ykV
	RoazSccd+cejYWbdVLfAuIlRmyJLH8pC58Z0TpM1qQ8MEZjCWrxm1ITPnYTe1C2qCdsDvQorsEe
	OVbiT+pm6r7c+aT2d8KqjnST+R/9Wi259A==
X-Google-Smtp-Source: AGHT+IHWWg1Htn6HdqAdrNzgg1CCDWwJ61fuWSYZWFyenLb3SbgyVdy12kmZDqgno+V/GeENwlKxgw==
X-Received: by 2002:a05:600c:1e2a:b0:440:94a2:95b8 with SMTP id 5b1f17b1804b1-4409bd3076dmr29972375e9.16.1745499995563;
        Thu, 24 Apr 2025 06:06:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad175sm20427485e9.24.2025.04.24.06.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:06:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/2] bindings: python: make license information in
 pyproject.toml conform with PEP 639
Date: Thu, 24 Apr 2025 15:06:26 +0200
Message-Id: <20250424-pyproject-toml-pep-639-v1-0-8150d3d807b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFI3CmgC/x3MwQ5EMBCA4VeROe8kVAleZbMH2ikj6KSVDRHvr
 nH8Dv9/QaTAFKHLLgj058h+Syg+GZip30ZCtsmgclXlWmmUU4Kfyey4+3VBIcG6bLEm02jXOFu
 0ClIsgRwf7/gLCw+jsLfwu+8HK5wzEnIAAAA=
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Phil Howard <phil@gadgetoid.com>, 
 Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9t5d+UKcPJuG3ggPPB/KVGoXdJJgTDs2EQO0I12nqzU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCjdXFeaWNuTONXkUS1ceaNg459DrvTr0HM3u7
 5NwwBfwDmCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAo3VwAKCRARpy6gFHHX
 cueSD/43yHhvz69FfTxgtG5X8rtnz3HOZFMJs2l/noKTo07fMKexSBztmE0QfHiY4Dok5V6HcWP
 PccGb6Vp95wfRDFVk67oOnImRLk1VRCCG/RC+IhRsIznddi2ZmJnAoLwEYAN3p647aFZP6racuE
 p8raSWeDy4NqtYBPJqVDTMniYY+hTxmbdxOihuL/pC1UAS5i2UN4+whNpdZFPbKR06p0JAh0RnP
 2GzSPUN4P1E/wL7g3PocgkuRFvuZAMAF83VYwuItZTyl54BgiPbJuf2DNdP9P1z7avlfnPxLji6
 kEZXQvdoZwoG1RUrtHvUpdEqSEW+hozE0bAph1gqlkMjjQ8FfXFL7g1TBWwKUdNpKbwMqZhHOem
 CFuKPeHscU0U1ai/CffXp3BiLtBfH8OGT70IuW0HNcmpxBKE7CwMiVwuFn0/ZZWSetD8+HPHUJY
 YxBdMauBgbbdX45ZftCFqaArG8eGgaDnS/vfgM+7rKcyRpg2ugS3hVUD5Nk4kNUEI2ruNgRMAiw
 GgLtF3A6wBMgtxUVO+JvVRUfL3KhPEwP/Hue04kiKX/aZh7cKMe/8tnEb3IkEUDRZZgxcuc/1y4
 AeEkFgLN4wDGGuO7S1R709EwiFf/eMH69YAqzSc+c4L2grbLr0Hpy9pgUSNlkJFU/hYmokZQB87
 WqheMX+MiyYN0hA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

setuptools v77 print the following warning when building libgpiod python
bindings:

********************************************************************************
Please use a simple string containing a SPDX expression for `project.license`. You can also use `project.license-files`. (Both options available on setuptools>=77.0.0).

By 2026-Feb-18, you need to update your project and remove deprecated calls
or your builds will no longer be supported.

See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
********************************************************************************

Update pyproject.toml to make it conformant with PEP 639.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      bindings: python: add missing newline to pyproject.toml
      bindings: python: make licensing information conform with PEP 639

 bindings/python/pyproject.toml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 41231df28c9aecacaaae9e6493d31161023733d6
change-id: 20250424-pyproject-toml-pep-639-6ec84f8fd192

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


