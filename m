Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C947E0951
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 20:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjKCTPH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 15:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjKCTPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 15:15:07 -0400
Received: from mail-wr1-x461.google.com (mail-wr1-x461.google.com [IPv6:2a00:1450:4864:20::461])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84B4D51
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 12:15:00 -0700 (PDT)
Received: by mail-wr1-x461.google.com with SMTP id ffacd0b85a97d-32fb95dfe99so512529f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699038899; x=1699643699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d674onrrLvCtMopWGzODVvgOe+Z9nwSN0YIsFhe0KZE=;
        b=chAHieLtYBQwcHMRZDHxfhtpn9WE5PLDt00AuKysZsoKCRKL+xNIIdluJpz8DieLKM
         7wJQMEdREmuFN5cf0j0+92FDjd9raYZ8tEAKrpMDlztF/NRPlNR3ecbnyaOe6qKp0DF5
         MvugJBGfhVJu0rX97IR5QafOjm60Ea9d8Ik2BZYi+vwrGYW1TwRtLpe32SEkUfeHEX3L
         FwCi/u0MZJaXcXIdshJK3z6qFKl1yG76GCIFtNI2T/Zq680xcwzcQjlz/08P05vyrFGx
         Py6SiQWg23WMKYkbLsEPnJ71dbxUwXF7DBG5X5XmljfRnmX51xFTeYFzhrK+jd/CsmeC
         YW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699038899; x=1699643699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d674onrrLvCtMopWGzODVvgOe+Z9nwSN0YIsFhe0KZE=;
        b=C29FoofvTsyT0zp14sL+uKf1mKPnMz/FC0KzEZymhk4kY96e2sJPGdRkCqvA8J2kdP
         PKTbDgmr5/1VIYkndaQAmRPoOQ2bdLqn8XvQFel5piY3hCpC/uaddn3XkNrEXBOAgP09
         Qpw1mWmNZtmA0iL8hPS0edK0aKdoQvNNBveT2njARcNEY7ESJd+J5Mtfi3cmM6nfdY7s
         iNylbC6EcTjYxyIVd2+Q8lDMh+o5w+3wUIw+UytE0vRx0oTZztg9YRVPbileHspByG22
         XYPHIOaJtIPjs4oqsLzdlEB2AYu8ejP3L8e2EHHTTFkXrzSfn/p8f9v8P0mQfNEIyuBB
         PArQ==
X-Gm-Message-State: AOJu0YxQGqJHBxlOih7I8OSNZxncgeMSjAtYsnhtM2L8jijeRhbFrY6P
        kU8p541UIJowfbycdQfUjy0jLKHWjztSV20QheVyZaL8X2thqA==
X-Google-Smtp-Source: AGHT+IHzGcxdeEmhg8f6liUUxTAHKRWT9LVj5WrYMel00HDXzybZgIrgDfkp8U8q24ObIqMohCTq8wPix8da
X-Received: by 2002:a5d:6c63:0:b0:32f:7fe4:45f2 with SMTP id r3-20020a5d6c63000000b0032f7fe445f2mr15266666wrz.4.1699038899042;
        Fri, 03 Nov 2023 12:14:59 -0700 (PDT)
Received: from pop-os.. (cpc91242-cmbg18-2-0-cust972.5-4.cable.virginm.net. [82.8.131.205])
        by smtp-relay.gmail.com with ESMTPS id o7-20020a05600002c700b003196eead436sm1239610wry.94.2023.11.03.12.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 12:14:59 -0700 (PDT)
X-Relaying-Domain: gadgetoid.com
From:   Phil Howard <phil@gadgetoid.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, Phil Howard <phil@gadgetoid.com>
Subject: [libgpiod][PATCH] bindings: python: fix README.md SPDX license tags
Date:   Fri,  3 Nov 2023 19:14:55 +0000
Message-Id: <20231103191455.2441883-1-phil@gadgetoid.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the # (which is a markdown heading) with HTML tags to hide SPDX
identifier tags within the project description on pypi.

Signed-off-by: Phil Howard <phil@gadgetoid.com>
---
 bindings/python/README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/python/README.md b/bindings/python/README.md
index abb69da..325c63d 100644
--- a/bindings/python/README.md
+++ b/bindings/python/README.md
@@ -1,5 +1,5 @@
-# SPDX-License-Identifier: CC-BY-SA-4.0
-# SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com>
+<!-- SPDX-License-Identifier: CC-BY-SA-4.0 -->
+<!-- SPDX-FileCopyrightText: 2023 Phil Howard <phil@gadgetoid.com> -->
 
 # gpiod
 
-- 
2.34.1

