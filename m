Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA83445224
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 12:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhKDL0S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 07:26:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35026 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230401AbhKDL0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 07:26:14 -0400
X-UUID: cba8ff7de2e743fe8bfd9afaedeff196-20211104
X-UUID: cba8ff7de2e743fe8bfd9afaedeff196-20211104
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 94376343; Thu, 04 Nov 2021 19:23:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Nov 2021 19:23:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 19:23:31 +0800
From:   Zhiyong Tao <zhiyong.tao@mediatek.com>
To:     <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <mark.rutland@arm.com>, <matthias.bgg@gmail.com>,
        <sean.wang@kernel.org>
CC:     <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
        <hui.liu@mediatek.com>, <light.hsieh@mediatek.com>,
        <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
        <rex-bc.chen@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v1 0/1]  Mediatek pinctrl patch 
Date:   Thu, 4 Nov 2021 19:23:28 +0800
Message-ID: <20211104112329.8446-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes 1 patches:
1. fix global-out-of-bounds issue.

Changes in patch v1:
1. change check eint number boundary condition.

Zhiyong Tao (1):
  pinctrl: mediatek: fix global-out-of-bounds issue

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

--
2.18.0


