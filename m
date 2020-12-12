Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283CC2D843E
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 05:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438090AbgLLEIl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 23:08:41 -0500
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:42052 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438086AbgLLEIU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 23:08:20 -0500
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 397F920CCD
        for <linux-gpio@vger.kernel.org>; Sat, 12 Dec 2020 04:07:37 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id A7F2E2008F;
        Sat, 12 Dec 2020 04:06:22 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 155F03F201;
        Sat, 12 Dec 2020 04:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id EF9702A36D;
        Fri, 11 Dec 2020 23:04:49 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607745890;
        bh=mx2OOV0nH7TzIRFvuDsyycaMn/Mk7SixEXWdS4pOG0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uFs3KsoJ88+mgfllVByFsQyRaRvZldy06a7hyOR8XwhtcomZOH6VDIy0xLfYCeQCa
         9I0PiTJdT0vhPGgFu9eqwVs/+jTien8LaaC8AjRwKgVKlZ2MueDfDY2znREp64RUE0
         AHuMlvdW8Uir6wdVDwtml8OqhkuoBIfLx4BgG/cY=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jrZLTLLnP2sR; Fri, 11 Dec 2020 23:04:49 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 11 Dec 2020 23:04:49 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 16D7642F46;
        Sat, 12 Dec 2020 04:04:48 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="TyJYZXxJ";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.161.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 73FDC42F46;
        Sat, 12 Dec 2020 04:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607745880; bh=mx2OOV0nH7TzIRFvuDsyycaMn/Mk7SixEXWdS4pOG0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TyJYZXxJ7WdgOzO+tNfpgeTJoLqO4DJBx9wDuixX2Apky16n549d8RjxvhJ0vlCtM
         3cHNNDs5wdAyHVnfbaPmry0MLaGINjc0YjKk8OSb5IL1Q4uA9y8kUGnZmXo/JfnWZH
         Cf8MnwHZZlHsH/0j47uR2fz3OfeuLakFHsc6FEuU=
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC PATCH 04/12] dt-bindings: pinctrl: sunxi: add compatible for V831/V833 pinctrl
Date:   Sat, 12 Dec 2020 12:04:22 +0800
Message-Id: <20201212040430.3640418-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201212040157.3639864-1-icenowy@aosc.io>
References: <20201212040157.3639864-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [6.40 / 20.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[59.41.161.2:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         DMARC_NA(0.00)[aosc.io];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_SEVEN(0.00)[10];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 16D7642F46
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

V831/V833 are a pair of new Allwinner chips. The difference between them
is similar to V3s/V3, but the chip design is similar to newer Allwinner
chips started from H6.

Add compatible strings for V831/V833 pinctrl.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 5240487dfe50..3d6855856594 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -44,6 +44,8 @@ properties:
       - allwinner,sun8i-r40-pinctrl
       - allwinner,sun8i-v3-pinctrl
       - allwinner,sun8i-v3s-pinctrl
+      - allwinner,sun8i-v831-pinctrl
+      - allwinner,sun8i-v833-pinctrl
       - allwinner,sun9i-a80-pinctrl
       - allwinner,sun9i-a80-r-pinctrl
       - allwinner,sun50i-a64-pinctrl
@@ -189,6 +191,8 @@ allOf:
           enum:
             - allwinner,sun8i-a23-pinctrl
             - allwinner,sun8i-a83t-pinctrl
+            - allwinner,sun8i-v831-pinctrl
+            - allwinner,sun8i-v833-pinctrl
             - allwinner,sun50i-a64-pinctrl
             - allwinner,sun50i-h5-pinctrl
             - allwinner,suniv-f1c100s-pinctrl
-- 
2.28.0
