Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0E69AB261
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 08:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbfIFGZb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 02:25:31 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33021 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfIFGZb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 02:25:31 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so3677887pfl.0;
        Thu, 05 Sep 2019 23:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tB2RNxXRErmJ9e3PrRrfYZt/4IO0/YJdN93uotJXzmg=;
        b=KHw7ngbgKFGwXSFYuiQbGQBfie880OX2vpp7L7MkL1sULSWNTS+amLlNfeUx7rmuOp
         E9CSHIH+Snd+pHoNvNkmoZPMxy2VDvQqTpqGVu6G2n6Yu2DJQ33iR4a+b1nOTbCtdCkJ
         Ut6L9cfoS+yOgTUVEvlrjqyUeOHn17ryGyo0lFFLqh/mokWzyKNTkzYqmMrymwaxFF3e
         8wFtNMlScmfR4ntuMwoNwxaxjHmJI0iqON9yO31sLfTs/v1XFrEicM7OsWR1Rdtvjce9
         WdKepwAaq6dsMxsIXT8ilMO01Lezvk7CaRhJA6DSiYSJRoGNPSlNApc3uZpDPQIdBFK8
         9knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tB2RNxXRErmJ9e3PrRrfYZt/4IO0/YJdN93uotJXzmg=;
        b=gR7uIS6L+KorWk7yWcynRxWc9cIU9NU4bwpOj2+4c5OFE4V1mgulz4qfK6PevXa0+0
         H71ExLx2H8FEpT2z20rWCXI7wdBZy9ia/B8JYS5QLVvPuHyouh0Ci75PTxChAVmU+lTX
         +JJuS0rVz80mGnXGoe7Uw/oXhIKOpK+BNGMgNSF8YWGLxOkjhPZp0tPvO93tIqFWL+HE
         Uku5L/RK5MsNxD2zzrG2r6cYrd2W2y9jUkHZ6OjH4o3PVbSBrLjRZPzA4Dte3vEoiXKU
         gkJAMKbgc3+RQDDe0acZDKHjE87MJ+BnWLMRmkK9GnzcgCKv7ZIEcwT6nNqWpMpjE2GH
         ZqBg==
X-Gm-Message-State: APjAAAVAo7iTsGz5kTHCM5UDlYwTk6OfLvWEgRXdGJpV/T1GJHJOHBtR
        Ha7/MEqSHNRvdXOtvmmBG1w=
X-Google-Smtp-Source: APXvYqyQA5o7Nplg7Mz6cACJYxVi92CNBUmDeAZ/6//NQuySZy9WiwRBzeJBgCrM660faJtp+bFQrg==
X-Received: by 2002:a63:6f41:: with SMTP id k62mr6650552pgc.32.1567751130676;
        Thu, 05 Sep 2019 23:25:30 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id b5sm7950688pfp.38.2019.09.05.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 23:25:30 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org
Cc:     Rashmica Gupta <rashmica.g@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/5] Add ast2600 gpio support
Date:   Fri,  6 Sep 2019 16:25:10 +1000
Message-Id: <20190906062510.13191-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

v3: Different ordering of patches, using ngpio property to distinguish between
the two ast2600 gpio controllers, fixed typos of 3.6V.

v2: More verbose commit messages, using DIV_ROUND_UP().

Rashmica Gupta (5):
  dt-bindings: gpio: aspeed: Update documentation with ast2600
    controllers
  gpio/aspeed: Fix incorrect number of banks
  gpio/aspeed: Setup irqchip dynamically
  gpios: Use ngpio property from device tree if available
  gpio: Add in ast2600 details to Aspeed driver

 drivers/gpio/gpio-aspeed.c                    | 52 ++++++++++++-------
 .../devicetree/bindings/gpio/gpio-aspeed.txt  |  7 ++-
 2 files changed, 39 insertions(+), 20 deletions(-)

-- 
2.20.1

