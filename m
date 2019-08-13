Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1559B8B2F7
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2019 10:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfHMIx3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Aug 2019 04:53:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:15185 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727715AbfHMIx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Aug 2019 04:53:29 -0400
X-UUID: 48d1413672114bf0bd830e48652dbd16-20190813
X-UUID: 48d1413672114bf0bd830e48652dbd16-20190813
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1334987500; Tue, 13 Aug 2019 16:53:22 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 13 Aug
 2019 16:53:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 13 Aug 2019 16:53:19 +0800
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sean.wang@kernel.org>
Subject: [PATCH v1 0/5] Improve MediaTek pinctrl v2 and make backward compatible to smartphone mass production usage
Date:   Tue, 13 Aug 2019 16:53:15 +0800
Message-ID: <1565686400-5711-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch improves MediaTek pinctrl v2 and makes backward compatible to
current smartphone mass production usage by:
1.Check gpio pin number and use binary search in control address lookup
2.Supporting driving setting without mapping current to register value
3.Correct usage of PIN_CONFIG get/set implementation
4.Backward compatible to previous Mediatek's bias-pull usage
5.Add support for pin configuration dump via sysfs


