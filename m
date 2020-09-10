Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A024E263B16
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 04:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgIJC54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 22:57:56 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33753 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727087AbgIJC5l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 22:57:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id DA2F65C00F7;
        Wed,  9 Sep 2020 22:57:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=Dv9G8vf2BZy5Sw/wGzgCeqKxjd
        oYeYoETlbjpaAz4t0=; b=g/Vjh1JGv9G2xjnS0TYgirRufyIhD8cVoO/M0R67WR
        /kUfrmIpP5b+oSocsiY8Wb6ylsJDdMQ15DNgILlO6yN32/mkx8vJMaRVVt5u+tDS
        CMNK70raEYj2ZmFO0UqGMXIrVvKHd0hI1FIYAoynNEbI2usJN5RgNyd1xlGWbdfm
        IthYzYxuO9jLB48j0a7GEe43ikghJbJVOIYu+ecMklp88lvJWZRi7EYL8+IVEAhz
        ReHCmmdn1YmWff+sPSxq4JQyvVTfAkOjTtUgso+JLe+kmQRilactXGpIOPr5QsPm
        l4lqyaIirFQ9xjjdkzjoRsu9GCz8C5QGU5ZqOYJCYSdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dv9G8vf2BZy5Sw/wG
        zgCeqKxjdoYeYoETlbjpaAz4t0=; b=ZO7kwr/pv7spUtjEZR8RXP9gTa/e13opl
        6tneKYDQjYjiDD259URqHM+lrurYaP412m4l7kohn1xRLTgGhkfKNRnK+Q5jdPzA
        sOLRFDpj5oxuLryKgXnzKeTEx1QFQ7XqpqIGIVPER3ZcWV5p8JOFlAagaHKsgMcc
        O9V1XjXaNLffctPy8Y0TLcj/2jH1vRnUOFb4UxexSKo1r//Q/Kg/UaKXBk7xTbuo
        GWTkTCLndwBRv1A93qkbbxMKQRTIa0tuhvZ5qzUkEMVnbKIPWmYRvegFsIXhbz2a
        pgB3/q8wyKaYNl8224BDVQ+aC1CXO6VBr8dAbDYI7KSCOQnB+SeDw==
X-ME-Sender: <xms:EpZZXz9VCDXJbSMFWlPtroqK0VUMCMqtWTtfUjKToW-Sj_gaFoe8gw>
    <xme:EpZZX_sBLZFsuypAmlhRwYLGExqR85v7UJX7LCQwF-5hEHSnRqg-GnysB2-V_nK9U
    IRcFnseGhYVQ0FT0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuggftrfgrthhtvghrnhepieetheduveelhfdvvdejleeuhfelteevhe
    ffgfeitdefgeekjeefieevgfehhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghen
    ucfkphepudegrddvrddutdelrdekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:EpZZXxCytbShkaI9ajG7sGZRoZJGRmal7WpEdAotqZxnm6pYUVKkaQ>
    <xmx:EpZZX_ec-nqmL9D12PRSNALELMUvv836OsO58gFsV9hAQYQI381JmQ>
    <xmx:EpZZX4ODsqeaY2Bpz3pcMO_QEgmacCFZHFAZdHw5Qc3YYg3oqTjfqw>
    <xmx:E5ZZX30sIIECRi4JW222zE0zo4Kl46Zthadgv2ke72i33X7BvFbldw>
Received: from mistburn.lan (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id AA345306902A;
        Wed,  9 Sep 2020 22:57:19 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pinctrl: aspeed: AST2600 pinconf fixes
Date:   Thu, 10 Sep 2020 12:26:28 +0930
Message-Id: <20200910025631.2996342-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

The AST2600 pinctrl driver was missing support for bias control on the 1.8V
GPIO pins, and in the process of resolving that I discovered a couple of other
bugs that are fixed in the first two patches of the series.

v2 Tweaks some of the debug output and adds Joel's Reviewed-by tags.

v1 can be found here:

https://lore.kernel.org/linux-gpio/20200909114312.2863675-1-andrew@aj.id.au/

Please review!

Andrew

Andrew Jeffery (3):
  pinctrl: aspeed: Format pinconf debug consistent with pinmux
  pinctrl: aspeed: Use the right pinconf mask
  pinctrl: aspeed-g6: Add bias controls for 1.8V GPIO banks

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    |  8 ++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.25.1

