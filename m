Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5C7CF1C5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 06:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbfJHEl1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 00:41:27 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49007 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729973AbfJHEl1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 00:41:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9CE865B5D;
        Tue,  8 Oct 2019 00:41:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 08 Oct 2019 00:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=0/MbfkSuw2RSJPd8KBeC7Wk9MN
        1nZHnVaswofQbs1mU=; b=ZrpVFpTOOLUr64sBh7etgDbjoWGm7uCK3yDAPlhTue
        hLYVj4Q7KB00soEftml2+GO0mjtlHc1jE3ORfpSoyNFs8iR03ZA7u9L4HkMUkaF2
        NpPYt2Sot552QifGSTnFPHnvJSsEZNqCxh9wwIbLswhNWNp5NMqb7Dl8bATnzgKc
        cyD5uTSls3dogAM49fhc10Cgtv5AM3AT/r1NIToOKanZPWeFwvzaWPMcvnCNCP7Z
        B0KUzXMYqxazq8lgauk/78f6UagvrWpS3GvoXQSmhW89eI+UKbgfUaoXk3AXFAiy
        GrKwp2y6SX4BGj9WDapX8Pl+H0+yihKaVnN3cw7ewkJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0/MbfkSuw2RSJPd8K
        BeC7Wk9MN1nZHnVaswofQbs1mU=; b=ZPUKBnkCxSpI5JwzWHuQ8agTBBVhyk6S0
        IMNDSRWriNuK47GmfmHCUcQ+sHtDukbA5muJ092G68mDmXD8NYjTwX+ugpshWqoq
        +roaDR4gJYJpzsVdRH5OeXJLVLz5RFsQ3QyiszYv3TOYtItTMLT209nAw++R4mNW
        UBArhO4pPdp3UjLlKjD5GmkBuqrB/OvN1LZY+jl5j7nVckmj6ffSJzn0PZ4JvlZX
        K29uSm1KsRXxvrkUeER7gqhuWVYWlg+SLJaFgVlvdZZNIbt89FPpFCKKhIbULxEr
        EBvclIAsiuJ6pyBlDg6bOhffa9j2l2YcpvsVqG7SkTQUrufYJ0IMw==
X-ME-Sender: <xms:bxOcXc8BvFgpyiyHvHbWz-06VU0PAXJEWfQ7BgYam9zVYgtSgsgsgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bxOcXTWzME8ZicGT72q9I2QUqe8fd9ggwqvj8eDT20M2QM4q12FNpA>
    <xmx:bxOcXRp7VOgsL6egZy3dbIkNPugOaxDFyd-c6Mubf_HF2aYsDnZ8WA>
    <xmx:bxOcXSonE1u_8X41nSABIqcihVA7uvgsLJ_HJwwUXgsrgE1q-aVBmg>
    <xmx:dROcXTJNQq3E_kvFO-nAbGSVguYjon4iMcZkIR7lCi8vMtaoUhHdfQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2F35D80064;
        Tue,  8 Oct 2019 00:41:15 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, johnny_huang@aspeedtech.com,
        ryanchen.aspeed@gmail.com
Subject: [PATCH 0/7] pinctrl: Fixes for AST2600 support
Date:   Tue,  8 Oct 2019 15:11:46 +1030
Message-Id: <20191008044153.12734-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This series resolves several issues found in testing by Johnny Huang from
ASPEED, who also contributed the patches to fix them. We'll have more patches
from him in the near future (which I'm pretty happy about).

The major issue resolved is the way I grouped the eMMC pins. What I had was
ugly and I want to get rid of it before the binding is solidified with the 5.4
release.

The remaining fixes are minor issues that stem from lack of documentation or
understanding on my part, and at least one brain-fart.

Please review!

Andrew

Andrew Jeffery (4):
  dt-bindings: pinctrl: aspeed-g6: Rework SD3 function and groups
  pinctrl: aspeed-g6: Sort pins for sanity
  pinctrl: aspeed-g6: Fix I2C14 SDA description
  pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively

Johnny Huang (3):
  pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
  pinctrl: aspeed-g6: Fix UART13 group pinmux
  pinctrl: aspeed-g6: Rename SD3 to EMMC and rework pin groups

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  86 ++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 124 ++++++++----------
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   3 +-
 3 files changed, 98 insertions(+), 115 deletions(-)

-- 
2.20.1

