Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 959B457B7B8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jul 2022 15:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238818AbiGTNqO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jul 2022 09:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbiGTNqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jul 2022 09:46:12 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABFF56B8F
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 06:46:10 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id v28so12082532qkg.13
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jul 2022 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NkZcG9iivUG9vrFb2DsGA3snDOdpHOroJRIEaOrOQYs=;
        b=dEHT/6V8rFbWvXGx2zzlGqUi5hGeHONmuz/vP1ylpQdpo1M3qeQZpjLbig76xjayB+
         tHPgm2e0IQghX32LTgDYaE4aMNrz0+JV85hUde6t+ZVL/aD71tAc8f5G2tzEiVp07MQx
         5jILDZgBQmCTmYLRX9Hrt9PyDwZmvO91CC3OOjV28+lBsxxZWOWQ0sWQ1uQ0vAH25zBY
         zuxurQbh2+ZXPcTaT8AhZwmjIFNLvfHSq57WXBCHNrecBnX8Oit7cri8OzrwFa+84uyV
         AOV9oLuaxL2oV17Dv4asU9FsYW9aihEKGMqYogyPpxJK2d4iVFF2mtcsKTJTIH+WRC+x
         U+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NkZcG9iivUG9vrFb2DsGA3snDOdpHOroJRIEaOrOQYs=;
        b=OKgoQg/+enqfY1GbCDGdM3MXbVe2/JIUu+kwPxg1s1jwSi28Bmb0S2GN1rV9Lgb2NN
         V71KqEwnyOVXmCu2+5kseOabmhOjYdXOxFiVPNu4knuCQ51685qBJcM6oQ5dvCKmd4/J
         ecJ2VITPOUKvoR4sj/5/xyijY8bo2HemwPpSqH9m7ktVvfg1GDBxmPjscR6pMSPspBZT
         YByrCxEq40AajXvJHmeGZ9UdPzrebwRCI5/wU2g8XJGUAj2Jbw/hhYgFrW/KN4u0Lmo5
         x9o3COV+gsQ4HoMq6BxngdkyIz8f6EQGkGmNnYrkaraHYbEXtPb7k0UAv7/9LfEwqNgR
         O1Eg==
X-Gm-Message-State: AJIora+ZrNX2uZgtXIRnxaQsUYqz+2Y2MaHHb6ZQsAZFXYiSFJ3IPCiE
        5xgUcQROsqs1ZBYii4jptk1NkqWimg9a9g==
X-Google-Smtp-Source: AGRyM1uuD+e1QBk3GeuwgRXb4xpBUDg/YkfTEowvTKXr1LgAm1eFJWVvG7T1Yf8oqFEa9uQNs168fQ==
X-Received: by 2002:a37:65c8:0:b0:6b6:de7:4366 with SMTP id z191-20020a3765c8000000b006b60de74366mr2292972qkb.776.1658324770039;
        Wed, 20 Jul 2022 06:46:10 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id bl13-20020a05620a1a8d00b006b5f8f32a8fsm5289853qkb.114.2022.07.20.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:46:09 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>,
        John Hentges <jhentges@accesio.com>,
        Jay Dolan <jay.dolan@accesio.com>,
        Fred Eckert <Frede@cmslaser.com>,
        Paul Demetrotion <pdemetrotion@winsystems.com>,
        techsupport@winsystems.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [RESEND PATCH v4 0/6] gpio: Implement and utilize register structures for ISA drivers
Date:   Wed, 20 Jul 2022 09:45:56 -0400
Message-Id: <cover.1658324498.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rebased onto the gpio/for-next branch.

Changes in v4:
 - Cleanup superfluous header includes from drivers
 - Add note to CONFIG_GPIO_I8255 Kconfig that if built as a module the
   name will be 'gpio-i8255'
 - Remove 'const' from '__iomem' pointers
 - Replace ambiguous 'group' terminology with more understandable 'bank'
 - Use more natural '>= 4' expression to represent upper nibble
 - Refactor i8255_set_port() to take more common pattern of mask and
   bits

The PC104/ISA drivers were updated to use I/O memory accessor calls such
as ioread8()/iowrite8() in a previous patch series [0]. This
patchset is a continuation of the effort to improve the code readability
and reduce magic numbers by implementing and utilizing named register
data structures.

One of the benefits is that we can now observe more easily similarities
in devices that share similar interfaces; such as the i8255 interfaces
used by the 104-DIO-48E, 104-IDI-48, and GPIO-MM drivers -- as well as
the similar interface used by the 104-IDIO-16 and PCI-IDIO-16 drivers.

A new module supporting the Intel 8255 interface is introduced to
consolidate the common code found among the 104-DIO-48E, 104-IDI-48, and
GPIO-MM drivers.

[0] https://lore.kernel.org/all/cover.1652201921.git.william.gray@linaro.org/

William Breathitt Gray (6):
  gpio: ws16c48: Implement and utilize register structures
  gpio: 104-idio-16: Implement and utilize register structures
  gpio: i8255: Introduce the Intel 8255 interface library module
  gpio: 104-dio-48e: Implement and utilize register structures
  gpio: 104-idi-48: Implement and utilize register structures
  gpio: gpio-mm: Implement and utilize register structures

 MAINTAINERS                     |   6 +
 drivers/gpio/Kconfig            |  15 ++
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-104-dio-48e.c | 249 ++++++++-------------------
 drivers/gpio/gpio-104-idi-48.c  | 143 +++++++---------
 drivers/gpio/gpio-104-idio-16.c |  60 +++++--
 drivers/gpio/gpio-gpio-mm.c     | 202 +++++-----------------
 drivers/gpio/gpio-i8255.c       | 287 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-i8255.h       |  46 +++++
 drivers/gpio/gpio-ws16c48.c     | 120 +++++++++----
 10 files changed, 654 insertions(+), 475 deletions(-)
 create mode 100644 drivers/gpio/gpio-i8255.c
 create mode 100644 drivers/gpio/gpio-i8255.h


base-commit: c4371c56397340134c1827ab70dbf817dbb1b99b
-- 
2.36.1

