Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6373416326
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 13:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfEGL5a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 07:57:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52640 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbfEGL53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 07:57:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id o25so8956091wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=OPHdfYWKRwJAQs5uJB7kF0RzPQn+beeGrm95NylS/7s=;
        b=x8IfvxSV8xEyOX6DuO+iRYAmA4ddSLYPKfR6dboTkoILy/QRKBArxlBAqvMLlcmJL1
         /5D8PHaON0JpgYnLnNZnWq9uxuReXFmxTfcDj+3heSe1vSpK7rUgSOtcnqBuDb40cG8W
         DONlXDGPv3EnkrEbbGS0r8GTGdxvqbI5Rs5XAAjZoOIa8sj36Xmvbvpd8hGuEXmkVlXA
         kKUSswjcq87zaGBGK5mK3W9Cz9wP0qjY1Nc7vL857HnFB5qcKLNbMeNDbSo3uv05fbno
         KB5O8EZSr1mMGwCqRxSoVtld61l4K+vCXFWZyiYf8EauwQ4Qq5xWoxE1LSw2ed6XxKGE
         UPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OPHdfYWKRwJAQs5uJB7kF0RzPQn+beeGrm95NylS/7s=;
        b=Vo1srHPidkzrHrYM3FNgUZFEZRAul1voo0ft9Fpu9FTXkI5RI6nr19Kx5dACMMl3G9
         AMCTu18gUqgNaxLpsWFvtCDupTH6Thf+oiyh163Vif28pJcMrp8rHhG0Jx0HN6fG8AD1
         j6CU3z4C5Vhub5az0OBMzgDesSTiie83CwTtvas7BLCjc5LaB4e6LOPG6MjonNdHQncP
         HRYpk/EYxIbB54hIoEN6eh5yV2UlqGrnzgTza6MnyAVd8ZRZZxPjszcJ5HdA0KOeoOCB
         +ywR9D2AMIOX1VsJ+tjlIKGXP2rHjORiHamotMPCyy9cWjgB2AMLXzMsV63g3KBp9UPU
         iNOA==
X-Gm-Message-State: APjAAAXYTMYpLnZnLCJ9fCW6QjgyKqabq3PchQmWZeb6Z9+bHxUd5K56
        82ik6xWfkynTRLELlcw7QZtdZw==
X-Google-Smtp-Source: APXvYqxq1oFwTc8aEPHZEL8JAQfGOWvAnNWHmRNXvEeDBiKqtaWlXMyzKk+kWPFbz7vEnwL3O1Lq0w==
X-Received: by 2002:a1c:1903:: with SMTP id 3mr20479100wmz.103.1557230248087;
        Tue, 07 May 2019 04:57:28 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 04:57:27 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6]  Add drive-strength in Meson pinctrl driver
Date:   Tue,  7 May 2019 13:57:20 +0200
Message-Id: <20190507115726.23714-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-uA". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v2:
- update driver-strength-uA property to be compliant with DT documentation
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com


Guillaume La Roque (6):
  dt-bindings: pinctrl: add a 'drive-strength-microamp' property
  pinctrl: generic: add new 'drive-strength-microamp' property support
  dt-bindings: pinctrl: meson: Add drive-strength-microamp property
  pinctrl: meson: Rework enable/disable bias part
  pinctrl: meson: add support of drive-strength-microamp
  pinctrl: meson: g12a: add DS bank value

 .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 177 +++++++++++++++---
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 195 insertions(+), 48 deletions(-)

-- 
2.17.1

