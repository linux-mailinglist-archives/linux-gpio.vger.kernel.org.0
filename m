Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3CB45BB699
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 08:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiIQGJg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 02:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiIQGJf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 02:09:35 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A25D8A
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 23:09:32 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 8FE8790031C;
        Sat, 17 Sep 2022 14:09:30 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 RESEND 0/2] rockchip pinctrl for acpi
Date:   Sat, 17 Sep 2022 14:09:27 +0800
Message-Id: <20220917060929.657778-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhofVk9PHUIfHhlPHk0ZSlUTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PBA6MDo*Nj0hOhowNwoYETIU
        Vi0aFEpVSlVKTU1ISEJPQkxKSk5JVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpPTUo3Bg++
X-HM-Tid: 0a834a10fc8d2eafkusn8fe8790031c
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These patch fixes to support acpi by:
1. populate gpio platform before pinctrl to probe
2. get gpiochip by finding from gpiochip list
3. get match data by device api

Jianqun Xu (2):
  pinctrl: rockchip: find gpiochip by name from gpio module
  pinctrl: rockchip: get match data by device_get_match_data

 drivers/pinctrl/pinctrl-rockchip.c | 62 +++++++++++++++++++++---------
 drivers/pinctrl/pinctrl-rockchip.h |  2 +-
 2 files changed, 45 insertions(+), 19 deletions(-)

-- 
v2:
- add a second patch to support acpi

2.25.1

