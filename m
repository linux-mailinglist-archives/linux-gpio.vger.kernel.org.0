Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF64242EC5F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 10:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbhJOIcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 04:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbhJOIcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 04:32:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E094C061753
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 01:30:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id ec8so35061589edb.6
        for <linux-gpio@vger.kernel.org>; Fri, 15 Oct 2021 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yywf8uxmCXs+eHVnojLOdXO3w73p4tPODGryjkUOC2E=;
        b=l4sgEo7cC46MhO+PI0YeFQne/haReZBLw0/wy6m2pDFVB3+E5ctsPNrDdkeXEPCAIf
         s4qyVnvX7o++rRkDEuviJmTtYx4crxtzpHUqAYze6yLMGaZpuB2t+Dvy7T6UTC368Cu2
         V8aW2d/L8DVIkhjuK1SeADaWD6IzrO8rqHWmNbenRsSZK+lpC4trfWbo7JeTr2lwZmmT
         dV4nYcFRRFAnJAmnWI1awDpvQkiSzfUeL8XFemU57J4IMg/5SqfW+VOeP18B90DK7zl7
         XgjUlOAK2vEW1yYvM7OWdEWRUo4d2j+R062a+/6HNb4ckgsq6coY2VR1+ICcNeawwEJo
         Uh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=yywf8uxmCXs+eHVnojLOdXO3w73p4tPODGryjkUOC2E=;
        b=mZ38P4sFv+Oivs5lAlkJwsYvdRJEfEMJ17b/t+oQxM9AyfOBbQpd/qPyPCru3RaPsd
         XI76chdkFqiFgrvuwMgYOGEC/2mKtU/Iox/d21pprq8yTOi9H5DzVak0TX74zZ7rtaWb
         LKp7a/r9BrGxu+ne/SK7yR2ViRb0alVDNUCMQGcC0GWBUxEwmRRAdZCmv3zB/XT+1Yzp
         JQ8181AAxIw6D5wFBqdkzgqWoqel3sw7RBDGo+cmO4iAGyNq6CHu+1EO0CbTqDM4udAe
         UTWRrILoEAQnfZjfHyRdXa0eBLgNyeN9ujIbYUPDGVx3Jyzc4hNwMFo2nyKTKeicscWG
         V7TA==
X-Gm-Message-State: AOAM531cnwqkdMu3+y4t/UqNUvtgGkxyhzMdOuYk1CiLAlmEjX9B65TG
        OzwwhRfIRdHxJs1jy/mFKjizeg==
X-Google-Smtp-Source: ABdhPJxry4jiBqbpg/NGImCQluSCFaGyDDT/dLeUU1nPcjHfB+LumB8PhvFLsQ4R4CK37LErl3vv9Q==
X-Received: by 2002:a50:9e85:: with SMTP id a5mr12888588edf.148.1634286598841;
        Fri, 15 Oct 2021 01:29:58 -0700 (PDT)
Received: from localhost ([2a02:768:2307:40d6:f666:9af6:3fed:e53b])
        by smtp.gmail.com with ESMTPSA id j21sm3944973edr.64.2021.10.15.01.29.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 01:29:58 -0700 (PDT)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: zynq: Add power-domains
Date:   Fri, 15 Oct 2021 10:29:57 +0200
Message-Id: <655523d7bf9658eb0b8e49a06c8b79a04052e5d5.1634286595.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe optional power-domain property to fix dts_check warnings.
The similar change was done by commit 8c0aa567146b ("dt-bindings: gpio:
fsl-imx-gpio: Add power-domains").

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 980f92ad9eba..da95b951c23e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -36,6 +36,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.33.1

