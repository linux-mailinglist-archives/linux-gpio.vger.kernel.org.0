Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D4D347288
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 08:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhCXH03 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 03:26:29 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:36580 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhCXH0J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 03:26:09 -0400
Received: by mail-lj1-f178.google.com with SMTP id z25so28903607lja.3;
        Wed, 24 Mar 2021 00:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8c9mvRdxm5dlbEUSzzwJS84KKJy+kfGcrt/7tq0hHWo=;
        b=H+Mr0QtZIImO/hLJeIM87H/3JVZ8khKbRW04Z3tES+vy9bkU4YpSWk1bv3hKY74YPI
         7ze7IVtQbblFuAYJY0TdkE4glOnLERt9dEhIcpKJI4zXepuG965W7e4OYHWArNn78SUZ
         lx6Qo5QPjWWXNROOTBzJytRj0F91oQYX3ASIPBbpaLAuCSKYabsjQ/tNAQcJ8xiYnmtg
         FdmyeTJxBGyddhWiZRAmdMrMGqYn3gk6rPAfalKJYR+npqx7OMJzUtkRCX3TfopAi1FU
         aVQbe23TIifQZPTiAyC8zv32Z8adx+pfEIJ9Mt9p+9oipjFZLbTkT5xbaRLSW95F4HpR
         T/4w==
X-Gm-Message-State: AOAM531pwtCb9Fv5eZib3LIPdH/WF0nUJVySoH41ot82jPpW0sD9qYOv
        ZDlyALWmbv4anAhOI9kqxfg=
X-Google-Smtp-Source: ABdhPJwoyEivzZ3Sx7PlQTDcvbt+IO9BJBhvEmtUWOXZXMGiCAt3p+RTu6Awdj0i0Squ9PDol3X4bw==
X-Received: by 2002:a05:651c:386:: with SMTP id e6mr1200074ljp.468.1616570767782;
        Wed, 24 Mar 2021 00:26:07 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id a14sm145660lfi.7.2021.03.24.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 00:26:07 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:26:01 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v4 07/16] mfd: Sort ROHM chip ID list for better readability
Message-ID: <136a118258e9d3fa60ad2732de67d2d723ade1ab.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sort the ID list so it is easier to see which ICs are present.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Suggested-by: Lee Jones <lee.jones@linaro.org>
---
Chnages since v3:
 - New patch

Please note, this patch is likely to cause (trivial) conflict with
the BD9576/BD9573 series.

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
