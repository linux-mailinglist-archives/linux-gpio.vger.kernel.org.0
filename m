Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B40E20AE0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 17:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfEPPNs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 11:13:48 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53810 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfEPPNs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 11:13:48 -0400
Received: by mail-wm1-f66.google.com with SMTP id 198so4033507wme.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izMGsuKh4OaKNtMmoPYzsuIZrqZf/ZhwaQ2KkK7m38Q=;
        b=O6FAMfy1E00D7rfyyVnNT++z7+nbL/ykgXcd19bJdjprVpRdB+G16c25hH3CCNc6W+
         2f/MiIs1l2FbyNBVpXESCwpqR7qXnF6Kym2i22WwkpehytRXPXfHRU9iREWYujFsUk5R
         NMgcqnF0fMSrxSQWVrZc+u3ysgPSoEQD1VwH8EmPByCrBRrT7tydB1KD6BtZR2OMmp+q
         e6NG1Bm3RXcnqejR21Uexr4xM8Kipef10MfzC2z1cS5HwnfN+wRMEzRFNv6VxsCYFQPi
         rFknz5FMBYzuuegBU3qlaGwwmro6WEVkPjtQRe/DntnM8H4pdBoLobalW+Y0CBRAhLIp
         ck9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=izMGsuKh4OaKNtMmoPYzsuIZrqZf/ZhwaQ2KkK7m38Q=;
        b=E78Vz3MV+D9x7JMrKt9TFgRBfMDDBTkL9kU1sQx1ZvvDLcuHTuhObxDDHAARdQozr7
         6E1dsuDlQPyRqOWgg2H9yWsPr9Rot1w6nsGsYN/hMoSlRXU/64hJ7ljCqJR0bGO/39nC
         hioq7FmezvW8K4L81t2in3MayZYXehU528fubDppVDU7TAWTqAPOaJZ77MiGHg0hUKbP
         6D9G3hoRbd/BnVpHLB5jPBBUBJ8D6tSP9lwNVEuWk147AflW122JH6RpThHNiE1NWGdf
         zBxMOjMTz3ATfG32c8EK4bgYCBAenKGo/FULrRdnMy66Tuw1rtbR3Fg9KbbO2PE6dsVb
         1iWw==
X-Gm-Message-State: APjAAAUV52DjKc6O+1hSJ0nxaRbEzlAyyIMc/NLqVKJgnQZJt+wMDRdw
        1JZVLehsI9B7I+fdyBiF6YMPRQ==
X-Google-Smtp-Source: APXvYqwDQ8utDUGlwEyZtxj0oqgawoWJGWIrLrB1I0n5YfrN5JX8T21Fx+9+r0xjGOfXvlvWk6uSow==
X-Received: by 2002:a1c:7a0d:: with SMTP id v13mr15628758wmc.44.1558019625939;
        Thu, 16 May 2019 08:13:45 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 17sm6968126wrk.91.2019.05.16.08.13.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 08:13:45 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: meson: pinconf output support
Date:   Thu, 16 May 2019 17:13:37 +0200
Message-Id: <20190516151339.25846-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds output support in the amlogic pinctrl driver.

Linus, this patchset is based on the drive strength series from Guillaume
which you just applied [0]

[0]: https://lkml.kernel.org/r/CACRpkdZ+p-J5Em3rzZcUwpA-a+CVOY91CgLqoRm_QVZP6E4Osw@mail.gmail.com

Jerome Brunet (2):
  dt-bindings: pinctrl: meson: add output support in pinconf
  pinctrl: meson: add output support in pinconf

 .../bindings/pinctrl/meson,pinctrl.txt        |  12 +-
 drivers/pinctrl/meson/pinctrl-meson.c         | 182 ++++++++++++------
 2 files changed, 136 insertions(+), 58 deletions(-)

-- 
2.20.1

