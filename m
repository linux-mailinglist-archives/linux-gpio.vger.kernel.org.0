Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7243F12AE3C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 20:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfLZTOl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 14:14:41 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45666 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbfLZTOl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Dec 2019 14:14:41 -0500
Received: by mail-wr1-f68.google.com with SMTP id j42so24307138wrj.12;
        Thu, 26 Dec 2019 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RdDU189IRzDSSQuuwdRp+bg/X99qADOf/XTXJFRaKx4=;
        b=KVjxXtkb4O7D1uapjkYYG0rrjj+A1LKb0U6nGIXmA9OI/zMOsCv7TdGZeAOkECxRL8
         2ShuVJVy6Oq042w8o/wXJXRKtn9lViF42w0H9TnZon49HDJIU5wzP7hvSKycahF+xx2h
         uoGglak/WFzV0BJgyvdxA9EVGQG/QdUFGPxctFrSHlYw9fLFv+N4NNzX+l+QfKsCsHeW
         R6LMMvku0xaCYf5U7B95QmZm7DUAYT+xLQTfLstIKdtMgJ+bDDbGkb8AHcwDhRuX8D6n
         NQfeyhtxX2s1eXCFUBdteMva1kKruFL9VyEpxNN9G5W+j8yfQ0zZ4Ctu/K1Xh6c8A1Ba
         JqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RdDU189IRzDSSQuuwdRp+bg/X99qADOf/XTXJFRaKx4=;
        b=HoJINLRc7fSMRCgm9JrXIIYZg5uHxBGHVfkBrcWzJ3S0r6ynsd9pR+PHfrXzhUiIMO
         WUzlWyDq8rCu1KQE35oCPIdY3/1TQr19tiqz10d2wy0gWrLn0+Dvz+w+QxAXq6wpEAT8
         YWJJ7u1s+AbTiRXZYgm8E0bhBaB6HQrv2dmpjDjzELhEx3sqJWJt1qtKfu2/La0yax7Z
         T6VEyxFSc3zbfpbcUY+PvYGubd5PShljCSXsNyfwDs+sNtf2ruvevmkm6p6EGqx/NY/T
         YUnwt0jchGz6Za18ww4RPqOsidnR336y8+R/FD/UQAK00c7cMbAYkVppEcF4rM186Bnm
         RiIw==
X-Gm-Message-State: APjAAAWLtHdbdXhQDFptsthuM8KIeNWEHrxw8DU7XpkIexuV1ut//Mtv
        oG56seJPnvz05cleF6g+Y74elq+oTCM=
X-Google-Smtp-Source: APXvYqzurwb5xdQo8gGlQM8ofNX/VGIdzgCohcUjwg5XUj0XVHKV+JN1pgFVp4z/TFKgeDxZP+Shcg==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr6977473wru.170.1577387679392;
        Thu, 26 Dec 2019 11:14:39 -0800 (PST)
Received: from localhost.localdomain (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de. [2003:f1:373a:1900:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id s128sm9098950wme.39.2019.12.26.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 11:14:38 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: meson8b: add the GPIOH pinmux settings for ETH_RXD{2,3}
Date:   Thu, 26 Dec 2019 20:14:25 +0100
Message-Id: <20191226191425.3797490-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIOH_5 and GPIOH_6 can have two Ethernet related functions:
- GPIOH_5 can be ETH_TXD1 or ETH_RXD3
- GPIOH_6 can be ETH_TXD0 or ETH_RXD2

Add the bits for eth_rxd3_h and eth_rxd2_h so the ETH_RXD function can
be disabled when using the ETH_TXD function of GPIOH_{5,6}. No problem
was observed so far, but in theory this could lead to two different
signals being routed to the same pad (which could break Ethernet).

These settings were found in the public "Amlogic Ethernet controller
user guide":
http://openlinux.amlogic.com/@api/deki/files/75/=Amlogic_Ethenet_controller_user_Guide.pdf

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 2d5339edd0b7..6cd4b3ec1b40 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -233,6 +233,8 @@ static const unsigned int hdmi_scl_pins[]	= { GPIOH_2 };
 static const unsigned int hdmi_cec_0_pins[]	= { GPIOH_3 };
 static const unsigned int eth_txd1_0_pins[]	= { GPIOH_5 };
 static const unsigned int eth_txd0_0_pins[]	= { GPIOH_6 };
+static const unsigned int eth_rxd3_h_pins[]	= { GPIOH_5 };
+static const unsigned int eth_rxd2_h_pins[]	= { GPIOH_6 };
 static const unsigned int clk_24m_out_pins[]	= { GPIOH_9 };
 
 static const unsigned int spi_ss1_pins[]	= { GPIOH_0 };
@@ -535,6 +537,8 @@ static struct meson_pmx_group meson8b_cbus_groups[] = {
 	GROUP(spi_miso_1,	9,	12),
 	GROUP(spi_mosi_1,	9,	11),
 	GROUP(spi_sclk_1,	9,	10),
+	GROUP(eth_rxd3_h,	6,	15),
+	GROUP(eth_rxd2_h,	6,	14),
 	GROUP(eth_txd3,		6,	13),
 	GROUP(eth_txd2,		6,	12),
 	GROUP(eth_tx_clk,	6,	11),
@@ -746,7 +750,8 @@ static const char * const ethernet_groups[] = {
 	"eth_tx_clk", "eth_tx_en", "eth_txd1_0", "eth_txd1_1",
 	"eth_txd0_0", "eth_txd0_1", "eth_rx_clk", "eth_rx_dv",
 	"eth_rxd1", "eth_rxd0", "eth_mdio_en", "eth_mdc", "eth_ref_clk",
-	"eth_txd2", "eth_txd3", "eth_rxd3", "eth_rxd2"
+	"eth_txd2", "eth_txd3", "eth_rxd3", "eth_rxd2",
+	"eth_rxd3_h", "eth_rxd2_h"
 };
 
 static const char * const i2c_a_groups[] = {
-- 
2.24.1

