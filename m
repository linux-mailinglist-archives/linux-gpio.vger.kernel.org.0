Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED541EB32C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 03:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgFBB7s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 21:59:48 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39931 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbgFBB7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2020 21:59:48 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 829A7A68
        for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2020 21:59:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 01 Jun 2020 21:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lovelett.me; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=w/hWwkoRjtblZVWiy6Dn7DDUfcyOcNGB+A/Sja7wd8s=; b=rI5cxrIK
        ZQd62nlvgxRUHJRq0yjQEjRCg+kJXPilWv2pmVnLUdtrh6fIdyiB3obQaYFnnzjJ
        h65OcvTEMe3NK/iHYAn2nRD0tLjqkQNdeZWNy85Qvc5K3qTcSJrbewB4u2/EDW6h
        x2YgPtRcJcJ+yX9yyRTLgM0/2yKq1lseqmXFBxo0VE4MpULyQyg18SHcG5GImhyG
        cvKUYyJQIWFg8Y0/bY9nCntDZtRplo2wCa7R+rZOdLYwRZQDGvTzRF6zxgNlUUvQ
        RSj6akaD2RLCct2H9tI3JZ9UTOs/29kFShWKFY1V1fw/6oEPyfYP51D2oLkk/oQR
        j5uTWspvU/vOsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=w/hWwkoRjtblZVWiy6Dn7DDUfcyOc
        NGB+A/Sja7wd8s=; b=Udt+IF8PEtsyArhPJ7zn6ByD8esZ5DEeeWwCsOHmrINc8
        bjm31b2ibF+mwDP7009bU5IVEeGW6nSadfwlZgWpJHNIgCdR9HtpDGYwNa7++UkI
        3+wJfj+eynP8y37Adp64oPs+SSdiHeUbxLuFjFK8k/guA4exboYgYSU+s5jF6U6y
        ikKjwliX9v5OYeVC3FeccaLyCo+99N2pw8ljW1wb/K4SRm7+8dkgTk7vd1R5m9Cn
        JFZEY4bicQhcpA79h/ycwY8xiUKD/snUcmsE1ZGQRrY6zRSNnMcsiTzUtcr38jVX
        ff6wJBCgyVrmHrWHfXJkd2yL/MkvnXsCCv9Y7NjrA==
X-ME-Sender: <xms:krLVXletXliEkAbraJSe_w_WbleUwFc_N6WwaHzSQ7imH4BLeZpA4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedftfihrghnucfnohhvvghlvghtthdfuceorhihrghnsehlohhv
    vghlvghtthdrmhgvqeenucggtffrrghtthgvrhhnpeehuedvkeduhfetieekieehveevff
    etvdeiiedviefhheejheeugeekvddtffeigfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnheslhhovhgvlhgvthhtrdhmvg
X-ME-Proxy: <xmx:krLVXjMUNjYAx_KG9v3oBdKV0Ag2n9eqBY5EE-vJFZ4i6eemS5j1kg>
    <xmx:krLVXujDkHu2Mg2EMSlkkOua-kmDAxD3CddQs0YlerKKYcjXWyN4zQ>
    <xmx:krLVXu9Fabsh9GqKry1LzctByn6YHMjyOYMjmEcpEUSp2RhrmAni1w>
    <xmx:k7LVXqMAMqyT--nYcTiYOggpQGynSy5LMPytyRQ-0mMWVc9Nt0nJAg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CAFFBE00A9; Mon,  1 Jun 2020 21:59:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <c5498c40-7e80-4dc5-bff3-3ab8efd4898f@www.fastmail.com>
Date:   Mon, 01 Jun 2020 21:59:07 -0400
From:   "Ryan Lovelett" <ryan@lovelett.me>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod] Polling precision/order
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am trying to use libgpiod to listen for falling edge events to determine rotation direction for a rotary encoder and the values I'm reading seem unstable. I am starting to wonder if either my approach is flawed or libgpiod/Linux cannot be used for this purpose.

Rather than post my code and go with that I think I can explain the problem using the provided tools. Specifically, gpiomon, 
e.g., gpiomon --falling-edge --active-low gpiochip0 3 4. Here I've hooked up the rotary encoder clock and signal gpio pins 3 and 4. Spinning one direction should make 3 go low before 4 and spinning the opposite should make 4 go low before 3. Looking at the signal on the oscilloscope shows exactly that behavior.

Unfortunately, I do not see that in the gpiomon output. It is erratic and order is not always guaranteed. Is this just something that is not going to work on Linux due to the nature of interrupts on Linux? Is this a bug? Or just not supported use case?

-- 
  Ryan Lovelett
