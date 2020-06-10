Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6631F5192
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 11:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgFJJx3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 05:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgFJJx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 05:53:29 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB95C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:53:28 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so1685371ljv.5
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JnYRXPTv/NgZ4PLEUI3sd9KbyWTO5rrfKL/GZOiTmKA=;
        b=AlLp5JXGOjnlwC4DRgTBKH0vmwnRw1YA8RbU5WfKBSDMbYyLoguGM4oxud49iAXSMn
         2iOa2UVUiiuVWE1LQFGoQENuAaDi0wVKsM5tJcK1d2URcxpxKam6Fv10hhWtywCrwTIJ
         O8oXXasueABCZvO+xFNfNERd3MkKWb7YL5TzRjsPfvNFugdZXJ/kfojdfZuwM9PNa0/8
         27qCSmUCgVrDmR2cSQM7McU1Rs9qErLin0unC/kUJCoRRsGksKq9OFV6qXF/BdujVFfU
         4RLRLgK0VsDlUhZikBj/MLkG+tJOfy5NQaMQAmtecsCfNXJ7/lyXbJ3d0KU+LoohvSjY
         bdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JnYRXPTv/NgZ4PLEUI3sd9KbyWTO5rrfKL/GZOiTmKA=;
        b=VGBcmNo0uoQgY+jxUt+NZo5Ssq06LZcEGUj4HuiFxePhXBrVe/efZ+s8fBA6j9MCHW
         9GjyiS9AxjkxImL9PEQd6ReC+TXz82RucpSUXHZwXMh4x3EHpiljKTOowo162gj+lcy+
         wm2K68ekiJoK8KQGzmKgCvnBMy5fryPBbp9W+6rb12SE57VppA5886vG/DTi7FqUwgvG
         7RWju1ooDERFgUSw9CFZG1MoXvm3hbD5y2aCC+6mYXuPl2MSvARo3sAOrMBr4FBVf6FK
         YIeclUhiCFmuywW2jYvd9fkY6uv3p/dNBRXgMXTTkMV+Y648CsSqpQqo8wO28R+J5OJn
         DdMg==
X-Gm-Message-State: AOAM533Uzk3yYJUKPk0y2ULN3u8XB8rCzmxh09RmLdrQfORKSiA/qddm
        o0/illXDJ/fcpisT/7jD9YfRBsYHCV8=
X-Google-Smtp-Source: ABdhPJyGAxxwNZMeyU3VuIk4RxEXA5QxW7tqtnnZpLJnYuuOE2kFOhKcxh0vA8MUqGf3IG+heHYtsQ==
X-Received: by 2002:a2e:859a:: with SMTP id b26mr1382413lji.191.1591782807013;
        Wed, 10 Jun 2020 02:53:27 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id o2sm5685412lfc.85.2020.06.10.02.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 02:53:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH] gpio: Add gpio-charger to the documentation
Date:   Wed, 10 Jun 2020 11:51:24 +0200
Message-Id: <20200610095124.170079-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO-based charger is another of the helpful devices built
on top of GPIO.

Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/driver-api/gpio/drivers-on-gpio.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Documentation/driver-api/gpio/drivers-on-gpio.rst
index 820b403d50f6..d85fb748cc52 100644
--- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
+++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
@@ -89,6 +89,13 @@ hardware descriptions such as device tree or ACPI:
   Consumer Electronics Control bus using only GPIO. It is used to communicate
   with devices on the HDMI bus.
 
+- gpio-charger: drivers/power/supply/gpio-charger.c is used if you need to do
+  battery charging and all you have to go by to check the presence of the
+  battery or more complex tasks such as indicating charging status using
+  nothing but GPIO lines, this driver provides that and also a clearly defined
+  way to pass the charging parameters from hardware descriptions such as the
+  device tree.
+
 Apart from this there are special GPIO drivers in subsystems like MMC/SD to
 read card detect and write protect GPIO lines, and in the TTY serial subsystem
 to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines. The
-- 
2.25.4

