Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119B920F5C9
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388257AbgF3Neh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388129AbgF3Ndy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBE7C08C5DC
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:53 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w3so7159288wmi.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+qGhRYBFyg4w70/+i8v0aKH3im1q1Wu84G6qHkN10ns=;
        b=m5TXu/t5DKfMXruQKZB68+3bIMiutcLyKBEStN8LN7fnI7W31+Ke2AzvBR8VwgqjKR
         LqwayMuHUVg/5efbOBN+c7Jr5PsEe+CE1FN9f+EDZU+XR2HKF77dvsLsvNzwSw9+Sszb
         /3M/mw8soiSberSwHv7Zi15ZVc7HUq0eVnUrtWiLDFwj5IJXDUbjclnJKU9rbOXe+LbB
         ONz02j168Rt3Gw6tn+TFBAHJ94k922AEa2refrxFnJrzSG1Zr+nOH/sHdeKLyXNxx50T
         hfXn4EeRnGQ/vOjTI860tqbnIymxlU+3sB0X9hZgmUyDUB3MDcTHNcsEB6oyKaSQOmbo
         Snvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+qGhRYBFyg4w70/+i8v0aKH3im1q1Wu84G6qHkN10ns=;
        b=phA1e6a2zIVkv9RlE5yOs4foZoufyApK1hm9yG8MPkU2LC+AcLyaSMxpIVhG4Y5zIr
         k9iei9W8RV8/ZUZZNgNPYFnMdcPq7LTlKmsdi25cxDCUdsLzDFCUiGm99/SPl81AQZeQ
         L9QmdI0oC2a9h5X62pKXSPD1IDoamcvPa38XT4YtEbcOzn0n/Gt+GTu74RzHe/J8ahJx
         fKCUx2W+YAnFcEmbJj/cAcqOTbR4Y+1Gro6m7RZOTE1/LU/3p+GNUBPgp8eaxU+bgZJh
         IlaItPcWTSFr977s+yJ2WBbmm92G1K6Btz4vwkDNfw3+5Kq1Wc9JlCWz4UUtJx5dMo0T
         wtbA==
X-Gm-Message-State: AOAM533W1ykD6etiy8hbrJWhXOfbZmCzO/rLDQstf3slJO1MesXUNXbj
        vAH5Rc4gte7lDQ016cLdm4ix6g==
X-Google-Smtp-Source: ABdhPJwxspIcxssmP1G2rn5ofE8vN2GTlugAs3HTO7L+/ydE6J3tNErrAGTO6z80v51SGDcQuZLyCA==
X-Received: by 2002:a1c:16:: with SMTP id 22mr20990748wma.42.1593524031756;
        Tue, 30 Jun 2020 06:33:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:51 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 03/10] gpio: gpio-ml-ioh: Fix missing ':' in 'struct ioh_gpio_reg_data
Date:   Tue, 30 Jun 2020 14:33:38 +0100
Message-Id: <20200630133345.2232932-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

'struct ioh_gpio_reg_data's 'ien_reg' property is missing a ':'
which confuses the kerneldoc tooling/parsers/validators.

Replacing it squashes the following W=1 warning:

 drivers/gpio/gpio-ml-ioh.c:63: warning: Function parameter or member 'ien_reg' not described in 'ioh_gpio_reg_data'

Cc: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-ml-ioh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 92b6e958cfed5..53d4abefa6ff2 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -44,7 +44,7 @@ struct ioh_regs {
 
 /**
  * struct ioh_gpio_reg_data - The register store data.
- * @ien_reg	To store contents of interrupt enable register.
+ * @ien_reg:	To store contents of interrupt enable register.
  * @imask_reg:	To store contents of interrupt mask regist
  * @po_reg:	To store contents of PO register.
  * @pm_reg:	To store contents of PM register.
-- 
2.25.1

