Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3174188E9
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 14:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhIZM6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 08:58:24 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60221 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231491AbhIZM6Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 26 Sep 2021 08:58:16 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id A7DC75C004B;
        Sun, 26 Sep 2021 08:56:39 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute1.internal (MEProxy); Sun, 26 Sep 2021 08:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=4cmz+HGRnlUTED73TQjp43nIKfod
        3+0YHf/pgNDd5ho=; b=fucdvjNjnNpGHbeCNijJX3gIQZVSUaBFyhl7TTQIKAVE
        piV392L/Rg+1/5vBr1au7g41WQ1cgEWiwMvoHLv3bJSZhSzieHQbnvCG6/KpnA5Q
        C0clbrnDbbCK4HMbktESr/vfiXSn5zMoxmiXerc9r34d8pXugnKbs9XeNtg57f3u
        2wrxtVePH/kqVMkznCKk8uPhvB7KCLw1heUTmO84UrcENQAbDUikiYVAx3lY7/0I
        PG7n41AmTPSKK6CDPQVeV+PvsVXsR1VXP+FrQus4IWAyeEkEhPEbzPEsP4wUMykb
        R9/s7fprg79DxzoYEkuWlpnFKG7x289T9gy+QzgpHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4cmz+H
        GRnlUTED73TQjp43nIKfod3+0YHf/pgNDd5ho=; b=wrbSPGiQFDUQY34d+vNBBn
        3P/Dj02C2q0Mg1Je4ON/9Qd89KEaiBdrHY5rY0RlhIXoHpM7QMZAhUxGWwgzjsgy
        eQ0zPe+hLCb6hjktd3mymvYR30C2tjLKoJZxbMycMYLZL9yRlt6wwghNGaSzhxIl
        CLzZeL6aOMkit0bJ99t86V6iRWLG7IkH40pNgxjIK3V0Q71bAFdnkd7hkbwAOyyi
        Xk9jHkEtwGa1iUhiUiIIvHvE8cxTYQvGQsEOhxbKwjjIWg/g6CdZ+WK4wwzKeLk0
        PmZ05vT89v8nhyc5TX0KvtpqYyjcQM242/miUA0w9i7yCqG91Kk9zpuMq6mLHjvQ
        ==
X-ME-Sender: <xms:Bm5QYVO_Zsisj6EoCccchcgAGQH6qrFXloYxfeSBDguFtEW7Umcklg>
    <xme:Bm5QYX8kHkYW_ms-nIvqJG8Bo-9EqUy4s4IPYXZpGTj5dP1jmju72C-A1RyTd6oBY
    A6BFeVezBqgv71dclE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:Bm5QYUT8E67OJW7_-o-MZx0odG6jbAvyrn0ualiTTefYLZuHypcGUw>
    <xmx:Bm5QYRvtut5PxLvby-lmYVTImzo5QQ3LccPeLyYMp57Z65CSO7dtgA>
    <xmx:Bm5QYdf6xAE9T6pONqkNsH4jtuG-B4DWQmSQkGIswawhiSoDtY02-Q>
    <xmx:B25QYXvM5SXJZ49UMIES_RBm9C3QDteEk600AaIDp1tw4aIUU1cBRA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C4E2E51C0060; Sun, 26 Sep 2021 08:56:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com>
In-Reply-To: <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
 <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com>
 <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
Date:   Sun, 26 Sep 2021 14:56:18 +0200
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc:     "Joey Gouly" <joey.gouly@arm.com>,
        "Andy Shevchenko" <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Hector Martin" <marcan@marcan.st>,
        "Marc Zyngier" <maz@kernel.org>,
        "Alyssa Rosenzweig" <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, "Stan Skowronek" <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:
> I think npins should be known from the compatible (we know that
> this version of the SoC has so and so many pins) and the base
> should always be 0? It's not like we have several pin controllers
> of this type in the SoC is it?

I've just checked: Looks like there are four different pin controllers of
this type with a different number of pins each in Apple's device tree for
the M1.


Best,


Sven
