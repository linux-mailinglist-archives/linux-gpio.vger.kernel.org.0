Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EC720F5CC
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 15:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388254AbgF3Neh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 09:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388163AbgF3Ndy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 09:33:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A53DC03E979
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:54 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j18so18841172wmi.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LxMqnKZ6/vF3Sz1VG4ZmVbGw0fGc694S11E5HGVbx6s=;
        b=a52p8zpDtHp2BZaKl7cLaCsGbQRImiqq+vdYMe+DEp24dRvPaj0y8e3Kju7zD0XhYx
         CLwU8KT53+rUeG44oD/jA/JijDdkch9F3RMzyJ1ppCeX6KBs/ucps8SozbJzpjtw6mOt
         jBoBo02vlcgoUfsxeIazznL9FhHExCEjjRFK8stugey1p6cx+rMZ1SxHayD+46hcaVCM
         8V8ZwOXV3CqPMIqYBokS0zQGkEJG0UQuUU44tgL2m9+EtAqzEEXvqj+MCGmqaek2aBnk
         AuLUNAngsZhaTMBEpLkFjYtH/YvrrGCbOElVQH/o+cZUwBRqtDsh5w6OHa0fU394DeRV
         X+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LxMqnKZ6/vF3Sz1VG4ZmVbGw0fGc694S11E5HGVbx6s=;
        b=RPjoFe1DyDalXnvLGzyAIbZd7zPpaID7iyfXc0lr4Yd8VJJwwlGJEaEv8SQTaSSFDF
         fQb/PQWL1AMCH67OQFcro0Pei5NlpKNclisnAcHTVlJd2SRNup6kzo2TEc0hs2CzBKSn
         7wn+60Fk11CZXKcy2J3KlisRR91SUD7nRSg/IuUFWvVBKVg+00nZGoLqj6kL4gGGFNsd
         +9e3pUEpl/zalDC2E7rXI1Qlqs2CogXZH9mp6V22cOlLn1BUfuIPrQVGgvCxf0+Rja0z
         DY0YVfwKTUmNmxZBHAOHTBaS7DP9BFBHxFo4VmevWAa6DT4JXQW/LzEMhoD06LLO/FFf
         H5fA==
X-Gm-Message-State: AOAM531wkiByVflTKepN9zrx211tdVk/o+m0wNr55tIvGHo6aYM7gW1v
        mIeBAs5BryJzVSra0mG2zaplDg==
X-Google-Smtp-Source: ABdhPJxjet3Fft4nPy2UchykKdNnrGWHxB31uPrnPEyWDLwTGsb3FgesECowF9Jy/VDozg8ma6IePQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr22807105wmd.156.1593524032982;
        Tue, 30 Jun 2020 06:33:52 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id z16sm3682464wrr.35.2020.06.30.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 06:33:52 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 04/10] gpio: gpio-pmic-eic-sprd: Fix incorrectly named property 'map'
Date:   Tue, 30 Jun 2020 14:33:39 +0100
Message-Id: <20200630133345.2232932-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630133345.2232932-1-lee.jones@linaro.org>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A good attempt has been made to properly document 'struct
sprd_pmic_eic', but 'map' has been incorrectly described as
'regmap' since the driver's inception in 2018.

Fixes the following W=1 kernel build warning:

 drivers/gpio/gpio-pmic-eic-sprd.c:65: warning: Function parameter or member 'map' not described in 'sprd_pmic_eic'

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index 05000cace9b24..9382851905662 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -48,7 +48,7 @@ enum {
  * struct sprd_pmic_eic - PMIC EIC controller
  * @chip: the gpio_chip structure.
  * @intc: the irq_chip structure.
- * @regmap: the regmap from the parent device.
+ * @map:  the regmap from the parent device.
  * @offset: the EIC controller's offset address of the PMIC.
  * @reg: the array to cache the EIC registers.
  * @buslock: for bus lock/sync and unlock.
-- 
2.25.1

