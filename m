Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D71D444D0A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 02:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhKDBnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 21:43:23 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:38756 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231206AbhKDBnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 21:43:23 -0400
X-UUID: db25bd5b0dc34dba8693d2d62841217e-20211104
X-UUID: db25bd5b0dc34dba8693d2d62841217e-20211104
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <zhiyong.tao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 183130306; Thu, 04 Nov 2021 09:40:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 4 Nov 2021 09:40:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 4 Nov 2021 09:40:41 +0800
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
Subject: [PATCH 0/1] Mediatek pinctrl patch 
Date:   Thu, 4 Nov 2021 09:40:38 +0800
Message-ID: <20211104014039.26772-1-zhiyong.tao@mediatek.com>
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

Zhiyong Tao (1):
  pinctrl: mediatek: fix global-out-of-bounds issue

 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--
2.18.0


