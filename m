Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 287DA113A25
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 04:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbfLEDBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 22:01:35 -0500
Received: from mga17.intel.com ([192.55.52.151]:38152 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728321AbfLEDBf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 22:01:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 19:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; 
   d="scan'208";a="219087597"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2019 19:01:33 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org
Cc:     rdunlap@infradead.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH 0/1] pinctrl: pinctrl-v5.5-2: Fix linker error
Date:   Thu,  5 Dec 2019 11:01:30 +0800
Message-Id: <cover.1575514110.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix linker error seen with 5.5 linux-next tree caused by below commit
1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC").

Patch is based on 'pinctrl-v5.5-2' tag of linux-pinctrl.git tree.

Rahul Tanwar (1):
  pinctrl: Modify Kconfig to fix linker error

 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.11.0

