Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D219F41589E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 08:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239668AbhIWG5p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 02:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239637AbhIWG5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 02:57:34 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E450CC061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:56:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t20so3775233pju.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fr7Enq1Md+/iS6o0n8IXfVQosSmEQH+2Mu6++d6naXk=;
        b=XGbJ/bAz1wNwRPORhEQJjL8UXXXNcWj8rIuHxZwAPFBFhQ5vtn3ZdMWQXxHIxQOulP
         e7BiZXQnZLv5/ziNcpQnZexJ1akH+g0yJOuFxb4Z52e7DiN95qA3mCnYkgoSJz9dQaZ0
         TLD6g4leqMUOpCrEfIuNbhKW9bBL3uwMXluc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fr7Enq1Md+/iS6o0n8IXfVQosSmEQH+2Mu6++d6naXk=;
        b=4lNQ05tCG9WSOWMfBy+9ykrbDj573CeMGDtjDcw4Cgpc6/BlAOY8Gjo37RihT0XhOm
         JsGjYBugk5VfD3Iz+p1VnFRHPXKG/q5xm3X55CP6dxuz6QExaU0YPsl6sghwOCkbJPIB
         qn923DygKWknKPKW5wWmZssEGTVF95dnGziJFW2UrCQP1ycRDg5qUOIyszwUz3enEuO/
         mA8vsTlg0yWeuMo3TIAQXGd+DQBeg9yB8SEuD9gYQTgGQ0WcQkjiM5qLQDpwvAVd6x82
         j+hPg7CJPBa22S/1n+WWmb230YGeYuYGU9sPSOxw0eE0DdhlW1MbYm/B/FbXOF9BCB+j
         WkCQ==
X-Gm-Message-State: AOAM530x0UpnJK6kLqwwhZim+1ndz5TrYRRwC7XIE6d9sxJn2lrFlsx5
        3b8fX5C4COF8xT2XNj4v3FpLGg==
X-Google-Smtp-Source: ABdhPJzW3ODPcfMkj2BqCnn8XcUBbAEEGB28eD/+I/5nulCCkg1ERrU1Rta+GOQv2IRU/1vvA8AAAw==
X-Received: by 2002:a17:90a:cb84:: with SMTP id a4mr3659138pju.137.1632380163447;
        Wed, 22 Sep 2021 23:56:03 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:56:03 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 09/11] ARM: dts: mstar: unitv2: Add io regulator
Date:   Thu, 23 Sep 2021 15:54:58 +0900
Message-Id: <20210923065500.2284347-10-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
References: <20210923065500.2284347-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a fixed regulator for the io voltage.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
index 7fba3a772fb2..19289d5b2a9b 100644
--- a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -40,6 +40,14 @@ reg_vcc_core: regulator-vcc-core {
 		regulator-max-microvolt = <900000>;
 		regulator-boot-on;
 	};
+
+	reg_vcc_io: regulator-vcc-io {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
 };
 
 &pm_uart {
-- 
2.33.0

