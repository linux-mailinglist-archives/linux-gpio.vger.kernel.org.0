Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD9EC56333
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 09:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfFZHVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 03:21:14 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40337 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfFZHVN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 03:21:13 -0400
X-Greylist: delayed 332 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jun 2019 03:21:12 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7E04E1C22;
        Wed, 26 Jun 2019 03:15:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=fWlD1uewNsuOv
        vJeyP+mMa6JLokQU6xzkQsW9nl9tuI=; b=lNDZe0OwrWhjUfAq+Ykf7egxE5PT+
        TlpMZA8Aqdm9GKfmbzNSHzFTLTqiVth6hkZInumC9IlQvLXrRrLRRh/Nhmy2I2Oh
        huZJy0QqifGtdjxtqD3DwAg+g4FX95lbpaSewrK7PzdPUYqL/oPHEE2Eh2ZGfcHh
        DlEcUYWm6Agp/5fhcS+p5mgkBwGnXArZZwMtgD4MZuaS0AF4UDD9bh6szqY3WRBR
        nAw3MHI8xYWqL7z7eVpn5FpiwCIHrKzXT6T+4EMtkyZFy+oWciefDbJmMJsLPoF4
        B7D7d/qlqFLLT/if/Ja5aaNIPj7opctGOicwctW59RkcXYHZDRMBr++YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=fWlD1uewNsuOvvJeyP+mMa6JLokQU6xzkQsW9nl9tuI=; b=puLWPAjq
        whxH/c7QidyFvKjgWRqCymc6vEDpiIa/O0wlvq32w+ldyywucvsmSIJJ1JgNNkxa
        VxsubG6LyhdPmq7RttIWL3pPJT/IBCAF8ZYbaPcw8TVBEG4wKCV/fkzuskhOg4HE
        0cW7eE8wFvA7QXeVkEEsoU1LZ6MtbkWVEPbxYWUBuzt+ah6Dfc4Ey1LU8j9C62vx
        fElrkRFsEZzQJeBDULfIE27y7zLAKabz4F7yIeWBC/H1a7giGl7u5sB9L9vOsRzh
        xGVxNUmF4FkvO4Y2q6hKvkamFUihRcB1o1KlhLRnEkikoBk8pWMPp8OQ6dh5sR8z
        GC+1YP3iDF1hfw==
X-ME-Sender: <xms:rhsTXWlP9ws_PPZRzyZx3jZQVpTxB6KyWfzOBAM3H8MP0NYYodpJdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
    hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
    pedu
X-ME-Proxy: <xmx:rhsTXea8AUim3q9k60F2hy0ukk1inKBD5-vkK0e7z1dtpVOUvq3qoQ>
    <xmx:rhsTXV0gWSQ-XQyewoq0qSiXREhxFsnm6gkfUEnHub6LDw4V2gglIg>
    <xmx:rhsTXURq--Q-jb9A_GChcDNgbzCXGK7AgsCwSSqBU7pyudU9rftbvg>
    <xmx:rhsTXe1FVeEOkH_6ZkGh_RmuGM_dxyrquAVFKMSeErk5f_NxzwBhoQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9CDFB380076;
        Wed, 26 Jun 2019 03:15:54 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] MAINTAINERS: Add entry for ASPEED pinctrl drivers
Date:   Wed, 26 Jun 2019 16:44:26 +0930
Message-Id: <20190626071430.28556-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
References: <20190626071430.28556-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add myself as maintainer to avoid burdening others with the madness.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6954776a37e..978383f5c1ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2586,6 +2586,15 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621.rst
 F:	drivers/hwmon/asc7621.c
 
+ASPEED PINCTRL DRIVERS
+M:	Andrew Jeffery <andrew@aj.id.au>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	drivers/pinctrl/aspeed/
+F:	Documentation/devicetree/bindings/pinctrl/aspeed,*
+
 ASPEED VIDEO ENGINE DRIVER
 M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
-- 
2.20.1

