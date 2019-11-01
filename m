Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47780EBBD0
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 02:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbfKAB42 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 21:56:28 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41763 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbfKAB42 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 21:56:28 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EAE758365D;
        Fri,  1 Nov 2019 14:56:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572573385;
        bh=HiEdNYNi8oKqRVwMtkU4iyatNl5LZzujdzu2zDPjPIc=;
        h=From:To:Cc:Subject:Date;
        b=az3h7bW5EzvCriUtcnu51s90I3bkQVYItBuGPcQhMt3feWD6WjxO+Ihk6RnIKaMm0
         4EantzP+U5lt5NvECSkMQzIDzYkNp/b7npkFy27EUDUnBYL9KzpmNFKvOBYSgPr0I+
         GyrZDKbWewKiNAtR2nlBN+ShAgBwjR8hv47P3akilvEoP1QbrWQ0d7gT1Yw7DzGEPt
         SwmcrJrq8i4Zlry/KXcd066tu0snRhxZ4ZizjCME89KgA7/yg0a/yOfz00eiTSRzyI
         7PbHyiH1uUYPo7PbckDNvapW6OCrjQDyaee4A39qOO54vhypk4zg1FHkqTZ69LvyeR
         ScEnByGsviEDQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbb90c90000>; Fri, 01 Nov 2019 14:56:25 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4B2F413EED4;
        Fri,  1 Nov 2019 14:56:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id AA07A28005D; Fri,  1 Nov 2019 14:56:25 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] pinctrl: bcm: nsp: gpio improvements 
Date:   Fri,  1 Nov 2019 14:56:19 +1300
Message-Id: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
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

