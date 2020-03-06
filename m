Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E9317C36A
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 18:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCFRCr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 12:02:47 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33402 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgCFRCr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 12:02:47 -0500
Received: by mail-oi1-f194.google.com with SMTP id q81so3247137oig.0;
        Fri, 06 Mar 2020 09:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2MFc1XVpBGgk6AEcnsNBIvE9WhmmAcbUo/Cvs2xI85c=;
        b=RpPj9Y5q4+UJn9pW/b7Kwdrg3bhORj+0YM/8eBslXez9OwpgpeOt6UHBJPfOu92wJ2
         852AAeE2hTCZLHKpR3LXX2NcUiFqQ8kcOLS0ZnNUnS4ZOP6VJSaYrmFEz8le4qhggVaa
         pKBiNNpoRQgcVK8GUQWwQ4wFRUiJZkIlhUoH36ewsA+HX8Zz3h0yM45u0fJ3nXVEU6L9
         oORvrLHyd/alUSBEd73siT+jnOReoL/x9mgT9AGRpDOrFLsPA8GXtEAhRyfvl6gJfDh8
         Ev1AgVzuDQaDfamdchvdXXrYtXy1bQ9EZQXJ/Wt9BzTn1DMsGrMbJnUgqzkSL9Anv+4n
         7TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2MFc1XVpBGgk6AEcnsNBIvE9WhmmAcbUo/Cvs2xI85c=;
        b=TSbJIEO/EugFHTUFOWr+8ZTaDHhhoXi+858krzz9InlkDJRLNu3Yp4wVT1jc8bmsNz
         6M5Uc2iqW0jpdA8urmuenIvMXIdjyzdbKU1D4EpZJ3R86OxGY68B7fpJdBex5DWBpi94
         HVhMvL0vPPmer7mPq1+kSiucDOngTUhsTmAPCM68s0bWQEqVKsp9WLfpQrqJ0aepFx6u
         468fsKceccuPDI8gWBeY3ueVhLiKEYm3MZ55Dx1OdQxafcpwGJzPz5UR+bPmZKm7oyyR
         TjWGj3NApLk+jvDSFPjbOjHMBMvlNKpxTmGBjMvIlxk9nh0sSrhWXhHxYNh+Hs+KOGCK
         /mpQ==
X-Gm-Message-State: ANhLgQ2oo9aij3ladrZOJKjR7whH+Nv56WgGUQOqIeehRECPVzVOeY9w
        Mcu5+yadJkW0gqN3er1X3PpewnJTFh/Jhw==
X-Google-Smtp-Source: ADFU+vtYviDTTw2iA0J9RyZkZwYpL04cVYUjDVyejtYkAWydvd+wZPz49nK+4daEeyjDhKT92rwoFg==
X-Received: by 2002:aca:3081:: with SMTP id w123mr3017028oiw.31.1583514166604;
        Fri, 06 Mar 2020 09:02:46 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
        by smtp.gmail.com with ESMTPSA id t9sm11550743otm.76.2020.03.06.09.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:02:46 -0800 (PST)
From:   Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To:     joel@jms.id.au, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Andrew Geissler <geissonator@yahoo.com>, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: zaius: Add gpio line names
Date:   Fri,  6 Mar 2020 11:02:18 -0600
Message-Id: <20200306170218.79698-2-geissonator@yahoo.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200306170218.79698-1-geissonator@yahoo.com>
References: <20200306170218.79698-1-geissonator@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index bc60ec291681..4bcc82046362 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -478,32 +478,61 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpioh_unbiased>;
 
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","","","led-sys-boot-status","led-attention",
+				"led-fault",
+	/*E0-E7*/	"","","","","","","","presence-pcie-e2b",
+	/*F0-F7*/	"","","","","","","","checkstop",
+	/*G0-G7*/	"fsi-clock","fsi-data","","","","","","",
+	/*H0-H7*/	"onewire0","onewire1","onewire2","onewire3","","","","",
+	/*I0-I7*/	"","","","power-button","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","iso_u164_en","","fsi-trans","",
+	/*P0-P7*/	"ncsi_mux_en_n","bmc_i2c2_sw_rst_n","","bmc_i2c5_sw_rst_n","",
+				"","fsi-mux","",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","led-hdd-fault","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+
 	line_iso_u146_en {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(O, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "iso_u164_en";
 	};
 
 	ncsi_mux_en_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "ncsi_mux_en_n";
 	};
 
 	line_bmc_i2c2_sw_rst_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "bmc_i2c2_sw_rst_n";
 	};
 
 	line_bmc_i2c5_sw_rst_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "bmc_i2c5_sw_rst_n";
 	};
 };
 
-- 
2.21.0 (Apple Git-122)

