Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1EBE185C46
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2020 13:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgCOMOC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Mar 2020 08:14:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34889 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728467AbgCOMOC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Mar 2020 08:14:02 -0400
Received: by mail-pg1-f195.google.com with SMTP id 7so7951021pgr.2;
        Sun, 15 Mar 2020 05:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xt9aen6glpugYoFyf1MaMxd1EvbCcDykTNsFcB6umqc=;
        b=ke634LkSp/PrbzfM2jQsQNdYs+y5r+Qdaz1rrMslQz7Hi9Ef77NXc/APeCesIYck+2
         9c2MGXxoO01XxpX6uBAkgnhVYq7fGau47TCzsORnkfCp+HEa6TWuJ0stISHwpZheIW+G
         73TQ8IU/mKjiu/Cbey1aFnhm7UKpMneQddTsY/KcYERI1Q1LS2OeQ0I3n7mOn4Qg3w2X
         iEh/uPmQVQpRT3JC64nXkr6zNEZvZXSo6wjFp/vfNkP3GONwIgbYumPgdGm3vcRvXGd/
         d5rKF/JbeUhwUc3FzwYICsD6f0z9oXQZrJiOTAHB2FZ6MRf/amTbaPp8W9Wx4FnY46nG
         2Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xt9aen6glpugYoFyf1MaMxd1EvbCcDykTNsFcB6umqc=;
        b=lYtoetXql4tQnKe+DRoze5NcdzDpw74Ohgi4zEr1tujzaQoXRSFpV9AZ8kfNc/QRNT
         bml8QPd5SrKGlgPhMoq+FHKKa5P/Txf9JL0Ug3Q06muTs63avXaaQbgrgWvX5kqMBTmo
         NreaIBEUlOeogVpzUf0MpWriuwchFtpKutEwodHgOnluwYmypZa3/KIkjnWd1Kyy12QR
         cP5Czq/zUuTwgNAxsCv4iYAw1JEnzxLkyvt2EMAKJ+0RUshtKlChpC31h18lbzbzi397
         ev2uD1aHJg3mqV6zT8oQ0j4XCrdYiTllao4oj7G9ZVfiyPSzu3sEUXwiaC6qXhtufjQD
         HabQ==
X-Gm-Message-State: ANhLgQ2ZZkiNtyTX7F/Tb1CyELODX9Ynn557+8gTtC5s53WB0Kztjl9/
        E+md9fUkcRhbHwFAqNzF9yEcBvIH
X-Google-Smtp-Source: ADFU+vskFw6BpawuLYm63vwxn2euxVBEH/W3DZyNtWOfIAUMDBwwQ9XQF1T9TD0WjaFQwHgvsv4ubw==
X-Received: by 2002:a63:b4d:: with SMTP id a13mr20543302pgl.77.1584274440443;
        Sun, 15 Mar 2020 05:14:00 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:976:a075:bc02:9cda:8f71:1120])
        by smtp.gmail.com with ESMTPSA id 5sm19869025pfw.98.2020.03.15.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 05:13:59 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
Date:   Sun, 15 Mar 2020 20:13:36 +0800
Message-Id: <20200315121338.251362-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently gpio-hog doesn't work on gpio-mt7621 driver. On further
debugging, I noticed that set/clear register on this controller
only works on output pins. We need to setup pin direction before
writing values in bgpio_dir_out for a correct gpio-hog behavior.
This patchset introduces a new flag BGPIOF_NO_SET_ON_INPUT for
these kind of controller and set this flag for gpio-mt7621.

Chuanhong Guo (2):
  gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
  gpio: mt7621: add BGPIOF_NO_SET_ON_INPUT flag

 drivers/gpio/gpio-mmio.c    | 23 +++++++++++++++++++----
 drivers/gpio/gpio-mt7621.c  |  4 ++--
 include/linux/gpio/driver.h |  1 +
 3 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.24.1

