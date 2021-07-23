Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0AF93D35F1
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 10:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhGWHTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 03:19:15 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:40889 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234366AbhGWHTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Jul 2021 03:19:14 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2448D58163D;
        Fri, 23 Jul 2021 03:59:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 23 Jul 2021 03:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=yMNleqijxoKWL
        G2/iRJF83Hp6/4Eiy8KM4eaq0aduKo=; b=d0ZxzPrInqmmJP9WyhsLKYYrWHtdz
        r5nUAh83q6FssL1zuVYuCT3Kx5bWW/WpfCmg5IdWiSa+E1Xu8kWFG21GY4ZUwg6+
        KU3YlW3jjKfCgAxzzZx1ywevWx4/NuSvUq3ltkyRR3BRnCHMtMBe1hyeOvWW1dkV
        HxEbV0QoBIPOROvEju0lOlDYLOQ2G8p1pKrP4W2ovSxx8VmMNByFpzx3GEA1isdX
        JFEqYUj9OzdWxqyAhu0gmDed5dTRvPWPdk97etYuwNgXk/QYMRn4cP97OHVvVazp
        k3BL5fXVxEU177pOY3vFB/q50Br1eG9YtCs1OXjVCUoS642Zv1EnlhNgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=yMNleqijxoKWLG2/iRJF83Hp6/4Eiy8KM4eaq0aduKo=; b=KVj3Hgfs
        h6uD4VUrAKDHz2z3yxYCgknIa1eJ2IjcSO7JVhUu/zgJVuH9bWcR+tYTrEOl/nnK
        6goAiSC2RDdqXn2cTQN8usnF2OiHVNaUNf73dNHz6YFipat4GXpV7NAUUJ3FZ/nG
        eBHMQO8lhtgmrZcDrKnvyW+DupCLTool/bdTQa004zAC2YFGj3pCzP6gnhxkF+Z2
        HSCRNo3NTqyL0Pvn2EAop4qM40IdLsuHLngRtqKEyyMScsV5Qf1xNq5nq3UQLwk7
        4QuglNsdYoHmVdp5Kk5UYwyYLZluxLM9nIXi8h0LFXT55QLCv7kG6UaZscxrtXsw
        8fqkFHBTAykO2Q==
X-ME-Sender: <xms:9Hb6YLyFT18ne0OgjIDNlyZvzB3qm98YUIj8kpgdlA35RWY1HnQmdA>
    <xme:9Hb6YDT1SKClqAJKJySJO9OA10ZuRaYQ8t97_MtZULFsKDaJ-4cfT0Skrts0WkPpx
    Gj11zdp46grUfEtdA>
X-ME-Received: <xmr:9Hb6YFV3reaabvItKImLjAvReOMz5Pu3wvHtqRYJ7sixj4K4Ntm1cgWWgZNtsbbNlkD15QP20TTXfkDT1ufrEgK_KvrrXVlkNRlQgxSTDaEoKzHBeU2XlNynJNdAbaKIenMisQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepudenucfr
    rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9Hb6YFiZUQ57LeD5qYIvtHdKw_99Mb3Vws-oQWyVZMRHbYVz-kW9_g>
    <xmx:9Hb6YNAe51HrnXFshOVt8wgxQeA1150f6NCTFV7Vz9Mf5qc6gjJG1Q>
    <xmx:9Hb6YOKavc3rizlJQnMPU2Bui15Hzhv3HJmh8lP5Pv-LGHVGL_Fi4w>
    <xmx:9Hb6YBvA395xYm1aCRhZoyUV2J_Ma808wRhqs7uCPaJbJ3F4cDlG-w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 03:59:43 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     clg@kaod.org, robh+dt@kernel.org, joel@jms.id.au, pavel@ucw.cz,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/6] pinctrl: Check get_group_pins callback on init
Date:   Fri, 23 Jul 2021 17:28:58 +0930
Message-Id: <20210723075858.376378-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723075858.376378-1-andrew@aj.id.au>
References: <20210723075858.376378-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Do configurations exist where this doesn't make sense? I lost some time
to debugging the fact that I was missing the callback :(

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index e4862552eb9b..4c436a419856 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1994,7 +1994,8 @@ static int pinctrl_check_ops(struct pinctrl_dev *pctldev)
 
 	if (!ops ||
 	    !ops->get_groups_count ||
-	    !ops->get_group_name)
+	    !ops->get_group_name ||
+	    !ops->get_group_pins)
 		return -EINVAL;
 
 	return 0;
-- 
2.30.2

