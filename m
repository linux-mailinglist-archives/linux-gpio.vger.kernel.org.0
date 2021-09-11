Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28BC407560
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Sep 2021 09:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbhIKHMR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Sep 2021 03:12:17 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37892 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235339AbhIKHMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Sep 2021 03:12:14 -0400
X-UUID: 8fdb09383eea43e7ab099a828bcff21d-20210911
X-UUID: 8fdb09383eea43e7ab099a828bcff21d-20210911
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1682353794; Sat, 11 Sep 2021 15:10:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Sep 2021 15:10:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Sep 2021 15:10:46 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v1 0/1] Mediatek pinctrl patch on mt8195 
Date:   Sat, 11 Sep 2021 15:10:45 +0800
Message-ID: <20210911071046.17349-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1.add pm_ops on mt8195.

Changes in patch v1:
1)separate from RSEL patch on mt8195.

Zhiyong Tao (1):
  pinctrl: mediatek: mt8195: Add pm_ops

 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 1 +
 1 file changed, 1 insertion(+)

--
2.18.0


