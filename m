Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5157A14459
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 08:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfEFGCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 02:02:10 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:37160 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfEFGCK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 02:02:10 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hNWhS-0004zI-5W from Harish_Kandiga@mentor.com ; Sun, 05 May 2019 23:02:06 -0700
Received: from localhost.localdomain (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 6 May 2019 07:02:01 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>
Subject: [RFC PATCH V1 0/2] gpio: set active-state of GPIO lines using device tree
Date:   Mon, 6 May 2019 11:31:39 +0530
Message-ID: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The purpose of this patchset is to add the information of active state
of gpio pin as property into device tree configuration using a
"active-state" property u8 array.

This is useful for user space applications to identify
active state of pins.

We have explored the gpio-hog option which is available to set the
 active states. But with gpio-hog used, the gpio-pin will be held
by kernel or the module using the hog property and the user space
application will not be able to access pin with IOCTL interface
like GPIO_GET_LINEHANDLE_IOCTL, GPIOHANDLE_GET_LINE_VALUES_IOCTL and
 GPIOHANDLE_SET_LINE_VALUES_IOCTL.

Any inputs are welcome.

Please let us know if this has already been discussed/considered or
if this can be solved by an alternate approach

Thanks,
Harish.

Harish Jenny K N (2):
  gpio: make it possible to set active-state on GPIO lines
  dt-bindings: gpio: document the new active-state property

 Documentation/devicetree/bindings/gpio/gpio.txt |  4 +++
 drivers/gpio/gpiolib-devprop.c            | 38 +++++++++++++++++++++++++
 drivers/gpio/gpiolib-of.c                 |  3 ++
 drivers/gpio/gpiolib.h                    |  3 ++
 4 files changed, 48 insertions(+)

--
2.7.4

