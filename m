Return-Path: <linux-gpio+bounces-16676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB3A478E4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 10:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3BE13A37C0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 09:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1FB22688A;
	Thu, 27 Feb 2025 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVaRU95+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5C224224
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740647892; cv=none; b=EXWQY94EJK39VjZEO6qtGGr/ao4iASU2G9srlV9LhAJ+AGZxoRxctlrW5s6K3ZiUC0Kd/pzuEIOs2UGL98Z1oOEqkAGvW3Q5+ZF4BlQ2dwabsdaR6ujwj4GYOLLnXE9ynnOpDprjSvt7MQk+r4bSbSJUBAeR9LjziTZIDj9NemE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740647892; c=relaxed/simple;
	bh=XddhvwWaOY+L/VD3TMmqWBAcesr8fNxd9nf5FB9ea4w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W17X5z5oGYHwsExHarzw3JwpUcj+Kkt2BAbyapgwDI7oDOFE4XXxjzl11+0segmCk5aKzeGXCwxNI9wcf2oA5W3vXFTrVHfA+gLfHLRmA2IYoEVnLt2voCfvNDbLgq3CkkM/m7aZed+obCy8lTq5p9zPtON1+Q7G8shlOnbOtnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVaRU95+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461cb12e39so644639e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740647889; x=1741252689; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjhcR5IpNDlrnxjIX/F7i+cQE1U0BAbf7fvaVIVnP2Q=;
        b=eVaRU95+SsBaj8QM7BoMuH8QCwx+6eUD+MTsa4Ks3A6li3YRGWLyNGj9fuKt4zpIHg
         KB9zyzq4Q/Pz1/5s10NUX4LviDVmEM8m+zYwwPHQuFdWWR4hryZO50ErAWkdZScRRD6u
         Qxz7TOWls+uKgBgWN/oqSlkRkoK6aJMZ+82KL06nagMUUTQyrCf8EQEgLuxL0MBLZTWb
         ijrVolXL3X9t6jRQ8/8KXUU3ftBM7Yu/IheIZKtgN0yAqomJ05/JLrkK6P1AzoG4mpOz
         gdkcbyH7/pliwR7RQ34GG5l70XhbTSPALLHJo66n4aQTXpK7FNdUkpjk5t2cU3tsOsoE
         3QRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740647889; x=1741252689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjhcR5IpNDlrnxjIX/F7i+cQE1U0BAbf7fvaVIVnP2Q=;
        b=L80FMFNOGH/CIm9Kh3tc8PScAj3GRXVy8BIfC8eZhgyF90N7HBM2u25FbOu5WSDTi7
         E5qh0VUq0y0T6fwiEHiEM9jw4CQsfF7by0/daP03YwRs6bNUKbLBS/aqIGE8SHi0f1mu
         NNiH6+6kmf+dUrwU3cbpmlL/dnq6T8mhguwaKESHIlzbGU8MG+7/H/vFwv4NpGiCeNhn
         +oWQju/nqPPnMPcTNNUMqO5myY0ET8OzfhwayL+CljJqMxNMm/Se9MG/oD8NWLRxtHlh
         8WQoXgp14oqxrASiVApsNXq1QdogHPrKt/w+uKWQ71M2u1yMXOZUae9Jiv/LCACtPc22
         3+vA==
X-Gm-Message-State: AOJu0Yz4l9FgmVAimGyCfMFTaKVPgSINEfaWswsHfqxHpj3IhlrLPSpF
	8x4Ifycv4bQwIE9V6w8yJiAmdI7SHHBcHig4nRGseyDKJeMSVdyptxQ0zqO8H24=
X-Gm-Gg: ASbGncvZPa56yQvyEhcfjLooRfH1o9Ok03YSXI4yf+XQ2F8uLc/68XpscMpdyECyazx
	jJpbZxnfc3nS6jElbywXFEXlrxJ3xzsYWkBbqQ/0wQ8YbOf5Z1KcvOgmXHqLSSxasq5zsyGk/xp
	GxAUJhl4KN3WAY3sskbE5nsdta7LVwYyiXKZMEdL85MosoObO9/TCImYRen/2TRYrL8tnmazb7H
	2W+eK6LGmqJHDGJFQ1DxoNmGoZqDDdhbJgrGpp1V/qzLY8nsEZkwz1wfD7cdh3fDiA3fNDc8rES
	1ODNWvSmOvasdlXfR1YEMYnHo4XfpR7qf0ra
X-Google-Smtp-Source: AGHT+IH6096Jiiajo7U+OpF0iqUevXrfj6+HLi964lvSkGvxtYXKjc1IjkdGCDiTGgbmx/txcLiA8g==
X-Received: by 2002:a19:5f18:0:b0:549:38eb:d694 with SMTP id 2adb3069b0e04-54938ebdbcamr4004127e87.26.1740647888752;
        Thu, 27 Feb 2025 01:18:08 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742d3sm111136e87.34.2025.02.27.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:18:08 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] gpio: Use generic MMIO GPIO some more
Date: Thu, 27 Feb 2025 10:18:06 +0100
Message-Id: <20250227-gpio-mmio-more-v1-0-0ea4ad43d304@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4twGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNz3fSCzHzd3FwQkV+UqmtpaZCaZJBiZpFimqQE1FRQlJqWWQE2MDq
 2thYABlRUmGAAAAA=
X-Change-ID: 20250227-gpio-mmio-more-990eb0d68d5b
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

I found that the Altera driver is easy to convert to
use GPIO MMIO.

Only compile tested, I do not have this device.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      gpio: devres: Use devres parent if undefined
      gpio: altera: User gc helper variable
      gpio: altera: Use generic MMIO GPIO

 drivers/gpio/Kconfig          |   1 +
 drivers/gpio/gpio-altera.c    | 109 ++++++++++--------------------------------
 drivers/gpio/gpiolib-devres.c |   7 +++
 3 files changed, 34 insertions(+), 83 deletions(-)
---
base-commit: 4d478accec99c9b23bd5deccb58996867bd0aa7a
change-id: 20250227-gpio-mmio-more-990eb0d68d5b

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


