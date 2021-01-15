Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43EEA2F774D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 12:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbhAOLOF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 06:14:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbhAOLOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 06:14:04 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322ACC061794
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:13:24 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a9so5407200wrt.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 03:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AzKJj5cWWWzT2QsZ3EiZy4sHjArPM4im2MxI1O0nfxw=;
        b=VSvr1WXOO/bS3bGoS0n6UE30Sg/QE6lORSIzky+Rytn5X7UhhtpOJzt+/SSPiVob7V
         ryBXFKSqe7J3JQ+dfAwjza5rwkjO9haSltGJB/MlgQh1xyOXfy7k9izBWyFnJYZtc+tc
         OKJY5Vu9NqgMV5O6nI+1CsDNXtBMz8D2kQ8oDQ3XxOPA4XlHlVcGX98KHeyCHSK6LRNq
         7Wx14zIN1iHezkqGjlg4xGhv1U19xmG0IO8guubzT9gbyIhkCswlStKvZ0Fu+nf+045K
         7HO+0LTbdGKT7gyludHx6hyk7FFYhz4eG5pk1xk2cOeN3iXwvfzlX5zQDfmlez1K/Zru
         WXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AzKJj5cWWWzT2QsZ3EiZy4sHjArPM4im2MxI1O0nfxw=;
        b=fPmsR9N7bPRB++8iWqlLjW8bKMVAYOJtPqCgaIeUh2k7cbeOcB4P4ys9fTVbyBETMb
         EG0mPBfsacaR+pjakZ1xhHW2T5YRbEKG/h5BVt/FalTpSderltR8UEGvy+0a/yoS1SBD
         XDCtFCUbdWm4ns/pqji3U860s8bsox4cFOau+fNUk50IVmJOYLfe6gblLBteLJGLNw3/
         ZEzf+B2C0KGs07sckZiQMH7emRSeVklS3pIvU8atV7UKBrrqLUbgojJTDEwLKHZwwWcJ
         9r3DJHyuEOWrwoNvnKZ64Q6KZe3PZDovRsRxWgXDo++mriQKQsGJ7I2rktl2elcjHopE
         QZGw==
X-Gm-Message-State: AOAM530dlDg4LF6txL9L868X6dtTNk2fhUbPYaqhVcf4VduyOhtTq6aU
        FcTCertvp6tfEL4WOOLYC3KiKA==
X-Google-Smtp-Source: ABdhPJyhBXMiPWKIgbr0iq5QdMjou/MQ7iAM41aneGWcb2yruo7x+Ys0kzN4llFLX3BZGDPTmTrEGw==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr12239477wru.321.1610709202937;
        Fri, 15 Jan 2021 03:13:22 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id l1sm15048822wrq.64.2021.01.15.03.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:13:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/4] configfs: implement committable items and add sample code
Date:   Fri, 15 Jan 2021 12:13:07 +0100
Message-Id: <20210115111311.31601-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Committable items in configfs are well defined and documented but unfortunately
so far never implemented.

The use-case we have over at the GPIO subsystem is using configfs in
conjunction with sysfs to replace our current gpio-mockup testing module
with one that will be much more flexible and will allow complete coverage
of the GPIO uAPI.

The current gpio-mockup module is controlled using module parameters which
forces the user to reload it everytime they need to change the chip
configuration or layout and makes it difficult to extend its functionality.

Testing module based on configfs would allow fine-grained control over dummy
GPIO chips but since GPIO devices must be configured before they are
instantiated, we need committable items.

This implements them and adds code examples to configfs_sample module. The
first two patches are just cosmetic.

v1 -> v2:
- fix a 'set but not used' build warning reported by kernel test robot

v2 -> v3:
- use (1UL << bit) instead of BIT() in patch 2/4
- extend configfs_dump_one() to make it print the new flags
- clear the CONFIGFS_USET_DIR bit on the live group dirent

v3 -> v4:
- relax the attribute handling for the 'live' group: don't make all attributes
  read-only once their group is committed
- don't allow to change the dirent name of committable groups when renaming

Rebased on top of v5.11-rc3.

Bartosz Golaszewski (4):
  configfs: increase the item name length
  configfs: use (1UL << bit) for internal flags
  configfs: implement committable items
  samples: configfs: add a committable group

 Documentation/filesystems/configfs.rst |   6 +-
 fs/configfs/configfs_internal.h        |  22 ++-
 fs/configfs/dir.c                      | 244 ++++++++++++++++++++++++-
 include/linux/configfs.h               |   3 +-
 samples/configfs/configfs_sample.c     | 153 ++++++++++++++++
 5 files changed, 408 insertions(+), 20 deletions(-)

-- 
2.29.1

