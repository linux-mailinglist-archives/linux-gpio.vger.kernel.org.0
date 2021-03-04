Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C23E32CC4F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 07:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhCDGGR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 01:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233606AbhCDGGN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 01:06:13 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0405C061756
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 22:05:32 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id j12so18127321pfj.12
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 22:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=H5IvtVELze0Vps97HY3+xay/OMS7k0lqk9oX1eLUgxM=;
        b=Nf25MtOTwgKdfgKuUD5Uj/P2ko0klUhukmMswsRgw4Ls4pyksvSMt+RMIF7UgyTtzU
         gmHqL23+P5RnrRN8QArwhamCVTSC2nZGG0sbn0uMNKwYwS+Uxuh5IyIALaujXV4SGabd
         osL/qqt7RoMKHbwhJMhe3FgERhETu+cX/3BQvnDR0xg8FRxxa2QsWCtdqjXV9R70OCpA
         /8TCOMWNEgNTzUZbjG74yOBFzhYLHvP5tr6+GRnuM7C40Mbo9K1ZMmBntEWMEJeLHIUO
         Z9acM+LR2ys05tkqYwaYUcAGZvaxN7F4wI/7dtnqZP93maklT8Mj1eIzXv+YjNp8M/IA
         zAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H5IvtVELze0Vps97HY3+xay/OMS7k0lqk9oX1eLUgxM=;
        b=caojtQDGv3e7zuTwbn2aE0i/Ljo4aa9LdPAlSAR9WlJ8ToxR+zeLj1Wp49NaQLuJX5
         6FvcEVlu6Hqr4sQkZdQndpB4j/3IgSaIXLslkcUQSba6il8Yl2Cn8j8JwdoUNus1l8Ad
         RTrc0qKG3YOR2z7Rgf/cB2nD77J8YvM2qxBl6T6/2HjJtPreZLr3D+yiuOl08B8PBE8a
         h+eFTvTvKDrHausPz2+KHnrAuzJ88Hqs/RzQIQGn1Vdsi1V5MHUteQH5sRqsZ3JL7qTD
         wgJF9w76a+4E4wyM5CFLm6mQc8s4yyAsNEWvEYTZI1S/VQkk518B2hzQRxC3T9/ZnQ6f
         e5Yg==
X-Gm-Message-State: AOAM531W1llNr3IqYK4xzk/4uEQTKmEWVfUm7PXmifitYQODgrQqE+Vx
        3Xs2P8UrR210SEKHyvy7MOmAlA==
X-Google-Smtp-Source: ABdhPJxy+sK3LmlveOTf93bVWrCj3HQk4a1gnnqS69S6FKye1xvLI5ivdE/tyVrGp/0egq18vsaajw==
X-Received: by 2002:a63:6642:: with SMTP id a63mr2306114pgc.333.1614837932366;
        Wed, 03 Mar 2021 22:05:32 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j2sm776386pgh.39.2021.03.03.22.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:05:31 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add ACPI support for SC8180X pinctrl driver
Date:   Thu,  4 Mar 2021 14:05:18 +0800
Message-Id: <20210304060520.24975-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a couple of patches that enable ACPI probe for SC8180X pinctrl
driver.  It takes pinctrl-sdm845 driver as the example to remove the
use of tiles, so that we can align memory resource description between
DT and ACPI, and simpfy the driver code.

Changes for v3:
- Remove the use of tiles.
- Drop unneed include of <linux/acpi.h>.

Changes for v2:
- Pass soc_data pointer via .driver_data.
- Drop use of CONFIG_ACPI and ACPI_PTR().
- Add comment for sc8180x_acpi_reserved_gpios[] terminator.
- Add comments for tiles handling.

Shawn Guo (2):
  pinctrl: qcom: sc8180x: drop the use of tiles
  pinctrl: qcom: sc8180x: add ACPI probe support

 drivers/pinctrl/qcom/Kconfig           |  2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 80 ++++++++++++++++----------
 2 files changed, 52 insertions(+), 30 deletions(-)

-- 
2.17.1

