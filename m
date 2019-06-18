Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8F34A60B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 18:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbfFRQBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 12:01:22 -0400
Received: from smtp-fw-4101.amazon.com ([72.21.198.25]:21858 "EHLO
        smtp-fw-4101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729563AbfFRQBW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 12:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1560873681; x=1592409681;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=m5c+QxuC5TZHuXYLARbeSntlW7rvO+1YgCMe8NcYLYo=;
  b=AWY6F9P55ufZNf3CyBk5pIfZquaC+9J5i2d0w3ix+EWW4a2vZZd39gog
   DsvGIeHYwzoaQkVyusEbdVO3pzXxVC405Q6cHbqO2zzbqPyq0VeFffRzO
   1u4aBTDjN07Uxqkro8Q/FXmWFZxaNtOGtqBCANP264WVnR0xwPKB4RHtM
   w=;
X-IronPort-AV: E=Sophos;i="5.62,389,1554768000"; 
   d="scan'208";a="770859253"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP; 18 Jun 2019 16:01:20 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS id A48A524209F;
        Tue, 18 Jun 2019 16:01:17 +0000 (UTC)
Received: from EX13D21UWB001.ant.amazon.com (10.43.161.108) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Jun 2019 16:01:17 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D21UWB001.ant.amazon.com (10.43.161.108) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Jun 2019 16:01:16 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.28) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 18 Jun 2019 16:01:15 +0000
From:   <alpawi@amazon.com>
CC:     Benjamin Herrenschmidt <benh@amazon.com>,
        Patrick Williams <alpawi@amazon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] pinctl: armada-37xx: fix for pins 32+
Date:   Tue, 18 Jun 2019 11:01:03 -0500
Message-ID: <20190618160105.26343-1-alpawi@amazon.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Patrick Williams <alpawi@amazon.com>

The 37xx GPIO config registers are only 32 bits long and
span 2 registers for the NB GPIO controller.  The function
to calculate the offset was missing the increase to the
config register.

I have tested both raw gpio access and interrupts using
libgpiod utilities on an Espressonbin.

The first patch is a simple rename of a function because
the original name implied it was doing IO itself ("update
reg").  This patch could be dropped if undesired.

The second patch contains the fix for GPIOs 32+.

Patrick Williams (2):
  pinctrl: armada-37xx: rename reg-offset function
  pinctrl: armada-37xx: fix control of pins 32 and up

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.17.2 (Apple Git-113)

