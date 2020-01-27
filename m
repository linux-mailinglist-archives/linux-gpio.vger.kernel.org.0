Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C283114A992
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2020 19:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgA0SPs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jan 2020 13:15:48 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:42579 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0SPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jan 2020 13:15:48 -0500
Received: from localhost.localdomain ([37.4.249.152]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mvs2R-1jlEAl0Ixr-00suja; Mon, 27 Jan 2020 19:15:40 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [RFC PATCH 0/4] pinctrl: bcm2835: Add support for all BCM2711 GPIOs
Date:   Mon, 27 Jan 2020 19:15:04 +0100
Message-Id: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:yg/rb5wFqWdXj81dOcYj28x9Nt0riCHuDWx9306t0g0mf3IueD2
 uizd9G/+uVDXYWmIGnORMVPQmXYPlJXE9Wf+2H9FqFAmDXZewNCVUYtJhIpAxL3wwzisGXn
 m5pWiDAL5AFhnCxhXNMHoKtYE0xDj0Yb4ewhQ02Zij986KKCtKd6zffB0ebGiWzGbLHw7Au
 2IVOQAFWeuXw2VtlMpHqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aKF8x4iqoY0=:9uBiIsisJ6lNO1jewQmFmR
 L5YZJPkXOqZn2cu9arXDiuLsXqQpWc8sa44MTl611OCZgD1nQQ2znlss/ub+ooNaDDdtUSok8
 BvBk9BTkVoRSvLwvkwS04p325ncEk8w39vHXwAq4uyG+B+o+wXuS8Qd1u78j7d+89WywSQ2gk
 A8wLmmZ9cIyS0d436/S7rxxK+OR6BIbJ2bOi0JCbW4vzBAkdQzsvGqY51bbEMNB9ZptSpJ9Ws
 RcNjs+ILuQy0pcBit8vCxAeiO86FrayGXp9CVMucwIPVqoz8UwJFHZQjHiK6xsfiJaeX6Yioo
 jra/rbGmAPhtpn5oYdzjPr/SzTtFQNgW4eYtNS/SzXchPkqZwmavTMrV+8drNfH7fhT/Od9tP
 G6kCVIqgec1rpwy/g09DjkcBqifzgr6vKnXPd5ILGDMG5vpGwvZkAm0XFnrGwxYa/cfOEuLeh
 QXJasanJHX4AmSGOWbdEUqslUeKyhzoBCBG6dAOkKK/n2jyThf5ON+lfRUPY2PZHvuGqctFTN
 jZsxE2B2ARlFjsNNezJQD1+3K5WGocqKkHJWmurhW3IgLwq8UzKmMPs/FGIWbFKOhJmprrp4R
 OiXIAQhjHvvkdmwlGzb7mYDsrPLVkNTQ1ASSWkIQvs2it7dRlVXNIoUtTG3y/ekAlr+6P9jId
 hxU9yUu47d4QwbA0hLDd6pPbWO4MiT+6faut/LySNrn1UjsH8wADsraNamTjy26aHW6vDzwt7
 xacbJod8O+urUArV0jkO9/dUXzvv4Xl2oWWCJilgc4vVOknZqIYCAPvW3nAJ2GGl6RGlaF55r
 hGSXgYkdGDByZTZUCymfE8iMGn+a7kDyxqGFR4p3gqnVrKZCYFTsJfY/H2AwFuFCKE9Rp5T
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BCM2711 supports 58 GPIOs [1] by using the existing BCM2835 GPIO registers
completely. So there is no need to change the binding.

Patch 1 and 2 prepare the pinctrl driver to be extended to 58 GPIOs in Patch 3.
I didn't want to squash them in order to make review as easy as possible.
The final patch 4 assigns all SoC GPIOs a label as we already did for
the older Raspberry Pi boards.

[1] - https://github.com/raspberrypi/linux/issues/3101#issuecomment-573092294

Stefan Wahren (4):
  pinctrl: bcm2835: Drop unused define
  pinctrl: bcm2835: Refactor platform data
  pinctrl: bcm2835: Add support for all GPIOs on BCM2711
  ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts |  74 ++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 106 ++++++++++++++++++++++++++--------
 2 files changed, 156 insertions(+), 24 deletions(-)

-- 
2.7.4

