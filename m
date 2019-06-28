Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5DC5914F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 04:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfF1Cje (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 22:39:34 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45169 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbfF1Cjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Jun 2019 22:39:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 962742CC1;
        Thu, 27 Jun 2019 22:39:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 27 Jun 2019 22:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Vxe60SKdB2WFg
        jGVqqAUJGIE/TPQst4OsGPOazQgikw=; b=izlOUc3a+lMIgJWtEXH1fCPZPSGiR
        frzSLRRScqsNZk5IA8LSdtAUsN9ZARKu+Y/mbNbU0tD0wvkt/diP+S2u5Ur4YS4j
        DYBIVyLQhKbETCiEdKJUD6LhRLDm9oHkbgovFYkjWTcyMs2mYd4dBjoFge2D4hzE
        RIL6XJ1Mdc0V4XUgRP9U+cBmmwtKXb0W+VILTJL3LqEwcjF4msDyTISoJF8cd4Wj
        htKZurh9mQQh84nJWb95sMvGWMXZ/zJY3PtB4PKYDv2mk2qCxLR2j43iGvHCAuOn
        aWeIHRyqYh+JTp/gdGNfi45KHW//P8suD9WU2B6D144auGVc28mIhE8aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Vxe60SKdB2WFgjGVqqAUJGIE/TPQst4OsGPOazQgikw=; b=nEXq/PW1
        1EcDFGipw58cj/E4dAvTUnpAflLQZ3l5JPSBX3StWuWPaNhDFOXFlbQQ9HRLRYLD
        XH9tDRhlPhssw1PAgvpesPdDArqR8UrlGyZkWJc4o/QG2yuITEhjb9SjJci95CHO
        Mza2OqlOWqT/BFSpV3gYVvUDBZ+CntP75XLU2Wbeax6c+7fHPi+Hc0A7Zzx/v6V6
        TkCP600pjFcVKza9QRGJM/H7oGx7cy3HxT+o3XGB0+4vEqlr8QcZJz++vYP8TT0V
        pPpg/XBQ5+yi94QU0w98C2Gj2FGvl55njINky28BT6Troh+IYha9zcxFwZiVH+O7
        SO1mWdYfv661bQ==
X-ME-Sender: <xms:5H0VXVNXUktQZDZYl5FaR7NIXf6562Zlz4P4dUvYo_yICLcZJ3FbhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudelgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
    ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
    ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
    ihgurdgruhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:5H0VXdPJBpagV_nPMpmlekY_zdy-Kf7o9Makcr-oxBgOkhhjvlcyEA>
    <xmx:5H0VXV8gT9uGmlEsmltmTlXjcG3zpTJmvRBfcOjNud8adRROA7Jn5A>
    <xmx:5H0VXZ4Yo-XX-MLHvG2Kf20zyilMY2Fz22421lIcHbqaA_VQky7NJA>
    <xmx:5H0VXc4OTLlXa77WQqQZoiyAVItR4skjs7xM7fOWaRfUk7VFmVRu8Q>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
        by mail.messagingengine.com (Postfix) with ESMTPA id 67981380074;
        Thu, 27 Jun 2019 22:39:28 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Cc:     ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@aj.id.au>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Johnny Huang <johnny_huang@aspeedtech.com>
Subject: [PATCH v2 4/8] MAINTAINERS: Add entry for ASPEED pinctrl drivers
Date:   Fri, 28 Jun 2019 12:08:34 +0930
Message-Id: <20190628023838.15426-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628023838.15426-1-andrew@aj.id.au>
References: <20190628023838.15426-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add myself as maintainer to avoid burdening others with the madness.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d0ed735994a5..e70fcaa56094 100644
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

