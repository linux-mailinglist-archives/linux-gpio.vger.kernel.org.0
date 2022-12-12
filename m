Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70CD2649C7D
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 11:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbiLLKmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 05:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiLLKlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 05:41:01 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB7D11A2A;
        Mon, 12 Dec 2022 02:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841337; x=1702377337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f2aMQWwuwPULO2V9GusZCdf7rDoCWIltL+nrLOH5sFo=;
  b=d6QUxB6ffHsROuzah2NBafXOZ1/xDG3lAqtzhMwmx1NwAvB2LZw5cDyi
   kaYOFFFuyVjC3Az6ip4ExY7QyXnM0p6HouzT4Wznq+nD01J+OHpwcxnbl
   RViyDVXBrIT0NpbMb9g43bmcYJ1IEDB6cXoSMFYy1tn6oxjj0enr8Tw3D
   QRAzey4X2vIXU1uUVU1PbnJ0hVBtbawTFBUucUnqqe8EYfwKFx89NlBFL
   ozDCaNtxof4WwX/L/ldK/uwSBqA96xX5BAqDUs3TwpjGOXM2ztXI+rwYZ
   pyGOqW3j6EcpjXoWBFfVwhepW9OJ/iZfxajW0OXJs9a0IGsg4//3Lr/0t
   A==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892496"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Dec 2022 11:35:32 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 12 Dec 2022 11:35:32 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 12 Dec 2022 11:35:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670841332; x=1702377332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f2aMQWwuwPULO2V9GusZCdf7rDoCWIltL+nrLOH5sFo=;
  b=TewM85Ugf8I8o04K9hThGTn1z37szyGSpmTpTWR6ith+1DkHp7aPi5gR
   i6WgRBpd+b9AUjdMzsWeQUA+LVX9MU3lRqggZYFJOrjg8/y4sDOVmD4l+
   1w5sw8rJNJ2BUR8w8aUFCHRMtoYv/HfIv14aBqkgi4mvRciR47YXJCGU3
   gCtPpupohY+vUaha/nkaVjUlGb3X/+Emra84X0kRacfRqQC1k59Ban9GI
   iTl24hvC/qY4bo6+PiMv+OrCqdBKYs+x/jL1lPUAF42+tSOP16wddIhEU
   WwvCdaDSsM6pi9YKjci2+bio13KIeeLIg01jX8hI5lBs+HOorfkZV2Dm/
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665439200"; 
   d="scan'208";a="27892494"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Dec 2022 11:35:32 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7384A280072;
        Mon, 12 Dec 2022 11:35:32 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 1/3] dt-bindings: gpio: Add optional ramp-up delay property
Date:   Mon, 12 Dec 2022 11:35:23 +0100
Message-Id: <20221212103525.231298-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
References: <20221212103525.231298-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a ramp-up delay (in us) for adding a delay after enabling
GPIO. This is necessary if the ramp-up time is increased by some external
components. Usually this is quite fast, but certain combinations can
increase this to grater than 100ms.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/gpio/gpio.txt         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 5663e71b751fc..b87669dce9a61 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -182,6 +182,28 @@ gpio-controller@00000000 {
 		"poweroff", "reset";
 }
 
+Optionally, a GPIO controller may have a "gpio-ramp-up-delays-us" property.
+This is an array of u32 defining the ramp-up delays of the GPIO lines
+going out of the GPIO controller. This might be necessary if external
+components (e.g. capacitors, resistors) increase the ramp up time notably.
+The delay are assigned starting from line offset 0 from
+left to right from the passed array. An incomplete array (where the number
+of passed delays are less than ngpios) will still be used up until the last
+provided valid line index. Setting to will not add any delay.
+
+Example:
+
+gpio-controller@00000000 {
+	compatible = "foo";
+	reg = <0x00000000 0x1000>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	gpio-ramp-up-delays-us = <0>, <0>, <0>, <0>,
+				 <0>, <0>, <120000>, <0>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+}
+
 The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
 providing automatic GPIO request and configuration as part of the
 gpio-controller's driver probe function.
-- 
2.34.1

