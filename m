Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547A8360B31
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Apr 2021 15:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhDON7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Apr 2021 09:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhDON7V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Apr 2021 09:59:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE17C061756
        for <linux-gpio@vger.kernel.org>; Thu, 15 Apr 2021 06:58:58 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id s7so23306846wru.6
        for <linux-gpio@vger.kernel.org>; Thu, 15 Apr 2021 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XVGfVGRf2lqFdi9u95Ww6kE/ExzJlYdE+7z23VB8v3A=;
        b=Z0jka7QMeObS2sH3XYnKMtcZ4M+L2HZkoTx+uQNaVYN+nTnBXgs0fEYg6T78vU3LFV
         qDZpyIW8TOta+/kYslVbnTPjvmjtqpXiDY1XCMyqpMbiwVqdXAj5vDjeadNyS7e+NZGa
         jLq5NZNngaZTTrcFqDuHveX3Q+DiMr977bfSZOiK3aAsuKsaS+hfmclUOcEncXJUY4/W
         MQ1Fb5QnEPB71KFqwhlkQXi5XFVOX0qdj6dKiTvlnrC+sCnCauNVpAo3tukc4z8M/03v
         lU/nq216h5ALBhFThVMbM/Om0t7BSMcjGKX5NWdu2+tUpggoHAtggXK9IY0oKiGKyy8k
         gkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XVGfVGRf2lqFdi9u95Ww6kE/ExzJlYdE+7z23VB8v3A=;
        b=R8XZILMIMyFRVwcNZUxSdaQff4tqdqmlX3CcBudqJ48FF08dKAOKqUDdLThhynSXfF
         VZCIJZBKYeWiHT9QcPrFn7NUokbxzU4/kCC+yfN8QMYSQZTh6kKxhIlE8Y0O9EM/HmH+
         B+8VwjQ3xoo+IPVGvRJPcSYlmpzoXbrK0c0FyI0AgZRV7tmQpGg/8ZkKANzPCXffQegL
         pI5z6prh86cZEpKc8I43w65Ulsc5gxYsdOJkt6yHf9qZDZ3LHV9ekJgzZqyziqNP3Qmj
         Dbji1lxXR5eDMwr9gljNrZrDOZfZTODKUbzYXyd/o3a6zbt6bKophtb56KjTb0PZ4DKH
         l4EQ==
X-Gm-Message-State: AOAM530eAN3DgEXp5oGbGvLJh2M9d9qgke4iCSxfLiD8NDiZPxUlwCpm
        ACvr1kWyTPAQwM31kT2s4+Ye/w==
X-Google-Smtp-Source: ABdhPJznICyWykrJyWx5i+dcomhTZnr4iAs69us/lf2jyAxWRzIkRsbO6Uykej8p9dT1E5Eg7kN5XA==
X-Received: by 2002:a05:6000:18cd:: with SMTP id w13mr3650522wrq.20.1618495137577;
        Thu, 15 Apr 2021 06:58:57 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-286-103.w109-210.abo.wanadoo.fr. [109.210.101.103])
        by smtp.gmail.com with ESMTPSA id e10sm3105582wrw.14.2021.04.15.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 06:58:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v5.12-rc8
Date:   Thu, 15 Apr 2021 15:58:51 +0200
Message-Id: <20210415135851.27595-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

I waited until late with this non-urgent one hoping we'd get more fixes for this
release cycle to go with it but nothing's coming up so please pull this single
fix for an older problem with the sysfs interface.

Bartosz

The following changes since commit 6cb59afe9e5b45a035bd6b97da6593743feefc72:

  gpiolib: Assign fwnode to parent's if no primary one provided (2021-03-16 10:18:08 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.12-rc8

for you to fetch changes up to 23cf00ddd2e1aacf1873e43f5e0c519c120daf7a:

  gpio: sysfs: Obey valid_mask (2021-03-31 20:32:38 +0200)

----------------------------------------------------------------
gpio fixes for v5.12-rc8

- do not allow exporting GPIO lines which were marked invalid by the driver

----------------------------------------------------------------
Matti Vaittinen (1):
      gpio: sysfs: Obey valid_mask

 drivers/gpio/gpiolib-sysfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)
