Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC7B262E32
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 13:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgIILvI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 07:51:08 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51983 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729941AbgIILns (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 07:43:48 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 915B7B12;
        Wed,  9 Sep 2020 07:43:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 09 Sep 2020 07:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=IeoBvfYVc4Im06yQD+pxOyrxlm
        Y/+Hex5uW2NfYlC4o=; b=pjWnANMor34uCQOJohh/rld/EEFZc0UosIinK3d9QS
        XayGD5TLHvZHMGEgVCf44OvYZC0TMSyya/vL5dXrFv1Nyst1KSNCu4Qu0ea9wbvd
        rG6wHz+nqWfOpeyxggBUWJT/CAcOpZ213uUIOOCpRtfct47VGvhs1AY2Z8eXUL3J
        r5Lx1o/1fN+ls+0sTZRXiFWmEwVQedIN3+y7KFV++Z//WRmZZSei3fwxVO8dAQNR
        cmYi7DTrCRGuno162UDtbtDOj1CU3L/CveGrvNg3+THNeur7HLTFntmJyfL0ULxR
        XBN8+V97LOiaI12YBzRQn56Ke0I41EueLcmWLZWI4R6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IeoBvfYVc4Im06yQD
        +pxOyrxlmY/+Hex5uW2NfYlC4o=; b=SRdJuAV/upsVfD3GHCrgmudbEhZYcNChF
        CcktFNPbjmmcfjWvkLAeXBQVrVoOz0REyitsgovvhE+larHzYMCV0OAYZCMViYx8
        JQ4LLQhu+Y41B3GbLfxTp/xdiBbCp+gFtZBdHqmDjXD7XR0DmneNCnvk6NRMmQru
        +YyE+QE8Jwlq3Z2zX1GpZWcFkiaOSDzoCV94LYNluDEMgIm/5EjgxZaqCef3hDSD
        InWFWA1rexsiz6eVnRudeJRNorV/KwV2vlI34006FjsqoFU/6SCw/OPCw3Pw+8BH
        IUJfL6qMAgVUAlNZ1Lv6bo1YH1hNx9fNYT9+wi5r1T1rhM1iNsB4A==
X-ME-Sender: <xms:2r9YX41CXZFARNB0cvRrJvpRQsP9ME2Kaw5DRo3l1BGDXkZD0GH3CQ>
    <xme:2r9YXzEgcpaFxrOkgie1iUuNF7Jqe_73bxz4Du9F9_1_wTm2-cUj-tAtjXptpjExc
    5SVJn4k23xdxlP71g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
    ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
    dvvddthefftedujeethfeuueelfedtnecukfhppedugedrvddruddtledrkeehnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
    grjhdrihgurdgruh
X-ME-Proxy: <xmx:2r9YXw4TELryIczh5Xaagxs2FH5ivCya275pTlsOHFPLyU4xuk3d3g>
    <xmx:2r9YXx0dwqN1ZJL3SX5_RyKVPEqIuP8-n0Gi2O7Wi0Ko0dOsRKqc6Q>
    <xmx:2r9YX7E3zlgNLcuiH9r57icHisrn_g-HNRhsGk822r-GYIboRsHf-g>
    <xmx:3b9YX8OTvr-a032_Sld4L8_3bSqS6lNQ36xRnW0r2LdBP7Jz435Otg>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1C3C63065B97;
        Wed,  9 Sep 2020 07:43:19 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, joel@jms.id.au,
        johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pinctrl: aspeed: AST2600 pinconf fixes
Date:   Wed,  9 Sep 2020 21:13:09 +0930
Message-Id: <20200909114312.2863675-1-andrew@aj.id.au>
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

