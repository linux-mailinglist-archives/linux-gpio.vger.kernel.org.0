Return-Path: <linux-gpio+bounces-10783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773798EC39
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 11:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C1BC1C21F77
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731D6145FE8;
	Thu,  3 Oct 2024 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="PiVtOhXf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB913CFB8;
	Thu,  3 Oct 2024 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727947425; cv=none; b=RzjO6AN8P51L52OQoXZe+oFx5G77pcrc4un22Jok5lZzj1zkuXo3ovvH9FK8CTXw7cOwljMqoFFU2JmWKtkeojLv6FLLvfiezNUxrfceqkGtXxDijtw8+p3NvfuylekvR/QY7q0k/j7dbFbEGgIzSkr5IUNTG7UaW0kRpo212hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727947425; c=relaxed/simple;
	bh=uDFiZvlTiwa5reE7zcLbUA63hvwB2cVZyUdjkOT9q+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=De6mGy+nc6+xHf+3jkuv5Uu1jNlFw/YUIJLo7V81op9ALXFDcWCqLrrZ0kQZWLMsOTLbmVrJqYD7FNivqRENiODEwqrChmw0mrpGg5sMtMwqHW+VgESE7PC/iKaFSpUYdNp4e7bAr4jdX/jqtSCPR2E7ntzuMJYRG0Yix9rGvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=PiVtOhXf; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=hPJlB+q50rBkXryS88Q3rgzRsYR7xZrLQE5LAlyLL0Q=; b=Pi
	VtOhXftwZZDdRrzRGjIUoMsi1D25ND2dM/q5rOHwCgeb14wKtNVc5OhdOA0OFB3rvs12wlAmoBZUN
	qev3IDYZaUT0BE/hryDmwyYZNNIaoQIkJ9v3fTQ4pPRPdW3X5m9HTqjo1gvpOHjKiuIgP56wqTD61
	f1SejLcUDMIMG4nq5G/X1ZSPNvpfSTM7vTK4NhDKoZlhbx4TYLPgVljcAmHJ/7N2Yf+CPDke92mAN
	XcLddcMtGiBzq4qtzm+WZOlYub8bvXF9SycldSnjCkgCHtl1vWKTNnsfabeNAGuXdxCJvcPrrPqCB
	7FdWYDnI+dRZBmIe5BHn7ST4o1Om2+ug==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1swI3W-000ECG-0u; Thu, 03 Oct 2024 11:23:30 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1swI3V-0004Ak-14;
	Thu, 03 Oct 2024 11:23:29 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Thu, 03 Oct 2024 11:23:09 +0200
Subject: [PATCH] pinctrl: freescale: fix COMPILE_TEST error with
 PINCTRL_IMX_SCU
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-imx-pinctrl-compile-test-fix-v1-1-145ca1948cc3@geanix.com>
X-B4-Tracking: v=1; b=H4sIAHxi/mYC/x3MQQqAIBBA0avErBtwLBd2lWhRNtVAmahEEN09a
 fn+4j+QOAon6KoHIl+S5PQFVFfgttGvjDIXg1a6JaUalOPGIN7luKM7jyA7Y+aUcZEb7UjTQqb
 RhiyURYhc8r/vh/f9AP/Su5BuAAAA
X-Change-ID: 20241003-imx-pinctrl-compile-test-fix-9a1bf1532519
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-next@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727947408; l=1180;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=uDFiZvlTiwa5reE7zcLbUA63hvwB2cVZyUdjkOT9q+8=;
 b=TJ1E3n+RB81bTj3wN524Ilc3iqBH2cXLVpHBN6/oqepZkrKkOiFK3H5H/5uiW26qDQZtCyfY1
 WNy1Cn8JW07BefhavafjjugPi4Em8VqhFL7uISXMAqMqhCMEixG7n7H
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27415/Wed Oct  2 10:52:29 2024)

When PINCTRL_IMX_SCU was selected by PINCTRL_IMX8DXL or PINCTRL_IMX8QM
combined with COMPILE_TEST on a non-arm platforms, the IMX_SCU
dependency could not be enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410031439.GyTSa0kX-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202410030852.q0Hukplf-lkp@intel.com/

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/pinctrl/freescale/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 4486f4a210684b603c8fdf85be3f0cec695df86a..70acfbdd318b0d973c0930fd0f5233ca48842f9c 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -20,7 +20,7 @@ config PINCTRL_IMX_SCMI
 
 config PINCTRL_IMX_SCU
 	tristate
-	depends on IMX_SCU
+	depends on IMX_SCU || COMPILE_TEST
 	select PINCTRL_IMX
 
 config PINCTRL_IMX1_CORE

---
base-commit: c02d24a5af66a9806922391493205a344749f2c4
change-id: 20241003-imx-pinctrl-compile-test-fix-9a1bf1532519

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


