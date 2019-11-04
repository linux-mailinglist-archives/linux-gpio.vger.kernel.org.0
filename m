Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 397C9ED68F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 01:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbfKDASa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 19:18:30 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43391 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728461AbfKDASa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 19:18:30 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A89738365A;
        Mon,  4 Nov 2019 13:18:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572826702;
        bh=HiEdNYNi8oKqRVwMtkU4iyatNl5LZzujdzu2zDPjPIc=;
        h=From:To:Cc:Subject:Date;
        b=PnxPhNy4SsDGLht5Cy52+X6zSxg/blzoA8ivVURqj7leEM+4aqUIia1JlBHPs4cNS
         1gqJYofHnPtf9YxpSZoTnS65EiK56Eav2fXm6tqE7+th3kxGOl7YwRKoXOIiErHCEW
         yOsRXPzbXN3TilfUc6tSzQeFXuEWfzydkpo1N93hXAKAsCocOHsp0CuO14jLpV+cOr
         bAvymnCfRnHcLd9cVtG8bIm5W6hwYpUsJZwbjKhAb5Y1jhOY+goA4v7GdrAdM8EEpC
         BOmN759CRGY1PjrPiYGQk1AB96fuTSSfr+H62gbrmz3a2kV97WbsLKts01CqNczNRY
         9qobjxascWe9A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbf6e4a0000>; Mon, 04 Nov 2019 13:18:21 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 2E1FC13EED4;
        Mon,  4 Nov 2019 13:18:18 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 51A1C28005D; Mon,  4 Nov 2019 13:18:19 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/2] pinctrl: bcm: nsp: gpio improvements 
Date:   Mon,  4 Nov 2019 13:18:17 +1300
Message-Id: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm working on a platform using the BCM 58525 SoC. I noticed that some of
the peripherals were being deferred (not that that's a problem) and debug=
fs
was complaining "File ':axi@18000000:gpio@20' in directory 'domains' alre=
ady
present!" which is more of a sign that things were not right.

The debugfs error was because the manually created irq domain was not
cleaned up on failure (or deferral).

I've dropped the patch from this series that changes the order in the
device tree. I can probably live with the deferrals.

While I was debugging another issue I noticed my gpio-hogs weren't
showing up correctly in /sys/kernel/debug/gpio. At first I thought I was
missing commit d95da993383c ("gpiolib: Preserve desc->flags when setting
state") but as it turns out pinctrl-nsp-gpio.c didn't provide a
get_direction function so the generic code assumed they all started as
inputs. I've added a new patch to address that.

Chris Packham (2):
  pinctrl: bcm: nsp: use gpiolib infrastructure for interrupts
  pinctrl: bcm: nsp: implement get_direction

 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 119 ++++++++++++-------------
 1 file changed, 56 insertions(+), 63 deletions(-)

--=20
2.23.0

