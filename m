Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDF547E64E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Dec 2021 17:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235510AbhLWQWQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Dec 2021 11:22:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233575AbhLWQWP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Dec 2021 11:22:15 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37514C061401
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:22:15 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id s1so12467648wra.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 Dec 2021 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhXkMPwGBcSiPIpTPBgElSyd1pb6V+FAdMLbsowPpAo=;
        b=l0bK405IzA9dOS9RCKUDC2HVVCiW9v+mP19KiOl1DCzpA8d5Cb8xPWWTSv2NVfgxjk
         ZPWLbD4lJNM+fQwX0gAT1x8Y5xnxRNv/KQXYOUPR2cULEqX3TaRSSx/9F6FUTxfOrvot
         4A586SbASZzQyo8YDFmqH+KV3jCi51Az4eYh8G0AeVH6X4ox09PzEAgDfkpU+VqhnzRg
         4uZ7eHckjnkwFqVrGAIbPA76K8LwS1RY9XhU32I6tPgTxeX+srrBH3WxmDdN7vykRNb/
         G/OzvpM9QYPWH8MP0eg2SzSvOaKEOOffiu4cX/0pxVIrYqRistAxfbHGJ6Ig8cOOy9Jv
         Gtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhXkMPwGBcSiPIpTPBgElSyd1pb6V+FAdMLbsowPpAo=;
        b=ayrlpqx4AKvUWZsYvxoIuNCZzUsTr7dlYI+1UCxCPTljLgoqOG5x7HM/0gqmeSihjY
         BrFtKr82Z/vkHiRtBzc2OfKrkrdzKysN4QVHEnrGJ+HmG2++mDOAksF0M2MlM9U9tc6z
         CrUYkGYFheMKZ2uyudlHEiekxCAGPoCHCRi2i4gf7cHRnXjNTgO4zvfhwKuBCF3UPzTU
         Xi1SIhHsH/PJ5s4I/saBj0fOOn3oXlCiHkNcblHYdiuu1LFGxhoB1CWeDKDGTjQaXG+6
         dRJvKK8y1F6hCIjk7Am0MaMJuEDR+8pSa6OkV/E2BwLbIhVinn7weHdIgn5KoH68NhOh
         aNow==
X-Gm-Message-State: AOAM5323mP+L9r/0aXue9KMldZXwO5DJH/4+qKSe4tugl82L9Nk7ysHM
        EL7NjdKPzm450OTERLjkpXx+Ug==
X-Google-Smtp-Source: ABdhPJykmvluCdyMXmFAJL7sq1JZ3lSc9YQVLVSIJEt3A/VIsOFSUeNE/c4uuGcjHZEeFk6OyoVOqA==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr2189264wrv.135.1640276533808;
        Thu, 23 Dec 2021 08:22:13 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j13sm9440166wmq.11.2021.12.23.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 08:22:13 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.16-rc7
Date:   Thu, 23 Dec 2021 17:22:09 +0100
Message-Id: <20211223162209.26870-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Here are two more fixes from the GPIO subsystem for this release cycle.

Please pull,
Bartosz

The following changes since commit d6912b1251b47e6b04ea8c8881dfb35a6e7a3e29:

  gpio: rockchip: needs GENERIC_IRQ_CHIP to fix build errors (2021-11-16 09:41:44 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.16-rc7

for you to fetch changes up to 3e4d9a485029aa9e172dab5420abe775fd86f8e8:

  gpio: virtio: remove timeout (2021-12-21 16:22:58 +0100)

----------------------------------------------------------------
gpio fixes for v5.16-rc7

- fix interrupts when replugging the device in gpio-dln2
- remove the arbitrary timeout on virtio requests from gpio-virtio

----------------------------------------------------------------
Noralf Trønnes (1):
      gpio: dln2: Fix interrupts when replugging the device

Vincent Whitchurch (1):
      gpio: virtio: remove timeout

 drivers/gpio/gpio-dln2.c   | 19 +++++++++----------
 drivers/gpio/gpio-virtio.c |  6 +-----
 2 files changed, 10 insertions(+), 15 deletions(-)
