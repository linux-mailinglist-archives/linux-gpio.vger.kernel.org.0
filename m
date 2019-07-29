Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5E77784A3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 07:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfG2F4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 01:56:03 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55699 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725988AbfG2F4C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 01:56:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3E7D923B4;
        Mon, 29 Jul 2019 01:56:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 29 Jul 2019 01:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=OfpAIjgwrhIxtKWdG7PT3qN5Lx
        O1ddFAzrWrq0YndxQ=; b=DDtSuXTrZWwxSPZHXGFgBPzyrn2kD2Tsk9CQ2cPFo2
        HwdGSHgs1xW7Wka/WBgiD8yJ8ttuXVx4ppupaTYO2Ph0YfnkKsnR6vMB/9aM/Cbo
        ThpPcsCqh+CT0oUAaH0owVzXhxC5E6Eyo1dDl199UIUmrN6RR4mfYyZMb4wiE9C4
        hztUKO47As8oVL2Img9NUUjBbpHeaac9RfQ6YFVVWzOF3wCdZYqIQg4EVVhx02yl
        p1JIlPk5AxCsYkSIBKnNFHhYAjVERClCJfH+YsOJ5vQlufDKzBYIkwLk2Ae5cPcj
        3/IXR64cQ8RWr4DXmauWPAyLdROdrbQdAoYo7gBHsNGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OfpAIjgwrhIxtKWdG
        7PT3qN5LxO1ddFAzrWrq0YndxQ=; b=cYCvPyschF5SBEvz1HKm/XjqctxFfetnj
        TzoQ4eqKFerOGqiXPbe7oh7dOj0pPiUZsznFZH/x9CIy0zc1UfNv6EqE+u22GcXB
        IqjxetEjaHrEpjbN+n1OP3XYdOU6CrIwWQlrYDg0WVtBX0R88NhZjvA5RZne4CBI
        IUqzQg0eeygANhVac2MtbBv+lqbCka3lmaz6gwUw5cJFn6CrSOr8MFejmMUurUlo
        /6DrfSNRtILJN/noJHuiqUqqGbL5s5GUxb0pfD9/9PTcW9QJe62r+k7EarK50hM4
        /RbSvi5rBOqyVJ+u9BG4IsR6TljD/cgbF/qqfDultKr8uSbUysqSw==
X-ME-Sender: <xms:b4o-XdcpBuXRl_09d53tt9esSgWBM6x_NtUo_vdS0IROrFLk46OEjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledtgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
    durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:b4o-XVwIVX8QrX3_7b0sKJ-lgAYaNYxq-gtwrJPO0zFgBAwRQDqOmQ>
    <xmx:b4o-XTFFp_JpmAwoE9vB0n4n-RcgJCpSgsJE-ihUpY5tr6G6Dc-nHQ>
    <xmx:b4o-XZyxz41ZXRAK8GIa303GBH5LKmn0eE8iiam95gge_D98pVttyQ>
    <xmx:cYo-XetsSjLix6I3Fyefi_MK2_WMG9a3OB1dMaLDJCHackVkuTVMkw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id A62D88005C;
        Mon, 29 Jul 2019 01:55:55 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] pinctrl: aspeed: Add AST2600 pinmux support
Date:   Mon, 29 Jul 2019 15:25:58 +0930
Message-Id: <20190729055604.13239-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This series adds pinmux support for the AST2600. v2 addresses some binding
comments from Rob and has some minor cleanups in the g6 driver implementation.

v1 can be found here:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/001999.html

Please review!

Andrew

Andrew Jeffery (6):
  dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
  pinctrl: aspeed: Rename pin declaration macros
  pinctrl: aspeed: Add PIN_DECL_3() helper
  pinctrl: aspeed: Add multiple pin group support for functions
  pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
  pinctrl: aspeed: Add AST2600 pinmux support

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  115 +
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    | 1821 +++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    | 1865 +++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 2355 +++++++++++++++++
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |  227 +-
 7 files changed, 4590 insertions(+), 1802 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c

-- 
2.20.1

