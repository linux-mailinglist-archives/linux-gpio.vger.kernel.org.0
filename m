Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB9C267814
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 08:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgILGF1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 02:05:27 -0400
Received: from out28-123.mail.aliyun.com ([115.124.28.123]:52016 "EHLO
        out28-123.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgILGFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 02:05:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1040136|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0219345-0.00153944-0.976526;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07381;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.IW5skju_1599890708;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IW5skju_1599890708)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 12 Sep 2020 14:05:20 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v3 0/3] pinctrl: Ingenic: Add support for SSI and I2S pins.
Date:   Sat, 12 Sep 2020 14:04:22 +0800
Message-Id: <20200912060425.30423-1-zhouyanjie@wanyeetech.com>
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

周琰杰 (Zhou Yanjie) (3):
  pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.
  pinctrl: Ingenic: Correct the pullup and pulldown parameters of JZ4780
  pinctrl: Ingenic: Add I2S pins support for Ingenic SoCs.

 drivers/pinctrl/pinctrl-ingenic.c | 349 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 347 insertions(+), 2 deletions(-)

-- 
2.11.0

