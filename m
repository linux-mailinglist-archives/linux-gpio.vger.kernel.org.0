Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0342650D1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 06:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfGKETz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 00:19:55 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:35317 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726119AbfGKETz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 00:19:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E93472EF8;
        Thu, 11 Jul 2019 00:19:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 11 Jul 2019 00:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=D+2vsx8lqO236DJVmaN/p1Vy6V
        CmDiyAuomD0yG8gKA=; b=CCJ3BXQquFOJYjeQjsvni7ZIGCxZB5FSivkldz3VMf
        N1EAXqjfnlrW5W8ud2NrDRF+pgNW7fq4Enp8iLTqjrBC0+Dl8UlZZli9i12eN/w0
        AZHDTmkdkzt9WIlale6AzOnpFxLk3s8FSRQ7vb2IMDFCmzxgFY9Su/Ic7soKuO/a
        TolUb/WVuqZqUI+X+xri207s+f2t1+3CVfQxP3noOpFHJl3zclUBxYzR9h5k87Yx
        lsJiEWJhRiuyiQJDV5N5NWf/oLoFklpZT789KdU+Ge6goWHwiR1RSTHZ+XkVPQkc
        s0afp75Ly1zKzr7U2ugncz44O49QoojoUCdKKEaksVfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=D+2vsx8lqO236DJVm
        aN/p1Vy6VCmDiyAuomD0yG8gKA=; b=kS4vhQmMBnte9IQzEEyj5uDnmtgqKLLCK
        f160Yuri42tbpoI0pyHZf7tArJR31gGYJFumACifqsWs3J43Y339Suzu4Ykbiujb
        uH1AL6svjRELo5VfXPtTvYg2PHKw9tVezH2sc4GfvJGR1mL3lj6ZukC+z2hhsLxS
        2ozGsvkNMu5PCfwdgR4yMwZIUlpT+zMl0VJ3KouwUFJpfEydBhvJV36fSnkJWrVf
        iEgjCl09I0AWzlTLVwwX2eq0u8A0cGr4OdCfC3FyE5oQpjmn7hua4fLFCgcstQSh
        UjClg2l77z6rLbk/SAH4ARnHviCo/0jw0nzflyIm735mY9jxnqewg==
X-ME-Sender: <xms:6LgmXdgmqi3EiquA5u8XIh2ArReVOfm-FeCAAn_vT_fL1n1fAj2l9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeejgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6LgmXdfnDr4TaUMIE0cdLtVB5AT55cpstAXyE3Gc8arQcMP4uDMmNg>
    <xmx:6LgmXQn0wgTWSwvJyASnT1xklvt-QYcSPYHkovI8n2MBSo1Q1e475Q>
    <xmx:6LgmXWvkug9i6n6RIriwnXUvirYuE5zdXo1ZBaQBa4RFla7GmT7EAg>
    <xmx:6bgmXUjTP81wnRhDKoVPRQlfUQ1o0mJhsA1oUK1MkYFmq6wcETQaug>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4342F8005A;
        Thu, 11 Jul 2019 00:19:48 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] pinctrl: aspeed: Add AST2600 pinmux support
Date:   Thu, 11 Jul 2019 13:49:36 +0930
Message-Id: <20190711041942.23202-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

This series adds pinmux support for the AST2600. Some more rework was required
on top of the previous cleanup series, but this rework was focussed on
supporting features of the AST2600 pinmux rather than fixing issues with the
existing infrastructure for the ASPEED drivers. Due to the dependences it's
based on top of pinctrl/devel, so should avoid any more SPDX issues.

ASPEED have been testing the patches on hardware, so even for an initial pass
there's some confidence in the implementation.

Please review!

Andrew

Andrew Jeffery (6):
  dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
  pinctrl: aspeed: Rename pin declaration macros
  pinctrl: aspeed: Add PIN_DECL_3() helper
  pinctrl: aspeed: Add multiple pin group support for functions
  pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
  pinctrl: aspeed: Add AST2600 pinmux support

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  128 +
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    | 1821 +++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    | 1865 +++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 2395 +++++++++++++++++
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |  227 +-
 7 files changed, 4643 insertions(+), 1802 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c

-- 
2.20.1

