Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC373EAE39
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 03:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbhHMBow (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 21:44:52 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:57539 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238228AbhHMBov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 21:44:51 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 96AC93200035;
        Thu, 12 Aug 2021 21:44:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 12 Aug 2021 21:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=fm3; bh=DSO55Ffg7LQZIB40mWFWD6ou9h
        bP8Dnr6+Jnu7dGhlo=; b=pag1yCAeU+qRcB0ejF+T4OUWB+yS4dgQDAqxbcf4Ia
        XQ7lq34pBMYZscz6NPdYKVNKnsDqrT/kSsEQ2PjxnoNcHsAj8aAu94lnXeWqeIay
        eV/YQYjdqXRTi76npU6cDOg9iAozSZc2eEEfhos5lM4gYf8+v47V2OpL2HLhXlNt
        d2Aquz/MSM1nzqAbc2X7rWBWFXHYI2eXyqOk2SS4uz7q724jHvUUlAd+jqdwBdjZ
        NJL69eq5V5f2asWeXyFGaSxSVvDluNLX+jpaHl508dFChSIo+DZiZp2v1Whbu+Y8
        hkibAMEKoDnYI2IZJ9cuDqCtCe2baKpI0hUt0jr4+7pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=DSO55Ffg7LQZIB40mWFWD6ou9hbP8Dnr6+Jnu7dGhlo=; b=MkHgPsoN
        jhZGfOS2Kss61D6TkrEVm7AsM7kf0HPrqvBid/J/0Nd36LsOQMhKqma0G2dUTkA3
        YL3lGO0UB+UaRJAgwiiziIwHGSYZ43HmnLp+Y+KvyoirBVMsF8CUS05VSsOWJIfc
        mfc1XTysDhBhfuA35TOpjfREHyQacr9oAXwqNVKsp1WevfXTb9FjtPXzKZVTvt1D
        mLovAFfACjLcCQtxeH4EKf7vFzAHCpC0qUGs7SVf4AvdGNZ/wPD2H8TYpcI1x8Ga
        JWhoiGy54wgy6uUy8xNYvIkgOgZZu52gPpIX36TbrWaR/HagLivOuieMPNZgNYxL
        LTLYVUA9OPnYHw==
X-ME-Sender: <xms:eM4VYWiItfNPIWWlqb8htlks_C1jxIhhxlSC-1v4Z9BkyaBcntIacQ>
    <xme:eM4VYXCgrhTQ5QortpGDfpbfSdl3WyraiZqF7IuUzxU3A5o3iH5qRbvHR8ezwj3jJ
    b4v1GBrFy_tyHgeiw>
X-ME-Received: <xmr:eM4VYeFHH7F14RP1FrkSXvQi5uMekEbQTXgGUhJCFMF4nCFag2y9Ja3bQw594lDXN0GtDyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:eM4VYfQsNStPLTPnl4Agp3JKsfLAAFunaQnA6wvO2oZZJBOMiTFSwg>
    <xmx:eM4VYTwgO3G3jCEO5MtTakLs_JZr352Uj6TceNPXflBjcHbtoinO1w>
    <xmx:eM4VYd49WZUeVAIgX1w2pXId5WChET-p_le9vbacvWhgnAVTLghk3g>
    <xmx:ec4VYRYgf42FAgYOUiB-yBxZc6LF4IsdBmh6adDSd2IJ_dapHgGrbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Aug 2021 21:44:23 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     bartekgola@gmail.com, linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod 1/2] configure: Fix 'flase' typo in bats dependency test
Date:   Fri, 13 Aug 2021 11:14:12 +0930
Message-Id: <20210813014413.4080109-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210813014413.4080109-1-andrew@aj.id.au>
References: <20210813014413.4080109-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hopefully this helps identify the failure early in confiure rather than
late when the tests should be executed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index e0a917f54cf2..351d5479a319 100644
--- a/configure.ac
+++ b/configure.ac
@@ -137,7 +137,7 @@ then
 	if test "x$with_tools" = xtrue
 	then
 		AC_CHECK_PROG([has_bats], [bats], [true], [false])
-		if test "x$has_bats" = "xflase"
+		if test "x$has_bats" = "xfalse"
 		then
 			AC_MSG_NOTICE(["bats not found - gpio-tools tests cannot be run])
 		fi
-- 
2.30.2

