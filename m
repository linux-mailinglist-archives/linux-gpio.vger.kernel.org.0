Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616C66C026E
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 15:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjCSOhd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 10:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCSOhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 10:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B36419120
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679236605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XWzHgiL2NSowgeGQA1tqAXRb6Sm60VFytFuHZjvfdfI=;
        b=DbwWHx4rJVx0yPamKk51wf5URuBVBsAa56mbntjWxj+aklogfl1R3MluQmsvNlHaHre3D0
        RGQCbxSfy5AeSHw/Jeca7KGex5IOuIMrtUqk5u6QPrcS+G7N5I94J1HCnC9JejD7exOIsa
        H781kiYYn9dcKl7Ja1nlwZDHOAeUkUM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-k4dsMdTMMSqwJj-tooHuag-1; Sun, 19 Mar 2023 10:36:44 -0400
X-MC-Unique: k4dsMdTMMSqwJj-tooHuag-1
Received: by mail-qt1-f199.google.com with SMTP id l17-20020ac84cd1000000b003bfbae42753so5323763qtv.12
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679236604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWzHgiL2NSowgeGQA1tqAXRb6Sm60VFytFuHZjvfdfI=;
        b=2Fn96FXwXzkRUcFkkJCAKwqoG6HrNtGBLB/hVROaahLL+Tjxtwhz8BCq2rFRhAfQK0
         nMO0Cyoc2KYMepJ1Kc3DhhbU9wrB3syg9wsbfAQIMRrg7lBsqcLE6/8vbVXhDNUUpdox
         9o7Jch4PRE4KvNtLJZ1acDbyXF9cBUx3H/W5uYCdQq2KorDweXT/UX1et1RNQflwVGka
         7FuLb8TclByCrcHjQvxXlacJktZ6pdE4xz1BXy7ke95Ya4qI4CNJcSfYGJ1ADows78dP
         LJc16bNuVS5pQgLieClqAIaMDlU5SUt9ov8FRvxQuXIaDQuSZJE7koTXZVFq/wc9c33/
         tUfw==
X-Gm-Message-State: AO0yUKWV2FW8sH/BhN+96s6C2aBo27GTSZeSH3pI4F7+MAOv48gvv7Ty
        MHAD0VItk2PU6DavJKnoeLio9MUUeqXg/tbNZHCrIDesQ4xMigznHcrVTKkRcaKX2Sz4QVi1CaM
        /Ao8JoCKH3nbM6/6gNQ4dlA==
X-Received: by 2002:a05:622a:1214:b0:3e0:98f3:6cec with SMTP id y20-20020a05622a121400b003e098f36cecmr1856193qtx.44.1679236603786;
        Sun, 19 Mar 2023 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set+97Dibvhqhg/Ulk6oZwTmlmWDnkiUm3S+2qMc0ntf5rUqQTbBuvGEsBgE3pdJyCZ+fZ2xf9g==
X-Received: by 2002:a05:622a:1214:b0:3e0:98f3:6cec with SMTP id y20-20020a05622a121400b003e098f36cecmr1856174qtx.44.1679236603549;
        Sun, 19 Mar 2023 07:36:43 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id l16-20020ac84a90000000b003d4ee7879d0sm2756qtq.56.2023.03.19.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 07:36:43 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     robert.jarzmik@free.fr, linus.walleij@linaro.org, brgl@bgdev.pl,
        nathan@kernel.org, ndesaulniers@google.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] gpio: pxa: remove unused gpio_is_pxa_type function
Date:   Sun, 19 Mar 2023 10:36:40 -0400
Message-Id: <20230319143640.1704735-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

clang with W=1 reports
drivers/gpio/gpio-pxa.c:174:19: error: unused function
  'gpio_is_pxa_type' [-Werror,-Wunused-function]
static inline int gpio_is_pxa_type(int type)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpio/gpio-pxa.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 1198ab0305d0..a1630ed4b741 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -171,11 +171,6 @@ static inline struct pxa_gpio_bank *gpio_to_pxabank(struct gpio_chip *c,
 	return chip_to_pxachip(c)->banks + gpio / 32;
 }
 
-static inline int gpio_is_pxa_type(int type)
-{
-	return (type & MMP_GPIO) == 0;
-}
-
 static inline int gpio_is_mmp_type(int type)
 {
 	return (type & MMP_GPIO) != 0;
-- 
2.27.0

