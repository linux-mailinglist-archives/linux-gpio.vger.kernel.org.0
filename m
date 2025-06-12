Return-Path: <linux-gpio+bounces-21424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE45AD6E27
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 070987A3D6B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 10:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CAD23BCE7;
	Thu, 12 Jun 2025 10:46:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18EB23184A;
	Thu, 12 Jun 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725170; cv=none; b=qZdGWthThN5GsPRkv0xXhkMw69zsCwB+ld0DaH8udTbn80fnpAsDz3nCcSDt2536vf3HWvj1CBKoiVt3neB5GaMDs/mF7LltS7QQEYxmEZp9ttpRzBXZZwkzG0xfsxOnSzwAD0SJ11u4IjpJOIGfCpUsZvzRMGviUiT6KgYg4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725170; c=relaxed/simple;
	bh=/1gcciYLf3mcr5dTWnS0/NNH5ggDzXWBaBIN89ySJHw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KpAfdjVeyVA9HxkTmcXzpgDAxTPGbDOJtaZ+gB3818iD3EyVth1FcdqY0CQxR22rM00VuQNPgWWQusKdpW0zjbQE3NaPp4FXzoXxLeDgTmLqOStHNmRtGUrVfiMwThvfSQEkVQLSPOLwUWtAEDKjXCJ1+WRLNZYKaX+DzShaQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app1 (Coremail) with SMTP id TAJkCgDH6xHXr0popHueAA--.50747S2;
	Thu, 12 Jun 2025 18:45:45 +0800 (CST)
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
	linmin@eswincomputing.com,
	zhengyu@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	fenglin@eswincomputing.com,
	lianghujun@eswincomputing.com,
	Yulin Lu <luyulin@eswincomputing.com>
Subject: [PATCH v5 0/2] ESWIN EIC7700 pinctrl driver
Date: Thu, 12 Jun 2025 18:45:39 +0800
Message-Id: <20250612104539.2011-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDH6xHXr0popHueAA--.50747S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry7KF4fAFWUKFWkJFWkZwb_yoW8Gr13pF
	43Grn5Jan8XF47ta4xJ3Wj9ry3Gan7Ar1a9a1Sg347XFs8Aw1UJFW5Kr15XFWDGr48Jr93
	tF15Kryj9F1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
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
Changes since V4:
  pinctrl: eswin: Add EIC7700 pinctrl driver
  - Added #ifdef CONFIG_OF to fix the kernel robot test compilation error.
  - Removed "Reviewed-by" tag of "Krzysztof Kozlowski"
  - Link: https://lore.kernel.org/all/20250515054524.390-1-luyulin@eswincomputing.com/

Yulin Lu (2):
  dt-bindings: pinctrl: eswin: Document for EIC7700 SoC
  pinctrl: eswin: Add EIC7700 pinctrl driver

 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 156 ++++
 drivers/pinctrl/Kconfig                       |  11 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-eic7700.c             | 704 ++++++++++++++++++
 4 files changed, 872 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c

-- 
2.25.1


