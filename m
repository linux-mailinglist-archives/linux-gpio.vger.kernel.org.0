Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC9A81735B2
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 11:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgB1K6f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 05:58:35 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44705 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgB1K6e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 05:58:34 -0500
Received: by mail-ua1-f65.google.com with SMTP id a33so793794uad.11
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 02:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pJRnjkrYSEoukXYQpbOMLDRASpxUllNw+8/8as6MqeE=;
        b=prkL/o5D8aJ8y5nYxi0MTlPmzNE6O6Yc0MHGBVqzJdZXEw/sa5eb8R/jxstOHGX/l0
         qYIUHibPRRLwzDvEE7Kgr5C4+zo9MG4f/MwgddKtcKAWwg8neUGGvyoPHEalYJozjb6q
         Xvx9gEQWsZhSwtoHb3AfZuZoztMzfnzXAGubNKlCYyQVo5T/vkwtOgVyNUgtNbnsfnVZ
         oN7Djfv2wRSbZ/xlpNMcKgucZk6V8qr3H+NKqW3h0c+TbX4zIxzkbsyzsVexPqQtUo2r
         SEBM25jLLtpAJ1hM6SgPZ1bmQ6xlbcOSktzRQZIavhCMwhFYBdIu9Q9Ejwzp6Pri78dj
         lOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pJRnjkrYSEoukXYQpbOMLDRASpxUllNw+8/8as6MqeE=;
        b=oAF39C70g/kZZHFo3bjyBZlth3TsdRk6fgY3h257t5eWJ5+guNs7ULo6Pu8J+pcrrd
         9ADIBkbwKI18dWqUlApGVAtyeoTYiuEXJAUV6SaIZvKt6/byFKVTAAMO5Sj0FFdgpYkM
         QjnaZEoEIQhjhb8C6JdBQxSfDfV35SRLwU9BLQtH3+cnFjobkQ2VYPfATKTOy0N8JMWS
         sg5aSs9cvTMMVo/LRda9YPqPn1Ibvccm8ygE27/v9z0dP6iSiTOWtAXZEnZrvDyPURCX
         dK6nYZ4jPKRfmEkodLzsGxu/e4pWFXw4r94uaYeySi+2t71dCJPr/diidEV0IS0rJLhJ
         XkUA==
X-Gm-Message-State: ANhLgQ3UclAgU3ScjL4LEVb2rjFSj134VcqN3hyUrUfDC98BiXHbiCT8
        DgrQ4kcLFmbeFHg2c9aJPqSTE/WTiiu9WnGELWiJ7MpQ
X-Google-Smtp-Source: ADFU+vu/mr1WKjNbYuWeJBEL1jp7bG/13WjPVyRHkCsJPGMA1Mw1bLQ08IkY5LIziEWwO+1DDh7cli3anXUn3MgUT+s=
X-Received: by 2002:a9f:3ecc:: with SMTP id n12mr1672855uaj.45.1582887511693;
 Fri, 28 Feb 2020 02:58:31 -0800 (PST)
MIME-Version: 1.0
From:   Romain Izard <romain.izard.pro@gmail.com>
Date:   Fri, 28 Feb 2020 11:58:21 +0100
Message-ID: <CAMiSF3BULWkyWTytTBcFfch9YaV_QzuBiawk-ZqEcQnsuGdUiQ@mail.gmail.com>
Subject: GPIOs not correctly exported via sysfs on ATSAMA5D2
To:     Linux GPIO List <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

While experimenting with a new chip, I connected it on the SDIO
interface on my board based on a SAMA5D2 SoC. For a first step, I need
to drive the pins on the SDIO bus at a given level to program this new
chip. To do so, I tried to control the GPIO lines manually by unbinding
the SDHCI controller, and using /sys/class/gpio/export to control the
pins, with the following code:

echo a0000000.sdio-host > /sys/bus/platform/drivers/sdhci-at91/unbind
echo 4 > /sys/class/gpio/export
echo low > /sys/class/gpio/PA4/direction

Unfortunately, the state of the pin does not change and it remains
driven to 1. I checked the configuration register with devmem2, and it
appeared that the selected function remains the SDIO function even after
calling export.

The issue does not appear when I use a GPIO in a driver with an explicit
pinctrl configuration in the device tree, which explains why I did not
see it until now.

The kernel version used is Linux 5.4.22

Is this a user error from my part, or is there something missing in the
AT91 PIO4 pinctrl driver ?

Best regards,
-- 
Romain Izard
