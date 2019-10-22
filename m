Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEF8E0155
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731594AbfJVKAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 06:00:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:55124 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731469AbfJVKAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 06:00:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="398966117"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2019 03:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A4D86311; Tue, 22 Oct 2019 13:00:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/5] pinctrl: intel: Refactor register restoring on resume
Date:   Tue, 22 Oct 2019 12:59:59 +0300
Message-Id: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor ->resume() path to be a bit smarter and less noisy.

In v2:
- add a patch to reduce a noise in kernel log
- drop warning to debug level for one message
- constify local pointers (Mika)

Andy Shevchenko (5):
  pinctrl: intel: Introduce intel_restore_padcfg() helper
  pinctrl: intel: Introduce intel_restore_hostown() helper
  pinctrl: intel: Introduce intel_restore_intmask() helper
  pinctrl: intel: Drop level from warning to debug in
    intel_restore_hostown()
  pinctrl: intel: Use helper to restore register values on ->resume()

 drivers/pinctrl/intel/pinctrl-intel.c | 115 ++++++++++++++------------
 1 file changed, 61 insertions(+), 54 deletions(-)

-- 
2.23.0

