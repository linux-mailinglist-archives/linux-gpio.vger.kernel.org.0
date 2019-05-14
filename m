Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B90F1C4A1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2019 10:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfENI05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 May 2019 04:26:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39832 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfENI05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 May 2019 04:26:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id n25so1805102wmk.4
        for <linux-gpio@vger.kernel.org>; Tue, 14 May 2019 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=X0toZzy5jG06W74WS/hZf53CDr/smndRtb9GSpbhzgw=;
        b=DCcz3Yp69wR3bZBKDn/QuVK0FvCSof8Ew0WzSEPM81nXrM6IGVV4Z378IW/wEmApc9
         6rJYt5azj7d//VJx3fFlxx9csNHdvyMki7rvr5x0lXeY3yt4/TBV9idded8Kfj3wGnko
         zZVMKUlZf8rv79WH6OmPz8scKITVnTsJKQwfXSdwK0y5KG61Lqd1DXDQHF8y76Osrs7I
         timrhpRIfLeKoo3xSDFVYbgKZZPLMUW2NaoCeqDtvrYVz9+f7pxgnBO0ut49nHYqsWMp
         ikucev/DepoE0LeBL3uM7ZWS+hdInkxhqj33nX/o47Qnyegi6YG8MQGwk4yydf7LXlFg
         bEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X0toZzy5jG06W74WS/hZf53CDr/smndRtb9GSpbhzgw=;
        b=StJd2hJx9CC/6/C81Jt1LyM+ALjtk/Q+an5qx3SunrvmjQMQIr1Q3ySQb42pXSiH3H
         QY/NR+OJzFgfWL3fhnX7X4FnoPxr48eQJXrtTd9lnoLP49ucVMeURyIvvCZAaUefRJ46
         cM/rLErxVPBoL184WuWWYO8Pl9RNG/cHOGuyRxAJJ2LchoVoviNjOB/CI35SMFNCvVvS
         xtiKJdNDvc4KaQUo6jjh8APBfx5ht2bsv8/ytA0xUzU+qGoF6bkyQ8lPSvsXsDtJWhvV
         hGjNGlbC8K4UfZ8dP5ubV7x/u38oqbEw2WE+8BFCcqSuDAefDf+rhvg0Jw0NRy9ofAG0
         MjRQ==
X-Gm-Message-State: APjAAAXlX1FZ5LMLVdhwCa6roWzVRE/tByRCeEbtGVgNKalvKs2x8aNB
        +k9+jZSGPY+m4ct/Cy4PCfmFj0rmJ9HssA==
X-Google-Smtp-Source: APXvYqxnQPc8uylG3Vch3Y5Tb7DiuQJ87G8GH7fcOBvIRwt2mlcz4eOXf1LUsAUj88af8nCLk1cElQ==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr1792485wmh.78.1557822414947;
        Tue, 14 May 2019 01:26:54 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:26:53 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] Add drive-strength in Meson pinctrl driver
Date:   Tue, 14 May 2019 10:26:46 +0200
Message-Id: <20190514082652.20686-1-glaroque@baylibre.com>
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
So this patch add another generic property "drive-strength-microamp". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v5:
- restore Tested-by/Reviewed-by/Ack-by tags

Changes since v4:
- fix dt-binding documentation
- rename drive-strength-uA to drive-strength-microamp in coverletter

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

Changes since v2:
- rename driver-strength-uA property to drive-strength-microamp
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

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

