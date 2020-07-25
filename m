Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E38D22D5E2
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 09:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgGYHsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 03:48:36 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:51753 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGYHsg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jul 2020 03:48:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.17077|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0325214-0.0448014-0.922677;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03275;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.I7J6ttN_1595663307;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I7J6ttN_1595663307)
          by smtp.aliyun-inc.com(10.147.42.16);
          Sat, 25 Jul 2020 15:48:33 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasannatsmkumar@gmail.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 0/1] Ingenic: Add SSI pins support for JZ4770 and JZ4780.
Date:   Sat, 25 Jul 2020 15:46:04 +0800
Message-Id: <20200725074605.67919-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add SSI pins support for the JZ4770 SoC and the
JZ4780 SoC from Ingenic.

周琰杰 (Zhou Yanjie) (1):
  pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.

 drivers/pinctrl/pinctrl-ingenic.c | 267 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

-- 
2.11.0

