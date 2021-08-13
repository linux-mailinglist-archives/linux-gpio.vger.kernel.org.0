Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF0A3EAE38
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 03:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbhHMBot (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 21:44:49 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:53073 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238228AbhHMBot (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 21:44:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id DF9AD320092A;
        Thu, 12 Aug 2021 21:44:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 12 Aug 2021 21:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=J5HIHNv6dygC+Q+ruyIu/h2GK6
        PEWsPP/EL7DiQ//RY=; b=BClhw22LzMaaiyvBXRxd0vjBmETZHSZlvJ/yXcvqvJ
        viLgvg3e8/hvJEdP6tnt7/PaZfBV1a/CyZpopvCjCZHOBIt4oGPQ5EgWvAKKCoU7
        tipivuhZalw7QHh4LIQO73zftfGk22Gos1eSbG8TgaPDgwnmiPB2Hv1bZm3fZb0e
        0zI3jPy2fMpTQb8qmlShYtJZP+GgUMm504FPPxkH1tIbZfRepKDNz7Ycvz9D08Mf
        s0NvOHh+/uj2Pe0SkEgTp1741ucEIAvYU+SKxZu6LvdUq8Okq4TSFkiudFDR6SyV
        86cdF+xESaCnzZ8q8Ygyqf5IeG01pU65iq8aVPaCdaAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=J5HIHNv6dygC+Q+ru
        yIu/h2GK6PEWsPP/EL7DiQ//RY=; b=jM1/KfwK5EPNLeWFOAYJUEH0Bll08RuKX
        IteD3UqgDISO/2BamV9SLCCTDKaYq+DSer6ezffauDNR4CDyaxhLx418kqcUqpZn
        nIJ5H6DT+Wksj4ZkZgHpYu1MWatSdee6kvVrLJ+UMdWo8kKzJHp30Gt+MA0K1nT5
        9Y5Rm8wlfscUHbi6MfFLm/yEhH2Msx6pd33nPngGrrnS2MrKckmWBgZnQViYsD9n
        1hmt23+rYJYSRF59LZhLKsi1MvH2XiVXfCBsfG6LSXzho3i/vJZYa7+sdfEe1DOC
        C4jgB2pbNLSxfEILNUDlCKPrEs4z/KRhipkotdusGFmF/VLhjn97Q==
X-ME-Sender: <xms:ds4VYUi_DHHAE6edYYKHz2fZzVbvBXVHi5LVwLcl-xi0a93e0n9UfA>
    <xme:ds4VYdA9nqRJBj7IRH0hr7BjWIFwhmwEtvn_fkAGVv8msDM66H_zL7yUlu2ez_-ym
    3Ql5UsSo-I9zudYoA>
X-ME-Received: <xmr:ds4VYcGJCZbAmVpJFh47LOWOci-Rq4mUrF0j-GRTGOqoWlI-4r0FxebKnbfE7appI0Egc4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
    dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ds4VYVR5ohTivjjS3QcTnsrzBHfgYbfHjuqLoP96x3tf9u1wB5ying>
    <xmx:ds4VYRzl4q8oVxixIBAgHhBX6U94uJ2PKDAC_yn-VsOxAKQ7y2Tthg>
    <xmx:ds4VYT5RKbzr8Q7HvYMbsf_Sb9y4gbBNzN1qREzakBC7jQUWgqcc_Q>
    <xmx:ds4VYfa9-zPTkNAzgTq64L0rqDmyj2UlJEyZU7LGf4UW6J9-PVTZFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Aug 2021 21:44:20 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     bartekgola@gmail.com, linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod 0/2] configure: Minor cleanups
Date:   Fri, 13 Aug 2021 11:14:11 +0930
Message-Id: <20210813014413.4080109-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Here are a couple of minor fixes for the bats test in configure.ac.

Cheers,

Andrew

Andrew Jeffery (2):
  configure: Fix 'flase' typo in bats dependency test
  configure: Drop unnecessary double-quote character

 configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.30.2

