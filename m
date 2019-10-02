Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 232EDC886F
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 14:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfJBM2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 08:28:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42402 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBM23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 08:28:29 -0400
Received: by mail-wr1-f67.google.com with SMTP id n14so19415351wrw.9;
        Wed, 02 Oct 2019 05:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qP9mbplmTy0EguziRYmdZKFvmKZpgiY1goXlhQxV0/8=;
        b=Xe4ozWCsxpb6DK1agUyM9eUxlP6G03BBFhI5g4JErak3F1hsMTKXmoyANoMKXxS+UF
         OWRiAkrVC3cQOJczX/+7HhZQ8bMC3apl96os1jO6/JWJEP2BHZpDAF0bRyJQdbd0lmMA
         afH1TDc/aCLYhrc6UF4IMSf4Noe9cSvoyQYpo0qgpxktdn7I/jv5ztIFWEVBOuEfDveP
         hKAmMRuOGlokBd9/+TirOM307HbJYDWAZ8Wko3G+bYcw41RSULf9eN0mQPLmeF/+J9tC
         XwaypBneeu3VeCmfU/DxP1duZ3pCcnwOu5nrzdHsS6ow28T2CVk8VvAAZGEU1cUIX4Z+
         +hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qP9mbplmTy0EguziRYmdZKFvmKZpgiY1goXlhQxV0/8=;
        b=akVGfKDGN9KlaS7GfDnHx98C2QeedcAeu8RIoCS8uh0twWVOZMZKbUY6M/2HaZKsPI
         38mOkZ2CRPyO1EzbpI9UU6hHXfohMTHuWX0pTdvkFXn+TfZPAxJa1fVRhHgOcknkhb/U
         JBzse/qoFFdlsRK3kY6I+0R1YyyAD2SDlzfax4U6ew8DL0icpWegiNEXnIno/7b6sIt2
         9u9PEHk+1AdQkgS/tVRAFdVg6rrYMbUFkh1JAYsEED71D2IR38JmdUfjsW0Bi1aohXuz
         F8LOoB0G33BszHljgknOYlHF4tPGDitMVI+giV3UgwXEWHKFgimUJKOb1nyg+4fcVOLO
         2g1g==
X-Gm-Message-State: APjAAAX5YpK/Xf8BgNQ7EyD7TzARRLtN4fRfLcEXIT3fZkDHf5xGyxPi
        jnbTBpi+UDekDgGOQiVnsoo=
X-Google-Smtp-Source: APXvYqw9HA6mSwE4O/MajE0OyTuT/xQaPqMRcrU+p/RXgMiP+Q297cH5ORneUFjHbOQpwrdgestsJw==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr2716992wrr.355.1570019307315;
        Wed, 02 Oct 2019 05:28:27 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id e17sm5719759wma.15.2019.10.02.05.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 05:28:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Timo Alho <talho@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpio: max77620: Use correct unit for debounce times
Date:   Wed,  2 Oct 2019 14:28:23 +0200
Message-Id: <20191002122825.3948322-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The gpiod_set_debounce() function takes the debounce time in
microseconds. Adjust the switch/case values in the MAX77620 GPIO to use
the correct unit.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 47d05e357e61..faf86ea9c51a 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -192,13 +192,13 @@ static int max77620_gpio_set_debounce(struct max77620_gpio *mgpio,
 	case 0:
 		val = MAX77620_CNFG_GPIO_DBNC_None;
 		break;
-	case 1 ... 8:
+	case 1000 ... 8000:
 		val = MAX77620_CNFG_GPIO_DBNC_8ms;
 		break;
-	case 9 ... 16:
+	case 9000 ... 16000:
 		val = MAX77620_CNFG_GPIO_DBNC_16ms;
 		break;
-	case 17 ... 32:
+	case 17000 ... 32000:
 		val = MAX77620_CNFG_GPIO_DBNC_32ms;
 		break;
 	default:
-- 
2.23.0

