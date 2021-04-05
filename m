Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA393541B4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 13:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbhDELmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 07:42:49 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:40680 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235083AbhDELmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Apr 2021 07:42:49 -0400
Received: by mail-lf1-f48.google.com with SMTP id d13so16976059lfg.7;
        Mon, 05 Apr 2021 04:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mtTYC3Y2jaT3AOBBoCforFdwsVp/bbxeq6kYdIhJlRU=;
        b=QuLWGQvDsW6hOuKIeUOhLK+K5E12nSUcbw5DgTZpAMrD7lva039JdJoo6upvbVUyi0
         vru8j5RylWtE3lDw/pdcWEJh5fFehc8tnmBOofBfKF9LDTkIFQus9hkpDmdbSqEaCT6m
         qYyft1jXzszuGQb6tlz2xWaWzROK5Z4wQfs07DCUpHmvfI9gVLrxcR0bIfdrbOGA84Sq
         IcLsaBBPNv790NWsUye4gcf4S0VFG1ps8y6wfBLfuTudYnFg1jdTLF+415fKLtp445GO
         +jymFwno0NrAfZ7eXowLxLuXNDHUaMvKU97jtOoFNE0ytaptKf5sMGCQ1cvwDXeGzVDt
         DUMg==
X-Gm-Message-State: AOAM533T5EaTHBTzzKW6wMf1HTSjr8qyeFSKX2k73JwJXJXb2Tii1Mlb
        NUcicKRZfMPxplEpFyLyQ78=
X-Google-Smtp-Source: ABdhPJzCnwq9g2tEDBKzF5AkirHysK2+1jtV1IYxqeks/rjOayigwg99L7VGZWoZ+QqJVZJIlY3vyA==
X-Received: by 2002:a05:6512:238c:: with SMTP id c12mr17744689lfv.200.1617622960294;
        Mon, 05 Apr 2021 04:42:40 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id f8sm1533044lfk.148.2021.04.05.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 04:42:39 -0700 (PDT)
Date:   Mon, 5 Apr 2021 14:42:34 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v6 07/16] mfd: Sort ROHM chip ID list for better readability
Message-ID: <dfe6ad999f894204ee0aff57ac7b2b27555e5d60.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sort the ID list so it is easier to see which ICs are present.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Suggested-by: Lee Jones <lee.jones@linaro.org>
---
No changes since v4

 include/linux/mfd/rohm-generic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index e107b4769101..9e2880e06950 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -8,13 +8,13 @@
 #include <linux/regulator/driver.h>
 
 enum rohm_chip_type {
-	ROHM_CHIP_TYPE_BD71837 = 0,
-	ROHM_CHIP_TYPE_BD71847,
+	ROHM_CHIP_TYPE_BD9571,
+	ROHM_CHIP_TYPE_BD9574,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71815,
 	ROHM_CHIP_TYPE_BD71828,
-	ROHM_CHIP_TYPE_BD9571,
-	ROHM_CHIP_TYPE_BD9574,
+	ROHM_CHIP_TYPE_BD71837,
+	ROHM_CHIP_TYPE_BD71847,
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
