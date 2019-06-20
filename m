Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84084CA1A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 10:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfFTI5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 04:57:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34886 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbfFTI5K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 04:57:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id a25so1868442lfg.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2019 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJCXm/9h6PeMdueB0M/u2oe869FcZvmqoKCRVSRLbXo=;
        b=FHbpgkX4gTqDkmUWRNwqK3500pJt4AamSgYyiP2CaR122NAax0ARBlf/FPLQPVqTmc
         rt4qPahud4qJDminBN6NCgOJA5SBisYCHadkxuBvFiDq28V6rmuZY+VgxVv2yusi2mwG
         XeI0u5ArONbQlYuhHxRpD0I7q/vJ0IegtyeBelz3dTVNrVJ2BCIrkM8b8/35eZdgtrKE
         r6NLRdM4VDddQC3Yc1gcFMyxGigsQXop/tPHWijiSNLuH1/zU6yv+tE3D86rg5EhDeNs
         c80ikEzr5cPxtvTL0DKguZ4AxrxpBbeQ5Fas2t5fCALXJvHjmq1LvaVVeiPB20wPI4KC
         Cacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJCXm/9h6PeMdueB0M/u2oe869FcZvmqoKCRVSRLbXo=;
        b=ddHInxrkhlJJ1kARhmMXSZ9P7cNtQUskbGUpk4DzYsjlRiulMU6WcTPy7DYtIPYo5V
         4yVHOhn9HptBBhGNuxEoKHfirl8OyCHM84JFnlNKp0te2SETjiux3tQ55JRKUMCHGxRg
         ulUJNvjipEFmQbcxfpz3zwNTKOnh9s3Co96/KlUrQ1WCBng/f0luWxi4VGSTcfR+Zgum
         TfAMdntckKHcio5UwsfaO0jsZYD/1BeuTYAUqvsoy0J9vGl5w1V335+evjA4rARmNYSl
         eBK1oGGnk1dEk4yq+Vme1yNXvsiui8nslTXFhZwaFT9eK3+L2sDGRpv1rSwZnjNoy1Nu
         Bfyw==
X-Gm-Message-State: APjAAAVf8pSdQZF5iDi/mqZylUnfDRC3Qet3nDUse5U//pyaWcfDvibR
        YQXUoM29nFnp1hZGHW3X7fP21i1FQ44=
X-Google-Smtp-Source: APXvYqxyQrqZUDFWvU/5DMjeRYRroJTky9loz8KOtTDAjynhT0UqULfHLeUqI8jqHn0YIMoK5Clx7A==
X-Received: by 2002:a19:4a49:: with SMTP id x70mr26514335lfa.151.1561021028034;
        Thu, 20 Jun 2019 01:57:08 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id i5sm3053941lfo.55.2019.06.20.01.57.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 01:57:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: Minimize SPDX hamming distance
Date:   Thu, 20 Jun 2019 10:57:05 +0200
Message-Id: <20190620085705.6012-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

OK so some automatic scripts were fixing the SPDX tags in
the mainline branch while we were patching other stuff,
and yeah it is more correct to have "GPL-2.0-only" rather
than "GPL-2.0" so let's conform to what is already upstream
so we don't end up getting the wrong license on the merged
result later.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig  | 1 -
 drivers/pinctrl/pinctrl-coh901.c | 2 +-
 drivers/pinctrl/pinctrl-u300.c   | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index 49c49fd6b853..d6d849e51c74 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-
 if ARCH_U8500
 
 config PINCTRL_ABX500
diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
index d10704cc9318..08b9e909e917 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * U300 GPIO module.
  *
diff --git a/drivers/pinctrl/pinctrl-u300.c b/drivers/pinctrl/pinctrl-u300.c
index 6d59e3f836df..348423bb39dd 100644
--- a/drivers/pinctrl/pinctrl-u300.c
+++ b/drivers/pinctrl/pinctrl-u300.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Driver for the U300 pin controller
  *
-- 
2.20.1

