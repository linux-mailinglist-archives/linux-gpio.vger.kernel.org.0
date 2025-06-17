Return-Path: <linux-gpio+bounces-21689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB0ADCB63
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 14:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D06F7AB3F4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jun 2025 12:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F0B218EB1;
	Tue, 17 Jun 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="14TsZwo7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EDD2DE1E0
	for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163085; cv=none; b=OD9yHjBlXDK9Of21StAKWYuEnAtNhraDiSel2kgHHb+SJhmgpj3lKOv/mrOgrTQSr9XpcXHCLX6a+P7EJhpnGC/ua4lC/qCilpohnF+J6mNobzSOc2HBBd0Pic/DUS/jOLx13FTwHfPF/evcZ0QPgbsXCJNpKG611ilem9cA+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163085; c=relaxed/simple;
	bh=RLnOLguCkXn77LVyLm/6OTIhPoN1Dit0JrVu41r0fmE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h5b4b2cYVNNFwzRO+q666oENdnlf0AwnBDnVLoFLwLSeiJjXMrv/5wBxUywKld4OclmndfxjgDoAheRE9AF6RxEEfYINqymbvMmeKy6OAC//TXUH3jmaMpOjMs0TaIPCbvzFZqGcjNCGuL4Z8coazfBu+Ua4zobePuo+/K/rQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=14TsZwo7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so41871695e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jun 2025 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750163082; x=1750767882; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=;
        b=14TsZwo7h6IHJWTxNbzEne4QAg2lcq2bbDoVi1bIwDQ99X0jeI1Fvb793dsNZHyZja
         mUw34Cf9EZNbMT7tdPbAWssA3LBKietfZ0FObFCO8HhWWfAbZ3PTfBVRlg4RYPU0U8q9
         3wS3nICrNOvXb7Qz2gSoaYapdt5qvy8+ISb5NO3//tZy+uGUVBQKXyvU4VkSOfAmGb8F
         FYb40dfuhPIbTkE4Wxnag1togpxKje+UdxrmjCthyFUpZtyiHfGvlQ2UfGgOzvRBIGm6
         1F08tJs+JJUkI9B/TzcBAKDUn9WtmvlV9sx89J8ZmEzc+iCUjfxPLlI8KSCzGIk46qas
         cvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163082; x=1750767882;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aOiT8aWvV9AtVi02w4ktGyvJjNxDzIlcv3Oau2aYCg=;
        b=r6LJV6zGf4BIVsSXkdpJ0YXkLUlQQgG7/vGUUCWVngy/Y+4bAQ5QS8pXoiv7xQ/3e/
         adowYIk5i/BHqljfIc3uPBgC3jsCW0HHF1Fib+1FBVZ65Y7qoV78d0yWWi9v0w8HopeO
         YDp3l/H83VW6tHO+n7Mg3Vv7zjU5AGTvXlSUbYHzC/DkGMjPqA+EJChbc3rDeOixElB1
         txd/CXLasMOqKPdDlnoRUzCHUe6RkH5hA/fJ+tZmbb1Rv6rgzlsYzryoKJjbt3khV9QY
         Dpg2p1dXj1AWZmf5dNv10qn1mVv65rH3WgTTlrtQmzRjf7PQeo3MqLQP1sLc5k9VQyaR
         myXg==
X-Gm-Message-State: AOJu0YwN/Qm5nGlb1erRAANDpsUw3goHdVUb79awqOIbnkbbz9UQfPf/
	j6bv3qN83tPWszlEnr4ZhcsFCNTdhMQjLSomveJDaImFi+z6vnaX7Tin43UmOvf5QBg=
X-Gm-Gg: ASbGncuK/O+K+WnEMIFll4UOWApswM2+4WzXab4WvPq6hctfiOJ+pIxyE108MaO49GU
	XHbDIVl4bQ6+80EF+HM6ua11tizxLWfUVP/ey363CQTS6X0jWgWvJq+AEHtY+vMB53ZAKF47vDn
	nxuew0voYbllmkVFb+18s3zfd8315Fx/17OK1AGM+QqUZHLWDq5YPOWeQSAmEp6mieohBDpl3I1
	sS6RftATdRxSjNaJL/ZkefxQGpHwkYWJGJuhHeXO5csyLbXBq+k4YUEBos2SLpDhcZbeujOCh14
	E3wD3qVaZLw0y7Nk5QIbdLyFZKtpK1FA1C/82ifOEbM25Q8T/zMbqiz/
X-Google-Smtp-Source: AGHT+IF+mB5SqbWQ/IXeYHMObyrSVvwo7MdGf15Ymmh88YebHVybFE0gf/vBSiFaY6F9NM4JITbNiQ==
X-Received: by 2002:a05:600c:5305:b0:453:9b7:c22a with SMTP id 5b1f17b1804b1-4533cb56708mr128208385e9.30.1750163081796;
        Tue, 17 Jun 2025 05:24:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm173816135e9.1.2025.06.17.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:24:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Tue, 17 Jun 2025 14:24:22 +0200
Message-Id: <20250617-gpiochip-set-rv-gpio-v1-0-903703881fa2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZeUWgC/x3MQQqAIBBA0avIrBtIMbWuEi3CppyNiYYE0d2Tl
 m/x/wOFMlOBSTyQqXLhMzbIToAPazwIeWsG1auhN9Likfj0gRMWujDX30iSnNHWuFEraGnKtPP
 9b+flfT82d1slZgAAAA==
X-Change-ID: 20250617-gpiochip-set-rv-gpio-e1e864768942
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RLnOLguCkXn77LVyLm/6OTIhPoN1Dit0JrVu41r0fmE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUV6CDET79f1o2CbISvL3vLRy6ELTLtQKnb084
 knXSnThFB+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFFeggAKCRARpy6gFHHX
 cpf1D/9lK1akx62CUxztvvy7rfND61EV2eVXetZwZCru69u+80k0krblUEs+OzEEsNomzQQjunB
 t6oGVkODsx9MDCHGMisesmtpssyc9U9ZL9/3Phkj46EdmTFQA4Jv4qP+XwlamMBQXIy1zf3KWOV
 Dx7s9uYPiEhyWDXW1IMHpJksogNn4kOOG9CYb7oZaaHR8S9i9Mujk0yqG77pOgFCF+oWy9cp1qj
 lYsB08HLcanT6fAWkXZ1Ll5rleE9+beB9+HKLi7p1Y31IvlsQ1/D67xx525vqjPeFM1EJ76Igl0
 /FnoKItV4ubW65epwmmWbi/UKTiSP+lU7u6zXY0eEOWuMkrg/uBakg7An2VYYSjtiz5w4e8LjPC
 r1eSzfsmrjHDC8HrNVwbnj9Ashn2tRis9fXAZ7+p7LodRjS6RLKebeav4NUPp3jCDyCGz44Sl82
 KxZktKjqp+0hnXOg2ATa3Ck8pHHtIgTiGXBQF/msz98sLdJq0YdtHn+9Ad2YfzcfYbTvSvq4WgO
 GRO30/0rIKexr/ctI8lBGNh/9MlBpeHFiEpr2CZsmCuht2vy38g0TzZJ8r0tBvYL39W2BdS5SEp
 kjk+/W1gC4lU3DDhbBHQVXR+laf4oumYx342Rjvm8paGhaf+h0T/XKk99JFDuDdPXicCCHnyKRO
 arX7wibv6dGhGwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: pca9570: use new GPIO line value setter callbacks
      gpio: pcf857x: use new GPIO line value setter callbacks
      gpio: pch: use new GPIO line value setter callbacks
      gpio: pl061: use new GPIO line value setter callbacks
      gpio: pmic-eic-sprd: drop unneeded .set() callback
      gpio: pxa: use new GPIO line value setter callbacks
      gpio: rc5t583: use new GPIO line value setter callbacks
      gpio: rdc321x: use new GPIO line value setter callbacks
      gpio: reg: use new GPIO line value setter callbacks
      gpio: rockchip: use new GPIO line value setter callbacks
      gpio: rtd: use new GPIO line value setter callbacks
      gpio: sa1100: use new GPIO line value setter callbacks

 drivers/gpio/gpio-pca9570.c       |  5 +++--
 drivers/gpio/gpio-pcf857x.c       | 17 ++++++++++-------
 drivers/gpio/gpio-pch.c           |  6 ++++--
 drivers/gpio/gpio-pl061.c         |  6 ++++--
 drivers/gpio/gpio-pmic-eic-sprd.c |  7 -------
 drivers/gpio/gpio-pxa.c           |  6 ++++--
 drivers/gpio/gpio-rc5t583.c       | 19 ++++++++++++++-----
 drivers/gpio/gpio-rdc321x.c       |  8 +++++---
 drivers/gpio/gpio-reg.c           |  6 ++++--
 drivers/gpio/gpio-rockchip.c      |  8 +++++---
 drivers/gpio/gpio-rtd.c           |  6 ++++--
 drivers/gpio/gpio-sa1100.c        |  7 +++++--
 12 files changed, 62 insertions(+), 39 deletions(-)
---
base-commit: f3763403a6bbc3a18379fe4c415bda899a111d55
change-id: 20250617-gpiochip-set-rv-gpio-e1e864768942

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


