Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7328BCB305
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 03:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbfJDBZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 21:25:41 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57885 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730277AbfJDBZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 21:25:41 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9B922806B7;
        Fri,  4 Oct 2019 14:25:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570152335;
        bh=zCae1sRbj0T6w6Pf0TMZ7dOtwYoAvCI5r5bzgSVd7is=;
        h=From:To:Cc:Subject:Date;
        b=gE3CLqDQfQxwk3emWTRF6EnaYpDOPuk/7z4VpP+D4O3gA9TzX+NhT8WoSrXnswZrE
         khQ/rp0CWO5mvbc0ENMqwcqujeVsVW9l++0Q+q9V5h14uGGKl1vsTZY0PFzkMiFeJd
         R/KrqKmBvmEKLL/g2e4mIdGyu3F2WL+gVMUG92wCB9vjHlqTmi7tzcefZSGtzUQbHS
         OlM0VJWZyH880KdwwmJDhpesQrSS148TEH823+LLI4PkcvdCYmjyII0AZY9NKbwHcy
         dhrG5ZO4nktkNi4nGH1zIwHlFrXhvotcCbs949HIvxkzLuYFVWutHHybkzluGYHBBm
         FuGkbzPbzgQUA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d969f8b0000>; Fri, 04 Oct 2019 14:25:36 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 3C7D413EC71;
        Fri,  4 Oct 2019 14:25:34 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 5A32B28003E; Fri,  4 Oct 2019 14:25:30 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, richard.laing@alliedtelesis.co.nz
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] gpio: brcm: XGS iProc GPIO driver
Date:   Fri,  4 Oct 2019 14:25:23 +1300
Message-Id: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is ported this from Broadcom's XLDK. There seem to be 3 different
IP blocks for 3 separate banks of GPIOs in the iProc chips.

I've dropped everything except support for the Chip Common A GPIO
controller because the other blocks actually seem to be supportable with
other drivers. The driver itself is halfway between pinctrl-nsp-gpio.c
and pinctrl-iproc-gpio.c.

Chris Packham (2):
  dt-bindings: gpio: brcm: Add bindings for xgs-iproc
  gpio: Add xgs-iproc driver

 .../bindings/gpio/brcm,xgs-iproc.txt          |  41 ++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-xgs-iproc.c                 | 422 ++++++++++++++++++
 4 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
.txt
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c

--=20
2.23.0

