Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF0D3253B2
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Feb 2021 17:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhBYQnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Feb 2021 11:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbhBYQnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2021 11:43:02 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A0FC061574;
        Thu, 25 Feb 2021 08:42:21 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v1so5896373wrd.6;
        Thu, 25 Feb 2021 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Npwl672MiRQEKruxh4+PrenCbJvpjjs2CJMv5XpKxrg=;
        b=pYDcqiUvzVyuuuMXd91U8RlkK/dNvkqB4Ob6OT53RGQ+hpu320NTN9K6sKWPHoKDhg
         0lmjoEHsENDDkg8W14LboPkSQ7yevOhQCRITP+7Isu4yerB2JPXoVUXYa1WFJlgG0iY5
         3U2j7Qa40PsQUpmm7fyQvk+ls51cvddMDwKXU1n8pYBKYFSmBxprKjpryzzpRukajn9H
         USFD2bqriACfvHAJpwxqam0GVVuzoGS5uEqt+1DeeX3hajE5tRtNOFKJoD1bxo2syNoA
         mLTA3Jce2zRSplZFnnFvp1mmpBCwUGVKQ4YaogMf5eTqNHGudmq4BVczSojsKGIvQ6my
         Wc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Npwl672MiRQEKruxh4+PrenCbJvpjjs2CJMv5XpKxrg=;
        b=qJoZXHxvzLRd58lk+KD/W2+TUTWpqmCjHoJqmYb3tyZ3GeurgygnS+EirwXZBmnEwh
         4S4XsFlfHgp32bqxFTzPtYYxPAosQfWOs08YDt8aBLTrVC8lUXQYklYUx/26xbq4bAgk
         MXH/WyR6cmmgxOTFp6YFYS7gqtHNV9P79XqY++T0sOXcxIk9GC1U5vbhE469ErX9b9a0
         1LbP/Igc0ayxqX5hIJFQ0slSv9Z3i1doDq6mC8hjpnVpbiDHEtTU0ApHio74GnnXs9Nn
         pmOVyD023gQQtIemq4m8oTKJ2n4l2eK/O6A+KJzQcv1gYO/1NQsIuHJd2rJoPuDvfNo7
         XmYw==
X-Gm-Message-State: AOAM531caDZSoe8teQQ+MN5EVE0+gjOjWHBykqe2eF6sQtahlwR68j3P
        ikD34BCcBX48/owjuuStWsFqc4VukDm4Rw==
X-Google-Smtp-Source: ABdhPJz0SBmMrSqawvmqhQZtg8Y287mT7VHL1G19RRIcnBE2g8teIXZFuvfxdvrCwoKFddOCrEfD+w==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr4541406wrv.40.1614271339832;
        Thu, 25 Feb 2021 08:42:19 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id u4sm372779wrm.24.2021.02.25.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:42:19 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] pinctrl: add BCM63XX pincontrol support
Date:   Thu, 25 Feb 2021 17:42:04 +0100
Message-Id: <20210225164216.21124-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

First of all, I've based this on the patches sent by Jonas Gorski back in
2016:
https://www.spinics.net/lists/linux-gpio/msg15983.html
http://patchwork.ozlabs.org/project/linux-gpio/patch/1471604025-21575-2-git-send-email-jonas.gorski@gmail.com/

I've tried to address all coments from Linus Walleij, but I know that
this may still need some other modifications

This patchset adds appropriate binding documentation and drivers for
pin controller cores found in the BCM63XX MIPS SoCs currently supported.

While the GPIO part is always the same, the pinmux part varies quite a
lot between different SoCs. Sometimes they have defined groups which
can be muxed into different functions, sometimes each function has a
different group. Sometimes you can mux individual pins. Often it is a
combination of single pins and groups.

Some core versions require the GPIO direction to be set according to the
function, most do not. Sometimes the mux register(s) contain bits for
unrelated other functions.

Álvaro Fernández Rojas (12):
  Documentation: add BCM6328 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6328
  Documentation: add BCM6358 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6358
  Documentation: add BCM6362 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6362
  Documentation: add BCM6368 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6368
  Documentation: add BCM63268 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM63268
  Documentation: add BCM6318 pincontroller binding documentation
  pinctrl: add a pincontrol driver for BCM6318

 .../pinctrl/brcm,bcm6318-pinctrl.yaml         | 173 ++++
 .../pinctrl/brcm,bcm63268-pinctrl.yaml        | 198 +++++
 .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 161 ++++
 .../pinctrl/brcm,bcm6358-pinctrl.yaml         | 131 +++
 .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 240 +++++
 .../pinctrl/brcm,bcm6368-pinctrl.yaml         | 255 ++++++
 drivers/pinctrl/bcm/Kconfig                   |  66 ++
 drivers/pinctrl/bcm/Makefile                  |   6 +
 drivers/pinctrl/bcm/pinctrl-bcm6318.c         | 674 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm63268.c        | 821 ++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6328.c         | 581 +++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6358.c         | 526 +++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6362.c         | 794 +++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm6368.c         | 679 +++++++++++++++
 14 files changed, 5305 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm63268-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6358-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6368-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6318.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm63268.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6328.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6358.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6362.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm6368.c

-- 
2.20.1

