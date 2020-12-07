Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5812D195C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 20:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgLGTVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 14:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLGTVt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 14:21:49 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64E6C061793;
        Mon,  7 Dec 2020 11:21:08 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id y23so297571wmi.1;
        Mon, 07 Dec 2020 11:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SegjRzTuCbPvQSuQPy/hbkcOF68wPXwUglzmO1J5ED8=;
        b=gT4gTiaQT/pW4/YyaleDJqypVqNfEx9POtEipKeN5tp9BlXkP7P7Y3oFNBQxMQaCHF
         6oJaFBUPFInYFaVvkKUjsiH6hzhUXtCUQRNfILL5Lt+f5wZLCj6q/ILxik0As0B2kmOU
         kE53n29xzy1zHVb9r0o0YNvRxtiGWUQLY8nlrtLGWqOxb6+0YSeAeEo/9hC9MDIlXSSl
         3X14FIzUXCSLvmZcjEVO3BYxA5hSXLSdlXODyzJG7CPi8vKLWKySLZxnzGxwk7qgJDtD
         nVZCo7vnILefxW5U9yVMar98Rs/DaklUcm/Qsxu07s9Y+CqGzbhZYeKwGv2lA0B3AxKR
         kx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SegjRzTuCbPvQSuQPy/hbkcOF68wPXwUglzmO1J5ED8=;
        b=Mc5fpmMj9m/492Vp2Tc+Nb2B1ufTOyvly8FCecvu7zXxBoLOXSkEdbhQlwFhvZ9Qv/
         u1fn/4qLRbfVsnv4yfweUVqBNg17q1GhsRBC6qF/OymbUmSvkO6WU/DQtRbE9nhOaydz
         A47o2p9GWx1MATdJeRZVOuhJ4OOL55Ho1L2a9VtFyGHhJyrCHPVBPNaKtZov9/SqLdo1
         iU959EXasgPHQnggcQwDKUPPe42h4idGGwgB/d1C3YwUuUl6kRCkS7tH/E8jqPRpIb6b
         9JDDpmHtNbApD5Cnm/hOt1DqjPxy9LSR622QVfL0UZr0ck1/5pRpBIlsT1NMN/MHowQw
         9LQQ==
X-Gm-Message-State: AOAM532sUWbsEowaDAjmcnJ0FL4AH4eH9ha3WjTQftLgZR1PGfkH4bsb
        hRvKMKDmvn5PrdJku5Enlwc=
X-Google-Smtp-Source: ABdhPJyC7QeC7BrqBhKfRoq2ZF3wmNzjD34rBcGtrwA/imEzIdwPuxBhyyXZdXU48yjXVpMnmtM44A==
X-Received: by 2002:a1c:7e0b:: with SMTP id z11mr376185wmc.16.1607368867696;
        Mon, 07 Dec 2020 11:21:07 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 20sm276978wmk.16.2020.12.07.11.21.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 11:21:06 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 0/3] pinctrl: ralink: pinctrl driver for the rt2880 family
Date:   Mon,  7 Dec 2020 20:21:01 +0100
Message-Id: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds a pinctrl driver for ralink rt2880 SoC.

After last cleanup in staging I was told [0] this driver is ready to be
promoted from staging.

This series are rebased on the top of staging-testing.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

[0]: http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2020-December/149178.html
Sergio Paracuellos (3):
  dt-bindings: pinctrl: rt2880: add binding document
  pinctrl: ralink: add a pinctrl driver for the rt2880 family
  staging: mt7621-pinctrl: remove driver from staging

 .../pinctrl/ralink,rt2880-pinmux.yaml         | 82 +++++++++++++++++++
 drivers/pinctrl/Kconfig                       |  6 ++
 drivers/pinctrl/Makefile                      |  1 +
 .../pinctrl-rt2880.c                          |  0
 drivers/staging/Kconfig                       |  2 -
 drivers/staging/Makefile                      |  1 -
 drivers/staging/mt7621-pinctrl/Kconfig        |  6 --
 drivers/staging/mt7621-pinctrl/Makefile       |  4 -
 drivers/staging/mt7621-pinctrl/TODO           |  6 --
 9 files changed, 89 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
 rename drivers/{staging/mt7621-pinctrl => pinctrl}/pinctrl-rt2880.c (100%)
 delete mode 100644 drivers/staging/mt7621-pinctrl/Kconfig
 delete mode 100644 drivers/staging/mt7621-pinctrl/Makefile
 delete mode 100644 drivers/staging/mt7621-pinctrl/TODO

-- 
2.25.1

