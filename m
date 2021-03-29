Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88B234D08A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 14:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhC2MzR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 08:55:17 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:41622 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhC2MzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 08:55:02 -0400
Received: by mail-lj1-f180.google.com with SMTP id f26so15783083ljp.8;
        Mon, 29 Mar 2021 05:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R0xVhG+7U53SPH5jmQHpTxLXFPcZAS60NbwSQReNzRI=;
        b=MLttORhjriQ72uc9YncdPJXqSiGMxmyeP58nWAK8G2Xfj4g6JKPVm56F2Prsr2oNUC
         PkTDKKhU1REk+EeP9WESNiTffdvVXWCypdxpx5MUdlhWoUHtZd/9Ku42v4sEJXWScOBT
         9yendUYAkWLs0zcTiAI0K4I4MxZrp87mUv8YXxdmYH3mlBPVMb9Vv9g0CbDkoozTjh4O
         wr/duFPIi+bbkqtfTs1B63NR7xz0yct/ux307S/Zkys5ekvappXb5V56V8FEhc4O4T0q
         U1tG4L9SGM7jeB++HOw3VptQ3sfy7Sgnx5W8XYWAiXp5lJD7hgESTS1Z9/HceVoxrJrQ
         mN7A==
X-Gm-Message-State: AOAM531clKeem3dK4mEw3EIlahOzafcOYiv8IcoNVgGjGGZlnH9IAiyL
        Z2YcHJb7ghSsQ76obnvTBwNHvmUgBvf8kg==
X-Google-Smtp-Source: ABdhPJyjRQbvzLntcR9xnLbrzd8ikCWldpOVxLvCccmidkhppEi3DIiRn0b8vBc/wQ1zDsejAliXGQ==
X-Received: by 2002:a2e:2a44:: with SMTP id q65mr18437325ljq.238.1617022500199;
        Mon, 29 Mar 2021 05:55:00 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id t192sm1826376lff.295.2021.03.29.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:54:59 -0700 (PDT)
Date:   Mon, 29 Mar 2021 15:54:53 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v5 06/19] mfd: Add ROHM BD71815 ID
Message-ID: <334c2fdfb79e8082144b11b18c976bcf86202f4f.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
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
