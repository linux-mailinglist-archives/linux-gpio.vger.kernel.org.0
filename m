Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0EECE4247
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 06:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfJYEAt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 00:00:49 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:60957 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbfJYEAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 00:00:49 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B8820891A9;
        Fri, 25 Oct 2019 17:00:45 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571976045;
        bh=Tq0G6BXEV9u9sOsaMOO6+wqkFsrQMUbTTIlX9eRpw7w=;
        h=From:To:Cc:Subject:Date;
        b=f6XJBxQCWkPpzphCN0m1GxktBRaiK9H6p0o2eYW88aONK1aUqDQGxbU68wpFnpKZn
         z26RYI9Y0A5MITzymDqZ4WwA0hzt/u31rP+Aa8/kqoMopo9FIY3rr9tc3Xj7IB+JHu
         4Ns+phO94LtwzKkkQwcqC27+DP0HLUD39TLLh/QxAe0xm/t2NCG9fkX7sCyPbkBqZn
         YTw2kHWB6pniER2qZ8kOZ9xseIcE59Rt1enTUgNAz0UzzD0nUYzIhfu89KdQ8mQLOQ
         Y77HWjilUv2khtVWPHfEg3Tp+gWLEk+f03bliwKtqivojHSH+2fRHhw43UKIpkUQax
         eXH/6uEYuaASQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db2736d0000>; Fri, 25 Oct 2019 17:00:45 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 6B80313EEEB;
        Fri, 25 Oct 2019 17:00:49 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 7E85F28005C; Fri, 25 Oct 2019 17:00:45 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] ARM: bcm: nsp: gpio improvements (hopefully)
Date:   Fri, 25 Oct 2019 17:00:39 +1300
Message-Id: <20191025040041.6210-1-chris.packham@alliedtelesis.co.nz>
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
cleaned up on failure (or deferral). The deferral was happening because t=
he
pinctrl node had not been probed.

These two patches take care of these problems.

Chris Packham (2):
  pinctrl: bcm: nsp: use gpiolib infrastructure for interrupts
  ARM: dts: NSP: avoid unnecessary probe deferrals

 arch/arm/boot/dts/bcm-nsp.dtsi         |  14 ++--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 105 ++++++++++---------------
 2 files changed, 49 insertions(+), 70 deletions(-)

--=20
2.23.0

