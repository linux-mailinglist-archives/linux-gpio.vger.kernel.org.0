Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9D23EAE3A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 03:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238228AbhHMBoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 21:44:54 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44853 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238284AbhHMBoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 21:44:54 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0DED83200035;
        Thu, 12 Aug 2021 21:44:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 12 Aug 2021 21:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=fm3; bh=toCks6kx61gRjktx+WjnXJgHc4
        kjzWtdq99W+rp0VQQ=; b=jGRLTB/N7hxu/PJsUeQlYrRpbAX2uUqsKdgdyDnXyL
        vW0ZB7wlctNTV5j4jeN3TXsxuM7/dlfcc/5t3jnauLcHCDFhq7ZSbCzpxm2xZ866
        i4mV+EQoQ/N0589Gp62aLtQQOvNQgRL4AESP99w2brQ3mMfLq/oTTeQJQHDYF1ig
        BTpmKNyg08ZhAqy3RjJRxayBI4lnV9chAg3Plfn17jCiCG3nIUCbAaEQ1/Ry/z4X
        z+8II4era4L3RkX/pVrJmAzsxpcedCqN05joPSdwOZlFkR42b3ehmK5YNC3AP1Ei
        O73Rq9nPTCPTbOuJo7oWNKhvSKLNZj1D076gQOKMy6Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=toCks6kx61gRjktx+WjnXJgHc4kjzWtdq99W+rp0VQQ=; b=L5kVPGhG
        E1IHt/BtEWzuWYW2P71aeiEEFwqb/xEYz+oL96TvtTAKCZNM1YgJ0QdxSIOS1gkr
        VEWkvGYGx26/57icpaehqahZg54XFMMcW+WvsZWN2FjF8YZbTQG0h8lW+Ijjfnhf
        /jinqADCK3SS/xR3bN+WTaEyalvpq3zjsA87ybx+IuA+4uF98GAs5OmdrdACP3D/
        106zoygovSz0ov1x4opVDDsJdlFJZhPhieoPbUfyEHF6cIgQnXbcm8FEh1YTJc8S
        hnUphapikoYbeLk3wjRaM8eu159SsRen0QRnJHFRgSVh88nP1LgF8Hjbdeohrh5s
        DWBB9RJ41b9YrA==
X-ME-Sender: <xms:e84VYa-GqeE97_K19D1CpGbD_GM84IWaugc024ciSJ-_jPVLVm80_A>
    <xme:e84VYauueZeKO-5GhanBY1-i_tmp7buEJRayX39YkFZY3wo3xzQ855iPqbQls3U7i
    T-kNxUpFQI2YLug0w>
X-ME-Received: <xmr:e84VYQBZwRiaaEnZidLA0DUtqJEmlrSO1ZW3n7v8PLSghbKgKcXSAHUVDkYjdZqD5Js2AHk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:e84VYSdRLJHI93akWaXYG4pd_U7i2OD-uNViX_gToMEiOb8blVZzyg>
    <xmx:e84VYfNb_365sS5OVZXspNrnA7yuuT6qIcSn9DrgaJMhvQEhnGk22A>
    <xmx:e84VYckUQX5FWJEdnZ6tJOdfzyhuXrDq60f6m4hO1xR0PNu87CZ6Ag>
    <xmx:e84VYRWWgEyUi51rCTfR4uN43jTNVFa9WSoGne5e0hpcm-25QwB8mA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Aug 2021 21:44:26 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     bartekgola@gmail.com, linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod 2/2] configure: Drop unnecessary double-quote character
Date:   Fri, 13 Aug 2021 11:14:13 +0930
Message-Id: <20210813014413.4080109-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210813014413.4080109-1-andrew@aj.id.au>
References: <20210813014413.4080109-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The double-quote was also missing its matching pair.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 351d5479a319..ce6de99c1edd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -139,7 +139,7 @@ then
 		AC_CHECK_PROG([has_bats], [bats], [true], [false])
 		if test "x$has_bats" = "xfalse"
 		then
-			AC_MSG_NOTICE(["bats not found - gpio-tools tests cannot be run])
+			AC_MSG_NOTICE([bats not found - gpio-tools tests cannot be run])
 		fi
 	fi
 fi
-- 
2.30.2

