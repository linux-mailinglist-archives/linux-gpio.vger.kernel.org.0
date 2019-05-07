Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3821A16329
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 13:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfEGL5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 07:57:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35279 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfEGL5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 07:57:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id y197so19627739wmd.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cMIohpfoq8ydYsh8yqcuhIMeQYx+QNBx59vvj52nmtM=;
        b=KvxZZuB2MX2DVl3lnqgiZt+iGtjzeQEPj/COF446peA5i69RRFXamMwhvQA1o7OAXe
         yXSCHgvlPe5qLe0o/xmVXnAvDe2bM/A541S/CmyMwog6ZlEivLmsWC/NLIYQ3tdWtYVb
         4u70QE/SUbU0vByzmAgzAJG1KxRjUKcaj2NuOhIhZ/bbMDkRE368iE7xnOtKn3Z8Kt2S
         +rNaRAZmXagI+0cUwgfn4mR1X9+S2ePWl/L1NZqjtDGjdiiBX/cyIf9wlsn41zKM/rOG
         /BReYnLgRTFAa9uaP9fn3YTUqEgnLGJYtvV1OOwTskbJsrSMQvdgC0a69/Coxxuqj9rh
         AEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cMIohpfoq8ydYsh8yqcuhIMeQYx+QNBx59vvj52nmtM=;
        b=ph076Otoz5XGtYK/7yGsEPUWgNx70C/uTGcMSUe/TNjAEGDyamiAR5iHmVj97s5quV
         Ws5IzdRIEsbVHvDX8ut9WWMY/zmXKMf6lHzySUVcIksFd8pjn7O2vYDwzDSgmEX2crku
         AzfteaEP1GUta1Sr0m+rzV1zyYMHEORXD8I+DnXK6tjJM99RUGQ3M3x6MSJGfEcy0glB
         0EFGgcuE5cMqQDg7niOoqqWQsPwU1M+m2k97JMsxiX9pVVy82iFoC+4oB2RnFylLf0xe
         f7lNrOaOo57bZeootvR7JR7phzbFCgRPNIFjWGx5Pbt9ODxZ0vyrbG9w2DygbZXvQah3
         RW+g==
X-Gm-Message-State: APjAAAXWptDyFfOWX6ZyVRQliP4qoWIhlFZ19xqlwegYfvDO+Ir4X2d5
        ZZDwVWjAaZF79akWpNsBJXQppA==
X-Google-Smtp-Source: APXvYqzmj2Rq5RP6yyQou3bzdy9uJ/w14kHqMcuRNezp/SQ/B/6RzFds9x8L9gkQSErOSrCkXWefOw==
X-Received: by 2002:a05:600c:2298:: with SMTP id 24mr19775725wmf.21.1557230249232;
        Tue, 07 May 2019 04:57:29 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s11sm7120274wrb.71.2019.05.07.04.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 04:57:28 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: pinctrl: add a 'drive-strength-microamp' property
Date:   Tue,  7 May 2019 13:57:21 +0200
Message-Id: <20190507115726.23714-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
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
 
+- drive-strength-microamp takes as argument the target strength in uA.
+
 - input-debounce takes the debounce time in usec as argument
   or 0 to disable debouncing
 
-- 
2.17.1

