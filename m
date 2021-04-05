Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B823541B0
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 13:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235041AbhDELm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 07:42:27 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:38540 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhDELm0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Apr 2021 07:42:26 -0400
Received: by mail-lj1-f169.google.com with SMTP id s17so12392352ljc.5;
        Mon, 05 Apr 2021 04:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R0xVhG+7U53SPH5jmQHpTxLXFPcZAS60NbwSQReNzRI=;
        b=kW1SIC9e0Q9dccjxwG1bnEXqUXlepY8RgclHOfLSm3NfNPKhUV/VuBbfjCVUBdXcw+
         XSsHxKoKtskXw0riuQvMGJnYV9t8njaIDbOfjcV1/BXx2zKuKRfdKOUIL2Iq1FjQv+6G
         BRnprX7r9hEyYyEdptQl5n5lSNHtbJkf6AHu6lF6qxMfg2B5zp9YCZlamCN1hZ8nBKlm
         uw0YU4subkO6tBhzb8//9yvKBTKfV+MqCbrxt/SStDB5jvgDbl0+AS4mvCowUXuphALH
         iEngrUh8CLmA3wyWSe3c5lgxpK2H7InMPYROj/gp4mXxVj4oQwBtpjLLFrY8LFpOPCUd
         bPGw==
X-Gm-Message-State: AOAM532rusSffpSd7NlbY8EWon9RDWM1injI2Seg+6gu0IYS4plj+4I9
        WYMpPex7MMMIrLGWNokHS0w8Ce6JjPEtIQ==
X-Google-Smtp-Source: ABdhPJxX9LWHXSw1pZiDEATH3T91qvnaEt9ROwuaK9wQ+HxgBVAybZxGk99OTQKqrPr+5axKtk2YJw==
X-Received: by 2002:a2e:544c:: with SMTP id y12mr16295735ljd.4.1617622939554;
        Mon, 05 Apr 2021 04:42:19 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id d3sm1752990lfq.249.2021.04.05.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 04:42:18 -0700 (PDT)
Date:   Mon, 5 Apr 2021 14:42:13 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v6 06/16] mfd: Add ROHM BD71815 ID
Message-ID: <a178498782117ea608cf3bc6c5e113d6a0b59453.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
this IC.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
No changes since v4

 include/linux/mfd/rohm-generic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 66f673c35303..e107b4769101 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -11,6 +11,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71837 = 0,
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
+	ROHM_CHIP_TYPE_BD71815,
 	ROHM_CHIP_TYPE_BD71828,
 	ROHM_CHIP_TYPE_BD9571,
 	ROHM_CHIP_TYPE_BD9574,
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
