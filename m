Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97A65B9291
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 04:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbiIOCN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 22:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiIOCNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 22:13:25 -0400
Received: from mail-m11873.qiye.163.com (mail-m11873.qiye.163.com [115.236.118.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318598FD44
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 19:13:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 03167900115;
        Thu, 15 Sep 2022 10:13:21 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     jbx6244@gmail.com, heiko@sntech.de, linus.walleij@linaro.org,
        andriy.shevchenko@linux.intel.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v6 0/3] gpio: rockchip: support acpi
Date:   Thu, 15 Sep 2022 10:13:17 +0800
Message-Id: <20220915021320.80364-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSU9JVk9KTUIYQ0sfSRkZT1UTARMWGhIXJB
        QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OS46Sgw6HD0jFC05MxUcCxka
        NBVPCj1VSlVKTU1ISUtDS0tJTk5CVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUlIS0M3Bg++
X-HM-Tid: 0a833eec128f2eafkusn03167900115
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch fix driver to support acpi.

Andy Shevchenko (1):
  ACPI: utils: Add acpi_dev_uid_to_integer() helper to get _UID as
    integer

Jianqun Xu (2):
  pinctrl: export function get_pinctrl_dev_from_devname()
  gpio: rockchip: support acpi

 drivers/acpi/utils.c            |  24 ++++
 drivers/gpio/gpio-rockchip.c    | 194 ++++++++++++++++++++------------
 drivers/pinctrl/core.c          |   1 +
 include/acpi/acpi_bus.h         |   1 +
 include/linux/acpi.h            |   5 +
 include/linux/pinctrl/pinctrl.h |   1 +
 6 files changed, 152 insertions(+), 74 deletions(-)

-- 
v6:
 - remove dt patches from this serial patchset
 - fix clock get to only with index 0 for apb and 1 for debounce
 - move get iomem and irq first, suggested by Johan

v5:
 - add patches to add gpio alias and clock-names
 - get clock by devm_clk_get()
 - restore gpio range add comment
 - other codingstyle

v4: suggested by Andy Shevchenko
 - use dev_fwnode and to_of_node(fwnode) to replace dev->of_node
 - split to a separate rockchip_gpio_get_clocks
 - handle fail for clk_prepare_enable
 - other codingstyle

v3: suggested by Andy Shevchenko
 - fix irq size (32) to GPIO_MAX_PINS
 - fix to use is_of_node or is_acpi_node
 - use standard pattern for error handle
 - remove redundant assignment

v2:
 - fix rockchip_pin_output_deferred to rockchip_pin_deferred
2.25.1

