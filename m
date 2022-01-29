Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EA64A2FB8
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jan 2022 14:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350313AbiA2NSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 08:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345290AbiA2NSM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 08:18:12 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE01C061714
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 05:18:12 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso5992075wmf.1
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 05:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vaxlZkb1Yc7DkWFR6LF/5+yc/tcLWU+qyPW6KDARZUg=;
        b=xlw7yHr6+G5+cDQ+fRwgSju3d9Me8SNQMr0mgkIor9xByMgZvvAgYXlhMBVolhhaa+
         amAb+cS3/C3IB5EVmROdmHQyxW5gJKwAGR98gzAz8NzsT1Wj3gXGUh8BngtGESIcWnjC
         /TIZNPkVl6tPD0CwRRT4mlCu7xrrE9DHpuucVuvRFybJxpi+QqtDe1PUKhjqkxf1kzil
         TdGOpY+MXimPIF76qnB4jOhrHadYPwBaOPepj8EgqChHP8/LmuPqRVcqtPPITnxoqDnY
         uQCjh46P4ckvJ5JybHY+ObuIJDXCnlPl3zawJlSWg6chgCJB83ZswTY2bMzEYnqjbEkb
         SRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vaxlZkb1Yc7DkWFR6LF/5+yc/tcLWU+qyPW6KDARZUg=;
        b=cqVvvrRpuOaTm/CRsEdsQmE1q1cx8IB+Sn/A47V8xE4zGIoF+PV0WgPAsuB8YtRurB
         cDrvqsr7ED3Ib8iO3sDA1JEndqsZLQSNkCIDq6AaxrDGVc1Kc/fvqEozFAny31FWFLsz
         L1sD6no6r4/hAaGMQeN8MejEDTHWxC28IS9DdMA0uHjPZZtKmcjqNgNkiwjwvFh+IjM8
         /sNhg2d+Rcw02GGaJ9p1l7ZJNQkTsLDccvBVRP7p13layEt3RyxamQk39njlthCmFb/S
         dUChIVKr9Rreq7MFoG+72qasmFlhZO4Q8lCgPKVqYmg1VB+1EjDDwEiTjSLJ//mDppvy
         vVWw==
X-Gm-Message-State: AOAM5320L66hoH/mH144CbKXHh02QjJApKugVkUmHd/14dL08RoecX8C
        rcN0EyQMLJLcsA9oAB104hgBGXLlI9YxRQ==
X-Google-Smtp-Source: ABdhPJx4pMm8q6FvsgJwaIaIrBocez7da/xdRAUTjcE6qK7RS+s3K18OOSzAp3S+PjWBAJUUkwVnWA==
X-Received: by 2002:a7b:c04d:: with SMTP id u13mr11062844wmc.156.1643462290536;
        Sat, 29 Jan 2022 05:18:10 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id t4sm4249503wmj.10.2022.01.29.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 05:18:10 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.17-rc2
Date:   Sat, 29 Jan 2022 14:18:08 +0100
Message-Id: <20220129131808.46682-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following two fixes for the gpio-simulator.

Best Regards,
Bartosz Golaszewski

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.17-rc2

for you to fetch changes up to 8aa0f94b0a8d5304ea1bd63bf1ed06f9e395e328:

  gpio: sim: add doc file to index file (2022-01-24 09:21:28 +0100)

----------------------------------------------------------------
gpio fixes for v5.17-rc2

- fix a bug with hogs not being set-up in gpio-sim when user-space sets the
  chip label to an empty string
- include the gpio-sim documentation in the index

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: sim: check the label length when setting up device properties

Randy Dunlap (1):
      gpio: sim: add doc file to index file

 Documentation/admin-guide/gpio/index.rst | 1 +
 drivers/gpio/gpio-sim.c                  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
