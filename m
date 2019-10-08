Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A14CF7C3
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 13:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfJHLHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 07:07:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:34156 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729790AbfJHLHl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 8 Oct 2019 07:07:41 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Oct 2019 04:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; 
   d="scan'208";a="206618462"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 08 Oct 2019 04:07:38 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 08 Oct 2019 14:07:37 +0300
Date:   Tue, 8 Oct 2019 14:07:37 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] intel-pinctrl fixes for v5.4
Message-ID: <20191008110737.GE2819@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-fixes-v5.4

for you to fetch changes up to 260996c30f4f3a732f45045e3e0efe27017615e4:

  pinctrl: cherryview: restore Strago DMI workaround for all versions (2019-10-01 17:36:40 +0300)

----------------------------------------------------------------
intel-pinctrl fixes for v5.4

This includes two fixes for Intel pinctrl drivers:

  - Fix warning about shared irqchip
  - Restore Strago DMI workaround for all versions

----------------------------------------------------------------
Andy Shevchenko (1):
      pinctrl: intel: Allocate IRQ chip dynamic

Dmitry Torokhov (1):
      pinctrl: cherryview: restore Strago DMI workaround for all versions

 drivers/pinctrl/intel/pinctrl-cherryview.c |  4 ----
 drivers/pinctrl/intel/pinctrl-intel.c      | 27 ++++++++++++++-------------
 2 files changed, 14 insertions(+), 17 deletions(-)
