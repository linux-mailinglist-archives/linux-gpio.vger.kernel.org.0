Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B771036AAC1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 04:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhDZCqW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Apr 2021 22:46:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:60295 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231530AbhDZCqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Apr 2021 22:46:22 -0400
X-UUID: 8f7c3ba02493441191cd68fee9f0f7cf-20210426
X-UUID: 8f7c3ba02493441191cd68fee9f0f7cf-20210426
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2069239074; Mon, 26 Apr 2021 10:45:37 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 10:45:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Apr 2021 10:45:34 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v7 0/1] Mediatek pinctrl patch on mt8195 
Date:   Mon, 26 Apr 2021 10:45:32 +0800
Message-ID: <20210426024533.20840-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1.add pinctrl rsel setting on MT8195.

Changes in patch v7:
1)add version in patch and fix spelling mistakes.

Changes in patch v6:
1)add "pintcrl: mediatek" as prefix.

Changes in patch v5:
1)document and driver patch are apploed.
2)change '-EOPNOTSUPP' to '-ENOTSUPP'

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.


