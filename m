Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE918E1A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfEIQ3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:24 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36334 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfEIQ3Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:24 -0400
Received: by mail-wr1-f66.google.com with SMTP id o4so3937017wra.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
        b=GTmpYoVkiFD9q5dllN+UTANfhfNppEO9k9r2mtPKdiNTKlSo2/K11Kc1DoLO3pzGzo
         +8oadDWMMF73u7uqsEZVKantnFEz5I1jvg8q9diJ6h67xa9PwPRxZeqN9qzkghbTPqKl
         Ejxg9meqYwvs8CCfmixifG+k1qEOibJwAnoXDZK57nBxIMlP4YQG/mYlfIVdmMxX9dWU
         MppYB4r7h8KEEcJBJndg79YL+AZwelfMkzB3PCvXTx5vdbxegozXDdM4wuWT2uw1nlZd
         ImyV2grmhzXcCDroeRpOWDhTsWt1pRy5VwtgGikKnh7mlrZDfohpGp1+5w9OPq0yooKl
         270A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xnUcq849ljF3W1PVVaGBumjDSyHUcTVt7HVj2vrbpqs=;
        b=Nu3otDZPzuBl4PfxlMeoCQ2WhaXN8v/464n5h0HxgPaf0/0ykQsssvMg9lWVHGQCNK
         kOzYhPg2lKkRCbxxmLb0gN7CIHLRtIW+1JfcblwWSgELFF9+RU22J8HXqcvQ0eBoqp49
         MOX5fsR0VVr8XbpBwPlsmbzA+GbgxSOjYcJOYgvx+usjJXYzKIhisijAikzndHV1aOOn
         MDGV/mJb/huN/lv52hPkh+/G6ftxTd3c5ok/r5+GKki5orTPgNHzHdwRl7eVVOufI8Rc
         iBiB3yorGIe0EWpSKm1TSzRrFBPkeq4VvfNTS0DG6Ligh0tBVqfxpA7WLPo5P1Zr7Atn
         kwMg==
X-Gm-Message-State: APjAAAVGarRHH71zFynId+5aO8uIhWxwaDcdf+Ed0hrrfqWnti7t+Iho
        Y4KIxr03R4D8L8M0PRucSs0jyg==
X-Google-Smtp-Source: APXvYqyiMcEGk177HRPJlCRGpEKkfOvFY/t5LFvZZuyi6ApMgWQ/TqSREiCeGqHv1iD451gqV5gHBQ==
X-Received: by 2002:a5d:4a92:: with SMTP id o18mr3791996wrq.80.1557419362487;
        Thu, 09 May 2019 09:29:22 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:21 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
Date:   Thu,  9 May 2019 18:29:14 +0200
Message-Id: <20190509162920.7054-1-glaroque@baylibre.com>
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

