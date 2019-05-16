Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E3A20AE1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 17:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfEPPNu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 11:13:50 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34963 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfEPPNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 11:13:49 -0400
Received: by mail-wm1-f67.google.com with SMTP id q15so3888429wmj.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m99MP6x4cChPdhbIubtpCxGHABkHuAb2m4hPfeMsS4c=;
        b=hZmYFnESuV6VuicUNxJtmgvxqvOU0LIiIjYlEGsI0RkzI5Tk2IzOetocq1Z5UmerbG
         MOXmFIJwhjvbTTU2fuEx0yis/gk3acViM/0yeBRgGO5Ui77w1HmnFdoY9zHTRBblKKwE
         /iYeklpIPxMdpjronphLgx0HWI98eTem+wx5rbVZjX+Rva3dLo2A43odbvzv/cfEdEne
         0+HT9R4H1uACijhqnf8h86PLldxtwYSVKLuBF3FFOf6iPjL/dGBQx55aE0Ugz2uWM2Y/
         nQz02omzLe6ubaQvObP3hjE976/I+4ggSupyrmo96nbBJQjYlHZU0x+BbO9Pa0RZG0uV
         MmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m99MP6x4cChPdhbIubtpCxGHABkHuAb2m4hPfeMsS4c=;
        b=j6GkOOKlWvbJrzh842XeNvEuW+s3uYNBMtaxxvJz3ZGFl+oprha1H3sMuRJZKaiTCC
         OUXKTLMXgfKzspY6kF55vEnhue6Ka++EQQ3J27DNu96vGZf+0O1VE6Y/+4tSGiz6REBq
         dpaW/3wbdUnNudpxF9j/WHZVp8ox8EeJRtW0eeQXXjgGlgz+Awwu2+y6AJSocuIuAYi2
         tg/Fi7JVLpoeiQnNe2YBDK//TViqX/DHKwZz9PXntLBXOpPMebRGvymJ3jLjO/UL6CIb
         HHP/A18IXnYsGq6Uw0y6jZax/nc3z4151juMeiCGdn7G1CZK7Iz3LvbKZZS62vvu3yso
         p2LQ==
X-Gm-Message-State: APjAAAWVDGOZRa/uWVobghMXrLeTwZIsd4Y5vpeC78seG/bYyx0knyGg
        oK64wM1IX4w885fF+inQM/nOHA==
X-Google-Smtp-Source: APXvYqz0RBerowQxIC2ARNV37JyqrgGCqaAxT6IWvRGxWQ56B4nchusaxmMXapm+9EOE8RC7Q22Gfw==
X-Received: by 2002:a1c:a745:: with SMTP id q66mr18504974wme.83.1558019627166;
        Thu, 16 May 2019 08:13:47 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 17sm6968126wrk.91.2019.05.16.08.13.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 08:13:46 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: meson: add output support in pinconf
Date:   Thu, 16 May 2019 17:13:38 +0200
Message-Id: <20190516151339.25846-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516151339.25846-1-jbrunet@baylibre.com>
References: <20190516151339.25846-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

add support for the pinconf DT property output-enable, output-disable,
output-low and output-high in the meson pinctrl driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a7618605bf1e..10dc4f7176ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -47,9 +47,15 @@ Required properties for pinmux nodes are:
 Required properties for configuration nodes:
  - pins: a list of pin names
 
-Configuration nodes support the generic properties "bias-disable",
-"bias-pull-up" and "bias-pull-down", described in file
-pinctrl-bindings.txt
+Configuration nodes support the following generic properties, as
+described in file pinctrl-bindings.txt:
+ - "bias-disable"
+ - "bias-pull-up"
+ - "bias-pull-down"
+ - "output-enable"
+ - "output-disable"
+ - "output-low"
+ - "output-high"
 
 Optional properties :
  - drive-strength-microamp: Drive strength for the specified pins in uA.
-- 
2.20.1

