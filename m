Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B08330B79
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 11:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhCHKlr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 05:41:47 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:45972 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbhCHKlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 05:41:20 -0500
Received: by mail-lj1-f180.google.com with SMTP id c19so7111595ljn.12;
        Mon, 08 Mar 2021 02:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VQrerSjNZ7YsBiG8Rj4DdqPzbZZhTzxkQIdIUI3vBzA=;
        b=tGw/8AtXYGv63eHW+PseRKVL1db1h++V3yHbxKIVauqjuBKBilj4zeG9gCZRaSp2ZO
         Nvl3dMJCcnrGjt5jlrV+MYqQcaQSA3LKkhCyj4ttKQd5NjWbPGJywRtqFHJ5/xT6YAPm
         kY6Da385l+z2+4VAK33rwnAgHwl5IZuRBC6fP0uu4UgctE3+6KzRDVb5ICtCid1NGxEK
         +zl8OnWBfABsnf/XgFRNb/WAU46LwYuFAA7q9kCNzOFUcKtVDXsNRtC8pOubGrD4ruWt
         J/H0v6tagzxMl9ZuPG9W98BqKz/JKX1+lXihTjBb2/cBor4fYmjW80vWlfulhCrGCPgk
         3mmQ==
X-Gm-Message-State: AOAM5326zOD34k7wUtx/QF/C+9tjrX3DRRhd3GGL62F9h/Up7LoPr/DM
        M2z5xUecH/sf/xErDOi0txU=
X-Google-Smtp-Source: ABdhPJwLznT10lUJKWYERwLTrr4oDGHmGgtVVQ4XHq0DMhPXXL1rufgRTAze/KXB4r310zWLRrKH3w==
X-Received: by 2002:a2e:3308:: with SMTP id d8mr13049700ljc.100.1615200079081;
        Mon, 08 Mar 2021 02:41:19 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id f8sm1428769ljp.24.2021.03.08.02.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:41:18 -0800 (PST)
Date:   Mon, 8 Mar 2021 12:41:13 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Message-ID: <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
this IC.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mfd/rohm-generic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 66f673c35303..e5392bcbc098 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -14,6 +14,7 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71828,
 	ROHM_CHIP_TYPE_BD9571,
 	ROHM_CHIP_TYPE_BD9574,
+	ROHM_CHIP_TYPE_BD71815,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
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
