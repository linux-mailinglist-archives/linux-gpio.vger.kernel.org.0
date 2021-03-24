Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4F7347285
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 08:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhCXHZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 03:25:57 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:33292 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhCXHZc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 03:25:32 -0400
Received: by mail-lf1-f45.google.com with SMTP id o126so20961781lfa.0;
        Wed, 24 Mar 2021 00:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6kmnlP2QnGoCPb0gD4i0nK1AFMHh6O90Yj7j+hOpTBg=;
        b=haSZwX/FnnUZirJ3TFAuUZljcgxHIuXhJrzINT/bO40J/e0jXrXjF/9myOeNMA10jY
         OeaZ69dLY0LGGLBkd+G7kwUnNx1iqkg0u4X4ec+F6kJreDWRAYr9e1QPY0xYq/VIOYsS
         JGI8tzPKvhjpbcGJ1vRdSSbSVjQdyCBkREidjXI8d/ik9UFfwOTc1J9F49bFnABd+OKZ
         SW2FiRNt0KFOR8BpxeiDAIy2XSeA+/nZLb1Abx2m/UFbZC+SbvuOCl7nW2nd3J11Vgcv
         UhY3TdO18E10IgW8crLTXoHGckVPMjhYy1pivwLXcVBz9ABa3nbeUUet8s6hIuvWW3Bc
         38fA==
X-Gm-Message-State: AOAM532Vg0AfUH4FiE/PgF1wAPCwjHeuepbZQ/yCZWl8YYeiHG/p3SPk
        OrCSp51n6M0Ca6l9qwFrKHU=
X-Google-Smtp-Source: ABdhPJwnRvqP3LtxA/P603zkfWgvi858pqOZBcn4yssJGlhxtt7SMMGbO4orxMDLc5oUyNdsr5wZAw==
X-Received: by 2002:a05:6512:b1a:: with SMTP id w26mr1156751lfu.206.1616570730929;
        Wed, 24 Mar 2021 00:25:30 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id v9sm146203lfa.32.2021.03.24.00.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 00:25:30 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:25:24 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        matti.vaittinen@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v4 06/16] mfd: Add ROHM BD71815 ID
Message-ID: <334c2fdfb79e8082144b11b18c976bcf86202f4f.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
this IC.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
Changes since v3:
  - ID added to middle of the list and not to the bottom

Please note, this patch is likely to cause (trivial) conflict with
the BD9576/BD9573 series.

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
