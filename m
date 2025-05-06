Return-Path: <linux-gpio+bounces-19674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68812AABED0
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 11:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B9F11C28484
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 09:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7025A2798F0;
	Tue,  6 May 2025 09:09:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11925264A9E;
	Tue,  6 May 2025 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522559; cv=none; b=MEX/J6ruz2kfqXJi3CY81PuLzgR6tXMRJ/KyXaRJnYurf16Pvr+0TUDaGKnQBrXpzwnlB0snSrneRGcJDHt2plpv7J7g/4XHK3ilRi1BSIOzRenWH36rH0O3sfkiEz5Z0f2pEY0vsFhKhMS5VP9tC2l6W3LWEy5FNiz179eR0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522559; c=relaxed/simple;
	bh=vSUbMIpTRLHktM0iNQa7tKGDC2wPWrqGiVyANR5NiNI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i4yfLeEQ/nDQ7uuHpVy806NTDTkFml+sEP4jIhvxug9OZeXiQOd67rgGHx94+h/ajxsQSMtht5sjuv1UeffCpGMjGPxjLZ66oVKlJ/o+9zM+RsQBAq9rSoSHGEonKT3GzIYon0Z8K3+rp+P+ev1r9Egq1q+oIsKPxF2AGghgt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app1 (Coremail) with SMTP id TAJkCgBHXg+f0RloSiViAA--.38522S2;
	Tue, 06 May 2025 17:08:49 +0800 (CST)
From: luyulin <luyulin@eswincomputing.com>
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
Cc: zhengyu@eswincomputing.com,
	ningyu@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	linmin@eswincomputing.com,
	fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com,
	luyulin <luyulin@eswincomputing.com>
Subject: [PATCH 0/2]
Date: Tue,  6 May 2025 17:08:44 +0800
Message-Id: <20250506090844.1516-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgBHXg+f0RloSiViAA--.38522S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr17AF4UWF45tr18Gw45KFg_yoW8XrWDpF
	43GF1rtrn8XFZrXa47Jw4FkrW3Ga1xAr1a9ayft347XFs8A348AF15K3W5XrWDWF48JrnI
	yryYgryUuF1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

  This patch introduces a driver for the Eswin eic7700 SoC pinctrl
  controller, adding support for the pinctrl functionality in the Linux
  kernel. The driver provides basic functionality to manage and control
  the pinctrl signals for the eic7700 SoC.

  The driver integrates with the Linux pinctrl subsystem, enabling kernel
  code to trigger pinctrl operations on hardware and ensuring support for
  pin multiplexing and pin configuration.

  Features:

    Implements support for the Eswin eic7700 SoC pinctrl controller.
    Provides API to manage pinctrl for the eic7700 SoC.
    Integration with the Linux pinctrl subsystem for consistency and
    scalability.

  Supported chips:
    Eswin eic7700 SoC.

  Test:
    I tested this patch on the Sifive HiFive Premier P550 (which uses
    the EIC7700 SoC), including system boot, networking, EMMC, display,
    and other peripherals. The drivers for these modules all use the
    pinctrl module, so this verifies that this pinctrl driver
    patch is working properly.

luyulin (2):
  dt-bindings: pinctrl: eswin: Document for eic7700 SoC
  pinctrl: eswin: Add eic7700 pinctrl driver

 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 156 ++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-eic7700.c             | 701 ++++++++++++++++++
 4 files changed, 869 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c

-- 
2.25.1


