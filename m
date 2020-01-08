Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F701337E5
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 01:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727150AbgAHATS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 19:19:18 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44530 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgAHATR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 19:19:17 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so1053600lfa.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 16:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=udeufZ4m3fi/VKR8q6J9hhk7263MJ2QGYBcHYNX3pdI=;
        b=UKPmUtMWaqJZOjp891KRXMND5hcx9sTAkPhdiZIqb1wD0i8uw5SzYEVi7ZaGOERyCV
         Va7IQ46zF5UmQkTigeMkmWquaJb0z+17t39ZCkOmYRFbydGpImSmuCqeQZswY9YJQJ1d
         tjMlr9G0us1lGv/+qwcxJT5+T59rwFmO8p0+ML5I60b/yPrXu1Z/Nl+Uv+LXR+hTVPsT
         +TPAcDO24kIUhPOamgYFY2tu/8P/3nObCNjAX4gEgcbaGu/1cqjNATr3ouC+ZVmNyzQm
         5j4SwI1MlfFKnCVinEz3G8kzEVeTFV6m//8RhMy/kq2Lr8ugS24i4tmvByI19H8dyDDw
         T6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=udeufZ4m3fi/VKR8q6J9hhk7263MJ2QGYBcHYNX3pdI=;
        b=owbcSg41wyxT1gKE8248yUnKzqXi++j6s1gD3W63RV1v0nNiunitVanlCOfftYMzvo
         A4srZh1heqCctUIeqtO5qV4KSb/g9WGY1tsKyfCtCoiFCvVIAhDaR4sPV3+/t+LB3aNC
         qY9/PBB6cQ9ZXpYMgj9aBf7Quk8npcGWhNE7s9rc2+WVTVgh0WJOhS65Qr7WSrvqsEkE
         n9Jw+0AbaHmxHYTTa7bZTI9Y3xjzjg7EaRD9Kq9/WBzqCXgBA3y/JyMh0jVBktLxU4N6
         jtIluR7NRDGwU69dUPsAz/JGupxl7fuxRAOZNf9rgoeGjoTbJ6UlPs//TMiLQYy8KVCE
         pnUw==
X-Gm-Message-State: APjAAAUb0P3wusJBNz3gUMagT/IFamnbNIjhBl+vuMoyxQpQLNYLfOEd
        rmWqAToL4mJoi9klgQ+JAqD9wa9VkgnkZg==
X-Google-Smtp-Source: APXvYqwuBTtVHZU9zcHcLAW1Bo+Gm1RIN+pIejV7bwF524R9MOTyq/tj0Vw9utujTdwr3MzZnQi4wQ==
X-Received: by 2002:a19:7701:: with SMTP id s1mr1202424lfc.180.1578442755538;
        Tue, 07 Jan 2020 16:19:15 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id b190sm502121lfd.39.2020.01.07.16.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 16:19:14 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Add use guidance documentation
Date:   Wed,  8 Jan 2020 01:17:12 +0100
Message-Id: <20200108001712.47500-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The text in this new document is a response to recurring questions
about the GPIO in-kernel API vs the userspace ABI. When do you use
one or the other? It can be a bit intuitive, but I tried to sum it
all up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../driver-api/gpio/drivers-on-gpio.rst       |  8 +--
 Documentation/driver-api/gpio/index.rst       |  1 +
 Documentation/driver-api/gpio/using-gpio.rst  | 50 +++++++++++++++++++
 3 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/driver-api/gpio/using-gpio.rst

diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Documentation/driver-api/gpio/drivers-on-gpio.rst
index f3a189320e11..820b403d50f6 100644
--- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
+++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
@@ -95,7 +95,7 @@ to emulate MCTRL (modem control) signals CTS/RTS by using two GPIO lines. The
 MTD NOR flash has add-ons for extra GPIO lines too, though the address bus is
 usually connected directly to the flash.
 
-Use those instead of talking directly to the GPIOs using sysfs; they integrate
-with kernel frameworks better than your userspace code could. Needless to say,
-just using the appropriate kernel drivers will simplify and speed up your
-embedded hacking in particular by providing ready-made components.
+Use those instead of talking directly to the GPIOs from userspace; they
+integrate with kernel frameworks better than your userspace code could.
+Needless to say, just using the appropriate kernel drivers will simplify and
+speed up your embedded hacking in particular by providing ready-made components.
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 5b61032aa4ea..1d48fe248f05 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -8,6 +8,7 @@ Contents:
    :maxdepth: 2
 
    intro
+   using-gpio
    driver
    consumer
    board
diff --git a/Documentation/driver-api/gpio/using-gpio.rst b/Documentation/driver-api/gpio/using-gpio.rst
new file mode 100644
index 000000000000..dda069444032
--- /dev/null
+++ b/Documentation/driver-api/gpio/using-gpio.rst
@@ -0,0 +1,50 @@
+=========================
+Using GPIO Lines in Linux
+=========================
+
+The Linux kernel exists to abstract and present hardware to users. GPIO lines
+as such are normally not user facing abstractions. The most obvious, natural
+and preferred way to use GPIO lines is to let kernel hardware drivers deal
+with them.
+
+For examples of already existing generic drivers that will also be good
+examples for any other kernel drivers you want to author, refer to
+:doc:`drivers-on-gpio`
+
+For any kind of mass produced system you want to support, such as servers,
+laptops, phones, tablets, routers, and any consumer or office or business goods
+using appropriate kernel drivers is paramount. Submit your code for inclusion
+in the upstream Linux kernel when you feel it is mature enough and you will get
+help to refine it, see :doc:`../../process/submitting-patches`.
+
+In Linux GPIO lines also have a userspace ABI.
+
+The userspace ABI is intended for one-off deployments. Examples are prototypes,
+factory lines, maker community projects, workshop specimen, production tools,
+industrial automation, PLC-type use cases, door controllers, in short a piece
+of specialized equipment that is not produced by the numbers, requiring
+operators to have a deep knowledge of the equipment and knows about the
+software-hardware interface to be set up. They should not have a natural fit
+to any existing kernel subsystem and not be a good fit for an operating system,
+because of not being reusable or abstract enough, or involving a lot of non
+computer hardware related policy.
+
+Applications that have a good reason to use the industrial I/O (IIO) subsystem
+from userspace will likely be a good fit for using GPIO lines from userspace as
+well.
+
+Do not under any circumstances abuse the GPIO userspace ABI to cut corners in
+any product development projects. If you use it for prototyping, then do not
+productify the prototype: rewrite it using proper kernel drivers. Do not under
+any circumstances deploy any uniform products using GPIO from userspace.
+
+The userspace ABI is a character device for each GPIO hardware unit (GPIO chip).
+These devices will appear on the system as ``/dev/gpiochip0`` thru
+``/dev/gpiochipN``. Examples of how to directly use the userspace ABI can be
+found in the kernel tree ``tools/gpio`` subdirectory.
+
+For structured and managed applications, we recommend that you make use of the
+libgpiod_ library. This provides helper abstractions, command line utlities
+and arbitration for multiple simultaneous consumers on the same GPIO chip.
+
+.. _libgpiod: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
-- 
2.23.0

