Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2F12CD31D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 11:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgLCKFk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 05:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgLCKFj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 05:05:39 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7002CC061A4E
        for <linux-gpio@vger.kernel.org>; Thu,  3 Dec 2020 02:04:53 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so2145652wmc.5
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2020 02:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6aLvwe4DDhuNCWa3xe2/MVZsHiYDF1eB2I4SI7ikhk=;
        b=De+mWCKi5U9KQO8eXkxLPwFh1724TaBKRoSXnh6gwcIQERb0Y/C76Rpy5qvTv9AHuc
         jW0ELxiHKTehSmv3Mxt/JbjnDQnhQLCHnaBMBRJRVnIVB5UGRJRyy2Xp7Z4XLqerRN82
         s4HHXHtMF+m78ENYfVkCpTn+pug54LkKGOzIbYOJe0GXYloSsLWGf9hYPY5YIioXIg2h
         eFPZ+dcbH5JmIZBudnRHsGsApTsG4BQ4200KmdSED2qaXurFa9Vy5WA6PtzXnPORG/qm
         hOaseQAOpdwidM/AQoDqrBFOb/PPzdlRqFDFDP1kw6GFzOQJY7ECrrt1Gwzod9qpksbF
         haUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6aLvwe4DDhuNCWa3xe2/MVZsHiYDF1eB2I4SI7ikhk=;
        b=p11ydTaYwM/BdgR+xQZIjc7E4Q0E3LYfBlhpaUzOBDHv5YzJc/uz9DQTjBjQak+Nwu
         tCaA/94zRJPx0PmD2Xsmjgfq1UxyWck/lL1OjNtrzsNy9Z4UcKmscNQWURUGyoaAgG9d
         hWEk7O2l931I5SrIFqV7faHwbvYbdxqOKV2wJE32mZCnpvcTjbrDW99ySepOY8tGB1PP
         RuOP9+fj6HxxOYK3/yqzLAP1W1gmufV4huogq6pCAalmkQ8O4IwsP8e0c7NyyoAXraCv
         JDiG5bu/qhf6zDx6/BBHmW+9fOuNSmE3IZZvf/0Gx/pFaZcJ4cgMsz+tAMrO2WS4HOTk
         KBcA==
X-Gm-Message-State: AOAM533L0EXeaHHaBRTPCUpqiiN/E0uUEYCVCGxW/GezUR5Uudb68AQI
        SbguDSv3PCtTF70ouKB79tqDipAenpitZA==
X-Google-Smtp-Source: ABdhPJyjDRtCkGFrpQdfa5Gw+0T/hXcW1oEXojyx12vc3mybZBlXGxhAtGNR7gI4fPD//X5S/ihoCw==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr2429733wma.186.1606989892169;
        Thu, 03 Dec 2020 02:04:52 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id q17sm1103215wrr.53.2020.12.03.02.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 02:04:51 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.10-rc7
Date:   Thu,  3 Dec 2020 11:04:48 +0100
Message-Id: <20201203100448.17201-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

Here's a bunch of fixes for you. They're rebased on top of v5.10-rc6 because
the gpio-zynq patch depends on a function that's been merged this release
cycle but post rc1.

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.10-rc7

for you to fetch changes up to 7ee1a01e47403f72b9f38839a737692f6991263e:

  gpio: mvebu: fix potential user-after-free on probe (2020-12-02 12:01:51 +0100)

----------------------------------------------------------------
gpio fixes for v5.10-rc7

- disable pm_runtime in error path in gpio-arizona
- fix a NULL pointer dereference in gpio-dwapb
- fix a resource leak in gpio-zynq
- balance the freeing of pinctrl ranges if PINCTRL is not selected
- fix a potential use-after-free error in gpio-mvebu

----------------------------------------------------------------
Baruch Siach (1):
      gpio: mvebu: fix potential user-after-free on probe

Edmond Chung (1):
      gpiolib: Don't free if pin ranges are not defined

Luo Jiaxing (1):
      gpio: dwapb: fix NULL pointer dereference at dwapb_gpio_suspend()

Qinglang Miao (1):
      gpio: zynq: fix reference leak in zynq_gpio functions

Zheng Liang (1):
      gpio: arizona: disable pm_runtime in case of failure

 drivers/gpio/gpio-arizona.c |  1 +
 drivers/gpio/gpio-dwapb.c   |  2 ++
 drivers/gpio/gpio-mvebu.c   | 16 +++++++++++-----
 drivers/gpio/gpio-zynq.c    |  4 ++--
 drivers/gpio/gpiolib.c      |  5 +++++
 5 files changed, 21 insertions(+), 7 deletions(-)
