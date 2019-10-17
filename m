Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E54DAE18
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 15:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394445AbfJQNTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 09:19:35 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:36826 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394421AbfJQNTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 09:19:35 -0400
Received: by mail-lj1-f176.google.com with SMTP id v24so2548304ljj.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+zBO5lJZa3FrIbh59/1BOHJJsVBlTsHNnlh5BTJ2Z4U=;
        b=I6PhB0lWCJ9N16l2eDh0O1yb0N3Mo2reWBkU+8IzY5W6Y9l5WX5hwg3Khciufk+fR7
         O6p6dTx7LUJQ3bSREQhwMzdOQb67bcGzOQOXvThnRzpH44wFWVGd6oaT1RlShXdJ2m1o
         oUD3tYKndf7h1rjVeMtW0eQzvyuhBSaUBBolhJiExDWJHVYVutx+NgKDQ/4B33J6JdUy
         oF+s4R5iew7HcFQvfhJ4GlLoFFOcwOzwmU60BezlVacMkQKjQu0Tc5BBG5uHfSbuymil
         FmNU17V0HIVXToPiiE75dGIS/m6TgYNv4iOtkfkfFAc3YmG63YAsJH5j8/60ZLK+gNy1
         gYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+zBO5lJZa3FrIbh59/1BOHJJsVBlTsHNnlh5BTJ2Z4U=;
        b=pqT4dTYvSa4LnRAJrWO+ST8KPV+cANTONJF+ksxKpZX8FZnxmM9nMNkwrIh8IobO7H
         EJ+oSRXKQ9vW715K31+Cx3bpQiUedZefuQh1rcezMpDYolbRiLFYiqsvImrXbv+ceXGZ
         QvmzoKtbC0A6s9zzEXfrNR3yNTbcz97jf7dzwpKsbsGiUd9xLQPhyGOIuPo95PiLwpzI
         si3xkpm82cKpbndFX3hIhogW9yoCTTS40SBXLDBZgwwpFBygxy5RnYKdBhkcpQyt7IdI
         kVD6h3rc/g06eEMscd1JHq0s06a3kPV3ILZqddD5PE9ZNbdBUHg/r+UTRt6nskcm8D1H
         dPIQ==
X-Gm-Message-State: APjAAAXPD6u7EDwF+mmrsGWz2eRAYfXxgL376p6PDeCUGx/WLj/zGTrM
        LzhfqjjR5WbnHWEBHPB12NFziF5fwy3ULXlOLVU=
X-Google-Smtp-Source: APXvYqyu9X6Yfj1uUFZ89Q2GbFjZvz2a23i43LmDrNcweRpHdR4jjRsWUgmGzwKHI9utdCLi6e1tMJFFY2aqjZFs8mw=
X-Received: by 2002:a2e:9205:: with SMTP id k5mr2582779ljg.202.1571318373099;
 Thu, 17 Oct 2019 06:19:33 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 17 Oct 2019 10:19:23 -0300
Message-ID: <CAOMZO5AuCCs27+hYTjs2w9j=nKUv3jzEraR8q1qSDg78F84W4g@mail.gmail.com>
Subject: pinctrl regresssion on mx28
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sascha Hauer <kernel@pengutronix.de>, Marek Vasut <marex@denx.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I noticed that on a imx28-evk running kernel 5.3.6 the following
pinctrl error is seen:

[    3.758280] imx28-pinctrl 80018000.pinctrl: not freeing pin 24
(GPMI_RDN) as part of deactivating group gpmi-nand.0 - it is already
used for some other setting
[    3.773300] imx28-pinctrl 80018000.pinctrl: not freeing pin 25
(GPMI_WRN) as part of deactivating group gpmi-nand.0 - it is already
used for some other setting
[    3.787913] imx28-pinctrl 80018000.pinctrl: not freeing pin 28
(GPMI_RESETN) as part of

Looking at imx28-evk.dts we have the following for the GPMI NAND pins setup:

gpmi-nand@8000c000 {
pinctrl-names = "default";
pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg
     &gpmi_pins_evk>;
status = "okay";
};

GPMI_RDN, GPMI_WRN and GPMI_RESETN all come from the common
gpmi_pins_a group (defined at imx28.dtsi) and are then overwritten by
the gpmi_status_cfg group with a different drive strength.

This worked in the past, but no longer working with 5.3.x

If I manually change the dts like this:
http://code.bulix.org/n9350k-914661

so that these pins are only defined once, then the NAND flash is
properly detected:

[    3.752437] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
[    3.759142] nand: Micron MT29F32G08QAA
[    3.762992] nand: 2048 MiB, MLC, erase size: 512 KiB, page size:
4096, OOB size: 218
[    3.802073] gpmi-nand 8000c000.gpmi-nand: driver registered.

As we don't want to break old dtb's, what would be the correct fix for
this issue?

Thanks
