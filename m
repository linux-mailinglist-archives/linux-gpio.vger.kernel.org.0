Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8024320A683
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 22:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390785AbgFYUQY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 16:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390554AbgFYUQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 16:16:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B0CC08C5C1;
        Thu, 25 Jun 2020 13:16:23 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id m21so5213843eds.13;
        Thu, 25 Jun 2020 13:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RTgSGzbVQGxe1Wrk0GYD31ifiKnEncm3jN8OFOfbbw=;
        b=EuYJ2nONckVf78Rh3GH+ZNH4xnD0JE8zSms2QLK7bTykV8otY6jG/MUuLVhMFqha5l
         q2craLtfjmHwX1TZvMXkLMNWM7EC/cOT1Htvj4TtZA3K0p0pquLOxgLdZH1tHB7/tuz9
         WNKfVmohSeHM4EzXT5FyDX2KFBYz32uNbzRGka9ack9a70AwwLx0q0783LbGG3NUBj51
         wBqzy+WDM6e4lvWy+xkbdyKyz7PZO3z6OC+bWJsoGseOWCDo/kOmpU7An8tOMGu/Bxvi
         /A1ZFw+Xn5fzW4L/8cgokCvg8HsiEIlotnXZBAu4rM+CE4QcPg29kG3kren3LS66dRvq
         yy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4RTgSGzbVQGxe1Wrk0GYD31ifiKnEncm3jN8OFOfbbw=;
        b=VPsKvpQz3kQvRSUe+sE6nLKDTOeZkeh4aWQptDl4gG++hG+cUUR5sQuDrijwioiJiw
         DsZGIeUIWoBn20r3aUZ6x14VXENE+Yq7ecP49EMM9oobfWxSTNnBlUnt0uSCeuD0MsNn
         gzt8TdWHdzdTGn2mmcol4xMC+Z/b+DC0qmFI4I8nStgFajnZXb4jfljzGGjgVnNswWRB
         mQznSP1LViOympV1vR+4keN5M02cB9Xhm/GtHmbfny/BxJwypSJanNCtG+V5C+rDqcvR
         NMWcM0wp7WLXysVVc5mlka4IrLJVO8KSuizFZnopqMQEWtWyoIa3VRB3m9D9GE+VI6Uk
         ICoQ==
X-Gm-Message-State: AOAM531ll2FEDPZQtTnZakBSZuGpMKsXlogQmOezEWrhJv1tJ3qafT+l
        Y8gBIrtuJkx32QCc5cJ1bKUqCtyhZgU=
X-Google-Smtp-Source: ABdhPJxE3NAFUgzL3jutxzQiFiUv3EohbFjt7N3ll+3zgLU5YGlUmRf8k9wlQsACF/tfq9SiXqANpg==
X-Received: by 2002:a05:6402:17ce:: with SMTP id s14mr33350537edy.53.1593116182601;
        Thu, 25 Jun 2020 13:16:22 -0700 (PDT)
Received: from localhost.localdomain ([188.24.137.55])
        by smtp.gmail.com with ESMTPSA id ce15sm3495265ejc.86.2020.06.25.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 13:16:22 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: [PATCH 0/3] Add Actions Semi S500 pinctrl support
Date:   Thu, 25 Jun 2020 23:16:17 +0300
Message-Id: <cover.1593112402.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds pinctrl support for Actions Semi S500 SoC.

Pinmux functions are only accessible for pin groups while pinconf
parameters are available for both pin groups and individual pins.

The pinctrl driver has been verified using RoseapplePi, the SBC for
which an initial support has been provided via:
https://lore.kernel.org/lkml/cover.1592123160.git.cristian.ciocaltea@gmail.com/

The DTS related changes, including the required clock support, will be
available in the upcoming patch series.

Thanks,
Cristi

Cristian Ciocaltea (3):
  dt-bindings: pinctrl: Add bindings for Actions S500 SoC
  pinctrl: actions: Add Actions S500 pinctrl driver
  MAINTAINERS: Add pinctrl binding entry for Actions Semi S500

 .../pinctrl/actions,s500-pinctrl.yaml         |  228 +++
 MAINTAINERS                                   |    1 +
 drivers/pinctrl/actions/Kconfig               |    6 +
 drivers/pinctrl/actions/Makefile              |    1 +
 drivers/pinctrl/actions/pinctrl-s500.c        | 1727 +++++++++++++++++
 5 files changed, 1963 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
 create mode 100644 drivers/pinctrl/actions/pinctrl-s500.c

-- 
2.27.0

