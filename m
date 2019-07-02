Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB695DA40
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 03:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfGCBGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 21:06:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37140 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfGCBGm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 21:06:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so739034wrr.4;
        Tue, 02 Jul 2019 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S20bz31fyF77AkCnu33n045r7OsD3M49ELgeQB5vs2I=;
        b=rKpfxsJDnfWd69UQSEtuSYNwHLwMhWWZHwStq/bYSyaH6PbKVNxQURWaJgcGWFPN9m
         u/JWYj3XXSbXBVPn/ysJyfDQiWWzEqwYJXt0mHyG4W9IAc6c1XDcPtRBCzvcTRIuMzol
         jQ2G1QvgzZNZv2XpMUuCdqFR/hD+sdI6Hgmbs4OcnIlQOyGozzyNfRYRsmm/ENnDnmaj
         j6q6GSXYZoB5okODrjO6w+dnZEbx5tCHLU091aDt7NmZeZ77F+ZJitaNpwgIe++MB0R5
         MG9z4IdCowKEICdq/Bb5zIFlNoGXQWr8uaFO+lu8RgQMnMp8to7n3kyjMMsuM1q/Lkb2
         3GBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S20bz31fyF77AkCnu33n045r7OsD3M49ELgeQB5vs2I=;
        b=mYlkd/ZHdUUoXmtfaVGzOGgGBTVFaop78jeLky30dCFmPwFPrbyd+PE1rF6IngZkXW
         uNk3wj3nFwYP5D5Lw5zx0v4kT4wCFW7izBVruthvnV/nuLrnkwdF9mK21pje4tISyPeM
         AS/0aNa63GtnJEXnehOdjgrweRaKEHpgjZWcYrVxfIwVwSoYT5qU775u4uijJWh/0iWt
         fGvfX2UmbzUlLzR8AiYDXZT7yBBtGaQPNd7vx64skeieYwfELtx6uuBAkGaYcdXfBScG
         Xc9FNZulZxxQTfL07/NJTOf0xxXTuC24T7ePSkfM4Ac+XcAGY/dUHcsXZBaqjVg6jH9d
         /8fA==
X-Gm-Message-State: APjAAAWN2UIgGDqndabBf2NQu0wgX/iMzerFdu+Qpx8Xqytz+U0MgCUr
        DzWiaKvURnMgYcsNzYTTuz6bvvp0
X-Google-Smtp-Source: APXvYqx1Hug9iFC4i/SltSeb9jObF12BCPzD2m1B8Z2jZTjofJXOFWZBgti1p0PY0OsOf/6wXgWnHw==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr24167876wrt.111.1562106788347;
        Tue, 02 Jul 2019 15:33:08 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id 18sm253513wmg.43.2019.07.02.15.33.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 15:33:07 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     blogic@openwrt.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc:     dev@kresin.me, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/4] gpio: stp-xway: small cleanups and improvements
Date:   Wed,  3 Jul 2019 00:32:44 +0200
Message-Id: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series brings a few small cleanups and improvements to the stp-xway
driver:
- enable compile-testing
- preparation for whenever the lantiq target switches to the common clock
  framework
- easier to read (for me)

None of these fixes any known bugs so there's no Fixes tag anywhere.

It's probably too late for inclusion into Linux 5.3. No need to rush,
I'm happy with 5.4 as well.


Martin Blumenstingl (4):
  gpio: stp-xway: simplify error handling in xway_stp_probe()
  gpio: stp-xway: improve module clock error handling
  gpio: stp-xway: get rid of the #include <lantiq_soc.h> dependency
  gpio: stp-xway: allow compile-testing

 drivers/gpio/Kconfig         |  3 ++-
 drivers/gpio/gpio-stp-xway.c | 33 +++++++++++++++++----------------
 2 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.22.0

