Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED1410E5BB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 07:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfLBGMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 01:12:52 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41067 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725807AbfLBGMw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 01:12:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 85EBE22639;
        Mon,  2 Dec 2019 01:12:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 02 Dec 2019 01:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=0RjErlsd2BgGPzWKY9035wj5+w
        1sayMAH/KmpcDz7N0=; b=ic8mng/k1DqnwT6Gl3dHcq25QjL4puHw+CyRFrcjRO
        SSY7IGpT8mmRmFsxz2qYv3Xc3b9vlyT4Xkfm99QJimK0YafQ+8HOHtAuZoqbNeCZ
        G6u6uerhmJlfdm5cXkRHA+gZ3LjfIn0nzwUQW4PIRiFBXHXBFjuCm2+f/msR5ObV
        /dod50vtchx47qZAvTxev57NgvkjflpWcE4NLA8KCW0Rd1iHWnFNCHBtRY/Rbpz8
        s079MHvJo8fOtdV9CIzjlqTFeLxiwExMHhNBKnPMew7u9Na6/nb5L9FPqc4gOmFZ
        laozeS1WEdrbw+/gAibQSjN2I1nvgcvhouLFBF/WjkjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0RjErlsd2BgGPzWKY
        9035wj5+w1sayMAH/KmpcDz7N0=; b=UFQ+ITXGYvmYQjvyDNA2IYiO7w2MnBI1K
        7x9B6Q0St7fwbUcJ4jsJuBKjdZxohm5U+ghYDuMkVWYnFyXPOFKINrbCKBZon5qP
        RYkWFcK8cgT17qA+S3Ind7WAKDZ9Gpo6M6A4xHtTvlF/Czsugw8ZDXrxMYDf746t
        1YXSc53OO7ZiM8d1VxLR7CJx5m7ztoNs2CTvVXc8NC6AciC/7A5qznHxBJIB6/Tv
        1kllmuxdxY08QpsYdwPRM8gOIVaRp1WxYh+HFbpxXebk3L+oLRtLAXwSrrVTDXwH
        xSVnOW8yl8mg+kAPJt63ldKiMlnKvk0eT+aZnfcdFGbUCUBcOGy1w==
X-ME-Sender: <xms:YKvkXTtUo9MuWIb4KRGwNzRSB6KEmk60U2YiyaFwcq6-DNMnor8gww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
    td
X-ME-Proxy: <xmx:YKvkXQ1ffOumc3312OXu_BO_dhduMphO8uo0uIZE0SeR5zU9UVX1xQ>
    <xmx:YKvkXbO3ESr9sYNGBCOALc6hnrwD1rbGdkvonL0h7minx4vzuGinNQ>
    <xmx:YKvkXQUez-46vBL-lcju1Yhmy76kz6jjcdnItmBN6EiH85gXdEvmJA>
    <xmx:YqvkXdbwbi_GhewCX739IsuQ7ztsMluU8SB46CIkruCFZDo5Y3r35w>
Received: from mistburn.lan (unknown [118.211.92.13])
        by mail.messagingengine.com (Postfix) with ESMTPA id AE8D080062;
        Mon,  2 Dec 2019 01:12:45 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] pinctrl: aspeed-g6: USB and pinconf support
Date:   Mon,  2 Dec 2019 16:44:25 +1030
Message-Id: <20191202061432.3996-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

This series adds USB and pinconf support to the AST2600 pincontrol driver. The
patches have largely been developed by Johnny Huang from ASPEED and have been
used for bringup and verification of the chip. The were developed around the
time of the 5.4 merge window but I got distracted for a while and haven't had
an opportunity to send them until now. They've had a run in the OpenBMC kernel
tree and so shouldn't cause any issues, but given where we are for 5.5 I'm just
getting them in early for 5.6 so we don't miss another release.

Please review!

Andrew Jeffery (1):
  dt-bindings: pinctrl: aspeed-g6: Add USB functions and groups

Johnny Huang (6):
  pinctrl: aspeed-g6: Add AST2600 I3C1 and I3C2 pinmux config
  pinctrl: aspeed-g6: Add support for the AST2600 USB pinmux
  pinctrl: aspeed: Add ASPEED_SB_PINCONF() helper
  pinctrl: aspeed: Move aspeed_pin_config_map to separate source file
  pinctrl: aspeed: Use masks to describe pinconf bitfields
  pinctrl: aspeed-g6: Add AST2600 pinconf support

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |   9 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    | 170 ++++----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    | 212 +++++-----
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 387 +++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |  50 +--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       |  38 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   1 +
 7 files changed, 640 insertions(+), 227 deletions(-)

-- 
2.20.1

