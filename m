Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19572267E3F
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 08:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgIMG7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 02:59:18 -0400
Received: from out28-148.mail.aliyun.com ([115.124.28.148]:45827 "EHLO
        out28-148.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgIMG7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 02:59:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09806963|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0203532-0.00140297-0.978244;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03275;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.IWSCMpo_1599980345;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IWSCMpo_1599980345)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sun, 13 Sep 2020 14:59:13 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 0/3] pinctrl: Ingenic: Add support for SSI and I2S pins.
Date:   Sun, 13 Sep 2020 14:58:33 +0800
Message-Id: <20200913065836.12156-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

1.Add SSI pins support for JZ4770 and JZ4780.
2.Correct the pullup and pulldown parameters of JZ4780.
3.Add I2S pins support for JZ4780, X1000, X1500, and X1830.

v2->v3:
1.Add Paul Cercueil's Reviewed-by.
2.Fix bug about PE15's pull-up parameter.

v3->v4:
1.Add Paul Cercueil's Reviewed-by.
2.Fix typo.

周琰杰 (Zhou Yanjie) (3):
  pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.
  pinctrl: Ingenic: Correct the pullup and pulldown parameters of
    JZ4780.
  pinctrl: Ingenic: Add I2S pins support for Ingenic SoCs.

 drivers/pinctrl/pinctrl-ingenic.c | 349 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 347 insertions(+), 2 deletions(-)

-- 
2.11.0

