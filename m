Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8275A4725D4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 10:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbhLMJqf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 04:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235309AbhLMJod (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 04:44:33 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8325EC08EAFB
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 01:40:50 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id j11so14075027pgs.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJJIkvkgCUgy0Bnr8sTa1h8wUIUSrsU0wq9uYf92fAg=;
        b=OHbCXvqdFWCy9fI4cOobFHeTChcJafP95KYGGeBIpuKnVw1/g/9jYkJURh3vXQLC4D
         nglaglCvZb91mNE3cMKDjf00t5sBoEoN9yoU1lxG336RlYI4pzXsBmvCO/i0UD69MUXD
         v0yGSrCAnjaK9vxeLkUTrr6SwSD1Sdk/fCnQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yJJIkvkgCUgy0Bnr8sTa1h8wUIUSrsU0wq9uYf92fAg=;
        b=u7wHJP9FkcncFjph0ta+TZWLQFwvdkX8LJvoCiP1kG4V86iXqESWlRIT/n36fdPaUb
         L4F4JgvTPwWpSmiobgDDtOkOsVxE3+PGiY0188iCF31H2Bl7cNwakd3NY4TESViGN4sZ
         mxCdOwnLIwOnUt8WcHPmOIW1yn9DzpT2C51NMuaJqGVSE1YcDHZ4TVuS0gZdbYI9n30Y
         QpX7RLA6axQQOKzgIfx8me7XP9vUmVGBOA2SlcGbcAbemQyzkGGyeKMoEOqOyApoz87k
         a0wG67pU2bAxkSHhl/tt5o9MWjr80nDBVn7tMmFD6qt/IhJWYv8uhb0YrKdAunbovYTP
         Do1w==
X-Gm-Message-State: AOAM531t5RY3p5ISfh5Od0ElVUQtO4W2qUhCOrFH/Orcmvj/MVasTk5m
        8dRECq6F3SF33P0a/c5iswR2ug==
X-Google-Smtp-Source: ABdhPJyGmBG0e9IkI3PggZ6vlLRHWZbOsipMG905x7iNuc3pYZ+ygr1loGaIeGk7ZlbjomoAKYRe4A==
X-Received: by 2002:a63:8849:: with SMTP id l70mr8316939pgd.433.1639388449926;
        Mon, 13 Dec 2021 01:40:49 -0800 (PST)
Received: from shiro.work (p864106-ipngn200510sizuokaden.shizuoka.ocn.ne.jp. [180.9.58.106])
        by smtp.googlemail.com with ESMTPSA id d195sm10237609pga.41.2021.12.13.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 01:40:49 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3 0/5] gpio: msc313: Add gpio support for ssd20xd
Date:   Mon, 13 Dec 2021 18:40:31 +0900
Message-Id: <20211213094036.1787950-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus and Bartosz,

As suggested by Linus I have dropped the DTS commits that were
in the series to add a usage of this code to a target.
If possible can you take the first 4 commits for the GPIO driver
for me? The final DTS commit will go via our tree.

Original blurb:

This is a little series to add a compatible string for the Sigmastar
SSD201 and SSD202D to the msc313 gpio driver, add the specific offsets
for the pins on these chips.

Changes since v2:
  - No code changes, dropped the UnitV2 DTS bits.
    I'll send a new series for that later.

Changes since v1:
  - Add a fix for the led binding to squash the warning about the
    activity trigger in the unitv2 dts.
  - Fix up the regulator node names so they pass dtb check

Daniel Palmer (5):
  dt-bindings: gpio: msc313: Add compatible for ssd20xd
  dt-bindings: gpio: msc313: Add offsets for ssd20xd
  gpio: msc313: Code clean ups
  gpio: msc313: Add support for SSD201 and SSD202D
  ARM: dts: mstar: Set gpio compatible for ssd20xd

 .../bindings/gpio/mstar,msc313-gpio.yaml      |   4 +-
 .../boot/dts/mstar-infinity2m-ssd20xd.dtsi    |   5 +
 drivers/gpio/gpio-msc313.c                    | 266 +++++++++++++++++-
 include/dt-bindings/gpio/msc313-gpio.h        |  71 +++++
 4 files changed, 341 insertions(+), 5 deletions(-)

-- 
2.34.1

