Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D4832C7A6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 02:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350228AbhCDAcY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 19:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380616AbhCCN3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 08:29:35 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88837C061223
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 05:26:31 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id i14so4146824pjz.4
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 05:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=L6GPr+tPT+/4tcVANy2DgWP8y/cMrSyWJznHIgnnhM0=;
        b=AFWAN08okyrxQhdPLMUpHy6dAp/iyoeGDbJEjwCW8PFLC1VRkKU71EiMvVkR8Bo7zu
         9vatb1kA2bvH9wFFtRgnYA/8zKGV+xCuogESKv3PJ3Yo+yItZEthca5oBKXN3548sSVv
         5SAhzTNL4KNdsOoBHU+ZJw9cNdA3N0w1Xg65kQHriF6cWhV02ftTeuiLn/v896n5s/2C
         TsgfbGxW5TXGiKaQ8tAbNkmenvJ9Xrvf/+Qu4LzOmreZuKRU/WScaoKtdk2/qA5utFJe
         4EGrcRoh9CJKhv9cCHsSbP1WlkNSCHWZ2zdtohy73KAfXNilHxlnaQi7Syv8LdAUfY6n
         A1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L6GPr+tPT+/4tcVANy2DgWP8y/cMrSyWJznHIgnnhM0=;
        b=rz8yNpQBavNPE8ud/phE9UNBSxb1cTUh25O24C84QVRy6MmZzavHQypHtTZWjFWdGb
         EaQ8r9UK8I9k7/mvmgja0cke3U050uTMXj/27m70DHaazp/Lz82RRd3JGjUxkPs6OS4e
         31y4vxW8lvu5utCxM63fhXgiYEEeM0k+tw13pHR+qum10MxD0FhwsFyC3e1nOQIYY5eQ
         5LXxKitaKVHMT19k/bcJbd74DD6gzmu4Fgx310WhMyMkCJkwwZQR2+4T/PUjXZV0vebe
         2gm3o3puZRvs0oXp03H2XoJ/DhvudhJMARZ6+SddeHCD3Ygwt13SJXT4RNh2u79RMlFz
         ue3A==
X-Gm-Message-State: AOAM530msps5cbXxyym1Z1VXBZn1iJnLFP2A9WkUXHus1mKy4d60al3A
        s+mOyK6/pa54CDBOwRxQTsoqCw==
X-Google-Smtp-Source: ABdhPJx2J0YNTVr7SsOV30gjr/+9A22IXtR8PmoaSXmAqr4QzTELIFrS0nUdn+mPgoE1suCCUPaGig==
X-Received: by 2002:a17:90a:1b4e:: with SMTP id q72mr9408706pjq.113.1614777991047;
        Wed, 03 Mar 2021 05:26:31 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y20sm24425044pfo.210.2021.03.03.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:26:30 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add ACPI support for SC8180X pinctrl driver
Date:   Wed,  3 Mar 2021 21:26:20 +0800
Message-Id: <20210303132622.4115-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a couple of patches that enable ACPI probe for SC8180X pinctrl
driver.  The msm core driver needs a bit change to handle tiles mapping
differently between DT and ACPI.

Changes for v2:
- Pass soc_data pointer via .driver_data.
- Drop use of CONFIG_ACPI and ACPI_PTR().
- Add comment for sc8180x_acpi_reserved_gpios[] terminator.
- Add comments for tiles handling.

Shawn Guo (2):
  pinctrl: qcom: handle tiles for ACPI boot
  pinctrl: qcom: sc8180x: add ACPI probe support

 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c     | 27 +++++++++++---
 drivers/pinctrl/qcom/pinctrl-msm.h     |  1 +
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 49 ++++++++++++++++++++++++--
 4 files changed, 72 insertions(+), 7 deletions(-)

-- 
2.17.1

