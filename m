Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43404141329
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 22:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbgAQVdo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 16:33:44 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:35509 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727504AbgAQVdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jan 2020 16:33:43 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 777C8600;
        Fri, 17 Jan 2020 16:33:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 17 Jan 2020 16:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=W569kOUG9Jg4u
        fvUVlvaDUcPU/rpbROxxV7I6tE2DMU=; b=JvIdapIhf1PQ0pRxH7UCvK7t44Lbf
        LABB5VlyC1GktUBq5umdIIizzmBTkHHfPhfDHBISW4PAh2iJUJ+7zO98NnXJsU00
        Ey83KG/Q5zSzXlA5PK0TaF3wrTdjDS81YsQkzO+59pKGtmJVcyyGSo06xSoevIzS
        h1JnjKgbMv0vuLhVqEKyB0XNMYlNBc68iUcsImoU6GIyoitc60zpOaavBgdcti/9
        7NKFZklCnzhlUzRq0737f8d1u9hn0glwmq5BqUUt83NVqCR6uizIrPAi4GwTar4E
        CPwSZzPGjQSUnERY7zNMF7A/DXCTPw5rLcIaIBCtObwsWCcQb+ESbEECw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=W569kOUG9Jg4ufvUVlvaDUcPU/rpbROxxV7I6tE2DMU=; b=jYXvSdN6
        WrGmVN4Fdy1s0cGSqWusNtkGsjmcV8ZR286tt/NGrKG7YqiE1LEUrh+QgiwQ5CNE
        Ogb97ruw/5rlRTFumaz73Fa+Zw6jp0haAKsx0TfvMF44aMV9f1JlT26udrvH7YXi
        t7idtc2mnhkKuJHZbRcNB9QFBBNkimSHCXzf7QVXf+wJAA74PHljzkQKu7aQ1MdD
        r6lhj/O2QHMrleUGe6qLPIlxrHT6gEkpuan2N4m1nH3sxyGBlgTqlCJmnqB27i6N
        H9dTE47lkJUEUwqLQ2Lfajki9rfUbliKmQsmQPilvOa3SMB9eLmRAJrcfuO/x4CV
        l6fc5X2MR6QonA==
X-ME-Sender: <xms:NSgiXpfkIybxSwl0zX0HkxfywgfJ375v4nRWUJZ1Ssu8tPSQG6XO4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdekgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
    ejtddrudefhedrudegkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhu
    vghlsehshhholhhlrghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NSgiXlhAyq22NPKdoZ7Pjm4roHvCkcfrKmHg2KUq6oRsTRhJxgzg6w>
    <xmx:NSgiXjJur8gvwdlC-9x0Dt1nUqRI47gZ5eQmW8il6aruv7aXEwtq2w>
    <xmx:NSgiXi5f2UJUbn4ONVNqF0DBaLwvGaOoOJN8RmlXsPbDwm_v1M1P6w>
    <xmx:NigiXomkNZ81FQQGPIhMxR7kgWs2iRrlv4F5ADujXVlZQ0xdbxrt1Q>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6376980059;
        Fri, 17 Jan 2020 16:33:41 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH 2/2] pinctrl: sunxi: Mask non-wakeup IRQs on suspend
Date:   Fri, 17 Jan 2020 15:33:40 -0600
Message-Id: <20200117213340.47714-2-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200117213340.47714-1-samuel@sholland.org>
References: <20200117213340.47714-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pin controller hardware does not distinguish IRQs intended for
wakeup from other IRQs, so we must mask non-wakeup IRQs in software to
prevent inadvertent wakeups. This is accomplished at the irqchip level
via the IRQCHIP_MASK_ON_SUSPEND flag.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index df79da76321e..24ff591efded 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1076,6 +1076,7 @@ static struct irq_chip sunxi_pinctrl_edge_irq_chip = {
 	.irq_release_resources = sunxi_pinctrl_irq_release_resources,
 	.irq_set_type	= sunxi_pinctrl_irq_set_type,
 	.irq_set_wake	= sunxi_pinctrl_irq_set_wake,
+	.flags		= IRQCHIP_MASK_ON_SUSPEND,
 };
 
 static struct irq_chip sunxi_pinctrl_level_irq_chip = {
@@ -1092,6 +1093,7 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip = {
 	.irq_set_type	= sunxi_pinctrl_irq_set_type,
 	.irq_set_wake	= sunxi_pinctrl_irq_set_wake,
 	.flags		= IRQCHIP_EOI_THREADED |
+			  IRQCHIP_MASK_ON_SUSPEND |
 			  IRQCHIP_EOI_IF_HANDLED,
 };
 
-- 
2.23.0

