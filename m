Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4777F256276
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 23:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgH1Vcr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 17:32:47 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:60588 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726626AbgH1Vcr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Aug 2020 17:32:47 -0400
Received: from [188.210.212.0] (helo=localhost.localdomain)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kBlzE-0001C9-Ev; Fri, 28 Aug 2020 22:32:40 +0100
From:   Thomas Preston <thomas.preston@codethink.co.uk>
To:     linus.walleij@linaro.org, sre@kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jan.kundrat@cesnet.cz,
        preid@electromag.com.au
Cc:     thomas.preston@codethink.co.uk
Subject: [PATCH v2 0/2] pinctrl: mcp23s08: Fixups for mcp23x17
Date:   Fri, 28 Aug 2020 22:32:24 +0100
Message-Id: <20200828213226.1734264-1-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi again,
Second round of these mcp23s03 driver fixups.

Changes since v1:
- Split up the fixups patch.
- I'm pretty certain the "mcp23x16" structs are typos, so I put it as
  0001, because the second patch doesn't really make sense without it.
- I lost the `(MCP_GPIO << 1) + 1` changes because the regmap handles
  GPIOB 0x13 with `.val_bits = 16`.
- Dropped the interrupt-controller changes.

Thanks again,
Thomas

Thomas Preston (2):
  pinctrl: mcp23s08: Fix mcp23x17_regmap initialiser
  pinctrl: mcp23s08: Fix mcp23x17 precious range

 drivers/pinctrl/pinctrl-mcp23s08.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.26.2

