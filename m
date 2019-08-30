Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C37A31BA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 09:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfH3H7B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 03:59:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54712 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbfH3H7A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Aug 2019 03:59:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id k2so4833174wmj.4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2019 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SffYeumq/rrdto7bvJgAwzCzqlWaAztrMj2xrDbbb6s=;
        b=jGENo/CmCATXOT1IPmsVIgrEOl49ukFPGwJBiRlYr8QxC3VuQiP0pzh44i61w7XTyL
         HoBYX+KeatZimQYlFaPedRDl3wxWx8zkJdkzPWmBxWO2FVfo2agWqidmn9oZDmbsnnuB
         qz8clvE5tF7qXDe7qH+ewPv6NGrGwNWseIzgggvyX888S848jzEKBLGQACypCUCGfMXt
         r3glp6BolT6CQNxZO8uJjoGepf9d7wnx7+l42EtmD5NQYix6e8o8aRaIVyHH2f6SzwEK
         pXL6BiTpWLWwXLSNkPo0mMgfpHDz1HTWmRDWapiivZWpXkZA8GDlXy2CjYBMm/O+3C6a
         7Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SffYeumq/rrdto7bvJgAwzCzqlWaAztrMj2xrDbbb6s=;
        b=YYjnR1EfMgc/F8YcO3jk2+KJ4Z11IMp2FPHzSvSDYzWFOz53kgjmsrXvEKdp6Gb3f2
         Y0GuDKeSwvjIZ3JnMdtlGfJ/ayX8tVUPm+YVQWPlKeIb8pNGSw8zwjxQGhNTlguOWc2V
         jOe5sPH7xc+SEYjutO9mjaY8SjIy6jJTRgH5pHynzWSPRmCgPaF1/ZXqkH+wm5eQalmC
         PPS+s8DgkM/eYBA+uKaYEKdvHRkzMjN1dxL5T0M31aXrmdJcff70/IT/YRwbiztPoy7f
         a4tI+45VdqX11oW6njsDhJSJROKEs5Hpeo7fQ561UpNrQbpv9b5zCOg2nMm0NJgp5Yhr
         +7yw==
X-Gm-Message-State: APjAAAUI4HjSCJiaQpsSUEKRd9rfEwq0Fv88UlLLi6YfmdLnp/FJHu7Z
        5u8qKgP/az27vywiHwBbe1R9FTb6D2c=
X-Google-Smtp-Source: APXvYqzuBbi97NyfcaMaM+IUB5Fmj1KLImLzG6NWMz/JUthe5DQYs/2TmK9VDs+TjFbEBJ2sO34I7w==
X-Received: by 2002:a1c:a481:: with SMTP id n123mr15517754wme.123.1567151938644;
        Fri, 30 Aug 2019 00:58:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id o25sm3539164wmc.36.2019.08.30.00.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 00:58:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.3-rc7
Date:   Fri, 30 Aug 2019 09:58:56 +0200
Message-Id: <20190830075856.9261-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following fixes for a regression in pca953x.

The following changes since commit a55aa89aab90fae7c815b0551b07be37db359d76:

  Linux 5.3-rc6 (2019-08-25 12:01:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.3-rc7-fixes-for-linus

for you to fetch changes up to 438b6c20e6161a1a7542490baa093c86732f77d6:

  gpio: pca953x: use pca953x_read_regs instead of regmap_bulk_read (2019-08-28 12:55:24 +0200)

----------------------------------------------------------------
gpio fixes for v5.3-rc7

- two patches fixing a regression in the pca953x driver

----------------------------------------------------------------
David Jander (2):
      gpio: pca953x: correct type of reg_direction
      gpio: pca953x: use pca953x_read_regs instead of regmap_bulk_read

 drivers/gpio/gpio-pca953x.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)
