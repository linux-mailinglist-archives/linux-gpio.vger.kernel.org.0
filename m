Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9390BE2777
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 02:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406158AbfJXAsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 20:48:21 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:58339 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405491AbfJXAsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 20:48:20 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DDCB4806A8;
        Thu, 24 Oct 2019 13:48:17 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571878097;
        bh=bWxQWGDdDIXjwP+uossCQGN3ASh7mBW21CgA8eHWdRI=;
        h=From:To:Cc:Subject:Date;
        b=MEGIZDU8xWNROqowDzvJuQ2tZSo2JvBwRhtEBrgzQP90+fvOQ/WLZaG0DX0JC878D
         9/uF4Uhd273Lziay1j7WIroL649J7acYj8+j4nkf1CQ27vvuBYE8a49EKqzc2/wWUR
         pGaK3cuM7kW6ZKOH1kx+U2C54HXmxi0TnT+Mpmn60wO/QXKCQj5XE6NFFjKqgBLcum
         2V1W8ryLlfetrkz8MeenGFn4JUlX8xS066EidXqAeaG4OpIA64VpTUE0xb90r6KPlV
         cKesx9lTOBu2krlzuTr12O2uv35PcziR/8TKIiZ2/h0QhRcwf6seusf2m8UJdvqwSZ
         iBvxH1aJ6ZLkg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db0f4d10000>; Thu, 24 Oct 2019 13:48:17 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id CEC6E13ED56;
        Thu, 24 Oct 2019 13:48:21 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9DE4428005C; Thu, 24 Oct 2019 13:48:17 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/2] gpio: brcm: XGS iProc GPIO driver
Date:   Thu, 24 Oct 2019 13:48:13 +1300
Message-Id: <20191024004816.5539-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is ported this from Broadcom's XLDK (now heavily modified). There se=
em to
be 3 different IP blocks for 3 separate banks of GPIOs in the iProc chips=
.

I've dropped everything except support for the Chip Common A GPIO
controller because the other blocks actually seem to be supportable with
other drivers. The driver itself is halfway between pinctrl-nsp-gpio.c
and pinctrl-iproc-gpio.c.

Chris Packham (2):
  dt-bindings: gpio: brcm: Add bindings for xgs-iproc
  gpio: Add xgs-iproc driver

 .../bindings/gpio/brcm,xgs-iproc.yaml         |  70 ++++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-xgs-iproc.c                 | 321 ++++++++++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
.yaml
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c

--=20
2.23.0

