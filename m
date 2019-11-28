Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B345010C4B3
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 09:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfK1IIi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 03:08:38 -0500
Received: from mga14.intel.com ([192.55.52.115]:29597 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbfK1IIi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Nov 2019 03:08:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Nov 2019 00:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,252,1571727600"; 
   d="scan'208";a="217548709"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2019 00:08:36 -0800
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org
Cc:     torvalds@linux-foundation.org, sfr@canb.auug.org.au,
        andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-next@vger.kernel.org,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH 0/1] pinctrl: pinctrl-v5.5-1: Fix build warning
Date:   Thu, 28 Nov 2019 16:08:31 +0800
Message-Id: <20191128080832.13529-1-rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus Walleij,

This patch fixes a build time warning seen with my below commit
1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
after "Bulk pin control changes for v5.5" were pulled in.

Request to please push this patch to Linus.

Patch is based on 'pinctrl-v5.5-1' tag of linux-pinctrl.git tree.

Rahul Tanwar (1):
  pinctrl: Fix warning by adding missing MODULE_LICENSE

 drivers/pinctrl/pinctrl-equilibrium.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.11.0

