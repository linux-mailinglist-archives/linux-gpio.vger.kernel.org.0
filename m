Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DD518E10
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 18:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfEIQ3G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 12:29:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34012 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbfEIQ3E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 12:29:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id f7so3953355wrq.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2c6x2f6eeQDgR5pR9v6L40zLzoX5XJYrfYvIkaAjp04=;
        b=AceFazVnmeo70zmUKXtxzROx9A0pF/jf2NP4g67cih0dsIVE8raO2aXjWOpQftWJ16
         K05BKCVSCYOrleouRkKx/3/7zaQ1HY+3/DFwOl9dHfS14JkoW/nI+LwXqANF00YebUuU
         Whw5FvGLzg2U9KHcsoGyT5KzdkwITja11hmwLkgYW0/T4rFrQIoThcUpBa1b/4DfG/zr
         cLsdBVldWwciEpp3dLmJ8dR6d87uilDLaPksoOKNF+/GfrBuXOBmQt67ON4kaQ0OkM26
         qI+idgB9mHmRSHFk6vHJOfM+vqyO+10wKLG3PbPCqPe670JH0hFfrAReSNWAvlndLddi
         2Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2c6x2f6eeQDgR5pR9v6L40zLzoX5XJYrfYvIkaAjp04=;
        b=FkIgudcLc8QB+ALUe/5yNaHIj+XYQh94HVyr/xUM2wZIoT/m0GBMnGq0sqS7RCyoN6
         L8mrDl8XRA29E6rf6XUsl1M1l2x50ZegXwIOoT4KG6289v22P18milie8tB0tdsEdvAP
         FQ5oPlZqO8/fn79r7zGh+/d7kn2ydiajkgr9Q09szdD370xU0CNJSCcGMfcAo10L2gDW
         OGJo6b2PSm6Kl4nV2plI1w9lwfpBY5dKZePuc+xmL5tWe2+JlFVqyQ6n88Ib2X5bkqId
         FkNkpEAzjavEHylg62Zi9/4o31bVZtYPGRJggqXTtVqO4GvAi5GhHYzVEGUAmg1LuoTf
         Z6FA==
X-Gm-Message-State: APjAAAXadaNrr1M1DvAw+ct2uk9svaS4HxsOBWk/Py6TgcofeF658ecY
        s2QftV/+4RNmZKQGdsuQ4Ya4s+CgKgMt9g==
X-Google-Smtp-Source: APXvYqyp+4swpGavdNb86NApkf1sjatdLA1EpEUZb9DAAQXR/gTO708mEf2oPQL5TovnEcFr/6JQ2g==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr3932396wrq.119.1557419342344;
        Thu, 09 May 2019 09:29:02 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
        by smtp.gmail.com with ESMTPSA id z7sm3649796wme.26.2019.05.09.09.29.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:29:01 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, khilman@baylibre.com
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: pinctrl: add a 'drive-strength-microamp' property
Date:   Thu,  9 May 2019 18:28:54 +0200
Message-Id: <20190509162859.7001-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509162859.7001-1-glaroque@baylibre.com>
References: <20190509162859.7001-1-glaroque@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This property allow drive-strength parameter in uA instead of mA.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
index cef2b5855d60..84adce9f2a75 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
@@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
 drive-open-drain	- drive with open drain
 drive-open-source	- drive with open source
 drive-strength		- sink or source at most X mA
+drive-strength-microamp	- sink or source at most X uA
 input-enable		- enable input on pin (no effect on output, such as
 			  enabling an input buffer)
 input-disable		- disable input on pin (no effect on output, such as
@@ -326,6 +327,8 @@ arguments are described below.
 
 - drive-strength takes as argument the target strength in mA.
 
+- drive-strength-uA takes as argument the target strength in uA.
+
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- 
2.17.1

