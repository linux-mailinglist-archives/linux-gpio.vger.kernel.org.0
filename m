Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73518115610
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2019 18:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfLFRIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Dec 2019 12:08:30 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43651 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLFRIa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Dec 2019 12:08:30 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so8395228ljm.10
        for <linux-gpio@vger.kernel.org>; Fri, 06 Dec 2019 09:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=RJvo8dm1C4RBvX1inxnpeI4gjWGaZu/lxsw87fYACSk=;
        b=ZKEdKFCNBnvtG/sUsIn6WbE1agwFb7pAX0rX8oiyhTW2UVzDGNZ15Viw02DIoANhDH
         ow/UceeMZwqdeZK09cLELLKiuToZgF7sq/5+i37Nb/4KgbqTZ3eEhZHE+KeJ/3XA4zpo
         EElDnweCXYXoxMUOyM4fVseOnLlFpnvo8R1roTu5hLAirI6oSRFuLhBqdgyIKYw/GwvI
         G/M+wEWPZLKq/T8uZuJeP1J0zjigSRl8p8Ksl7G7uzks1v//9fpOIcZPv28jTsAKwsSG
         mBZBrLPveWioEqKqLgy4FhrZ3sB2Nl6BlkCrEMf8qOYXXr8840H89n7CdPL+hWK0Y3G+
         rNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RJvo8dm1C4RBvX1inxnpeI4gjWGaZu/lxsw87fYACSk=;
        b=XQnIIAoU0dC/lrm7cg/cZNSW5IMAluqw9hd8nr3TEvG84s7htBovBG/i0KBSLIYm4O
         JOvaaYgdh1K8Wztj3uso9LGAuBpsEkgiadQEIA25eBchHncFzTHvXYO5EjRo5Hmq239p
         /dyQ45a3PYduYkG7mJIq2RbZ+acSTh/pEsCam0JC9ycN88UbQ8i/CMt31PJWeC0LMN3Z
         wSAIhTwOlrPBlBSTAuu6A82uL4laI297LfQG0kTIwR56YL9v8gzXiEHWmUNM3829fO8a
         FgnXvXpm+wCfVWXA5lBPan3wsNkifVRtiuj5gPjw3mlkJb87et1ZB09E5m70V4d88zvS
         692g==
X-Gm-Message-State: APjAAAXYc5/5dcHpqgoEDGtZXRsd48N5LuwNyJypnA89nNkgdPByPvys
        TVUFad6ZyLGkZ2snhcJSmgEzF8UAHmk=
X-Google-Smtp-Source: APXvYqzJt+YACb3a8Tl61TG8pgv8gqMLZ4+X330YLPAqOz0ACqmdzKUNe8U0rzCbkaa5XP9lXfTcUg==
X-Received: by 2002:a2e:998a:: with SMTP id w10mr9545421lji.241.1575652107749;
        Fri, 06 Dec 2019 09:08:27 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id z9sm6905283ljm.40.2019.12.06.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:08:27 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/9] pinctrl: Consolidate some pinctrl code for mmc
Date:   Fri,  6 Dec 2019 18:08:12 +0100
Message-Id: <20191206170821.29711-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some mmc host drivers, but perhaps also others drivers, needs to reset the
pinctrl into the default state (PINCTRL_STATE_DEFAULT). However, they can't use
the existing pinctrl_pm_select_default_state(), as that requires CONFIG_PM to
be set. This leads to open coding, as they need to look up the default state
themselves and then select it. This series attempt to address these problems.

Ulf Hansson (9):
  pinctrl: core: Add pinctrl_select_default_state() and export it
  mmc: meson-gx: Convert to pinctrl_select_default_state()
  mmc: mmci: Convert to pinctrl_select_default_state()
  mmc: usdhi6rol0: Convert to pinctrl_select_default_state()
  mmc: omap_hsmmc: Convert to pinctrl_select_default_state()
  mmc: sdhci-esdhc-imx: Convert to pinctrl_select_default_state()
  mmc: atmel-mci: Convert to pinctrl_select_default_state()
  mmc: jz4740: Convert to pinctrl_select_default_state()
  mmc: uniphier-sd: Convert to pinctrl_select_default_state()

 drivers/mmc/host/atmel-mci.c       |  2 +-
 drivers/mmc/host/jz4740_mmc.c      |  2 +-
 drivers/mmc/host/meson-gx-mmc.c    | 10 +--------
 drivers/mmc/host/mmci.c            | 12 ++---------
 drivers/mmc/host/mmci.h            |  1 -
 drivers/mmc/host/omap_hsmmc.c      | 10 ++-------
 drivers/mmc/host/sdhci-esdhc-imx.c | 11 ++--------
 drivers/mmc/host/uniphier-sd.c     | 14 +++++--------
 drivers/mmc/host/usdhi6rol0.c      | 15 +-------------
 drivers/pinctrl/core.c             | 33 +++++++++++++++++-------------
 include/linux/pinctrl/consumer.h   |  6 ++++++
 11 files changed, 40 insertions(+), 76 deletions(-)

-- 
2.17.1

