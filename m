Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0894E41F1FA
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 18:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhJAQTU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 12:19:20 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52169 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354781AbhJAQTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 12:19:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B36DB32027AE;
        Fri,  1 Oct 2021 12:17:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 01 Oct 2021 12:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nakato.io; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=wk0G5yb0Pu+jU8dSjG8NyghWV+
        VHyRrTbH7tD0+2cpQ=; b=O8iIJe4bKW9pnxZDc78Y1iez/ECgJ6O2QswTg6oufb
        gY6Ww7q7TURQa7ep8IfXfZV3GnC0+nNUxyI5u6gmCWEGCo0YpESa0IQiHW/XjBuq
        Xp8FKfHoOOOeZIwRWP/bRk9Mlg0rKzAG5sy33OCMIQ1vibJncTWwEN644J9JWHxq
        1ygNwkFEPZ8XUNzTZDUJ3IWJQ/IwelA9elBPcAayYyKsaFuINsFCEXNEg1Ru3Yc8
        8GN2kzdmzLudcGRv8YyxvgViuHh1ZahbzXF2ay8fW35oEnGnqzOA8v5NgC4bWTN3
        lEasJa1e2VcMyvszBQSVm1MF9dAbkdXngk/2Hw64/tPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wk0G5yb0Pu+jU8dSj
        G8NyghWV+VHyRrTbH7tD0+2cpQ=; b=S763rGZVNBApJuqTAJvov1XIbNXA38Ums
        D35DdoUcEaDR0dTV9zVB0RrcwzxkyEJAbJOLRO0IO8QACxBMcY74/xqC4tNsf+gs
        0PsdaE/R6nZ5hv0EQ/IdExZYaG1GnAatEW7pW5a/ukCD/M43JyayDJj+EmWt9HHg
        iA8AWXd16MgyfrnUleksWLgz+bTgAyPlfVtVSe+vXXCmu7lrAYFGcepDU7Ltv1Ja
        0DKYk7+eLA0heyHE6aIrEFzBKwkNN6wEqkW0WOLarnwcMJHp7baihUsLTh8zjeHv
        iQib6DGh+upszslID7XiDAFxTClkqwRqRTw0GJbqY3CZ0+fDlF1Yw==
X-ME-Sender: <xms:njRXYQcX8aicc-N1_CmXAwT7riD6nd7YcOAmkYbGBX15zIQ8PFh6Fw>
    <xme:njRXYSM0wR3Mo1tpA8C7lPvMJ6c3yj4grc4h5ztKC1rEWERD2__qW2OvQovxZxj9j
    _ckp-A3YO1j5_PLsg>
X-ME-Received: <xmr:njRXYRj9vqEtghC2BvjQtwYVFtczk4SpOQgjc2sA5w2Y-rP5APqfC8pV_AUasfu0AOUSLeUBwqm1oVGqkADd2VGfpUL8SVE8Uy6n12kN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepufgrtghhihcumfhinhhguceonhgrkhgrthhosehnrghkrghtohdr
    ihhoqeenucggtffrrghtthgvrhhnpedvveetteefiefgfeejueehkeekteeigfduveduie
    fhhfetjeejgeetvdeuhffgvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgrkhgrthhose
    hnrghkrghtohdrihho
X-ME-Proxy: <xmx:njRXYV-_uNy0_CnMBskbxJvjLTazSofIygtXTCF-RTgo-O4t1V2k5A>
    <xmx:njRXYcuZcADDC6pffLhf-S3QCHMULMWFOl6LvFXRplGYO9x5CErj2Q>
    <xmx:njRXYcF5KKwEQ_uI9R7X2lHUClJ4LKr9wpEkn-X7JpGAo7DQ5HKonQ>
    <xmx:njRXYV71KgoV-QTt0aC6DDICmzPdpguSv7Qntxhevp5ySQCLHV0ofA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 12:17:32 -0400 (EDT)
From:   Sachi King <nakato@nakato.io>
To:     linux-gpio@vger.kernel.org, basavaraj.natikar@amd.com
Cc:     linux-kernel@vger.kernel.org, Sachi King <nakato@nakato.io>
Subject: [PATCH 0/1] pinctrl: amd: pinctrl: amd: disable and mask interrupts on probe
Date:   Sat,  2 Oct 2021 02:17:13 +1000
Message-Id: <20211001161714.2053597-1-nakato@nakato.io>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On a Microsoft Surface Laptop 4, I've found that the GPIO controller is
preconfigured with a number of interrupts.  I'm not sure if this is
device specific, in which case I could propose a quirk, or a more
general issue.  Prior to https://git.kernel.org/torvalds/c/acd47b9f28e5
which will be in 5.15, this device exhibited failed resumes that would
result in high power consumption and no reliable way to resume the
device.  Following that patch the device exhibits spurious wakeups.

As far as I can tell interrupts should be disabled and masked as a
default state, so ensuring this is the initial state should be safe as a
default action.

Sachi King (1):
  pinctrl: amd: disable and mask interrupts on probe

 drivers/pinctrl/pinctrl-amd.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.33.0

