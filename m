Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4922818E0C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfEIQ3D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36291 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbfEIQ3D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id o4so3935585wra.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
        b=ImAZTHHuJkcRseb3Xm8ZXczl83t2j4YUlF5xajtB6swwmxCVE+rFqGrqeSLPxSt6Nh
         5DR4zpcHG/qA3XBzGzcVQG8xCpjO4PTSA4NWFKu2BPfbTnkQXLnX4Y4wS2j/AAa6reee
         s8AKXQiSpZE31rUUZMH+Mfdm0vr+7rSmGGz6wEKeOu0/YjPUo1aAoRp3g9PNi7js2ZC1
         zcoD5rAHg2oU6rBrot11qF8DFCKp7Uc35edkIY6cMBaXJaZhvvCDtI1dSz3OP6K73bkI
         J4jdszWKQGJjWeW2k/pVLd5l5N8h7zo3F1VAiuDpxupiHlUHq+1D+Y4H91t27ZkVa6O1
         dmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
        b=Y462XXJM99+ocaBqsba41vNO8yQE06l/FQMoWdIDZiFwswClZ0egnX0ORO+exaMcof
         zzylEHIryiXPnSBkyW+hASeOccTLoMiqv5Nqgk/IK67OmZRZXGE6HdkwkVjKbWV8Y8Zm
         VM4DKLomeDeB0R6hOPX1lMTRgdiDXm90MN1phGfHB+Ilty/yPBbrMlLgnbxHRnrTzcM+
         nE6fHcZR/Rul5EoW9D1AiasCU4y691sD5x1OMCyqceV7wIVnPeUsDFhjoYZdeHmWelDA
         NPgnDWYw0yStsA8NTIe6sH9nkiUzLv9F7+TULGGDNGs+SKeJFCrGxvzU8aXjKadGqTja
         89Rw==
X-Gm-Message-State: APjAAAXvVjsVD9rNqFxVxd9oo2vVVZGZD9wA7+64uD8l7PsLmhQZj1pb
        VIhyd5v66a3TsZtAN56DVohgPQ==
X-Google-Smtp-Source: APXvYqz6tghhvw5ngKFutUOgPjB5QMLbIMJhbXOpnWUau29mKVkEg/a0IPmLzTZ8+PO6XTPmB4S4gw==
X-Received: by 2002:adf:b3d4:: with SMTP id x20mr4226008wrd.284.1557419341336;
        Thu, 09 May 2019 09:29:01 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id z7sm3649796wme.26.2019.05.09.09.29.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:00 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
Date:   Thu,  9 May 2019 18:28:53 +0200
Message-Id: <20190509162859.7001-1-glaroque@baylibre.com>
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

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

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
 drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.17.1

