Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB04631C9B2
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 12:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhBPLcX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 06:32:23 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:12092 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229811AbhBPLcW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Feb 2021 06:32:22 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11GBUujp004270;
        Tue, 16 Feb 2021 03:31:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0220;
 bh=tTDkPmc0CcmndlBQaCLe72JM+sLOACfpwxbMK7sbpuA=;
 b=MnkssHTHMPXm5qUxE3vo7xzXrlgjZs44CFyv/R4mQ+vuJM2JxsvP9nUGlQsBigNvuPvh
 Oq6wAv0bEfOGXinL1Iq5v6arZfSiyrOsQQqOKNt3ejHOS2Cw5Al2a8S2kj2lBqXXq+F4
 NMmHASLXoS6QSjfQXqTjhHVpC2VU9E0mgEwTs+j4HUyFhf8uHOOb47+L7ttGJKSUhrIH
 IkKb4d1fhhQ71isoxx4Qf5a60SupbOjO8Q24HBHOw3NPih2fHGNZPVqgamN+wsUyCCOK
 m5EAfk5w27eSs5YrEdCDqLeRL1UJGt1EN+kjFJMOy5uSWM1HNTgBkYSriuGJp6jDoU67 TQ== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com with ESMTP id 36pf5txsf0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 16 Feb 2021 03:31:27 -0800
Received: from SC-EXCH04.marvell.com (10.93.176.84) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 03:31:26 -0800
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Feb
 2021 03:31:25 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Feb 2021 03:31:25 -0800
Received: from octopus.marvell.com (octopus.marvell.com [10.5.24.3])
        by maili.marvell.com (Postfix) with ESMTP id A37343F7043;
        Tue, 16 Feb 2021 03:31:21 -0800 (PST)
From:   <kostap@marvell.com>
To:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <daniel.lezcano@linaro.org>, <amit.kucheria@linaro.org>,
        <viresh.kumar@linaro.org>, <linus.walleij@linaro.org>,
        <sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
        <andrew@lunn.ch>, <robh+dt@kernel.org>, <mw@semihalf.com>,
        <jaz@semihalf.com>, <nadavh@marvell.com>, <stefanc@marvell.com>,
        <bpeled@marvell.com>, Konstantin Porotchkin <kostap@marvell.com>
Subject: [PATCH 0/2] Fix Marvell CP110 pin control finction names
Date:   Tue, 16 Feb 2021 13:31:16 +0200
Message-ID: <20210216113118.17484-1-kostap@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-16_01:2021-02-16,2021-02-15 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Konstantin Porotchkin <kostap@marvell.com>

These patches are fixing the CP110 pin control driver and the related
documentation.
Current CP110 pin control driver uses two different MPP functions named
the same (sdio) in MPP54 and MPP55 definitions.
Since these names are used for the MPP functionality selection, all
function names within single MPP group should be unique.
This patches series fixes function names in MPP54 and MPP55 pin
definitions.

Konstantin Porotchkin (2):
  doc: cp110-system-controller: fix the pin function names
  drivers/pinctrl: armada-cp110 - fix MPP54/MPP55 functions

 .../bindings/arm/marvell/cp110-system-controller.txt          | 4 ++--
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c                  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

