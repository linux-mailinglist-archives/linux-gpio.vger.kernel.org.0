Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC963426BD
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 21:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCSUWm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 16:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhCSUWk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 16:22:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D67C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 19 Mar 2021 13:22:28 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x13so10340765wrs.9
        for <linux-gpio@vger.kernel.org>; Fri, 19 Mar 2021 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iXySPiFeBqFNXOlBA8Hlxv7UAlSpBEE41vijCE3djrc=;
        b=vSv6oPxmtEU9z27sFTxMUsx3Z+3ox6KRRCkclzbqS2s/HHe4v3Xe6kho9eJx7zSVA4
         7oOxtrNuvFjdYuRCS3H7wBSBgh7/fhQJsHK9p7ba/1VInwBA72Ml2ZRt/kniLI8jR2Pa
         rMB3H4/vxHt3HIWxQudgHZN0qG4CwEwcmR/l2le6Ze9yCsbDs7gbI+g9yGUBR3+Bsoka
         2dvku831OhbcCSvQ4pfx4QXD5XQTy5UbZ3mDQI2zmNQ4Q1ngWx8Em6R02c1fpPKf+KIf
         KlAHX6A+MMgMevjHQcZeubY6I19x3MSCHMtct/mjXBsLgxn5rFz7trJZbq9iT2nFMUUa
         F+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iXySPiFeBqFNXOlBA8Hlxv7UAlSpBEE41vijCE3djrc=;
        b=HlGdFRwlMKGbv96hllVtt2+KX+hJWqLD+s3wXajfSVTvqGRBJ1KKzgZ6Y707vqOnqs
         urWZTLCKu5dtRcG/UYwhWhVzPgpqnJbZyXHns8oZyzqtmUQeEJoMFpwKWWed3Qp8ylhs
         K5G2LpODBv/buLog5mUZFvHk0v0uGYNXK0FzQRDrH2fONyahH8AqzOXeGU93kcVQCrXU
         LxiBlbWAuwPxOJQ9jvL87b9VzOZhyRXTFiI3/FrgYzmq6EifFSuzMWOEuwn0JosoAYcQ
         9Ocrp2JmTb+dkFtNWovcS4aIMuKAWDms4QkfhgZ3VtAm97jjx2mZhm7rIdEom76EQt06
         6hNQ==
X-Gm-Message-State: AOAM533EH5okxTwrCC62oOLnL0MXgcabu05c1O6hympDP7WbagUs0Rti
        DFOcMUZXrf+WdN7HIVVY6Dn/mA==
X-Google-Smtp-Source: ABdhPJzGION6z8rZr2vfIt19sANVKEW0E7BDXy1V7/Eydzx0QdLTqnardKLbFa4fucQPbJTAXBfCEQ==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr6615711wrt.28.1616185347689;
        Fri, 19 Mar 2021 13:22:27 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id p17sm7225865wmq.47.2021.03.19.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 13:22:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.12-rc4
Date:   Fri, 19 Mar 2021 21:22:26 +0100
Message-Id: <20210319202226.24590-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following two fixes for the GPIO subsystem. Both address issues
in the core GPIO code.

Best Regards,
Bartosz Golaszewski

The following changes since commit b41ba2ec54a70908067034f139aa23d0dd2985ce:

  gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc4

for you to fetch changes up to 6cb59afe9e5b45a035bd6b97da6593743feefc72:

  gpiolib: Assign fwnode to parent's if no primary one provided (2021-03-16 10:18:08 +0100)

----------------------------------------------------------------
gpio fixes for v5.12-rc4

- fix the return value in error path in gpiolib_dev_init()
- fix the "gpio-line-names" property handling correctly this time

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Assign fwnode to parent's if no primary one provided

Wei Yongjun (1):
      gpiolib: Fix error return code in gpiolib_dev_init()

 drivers/gpio/gpiolib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
