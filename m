Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C450517C367
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 18:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgCFRCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 12:02:42 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41906 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgCFRCm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 12:02:42 -0500
Received: by mail-ot1-f66.google.com with SMTP id v19so3073589ote.8;
        Fri, 06 Mar 2020 09:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0huqSOOM6TQWT/uaipc+FS4s16ouSaOa4nymxBl//rs=;
        b=E578MAb7Yr42MvvPNFo3yDbFhNAT2AbVP9J18ov7OwRiwaeS0UWnAdlPX7xu42IjK/
         55M6bqYkOS6SbkVuoPSZX5YpTLKcRGUDvUw/7zZN3UVyrhTUpMmrUyj8i94atSmzhhpJ
         LZS7Je07zTvXE46VUBdwzDh1ojHEGF/bC5WDBDx2bvne42OuXymWdMKOLknROBzFnuEs
         kVmS+VH+7OSgqPcA7L/mffmoSTi6QxV1nOpuD8qsY9QbuFRe3WBsYJFHQyWP0Gxm9Lyw
         QWN6bf2APE3id1PWNFTsri3m4NlprvDfX2HxBVF12A+vF6mp3FT1oY7bPkk3byvq6Lf4
         CD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0huqSOOM6TQWT/uaipc+FS4s16ouSaOa4nymxBl//rs=;
        b=ELzq5XDmEj4DTbJAHsL1KR5HD7W9W9cpitpVjbxEV3rMrJZBoS3qvlHNfLFJlv6K8f
         ggs+fv7ypExkH5Q0r3W90N62p1voxWcCidYTbhBqQIkaQuoguEzLPVGfV3M9XJ69IlZ/
         qUft63CEU4M/B9iFAKA7Jpc2egi6CZ8XqDKpBWhOelj5usK3adj5DjG2pkYGjMkBa3UM
         OmxDSZEDwBKXzmNiuqvyWOSX7eedmk6+y1G7l34BvSQ2u7ddItw5kzb/YQ1DRo2G5Yw3
         JnLRmu/DNy15xOu8pCOjSW6Mbng6IHbs7BJMtxGPVfmKLwZPnG1iBz37me500guseT0r
         apdA==
X-Gm-Message-State: ANhLgQ2tTlMc9Lak7f/48wPTLK6ywAN8fPu8/yHssM2OFOjDRnBioJDq
        KT3gC9jaUri/YKXto2cm/lk=
X-Google-Smtp-Source: ADFU+vsoao5aucvzlM9qEqT53U96NcowhLRZAwGIJeWQMdIOpwMlemrRqJtLU3zoSd8q9SxSQrbZdQ==
X-Received: by 2002:a9d:6c94:: with SMTP id c20mr3429727otr.285.1583514160968;
        Fri, 06 Mar 2020 09:02:40 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
        by smtp.gmail.com with ESMTPSA id t9sm11550743otm.76.2020.03.06.09.02.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Mar 2020 09:02:40 -0800 (PST)
From:   Andrew Geissler <geissonator@gmail.com>
X-Google-Original-From: Andrew Geissler <geissonator@yahoo.com>
To:     joel@jms.id.au, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Andrew Geissler <geissonator@yahoo.com>, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: aspeed: romulus: Add gpio line names
Date:   Fri,  6 Mar 2020 11:02:17 -0600
Message-Id: <20200306170218.79698-1-geissonator@yahoo.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
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
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 35 ++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index edfa44fe1f75..fd2e014dae75 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -231,23 +231,52 @@
 };
 
 &gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","nic_func_mode0","nic_func_mode1","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","power-button","","","","",
+	/*J0-J7*/	"","","checkstop","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","led-fault","",
+				"led-identify","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","","","id-button",
+	/*R0-R7*/	"","","fsi-trans","","","led-power","","",
+	/*S0-S7*/	"","","","","","","","seq_cont",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"fsi-clock","","fsi-data","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+
 	nic_func_mode0 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "nic_func_mode0";
 	};
 	nic_func_mode1 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "nic_func_mode1";
 	};
 	seq_cont {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-low;
-		line-name = "seq_cont";
 	};
 };
 
-- 
2.21.0 (Apple Git-122)

