Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86FDBC30C1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 12:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfJAJ6H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 05:58:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40180 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJAJ6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 05:58:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id b24so2494816wmj.5
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etK08N7ZF6NsU8FkN/l/SbA8M1JK8ta03JqNnfXjkv8=;
        b=oRDN2kSg1LCOwYS0j4FwIkSeHW3CaVMQeO9Pkf/wL8geht+j72RgG9Tb82LIBOgCAb
         UhbObF0Cm7kvpLV9kRqONsfHxU1YQXPBlJ+NYjjxzEhf61RandPD8/gZMtlSoTYtUXsS
         bn9OurHEqAk+ffPg1DwEiHDuvQrZb+TO9EzPIxqV3GuMcaQrZTe4U6D54qHfvK3FX21l
         QSzinvw+MeuZAVgfw5CWG4BT304xmxFjSejFZAeuXn/gp1XhqO6JCsT3xRt3LnCtReK1
         Dco1kCsj1u4F6MFff46hs9USl7fWkCsclBDym7Ipa9ezaWTQ6ixfCJHLzG/uGJ0yPyus
         L2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etK08N7ZF6NsU8FkN/l/SbA8M1JK8ta03JqNnfXjkv8=;
        b=hcenixwBV5tELngc11IWLkg7pAlz4S2oBAMs+3fUa/sCsqbhGxNTjgh2Q/anfyOibq
         J/ggl+XFc1baBbEqZyWS78J10/4/ysgwLVJQKDSRw3x5U8JNb13sPIVxEKomHIFvndDg
         48Rla2Cz1ct2Kpj5t1rItEtOWNVZF79GBqBGtknGxlBzh0n449MOIqRIA+peeRffINHP
         Lbjv5j8cz+Og+Gie2Ubntk9BgHs4RI5p/3myAXgIjMMkt+b0yBcacISuLFSLWz74y7H7
         YxjnFbj3SKWeKCXgQg5FK2QVxT94EM//yKlri3A+paPoV0gTbwALUXiYBnCfh/pXRyA8
         +3NQ==
X-Gm-Message-State: APjAAAW1iG5fVYtKdmRRgHbX5CNamNWF7fpnPZV35jOaD+lAQXPF2upp
        jrfmhvAp3Ok/oP/UTRdvV8OAcA==
X-Google-Smtp-Source: APXvYqy8E6bf8MfLl+eEDckePorIebUX8j6kX8FG8kB5BpfwIlaGXxwp/Rlb5UDpyi4OfFaOcBbT3A==
X-Received: by 2002:a7b:cf38:: with SMTP id m24mr2672365wmg.24.1569923883691;
        Tue, 01 Oct 2019 02:58:03 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id z125sm4174909wme.37.2019.10.01.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 02:58:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.4-rc2
Date:   Tue,  1 Oct 2019 11:58:00 +0200
Message-Id: <20191001095800.28966-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

this is the previous PR rebased on top of v5.4-rc1. Please pull.

Bart

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-rc2-fixes-for-linus

for you to fetch changes up to e91aafcb51f3c5001ae76c3ee027beb0b8506447:

  gpio: eic: sprd: Fix the incorrect EIC offset when toggling (2019-10-01 11:50:40 +0200)

----------------------------------------------------------------
gpio: fixes for v5.4-rc2

- fix a bug with emulated open-drain/source where lines' values can no longer
  be changed
- fix getting nonexclusive gpiods from DT
- fix an incorrect offset for the level trigger in gpio-eic-sprd

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpiolib: don't clear FLAG_IS_OUT when emulating open-drain/open-source

Bruce Chen (1):
      gpio: eic: sprd: Fix the incorrect EIC offset when toggling

Marco Felsch (1):
      gpio: fix getting nonexclusive gpiods from DT

 drivers/gpio/gpio-eic-sprd.c |  7 ++++---
 drivers/gpio/gpiolib-of.c    |  2 +-
 drivers/gpio/gpiolib.c       | 27 +++++++++++++++++++--------
 3 files changed, 24 insertions(+), 12 deletions(-)
