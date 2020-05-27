Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82CB1E347B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 03:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgE0BLH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 21:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbgE0BLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 21:11:07 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF22C061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 18:11:07 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m7so9440804plt.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 18:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uy3asoaDED6J4XXGKgJlAsukMI1Ii8k5fjsFLI/2IeA=;
        b=TtQLvFzHOTL4tsLic+x9CbVeCpYWOv8sD/ho2LgzOyZkv23QvBZTICi3E98ZnZ+Vyt
         PkqQzii16fjs6m/jjLYz6cpaHDQ1IuO+4FII3jij1xflf0COCZMawTbBM0bx+QyKKgTS
         4RwFbrsziEtG2vsYtGJf1s7sIW7D88CpUtgDcjBND08wPVLIUyKC1AK8Iu4M0F2hH2c2
         HjTqvrq8JfSeKKFxoNB0xbVRsZjJDdhnb7WRod+Xp1m+rMLjIjl5DNp9ujz8GrI3lC7G
         VQjD70wTs8VMzRr1rWe633RKfqkTyC9+p2NvX3fnrkb4BceRSr371PQMrcqF3NB4zx8S
         Sstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uy3asoaDED6J4XXGKgJlAsukMI1Ii8k5fjsFLI/2IeA=;
        b=U+iENq+9IA/9ZRCh+t29vNc8rc4beNNjF7D+rITi+uEjAPfDo69jWTqUHTfqRSK9gl
         MM2x4REmqUEAcHDADugl30DqWgtLAqjrUxoC7e9U7FBT4o5gU1ZNGhAvt0gnfkcu599s
         MFp48INHnci7SlnCdCQaWCAzLDvkuYtk99tR0UOC249SV/+Nwwj09RU7wVCye5hRiTgz
         NYh3UpbGwuvK6ux33JiQQj3cAi5wFmxf5irhmkicRLA5Z4XJCGeXeLooX5bdRMrBgayk
         wmYdenxIXBZH84IChRP1NSJ9xagGErbl0KL2BeGuOIyPm4DCdZtlg/0AHxuL+atqUEK3
         mkHQ==
X-Gm-Message-State: AOAM533KKO4a5kgn11VkEPfVUuAkvcrjHdFjHUEynv9Ph8k6f4xn/+8r
        oeq1dzH0Z4BnuL7YNXnDZZ5Ay/vfT80=
X-Google-Smtp-Source: ABdhPJyZfXxmNZ/yWQGOHHGsehTb2OQwrNvibGSw9ediG/o5BARUJmyoy3iunYC/WqzCmVkPv2KTFw==
X-Received: by 2002:a17:902:7281:: with SMTP id d1mr3754719pll.78.1590541866158;
        Tue, 26 May 2020 18:11:06 -0700 (PDT)
Received: from sol.lan (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id u4sm968913pjf.3.2020.05.26.18.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 18:11:05 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] doc: fix comment mix up in gpiod.h
Date:   Wed, 27 May 2020 09:10:55 +0800
Message-Id: <20200527011055.12726-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A couple of the doc comments for GPIOD_LINE_REQUEST_XX values
document the wrong value.
Switch them so that they document the appropriate value.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 include/gpiod.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index 3af97c4..f03ce95 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -956,11 +956,11 @@ enum {
 	GPIOD_LINE_REQUEST_DIRECTION_OUTPUT,
 	/**< Request the line(s) for setting the GPIO line state. */
 	GPIOD_LINE_REQUEST_EVENT_FALLING_EDGE,
-	/**< Monitor both types of events. */
+	/**< Only watch falling edge events. */
 	GPIOD_LINE_REQUEST_EVENT_RISING_EDGE,
 	/**< Only watch rising edge events. */
 	GPIOD_LINE_REQUEST_EVENT_BOTH_EDGES,
-	/**< Only watch falling edge events. */
+	/**< Monitor both types of events. */
 };
 
 /**
-- 
2.26.2

