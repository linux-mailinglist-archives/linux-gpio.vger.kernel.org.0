Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57CD8244814
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 12:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgHNKcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Aug 2020 06:32:09 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:46762 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727055AbgHNKcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 Aug 2020 06:32:07 -0400
Received: from [188.210.212.0] (helo=localhost.localdomain)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1k6WZD-000572-1O; Fri, 14 Aug 2020 11:04:07 +0100
From:   Thomas Preston <thomas.preston@codethink.co.uk>
To:     linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     thomas.preston@codethink.co.uk
Subject: [PATCH 0/3] pinctrl: mcp23s08: Fixups for mcp23x17
Date:   Fri, 14 Aug 2020 11:03:54 +0100
Message-Id: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,
I'm in the process of adding a device tree overlay for the PiFace
Digital Raspberry Pi daughter board [0]. It's an mcp23s17 SPI GPIO port
expander. In doing so, I noticed some errors with the mcp23s08 driver.

This series adds my fixups to (which builds successfully):

	v5.8-13252-gcf4a66ae5e4a

But I have only tested them on (rpi-5.4.y):

	v5.4.51-1078-g92834e4bb4ce

They're quite trivial and backwards compatible, although I might be
wrong about "interrupt-controller". Can someone please confirm?

Many thanks,
Thomas

[0] https://github.com/raspberrypi/linux/pull/3794

Thomas Preston (3):
  pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
  pinctrl: mcp23s08: Remove interrupt-controller
  devicetree: mcp23s08: Remove interrupt-controller

 .../bindings/pinctrl/pinctrl-mcp23s08.txt     |  8 -----
 drivers/pinctrl/pinctrl-mcp23s08.c            | 35 +++++++++----------
 drivers/pinctrl/pinctrl-mcp23s08.h            |  2 +-
 3 files changed, 18 insertions(+), 27 deletions(-)

-- 
2.26.2

