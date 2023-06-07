Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F967255DF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jun 2023 09:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239263AbjFGHhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jun 2023 03:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239314AbjFGHgK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2023 03:36:10 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3E91FE2
        for <linux-gpio@vger.kernel.org>; Wed,  7 Jun 2023 00:36:00 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30c4775d05bso5092881f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jun 2023 00:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686123358; x=1688715358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xXPlJxqNYA+c+OB6Vq322/8+DCYLrTqy+2i31a96uvY=;
        b=Wsv7QCTn5RKBrxf5v+KuZWbLhxZfvYla/Frgq3cBpmiIaULvxjsOLFePdwaa6gvo7M
         BnRZpQXSMEH86G3e6La4w1g8w0Pl9IRJsWkDfS4J5Vv65YkYLcMfn+ijy0weNHX1UlSd
         5TKP/8J0W8lQiToRjCpO/TIVws4SHZVKxgGPt0hkYOrwhJ0Xwq1nMFbBe7DI9eGPomwk
         hT00ANo88ivSXlssok9gl1xS0hnoHIsDo56bUl1iBNNNXD5aUQZgzRuFG0BaJgDLFf+V
         GQC7V+syFPr9QmSIs7qa0gzL1QijbMHfKwFegN619vFV3AfjRU8nKj/6z0KNhtUHq4Ut
         uL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123358; x=1688715358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXPlJxqNYA+c+OB6Vq322/8+DCYLrTqy+2i31a96uvY=;
        b=c2G7B+UOd5f1i/vmq0M3LhVB1jiE5W3Z4Mqqm+0P3xXvkC6AXe9m1xd7h5vUBMCN/F
         sHi/qiXX1TkYSVR5+7r0xNiecWF1s5HQX3bePZ9TxLglAVRIyapsKlzMspojzCtZpmv4
         LaQLr0HXQyTYrhhBWGaZOuxkVgy8EnYF5jp2botAd0X54DKXYgerwmbAAw43z4sArIjF
         cxovc3olHseb28WGaf/YQ7SbIh8lrAngIMI4n4vHlUL9K8xmgjmz+gWAhjsktbsguCFa
         zM7y1EzY7zGniASmXFEgEHlyy0Okw86bbCkk1qg2cUAprsaVBbBqwjqvKekirBqUalen
         xnfw==
X-Gm-Message-State: AC+VfDx4reGR8sYqNKiNVh+vfU0xfjpE2lTgVe3GcOQ2Oo6fItRcy0kP
        GPhMQCQt+a/dOda0fpyC9FzgwQ==
X-Google-Smtp-Source: ACHHUZ6pkfOS6ylQ0PNrxCc0avx5xX1GDHoxtLIEBxFREHexj3fCDTsaZuBKBp+tSqaiY8ta2bVYzg==
X-Received: by 2002:adf:f341:0:b0:30e:4631:d82e with SMTP id e1-20020adff341000000b0030e4631d82emr3739352wrp.8.1686123358546;
        Wed, 07 Jun 2023 00:35:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bb7a:57b:599f:1011])
        by smtp.gmail.com with ESMTPSA id j14-20020adfff8e000000b0030af8da022dsm14510523wrr.44.2023.06.07.00.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:35:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v2] MAINTAINERS: add Andy Shevchenko as reviewer for the GPIO subsystem
Date:   Wed,  7 Jun 2023 09:35:54 +0200
Message-Id: <20230607073554.6251-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy has been a de-facto reviewer for all things GPIO for a long time so
let's make it official.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v1 -> v2:
- use Andy's kernel.org email address

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..d847e9aa8088 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8799,6 +8799,7 @@ F:	include/linux/gpio/regmap.h
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
+R:	Andy Shevchenko <andy@kernel.org>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
-- 
2.39.2

