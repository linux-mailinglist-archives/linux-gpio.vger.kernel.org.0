Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18ADB557F65
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 18:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbiFWQIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 12:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiFWQIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 12:08:19 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D32B5FCD;
        Thu, 23 Jun 2022 09:08:07 -0700 (PDT)
Received: from jupiter.universe (unknown [95.33.159.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id DE89E66017E6;
        Thu, 23 Jun 2022 17:08:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656000485;
        bh=3PoFyOi2PuVN5eAkHhfUKGlEfV4vRXqknVKhZCnAjEw=;
        h=From:To:Cc:Subject:Date:From;
        b=QPA4ELcpdYYx23MTDi2g6vAWdqpF8SHoQ8U9hYwtymzt3F1+9y2O/V5CNRJaAydd9
         U/HycEVJK79Xi9PqqkkRlDmDfUsmCDZkqVC+mk9ZRN/adqtsqUNDyIeLxURGSu0s+n
         zgnPPVmRc0fldbgAq+yjPy4m5sIOFvfGxPpRcyLgQYGX3AbQKtihPPvtQPRAiMp3aA
         /ks74AETRVPKPsXYvhDPhz0tCYEFTi8rLTeNM4Q5nHvl6gyiq82uSOb8doJ3wXRuJL
         C1TKh4v3lxLRZzrl/8tf3uMF3Ft82PXyKhDWvdz2hTpXP/HR1OkB6JPqt8/MitHb+q
         VyaeJSKxR61lQ==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 9D2C1480122; Thu, 23 Jun 2022 18:08:03 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 0/2] RK3588 GPIO Support
Date:   Thu, 23 Jun 2022 18:07:59 +0200
Message-Id: <20220623160801.240779-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This has been part of a bigger patchset adding basic rk3588 support.
Since that gets more and more out of hand, I'm now sending patches
for each subsystem as individual patchset. Previou patchet:

https://lore.kernel.org/all/20220504213251.264819-1-sebastian.reichel@collabora.com/

Changes:
 * None (except for collecting Acks)

-- Sebastian

Jianqun Xu (1):
  gpio: rockchip: add support for rk3588

Sebastian Reichel (1):
  dt-bindings: gpio: rockchip: add gpio-ranges

 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 ++
 drivers/gpio/gpio-rockchip.c                                   | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.35.1

