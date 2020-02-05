Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3AA3153A87
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 22:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgBEVzm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 16:55:42 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37266 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgBEVzm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2020 16:55:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id q84so2420342oic.4;
        Wed, 05 Feb 2020 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qndbgjnKGTRqil5Ffj6ZYDKeVw7HlXNwJpUlAgm+S6Y=;
        b=q34KOhpk47Q/2E2X+VFfQB25SvVHJuhCnCg72JdZCFnW+34+VG2/GkEDFmAASAupm4
         on29xmt526yzth1T5zm/ebJ1M1wvCuY4Yx6/901AobkiGPk8jC7h3RyrgcH5Vs4C8UF7
         KN/spHDzuJjORoS0IUzm0FRkq1V9B/lbDpLuH0gB4B5pLXTjNV0uKEZCndTP1J4oCf8/
         h/1WjYJS3OGsZsmR6BFQPvhvM6grondSLwj30uUnPicUHus/rgxmJdX6sdVQ4DIV/eiN
         xO+0hbO8PBLNoTOiNpeK721XNw3+z+C9X+yrn0GnSkd+efN1vixeURjr63JB7sXnCxsx
         8Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qndbgjnKGTRqil5Ffj6ZYDKeVw7HlXNwJpUlAgm+S6Y=;
        b=dWhnrk3FWFLiHfSIgWlVbWgyzwzFeROAWrmh6ktySJM6XAydZkoRrhfZ1KFjONvoo/
         X3i9tEy1J0RSbwgAlynA/d5/A/Scq8WvaU5SqcrqVPVU1NOgzdLiTT22nASKkXBGXBYQ
         UmNpF8hJ0POHGtHXIkvOGkei7zXuuOCoq/79U3jmDMnqZaxipwgdZR+UWr3zbhZFFQnF
         6Zm8rhNG4Yzf0Ii6TlIpS8gpSB3J6e4EVLdnf3K9zhBaJWb/KovRIp3XeOMfctdMBZX7
         IYLC/ouHBGGFEWWz4A8RU+VAXWmsKiR4XmoAXWIn+LSNttkxgoQBkgsLd8AqdrigQe+0
         W2ng==
X-Gm-Message-State: APjAAAXsevqvOX4GA69TXXgg5AIKsiD+fJ+qkcM6S0GjQAF3EdN5qNFr
        CP29YAJMl/39lSCYfSFt1s5hKh8KkH888g==
X-Google-Smtp-Source: APXvYqzIKlb6ICrQEIE/J8GnWSUbGPOQNuGxtAkBKjeoaS1kBpIQsikXhsSVFf7o1NUhEsOJfJTFIA==
X-Received: by 2002:aca:fd16:: with SMTP id b22mr4657409oii.73.1580939740596;
        Wed, 05 Feb 2020 13:55:40 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id t23sm242396oic.28.2020.02.05.13.55.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 13:55:40 -0800 (PST)
From:   Andrew Geissler <geissonator@gmail.com>
To:     openbmc@lists.ozlabs.org, joel@jms.id.au,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc:     Andrew Geissler <geissonator@yahoo.com>, linux-gpio@vger.kernel.org
Subject: [PATCH linux dev-5.4 v2] ARM: dts: aspeed: witherspoon: Add gpio line names
Date:   Wed,  5 Feb 2020 15:55:11 -0600
Message-Id: <20200205215511.80333-1-geissonator@gmail.com>
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

Name the gpios so libgiod will work with them

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
v2: added upstream to patch
    prepended fsi- on fsi related gpios
    prepended led- on led related gpios
    prepended presence on presence related gpios
    dropped pin_gpio_a1 definition
---
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 515f0f208ee6..2519722928a4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -193,6 +193,42 @@
 
 };
 
+&gpio {
+    status = "okay";
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
+
+};
+
 &fmc {
 	status = "okay";
 
-- 
2.21.0 (Apple Git-122)

