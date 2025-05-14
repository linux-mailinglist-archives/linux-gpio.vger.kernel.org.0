Return-Path: <linux-gpio+bounces-20123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525B4AB6554
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 10:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A1423A7FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01CA21ABD3;
	Wed, 14 May 2025 08:10:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (l-sdnproxy.icoremail.net [20.188.111.126])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D2E206F2A;
	Wed, 14 May 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.188.111.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210241; cv=none; b=G8FKggS+mTCBDY/UGLBgNqoUGMr3dBErE18R6fe05ZKdoYwKt0pu8imKeLTc+k86RYd/C/a2s582GgIO2n2WcKr7pNbKxc1RoMGkpQDWAlH+qJ47tcYhybvMWq5Oo/11G9E/Gh6yMg88g8uG4OU9o2h9i5vSKMPoHGYg8rdJsVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210241; c=relaxed/simple;
	bh=DIQPaVMfUbgq6kQYMxZsdkh+L/DpHHl1WE0gt7iVMU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=edePX8QLWAZ12XQcYg9vVw/70ombYoVbf8vfjmx2+fzx4Fblei5sLHH5K0vrkO11im6UZSbjUhGejSVPN5qXckgIJfJ/XyJV5RisTV94ZNroJldEcJKZLblP8KsgNNIiS/E8veWrMYzbJq3vpWmZCPGm168KCIPSLUyK6egKoB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=20.188.111.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app2 (Coremail) with SMTP id TQJkCgDXaJLuTyRoDL15AA--.31835S2;
	Wed, 14 May 2025 16:10:25 +0800 (CST)
From: Yulin Lu <luyulin@eswincomputing.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	brgl@bgdev.pl,
	linux-hardening@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	zhengyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com,
	Yulin Lu <luyulin@eswincomputing.com>
Subject: [PATCH v3 0/2] ESWIN EIC7700 pinctrl driver
Date: Wed, 14 May 2025 16:09:28 +0800
Message-Id: <20250514080928.385-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDXaJLuTyRoDL15AA--.31835S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry7KF4fAFWUKFWkJFWkZwb_yoW8Ar1DpF
	43GFn5Grs8Jr47Ja4xJa109rW3Gan7Ar1a9w4Sg347XFs8Aw1UJr4rKF1YqrZrCr48J34Y
	yF15Kryj9F1DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/

  Implements support for the Eswin eic7700 SoC pinctrl controller.
  Provides API to manage pinctrl for the eic7700 SoC.
  Integration with the Linux pinctrl subsystem for consistency and
  scalability.

  Supported chips:
    Eswin eic7700 SoC.

  Test:
    Tested this patch on the Sifive HiFive Premier P550 (which uses
    the EIC7700 SoC), including system boot, networking, EMMC, display,
    and other peripherals. The drivers for these modules all use the
    pinctrl module, so this verifies that this pinctrl driver
    patch is working properly.

---
Changes since V2:
- Address the comments from Krzysztof Kozlowski, some commit information are modified.
- Fixed some errors and warnings reported by the kernel test robot.
- Modified the usage of some labels and syntax in the YAML file, as well as the usage
  of the dev_err_probe function, to make their application scenarios more accurate.
- Link: https://lore.kernel.org/all/20250506090844.1516-1-luyulin@eswincomputing.com/

Changes since V1:
- Made overall modifications to the driver structure and the DTS writing style.
- Link: https://lore.kernel.org/all/20250325141311.758787-1-emil.renner.berthing@canonical.com/

Yulin Lu (2):
  dt-bindings: pinctrl: eswin: Document for EIC7700 SoC
  pinctrl: eswin: Add EIC7700 pinctrl driver

 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 157 ++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-eic7700.c             | 702 ++++++++++++++++++
 4 files changed, 871 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c

-- 
2.25.1


