Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35821A4A41
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2020 21:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDJTRg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Apr 2020 15:17:36 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42024 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgDJTRg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Apr 2020 15:17:36 -0400
Received: by mail-ot1-f68.google.com with SMTP id j20so2053349otl.9;
        Fri, 10 Apr 2020 12:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGMNxl5yMaSl8w4TVy6/u5eqbJHU/Il2MpyvoWjq+Hs=;
        b=cJ4hIknacOZTf+wTNHq17b7pSjadFHPOsl31Rr/7cFhiBWqXjznKp4SYO/Fa30y1oU
         CDgEOxy2o0za+R4gRtGHD8ZTCDK/vata9dknSwXvyhiP0jkBxQOh/HFgD82OvIKxZ5Qg
         GVlL42E+DSIrJWrjAB/hLCC41H1by0iDzKbzytR2Dyi5U4nFTQ9utqE8kI1+PKxK68Tn
         PTmNiSgYbjlMyUDrbb9Y9dGq42a28vdsobMxH29zntYKSwNEIeuqawyqtvbJ1l45uIo/
         FQFhsXzEqhns0G+zB3YZvjF8PPkiVpp4DR9/uZdINhyyajINXUs1xVP73IH1e/avxy+9
         RG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pGMNxl5yMaSl8w4TVy6/u5eqbJHU/Il2MpyvoWjq+Hs=;
        b=Q174r40tPZT8ygNkSOIp8HPlRjCsuFmJqg2iZql+mmV3JYUCtYmjyKOFFhGc4TkLFK
         gOjVVrChu8o/jLPoPmbQfy2MPuBAqIGF6lUkEqbVlhaoXDWBVlNvdNsS4u38iNWJIfUy
         2vIDebsLi5TCvpLqdA0cV2zx9P13veIsV04egEHHuVmTBk5Qk21dDJYMWV4mecAkA/pd
         FVT6XBDHdN19Yhjpk67XRfk0BtamUrOqrwSD8x1HTX7RHaQytp00c3KEpSEjycQ5kFcU
         WaMUjOWwDoRcNXcZioa4TWexcm+VBAL2E6tQwr1OyT+4YULOGNrIFifRWXdtE6Ze6VUn
         gx2A==
X-Gm-Message-State: AGi0PuZswBfJXZ8+SfPSyFNcj2HqSyLQ1JvDVXXZMwJzx/aHAv3cPlOq
        ynH8MC1/aW90qJVvVGyAUvYFPX291qnxMg==
X-Google-Smtp-Source: APiQypIPe6SDOZEbT2UuatfbKpEq3Q7lnEcSmKVNAe9RU1+ELrHnloyze7yIhau2lR+NFI1Io5EAuA==
X-Received: by 2002:a9d:6a95:: with SMTP id l21mr5173279otq.237.1586546255357;
        Fri, 10 Apr 2020 12:17:35 -0700 (PDT)
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id i17sm1597363otc.16.2020.04.10.12.17.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 12:17:34 -0700 (PDT)
From:   Andrew Geissler <geissonator@gmail.com>
To:     openbmc@lists.ozlabs.org, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Andrew Geissler <geisonator@yahoo.com>, linux-gpio@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: rainier: Add gpio line names
Date:   Fri, 10 Apr 2020 14:17:04 -0500
Message-Id: <20200410191704.82625-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andrew Geissler <geisonator@yahoo.com>

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geisonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0a7a8b84c118..01db238ce741 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -70,6 +70,40 @@
 
 };
 
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"cfam-reset","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
+				"","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &emmc_controller {
 	status = "okay";
 };
-- 
2.17.1

