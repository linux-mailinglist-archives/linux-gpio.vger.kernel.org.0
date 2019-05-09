Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB48A18E29
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfEIQ32 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:28 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55160 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfEIQ31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id b203so4042980wmb.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iSJwm6tn+7I484rTSQE+9G4s/2gB2UbS4DNi3jkBUBM=;
        b=WlYLxXh+1rjCDEGkdMeMxWWLV3Ie34eO+aSyiYLTI3hkiu+Zw5CzoqjRofl1Yh+6RO
         POeJYYPXQmrkJBt05aHt/g26aRiskma2SzaeDSYOiYBUxLz6U3kUbI3rSCxBEx6GhheF
         WRXNLyvkA6tIVKlT5BB0PCqn1dZZBcfyq7b6aS8vWR96/19OZ6z6wH1SzkmCxvS33AkH
         rAMHCbXeyJMr6RxDstXmZsPf/xetJKFF8lfrKvWQUtmBY/CkkZwvfsl2r5igJ8vHUvHD
         aEOZH/d1Z7pddKGJwTWy9pxygjXHHPUnR8mpxzYQ2JQGDVTToWtIycVYBA3bPA7ECLrJ
         gEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iSJwm6tn+7I484rTSQE+9G4s/2gB2UbS4DNi3jkBUBM=;
        b=OVdeUVJcPhR3iUdTux9tTRcLd8kwp7NaMbdQ5RAatqNZqBVtKBYGlT6LlJ2cly7L+x
         IsjxtilTpJGa1Maa2wzerF5mSdYEvZNXjosD//4VgJ3k96VTC4Uj3jV3rgZWgGtkXSIZ
         VW/G5n6tjXJ0IoJmsEPB7xgR7Rwk6iJ5rADH/MqEzkbKXl87RqWjI8tqNo8yVPF5iamW
         +uuZXxoOkaZJdn/oF3XwSVCBPbYEHzy6D3wsUyh+YBlevVPOIprRf+LCn/OQjMfnC+Qq
         ylOaNECZvSxR6zvxL1zZ4RQA+X3O3aamqXuiHO815fVh49c+VNJA4VeVwxPQC/iIBB9Z
         2GNA==
X-Gm-Message-State: APjAAAVUnfqs1SMQjH4J7PYyjyma9PYAFBhtzec3jkj4ZHcbXhzCX/UJ
        gSU0Z487mX6ysacjO4j8gGXhRQ==
X-Google-Smtp-Source: APXvYqzK6dDv0FaWY8L8ZZRRMKkpxob5eBlkxjUpVMDPyFaamRBtJdTrQjTU88ljiqOdVuLMIJYmaA==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr3501045wmj.32.1557419365706;
        Thu, 09 May 2019 09:29:25 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id k2sm4116297wrg.22.2019.05.09.09.29.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:25 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: pinctrl: meson: Add drive-strength-microamp property
Date:   Thu,  9 May 2019 18:29:17 +0200
Message-Id: <20190509162920.7054-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add optional drive-strength-microamp property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..a7618605bf1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,10 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength-microamp: Drive strength for the specified pins in uA.
+			    This property is only valid for G12A and newer.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.17.1

