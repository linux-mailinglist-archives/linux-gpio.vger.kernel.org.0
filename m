Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03466650DF
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 06:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbfGKEUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 00:20:18 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:33797 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728086AbfGKEUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 00:20:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 276A72F08;
        Thu, 11 Jul 2019 00:20:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 11 Jul 2019 00:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=HZcia/IfVzkvd
        lkvnb5LKV31CBZHUGSpuuBvYoxo1kk=; b=pdfcgHouKdKuYmfxpsOaP6K77uack
        pqSsatKYFQ0izSJYE04AQd0ZQ9T3WwACruy74H758hT+Y34YjTeY1rlxDpvPkfoX
        WF7pFEd90LA52Bel8RXQ2Rx+G2se15f+Ba4s6XRXR5HiVUiLBCg6Juu0glKats0Q
        8pbo9O8F2yPIuuWi8YfXcSpvCBAhrqOek+t3v6HsLNXuFQQ4ryHItcbted+KjpbK
        ANLZ9dqUQFwvsDoc/+y6VLNmBLj4+UGghVfLWnFt8be3BTiouv2YYJkKknsOJLd4
        RSUtY9Cizor8dZQvDh+244oXIU2RIkqNvUyyMtZpAHLZkqYeuhNQavn+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=HZcia/IfVzkvdlkvnb5LKV31CBZHUGSpuuBvYoxo1kk=; b=dGw4pyKA
        2n/im6cU11TCGqY7ZrXDTVMb23naYGovlb5tij+18E7pMSayDOueYwdIbIjZTxMS
        m2Qqvq2QoAOrmIqwBMLxHjpEJJfMjm7EjfZzDr35pcME4SbQltnL4NxcdClFfiXf
        BZkO2I6GLcTt57n9qbrx1Q5IBMS42dONscdBBrb1+Bp3cxvCfXvjJk/JdKD9M27J
        pEl15KBq3pQOoQ780kEzUfb0mtOvXFU/rkHFpUfZ7U2Apj/TKli/Z25xDr0pmdyj
        sOFtNrFkRofrYV8d5c4RbimT+WdUBrVdF4O66klVjpgRoqQzx/Ajx0D1vGo6i6B4
        EJjwiJJavaVB1A==
X-ME-Sender: <xms:ALkmXXV0bcNWplwFBt949UjpF7Zssd-U5nNs3MnD6KA6Jj76bvGW1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeejgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
    fe
X-ME-Proxy: <xmx:ALkmXSKUy5CCssGBvIjkAddVPKvTwkwJF2oS3pmtT4pUKz6Ia4FA7Q>
    <xmx:ALkmXXBzOiBiXQN1CrMKRvOw7tCMa-nc5zJ8cQg08V0zj_w3hpDDgQ>
    <xmx:ALkmXSd8ZtXUKKVT0PP36KAl8hHBNVrPEeFPJgOLhMhB38oFcl4W-w>
    <xmx:AbkmXbu3zc4oHjPB991BmzWgCKDe0tMeskvLDUDpLaHMmD-TIP3fAQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2B1C780059;
        Thu, 11 Jul 2019 00:20:12 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
Date:   Thu, 11 Jul 2019 13:49:41 +0930
Message-Id: <20190711041942.23202-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711041942.23202-1-andrew@aj.id.au>
References: <20190711041942.23202-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The complement of SIG_DESC_SET().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 474820df6263..c59e936a7dde 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -508,6 +508,7 @@ struct aspeed_pin_desc {
  * @idx: The bit index in the register
  */
 #define SIG_DESC_SET(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 1)
+#define SIG_DESC_CLEAR(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 0)
 
 #define SIG_DESC_LIST_SYM(sig, group) sig_descs_ ## sig ## _ ## group
 #define SIG_DESC_LIST_DECL(sig, group, ...) \
-- 
2.20.1

