Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C52125BBB1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 09:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgICHa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 03:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgICHa1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 03:30:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D51C061244;
        Thu,  3 Sep 2020 00:30:26 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o20so1569852pfp.11;
        Thu, 03 Sep 2020 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=he64QQV9pZVx+ktlAFtqPXDhdBcTaUMF6DeQvxYf9kI=;
        b=c7JrFXHvV+TonUZE/KSsYYM5lobhhHSzePzX1AiPk1VqhFtHiBASpHvuiYDceLkDoZ
         1U0vD1rfT3f66NCtd9+Ov4hPhop+2vAjQoOGFcoiNwUGhau9rtiab7cu/Z4THr/WKKds
         /BICMFdBddmugjFA5RtcR+Td6M7ipCB3gVXdHV6Srxng82AHEUAxdHwAKd3VMoAKKHVC
         mTjorkm0E6905iX+f+VLKrfRzTd0/pbY/l/WiMnR+ZyCwfrfDvkKgNRktFNTH0ilVc7Z
         xnTwST+sLi48o/xCLi1/z7VYO/ZEjgmtzyJj9+/UHuf4Dwey22GUi12Q/QNFwGQUF+p2
         HQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=he64QQV9pZVx+ktlAFtqPXDhdBcTaUMF6DeQvxYf9kI=;
        b=kJs/jfPeiw4GoP36ndcF4CV3Y8OkPr+s3msuKkUMWccTxflyJEJGkYz8X8hT+1eniq
         kVMFI+0qVn7MSOrRdz1mjnaSOm+CftGNdq+IPuaOzL/RLuR0Mt4Pii092uArsgKDut8/
         b8+aj+chD7i9dVdrsePJGJ3auodAOnRyHDoe3qTc9DD+laY6ZbXt62JLAsMOg5WhfgWe
         A51zoV870A/taLwuKzSlLx/VRnCbO0v5Df74xTGvzn/qBh8DwQI6gsecVnIEGlw81gjT
         c/iPcgo6hBhL2ZUSEt6PbGtmB40ieMwsQ9p+GeH4TxA8E7bzZjyYdKzgt3jhQK2IAhnA
         TErQ==
X-Gm-Message-State: AOAM53226wkwMVwjCGUGrQriPXFbFVOWURYq74p8MQw2Nr2ojygvE2A2
        zwKiMSi1uIbWH9H6caLH0nk=
X-Google-Smtp-Source: ABdhPJz/ctZePSI6q+SIQSCEVAqLHvKXN3t3nUdGzCr2sWeKL3+goeSZJjhVOea08c4pKoV5mGJsiw==
X-Received: by 2002:a17:902:850b:: with SMTP id bj11mr2537633plb.81.1599118226410;
        Thu, 03 Sep 2020 00:30:26 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.6])
        by smtp.gmail.com with ESMTPSA id u63sm1949105pfu.34.2020.09.03.00.30.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 00:30:26 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     linus.walleij@linaro.org, lee.jones@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH: V2  0/2] Fix TC35894 gpio interrupt bug
Date:   Thu,  3 Sep 2020 15:30:20 +0800
Message-Id: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

This patchset intend to fix two bug on tc35894

V2:
1 change V1[1] patch's Fixes tag
2 add DIRECTx register configuration in tc3589x_gpio_irq_sync_unlock()
  to active general purpose gpio mode, else can't read correct
  GPIOMISx to identify which interrupt


V1:

1 offset counting is wrong in tc3589x_gpio_irq_sync_unlock()
2 disable Direct KBD interrupts in gpio-tc3589x's probe(),
  at least have to do this on tc35894, if not, after chip reset,
  IRQST(0x91) will always be 0x20, IRQN always low level,
  can't be cleared. need more test on other tc3589x.


dillon min (2):
  gpio: tc35894: fix up tc35894 interrupt configuration
  gpio: tc35894: Disable Direct KBD interrupts to enable gpio irq

 drivers/gpio/gpio-tc3589x.c | 20 +++++++++++++++++---
 include/linux/mfd/tc3589x.h |  6 ++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 

