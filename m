Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE633EAE89
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 04:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbhHMCYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 22:24:53 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38721 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235385AbhHMCYx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 22:24:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id D4069320055E;
        Thu, 12 Aug 2021 22:24:26 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute2.internal (MEProxy); Thu, 12 Aug 2021 22:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=R4Av/bV5lLfvxbCya7BJK+Ld7wNO0xoQgrCdynH0xe8=; b=oSnc2RqD
        Uz833OsNNryYKUZH3IyNYr85zFxR2p/Nrh8d1xdXP/q+YSirkuP79+Ni60zZ7COG
        uIVg3vWV8JJEGah+SpwsjDuQuGqpJi9rYFWH2mXbjYxqXmMdww4PyMZripigomkq
        tFoeDDOSpQvEy3cyV0xpEgwBth5NPPDw7H+dBAdLr+xfjVGBBi+8zObD7g0CO/HX
        D5NPqNJRJO6j5if4t8kxIiGI4OXnBr68V8nULJpKGH2qSEj8teLjo+wwV4+23Q4J
        wxaRRxd1Sr0MlrCq0pOdA+eWEilHbK8Hz7/TCCSYd8q4zBYO3VEUGUmJWeJdMhql
        LeDDlH7KCe7dYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=R4Av/bV5lLfvxbCya7BJK+Ld7wNO0
        xoQgrCdynH0xe8=; b=tIc3VHyi7W8BCuyGGZn2TpTto7fX8uZHGoyP9kVlgykfr
        QMabM0jjV6LMRXbekGKoWh+o3XZOtvNFKAoATkIptRnME0vshIrs401pn0ov/bn8
        j8v9DW0Di5PMP4IaTKe34NiH6Pfdh6UH5wM8jveMxqaV4LLyYXlGSBlrI4nbFj1U
        FKzKwYwTx4kBbCOFNFoJy/IVNXmxw0/UUIF+jRGz/kRcVyBPnFcxy8agtBmixzks
        x42FNzh6zSIRIKQsGodxs7ZxQt4srgnqj/HFN7sRbrDMiFE/RnipEnXgKrd4CSD/
        tFdDg5b4QyFdqYJzSxdRpIhMW7EU2nLwA+s4wY2KQ==
X-ME-Sender: <xms:2tcVYZP5pFUIKm3ipfwHwiZ65Hb8FizW_-LJJleao_pbLa8PK0fJ4w>
    <xme:2tcVYb9x8oSHlw52qlGrY4oUioKE77Pke8O5lLlcOgsxnudTxMwG16IClMWL_gpeg
    7Bz7FMIpVsr3iyAUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeeggdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepgeejveetveetkeefgeetvdeihfekvd
    dvgfehtedvtdfhtdetieevvefhffdvvdeunecuffhomhgrihhnpehgihhthhhusgdrtgho
    mhdpohhpvghnsghmtgdrohhrghdpmhgvshhonhgsuhhilhgurdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
    ihgurdgruh
X-ME-Proxy: <xmx:2tcVYYRg4OIm2lj1WEN2XKMIjCeAAmfyaz0BN-PXDuX8CaeNmbIrGg>
    <xmx:2tcVYVsc0-ag-IhpfsJl7IP4erEA6nw9z57e4ZDZc_1MeaoL9nygMg>
    <xmx:2tcVYReZhD0-e-m37CIq62fTt0KargAGchWkDPf5bDCea0vXxHHBtQ>
    <xmx:2tcVYXp9RTkBhJ1801tHgEjxpDUfoltYAo_1YTkknD-2F38uKp1GvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 365D6AC0DD0; Thu, 12 Aug 2021 22:24:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1082-gccb13bca62-fm-ubox-20210811.001-gccb13bca
Mime-Version: 1.0
Message-Id: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
Date:   Fri, 13 Aug 2021 11:53:35 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     bartekgola@gmail.com, linux-gpio@vger.kernel.org
Subject: [libgpiod]: Meson wrap for libgpiod
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

I use libgpiod as part of supporting various platforms in 
OpenBMC[1][2], among other things. OpenBMC generally targets ARM SoCs, 
and this means cross-compiling applications and their dependencies as 
part of the day-to-day work.

While cross-compilation for (complex) userspace can be achieved using 
distro systems like buildroot and openembedded/bitbake or their SDKs, 
the meson build system[3] provides dependency resolution and (cross) 
builds as explicit features through subprojects[4] and the wrap package 
system[5]. In my experience, these features are compelling.

To help me develop userspace applications that depend on libgpiod I've 
opened a pull-request against meson's wrap database[6] to add libgpiod 
support for v1.6.3:

https://github.com/mesonbuild/wrapdb/pull/130

Meson overlays this reimplementation of the build system along side the 
source as shipped in the tag, enabling meson dependency management 
without any impact on the upstream project. However, as you might 
guess, the wrap implementation is non-trivial as it transliterates the 
autotools scripts. While maintenance of this approach doesn't require 
any work on your part, it does have to adapt as the autotools scripts 
change. As such:

How do you feel about switching from autotools to meson for the build 
system of libgpiod?

If this is something you're interested in we can rebase the work in the 
pull-request above on libgpiod master and have something that's mostly 
ready. If you're not interested, I can at least carry on maintaining 
the wrap, but I felt like it was worth asking the question :)

Interested in your thoughts!

Andrew

[1] https://www.openbmc.org/
[2] https://github.com/openbmc/openbmc/
[3] https://mesonbuild.com/
[4] https://mesonbuild.com/Subprojects.html
[5] https://mesonbuild.com/Wrap-dependency-system-manual.html
[6] https://mesonbuild.com/Wrapdb-projects.html
