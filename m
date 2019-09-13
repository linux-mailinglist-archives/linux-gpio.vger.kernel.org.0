Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B879B176A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 05:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbfIMDWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 23:22:44 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37419 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfIMDWo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 23:22:44 -0400
Received: by mail-pg1-f194.google.com with SMTP id c17so6755120pgg.4;
        Thu, 12 Sep 2019 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mq3uEQUSbTsyi612FRhgkMJIVMuNd8+2nTcH+ZUp44U=;
        b=Gq0/8HV9ZJFm98E/55dcvt7PbBQWsjnj6H3fSoM6mmyNhFxKsdwg8JqHQRTeWdf7d2
         UZcD3feViQF5lAJH4PXoD3KbmjCeQtcIaaa98SNo6jESF8dQ6hxgj3bzRPr5xHR9YOoT
         nM1zts/CIUouiCp12Tptw9w9AwIc9ThpwqbaymF9UX3gejveOg7PeqqaBoFPoAiz11Km
         ub5qbwoj79GWKCVY9kRBpESD8KDfLrYtCfipdmItona6HU9FrHouZz/gE77ORzxUMGLe
         jc+zX4HttZWiK13aEr7+bZxGFSYcoDL2NbnPdcg2Mb28aLL5ycQ3Wcg3WYUys3ifYgj4
         NXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mq3uEQUSbTsyi612FRhgkMJIVMuNd8+2nTcH+ZUp44U=;
        b=rfLBGKeGnIeqfWJ4sWuB33z+oVkU40KOwmRGLzXMlpxMtt/YCtEPU7KWxpFssUXz88
         wi7V+1+e1lqoXEhZHRPA359lLj5BwMEeq/dz1xj7wR21qXlEvnqiQtBOT99BRY7j2TxH
         lR84wtYCWBFifJooH/YwgMtj6yE9COgtpnLQVxT/Mp9tUIdTa9ykecPtSvLtIiggFQfQ
         GCZOpPNtVvV4rAel7xkEfXjf7H0Gd6csmwCr7fhgsbVvzjmKwEFTOOlwhBOazbfRaDgp
         RFMAIyJ7P4+JkRa4y38vqE14hkwxjyIdu58Ttx1TERUYwV8DfrctPsafj+9HLgh0qL4y
         68Gw==
X-Gm-Message-State: APjAAAVDCei9rtyDpzRElORYAaqufD1i7QnkSWhcZ+Ca6W70JXQyJNDh
        6N5TGR9zVymCi5Lqw5SgV5g=
X-Google-Smtp-Source: APXvYqzGDU2p00rpKHHpgR0XKyIcdSAHlLJt1ols4C1Zo9DYgvfKJg2Rw8JMt0Hp+WH0ePmJorpdUA==
X-Received: by 2002:a17:90a:25a9:: with SMTP id k38mr2660559pje.12.1568344963350;
        Thu, 12 Sep 2019 20:22:43 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b2sm8060936pfd.81.2019.09.12.20.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 20:22:42 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/2] Add support for software nodes to gpiolib
Date:   Thu, 12 Sep 2019 20:22:37 -0700
Message-Id: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a part of the larger series previously posted at

https://lore.kernel.org/linux-gpio/20190911075215.78047-1-dmitry.torokhov@gmail.com

that was rebased on top of linux-gpio devel branch.

Changes in v2:
- switched export to be EXPORT_SYMBOL_GPL to match the new export
  markings for the rest of GPIO devres functions
- rebased on top of Linus W devel branch
- added Andy's Reviewed-by

Dmitry Torokhov (2):
  gpiolib: introduce devm_fwnode_gpiod_get_index()
  gpiolib: introduce fwnode_gpiod_get_index()

 drivers/gpio/gpiolib-devres.c | 33 ++++++---------------
 drivers/gpio/gpiolib.c        | 48 +++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h | 54 ++++++++++++++++++++++++++++-------
 3 files changed, 101 insertions(+), 34 deletions(-)

-- 
2.23.0.237.gc6a4ce50a0-goog

