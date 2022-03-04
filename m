Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E83184CD0C7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Mar 2022 10:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbiCDJG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Mar 2022 04:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236686AbiCDJG2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Mar 2022 04:06:28 -0500
Received: from mail-m17661.qiye.163.com (mail-m17661.qiye.163.com [59.111.176.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6DA18BA7B
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 01:05:27 -0800 (PST)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m17661.qiye.163.com (Hmail) with ESMTPA id 6705C1DFEBD;
        Fri,  4 Mar 2022 17:05:25 +0800 (CST)
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de
Cc:     linus.walleij@linaro.org, linux-rockchip@lists.infradead.org,
        linux-gpio@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v1 0/3] gpio-rochchip
Date:   Fri,  4 Mar 2022 17:05:20 +0800
Message-Id: <20220304090523.1748297-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUNNT0NWSR1LTEofGU
        JIQhkdVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nj46Chw5Oj5DGT9MLSFILA4w
        OhgwChpVSlVKTU9NSENPTElOQ05OVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
        WU5DVUlJVUxVSkpPWVdZCAFZQUpIS0s3Bg++
X-HM-Tid: 0a7f542d3e1fda2bkuws6705c1dfebd
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The first patch fixes gpio driver to support works without cru, and the second
patch try to support different dt node format.

Jianqun Xu (3):
  gpio: rockchip: make gpio work without cru module
  gpio: rockchip: get pinctrl node from 'gpio-ranges' property
  dt-bindings: gpio: rockchip,gpio add optional 'gpio-ranges'

 .../bindings/gpio/rockchip,gpio-bank.yaml     |  7 +++++-
 drivers/gpio/gpio-rockchip.c                  | 24 ++++++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

-- 
v1:
  - add gpio yaml file patch
2.25.1

