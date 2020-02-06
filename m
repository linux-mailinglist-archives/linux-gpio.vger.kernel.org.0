Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E46681549E3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 18:03:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgBFRDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 12:03:09 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34108 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgBFRDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2020 12:03:09 -0500
Received: by mail-ot1-f66.google.com with SMTP id a15so6180275otf.1;
        Thu, 06 Feb 2020 09:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IeTZrdBP9Hf13GH1UBDM8f5f9+rl1pL1drtOnzJSoEE=;
        b=Au6nzfnD9JbIjuoL9LmDt9DO926XEvDDHsqD3l/D5SC7ZozTSJ+f4XOnJpbkDsYtG0
         eg5KT4+bF59pq5e9sDR4TQE74ywJzQpYY37KE8FlsTyf6aeunElkQ4SgL9N8tMkYsaN8
         ZVG5x3SZdso7y0fWUJMwFfL6OpB/8UCT8soltYwM1BXWAfWoFR9hg0bJZFTN6HjibXSp
         c95t2C/tXP1ot8+8xJOO4Q2koHI0WlH3RQ7wV5EWwZF6PE2qWyXqLDyz6EArzslT8yK7
         5+rBsMTNPoW/clqZnguEvtTjFDjVm3rHrfJRNuGsT3bcY/y/L1PKgxGhrMeJap+HJcZ5
         IFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IeTZrdBP9Hf13GH1UBDM8f5f9+rl1pL1drtOnzJSoEE=;
        b=HDo2Hr3aYY1asMGaag14y/KQSHDd07Mrg/fiZn/p1I/+/k2EraL1iBm02fxDL+JUH7
         4VnaMsYlNqvmlPp20fgclQbkboS7Oz0vCoyzvcYhOoeFVMjp7641mWJa1/73v3QoVDU6
         x9wU8sbE+6pNlKLOaSbIWyyj9QTY2bMucJVbhSWYGcOftcv3GEQCObd/JyDV1vg+IRkR
         igDlUe4arLgbPLiyrKjo1Y2GxQUExLN0VQFPeElivLt6KC+SwRmTIGg1SJXrlXHeP2wj
         GeHj08qEMqn4Qz32VzXLNVF0HE8WOFeWfV03ffcnTvMcIlEd82T3fCVRf0dPO/9l4ZJ5
         TW5Q==
X-Gm-Message-State: APjAAAX77D0+WpnrdU1leKLbm/yvAO/vKZC+aYFR/yQDjqWr49yLZ4pp
        /0j8JzpEsbsZYQrOnaO6qDPCWNQfA19Qvw==
X-Google-Smtp-Source: APXvYqzojO5LxaWz5TmWr0czHWvxHCGQ25CU390Jrs7j5DnAUB0SRjmiKdacElgXeHOX8NXFZ1Dt6w==
X-Received: by 2002:a05:6830:50:: with SMTP id d16mr24338717otp.166.1581008586834;
        Thu, 06 Feb 2020 09:03:06 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id m68sm55687oig.50.2020.02.06.09.03.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 09:03:06 -0800 (PST)
From:   Andrew Geissler <geissonator@gmail.com>
To:     openbmc@lists.ozlabs.org, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Andrew Geissler <geissonator@yahoo.com>, linux-gpio@vger.kernel.org
Subject: [PATCH v3] ARM: dts: aspeed: witherspoon: Add gpio line names
Date:   Thu,  6 Feb 2020 11:02:34 -0600
Message-Id: <20200206170234.84288-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <FMfcgxwGDDpcbrVbWGfkMRbZCLSZqpMM>
References: <FMfcgxwGDDpcbrVbWGfkMRbZCLSZqpMM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andrew Geissler <geissonator@yahoo.com>

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
v3: added more detail to commit message
    removed linux dev-5.4 from PATCH header
    removed redundant status from gpio
    removed blank line
v2: added upstream to patch
    prepended fsi- on fsi related gpios
    prepended led- on led related gpios
    prepended presence on presence related gpios
    dropped pin_gpio_a1 definition
---
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 515f0f208ee6..2269c73b8987 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -193,6 +193,40 @@
 
 };
 
+&gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
+	/*B0-B7*/	"","","","","","air-water","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","","","","","",
+	/*E0-E7*/	"fsi-data","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","checkstop","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
+		        "led-rear-id","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","presence-ps0",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","fsi-trans","","","power-button","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"fsi-clock","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &fmc {
 	status = "okay";
 
-- 
2.21.0 (Apple Git-122)

