Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62736193E5
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 23:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfEIVBT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 17:01:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40477 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfEIVBT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 17:01:19 -0400
Received: by mail-pl1-f196.google.com with SMTP id b3so1713886plr.7;
        Thu, 09 May 2019 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HiuXIyYLdmsAYU6zvL+k+NRqP/Z17rWpYIQBydjoiww=;
        b=p5q8KobLVi5edHgQ6CguPyLD2oE0Vj0uuNMeT13IKga4CeJPBxJ045FvYlbPdKgkVG
         KNRVHGuossb5kf4g3Cqi9vTFc7+/1DdhVZJoc5aD41kJ0xsLXFVk1jwl1hGKvKh9aR3V
         oHBwjetUfosixvCiPwkjEA4T9cN0IxGJCWz8qqWcfz3GJx0n+ICGyyE1HLPDlTKTwy0a
         c31mCmHqfpTGU9ASAKA7ithdmMuD1aIOhwebdXG70EZ1ru9obYde2uI6pESM00RYPvN3
         8LSrDi0XTbk0KcEDWOP63SAkWJPVlhDR6ZgwRW3xoeTzghmFs1zSXobjmSvTY5HmGs1t
         8oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HiuXIyYLdmsAYU6zvL+k+NRqP/Z17rWpYIQBydjoiww=;
        b=rZVY04c4RW3EjB3T9220ZHFN6pQJKJCvdBZlkxnvjeJCmR8fDUq1YNUUuTswYMBT8N
         2+EKgzkg7UnZs2kJy1adVWRsTh0yc4+1RU7+/8PLjhrB95yzuwUsip2TL/yqysMElsKl
         +MtIQVjv5uq+rAaHXBiSbjR499fYzKRuhJJklLnI3PutYw/cjHqo609v620SXcXgM29S
         w8VUnP1wucc/2LxD8i64vPU+Bxdasdte0p/i9M23we0RrSM3Ayv0wQwtp5sTjjzTY/0K
         h/Z1jTYRkRPbuqO7MyEqiUhmmmuoOUQbkO2awfhhnmrXo5FeCIiMp3W4mynhDEFWSEdi
         VC1g==
X-Gm-Message-State: APjAAAUzOtN6rr6aY4w8/chepH7YhAsGXeDD+XWsgbDwU2a6xiCeIvg3
        yLkdq3Wh67F3cnl9fDr5FTs=
X-Google-Smtp-Source: APXvYqwPPVJPZR7Ngz7iUDd5Xh+3EilFjMx5Kc5mIo1MpJqawPOja005npdCY5gWF1YEA35rO2073Q==
X-Received: by 2002:a17:902:bd86:: with SMTP id q6mr8273799pls.152.1557435678642;
        Thu, 09 May 2019 14:01:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id d15sm10989209pfm.186.2019.05.09.14.01.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:01:17 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Doug Berger <opendmb@gmail.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Al Cooper <alcooperx@gmail.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB
Date:   Thu,  9 May 2019 13:59:52 -0700
Message-Id: <20190509205955.27842-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

This patch series allows making use of the pinctrl-bcm2835 driver on
ARCH_BRCMSTB where it is also used. Binding document is updated, and
then the Kconfig language is updated to allow selecting this driver with
ARCH_BRCMSTB, finally, Al updates the logic to account for the
additional registers that were added on 7211.

Thanks!

Al Cooper (1):
  pinctrl: bcm2835: bcm7211: Add support for 7211 pull-up functionality

Doug Berger (1):
  pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB

Florian Fainelli (1):
  dt-bindings: pinctrl: bcm2835-gpio: Document BCM7211 compatible

 .../bindings/pinctrl/brcm,bcm2835-gpio.txt    |  3 +
 drivers/pinctrl/bcm/Kconfig                   |  6 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 85 +++++++++++++++++--
 3 files changed, 88 insertions(+), 6 deletions(-)

-- 
2.17.1

