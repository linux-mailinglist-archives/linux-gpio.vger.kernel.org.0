Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5E135B74F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 01:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbhDKXBG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 19:01:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:57591 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235005AbhDKXBG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Apr 2021 19:01:06 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id DA4BF5805EB;
        Sun, 11 Apr 2021 19:00:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Sun, 11 Apr 2021 19:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=Cl5NDlR0eeNq1SIA3lbTrquui0su7ag
        E6SsdembMtS4=; b=TKxu0qg/SVMSv+IYdXTiOo+qpAMUYm+Dm4UiikfWnljE/mq
        NQirbvtS1O/rdZu1HTq9VlDnwFhWVmH8mJZsAnf8+7A+67wN7/8raDjnazjlSU3C
        j4b1amfhJI+u1R35/pvrfy6h26bkdO52WzVmaEBWMcSGL1vyYhtCRdV275NJ/mk8
        0WyQjt3K5HREsoQVAmMPzbNGiNs5TABejz5zQ+oGL7TR+ZwdWiU/8jYv89BvCDcB
        XY6P6EAveASQjePYByqH5XtPnR4RBbDgWyDiMEeglFzrnmNrkzPPniXIVvFYQYOq
        J5KfV3CkCRN6HSrPtfHMUMoJPd0ZDjrOpE+wLug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Cl5NDl
        R0eeNq1SIA3lbTrquui0su7agE6SsdembMtS4=; b=UqqsQIcvyOSld3IRE4fX8+
        QWA8hvNqU/+sYi0hAJX/R48JJTN42fcVSMRRNfpCWZo4zXLvXEaEA9iGbEFfJPlD
        SHjWNay/Regm5lXulwsDlGJZZhV6raX7LMZVN/+VuIHYltBNvCQfWDvYzsAKNB/C
        yV+Ne+yLR1HNSIm1/RzmjjrCZ6knDTmLut25+StM6U59PlRlVLVN9/odRV1FOeDy
        n/WLZSydttQ8HYHCHA8GxPChQ8sIpOc4rYxbwM4CxaF4/CeT706eKxsjhSXLpDsY
        I8aXHE7v6suL7n+p1EKicsSZvK6YGhFkxHlY0Z8/1u1mLV5S0my4lKueLqm5Gvzg
        ==
X-ME-Sender: <xms:n39zYKrfPbMkBxTjpuO2jpdk5dXjY4Ezrgq8rz4b6Ru9ZzcyR2HISg>
    <xme:n39zYIoT-cxhvHeWZVu4b2PG9jwnSSG1AtumJ7Rxp3RDPm8txyTBjQDZBtRiGNaKN
    KkOv1UhsrWeNHDxcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:n39zYPOlM7TtBe1B1ORtRfcGQx4bmkllO969YWoFj3qlkYuDXxOuAA>
    <xmx:n39zYJ5m_Ruvqiyvw7wbUqUA2X1w8T1r55AfzmNule8F21VrYtWDCA>
    <xmx:n39zYJ5pAm9b8Kx6n_rgCcjlcDFVgIW0SiAwBwmOqsE9hOUUogqlqw>
    <xmx:oH9zYNonsx8RlM1NjKCPvWf_GJSTVUshI0Ut5ZWY4KyoBMlEUXX0Sw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A49C1A00079; Sun, 11 Apr 2021 19:00:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <e99e2e45-7810-4a24-a519-5204acee04ea@www.fastmail.com>
In-Reply-To: <YHCqR8/nZFB1HRgX@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-10-andrew@aj.id.au> <YG/Ql9z9X/mtOSvl@packtop>
 <ea34ee69-a266-4737-8450-4695d2d0fbd4@www.fastmail.com>
 <YG/zVv4XOo1HoLd1@packtop> <YHCqR8/nZFB1HRgX@packtop>
Date:   Mon, 12 Apr 2021 08:30:26 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Zev Weiss" <zweiss@equinix.com>
Cc:     "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "Corey Minyard" <minyard@acm.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Patrick Venture" <venture@google.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Tali Perry" <tali.perry1@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "Benjamin Fair" <benjaminfair@google.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_10/21]_ipmi:_kcs=5Fbmc:_Turn_the_driver_data-str?=
 =?UTF-8?Q?uctures_inside-out?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Sat, 10 Apr 2021, at 04:56, Zev Weiss wrote:
> On Fri, Apr 09, 2021 at 01:25:26AM CDT, Zev Weiss wrote:
> >On Fri, Apr 09, 2021 at 12:59:09AM CDT, Andrew Jeffery wrote:
> >>On Fri, 9 Apr 2021, at 13:27, Zev Weiss wrote:
> >>>On Fri, Mar 19, 2021 at 01:27:41AM CDT, Andrew Jeffery wrote:
> >>>>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
> >>>>-struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel)
> >>>>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
> >>>
> >>>Errant declaration again?
> >>
> >>As previously explained.
> >>
> >
> >This one seems like a slightly different category, because...
> >
> >>>
> >>>>+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
> >
> >...it's immediately followed by the definition of the very same function
> >that it just declared, so I can't see how its presence or absence could
> >make any functional difference to anything.  (So perhaps I should have
> >said "redundant" instead of "errant...again".)

This is is a small hack to fend off warnings from -Wmissing-declarations.

> >
> >It's fairly trivial of course given that it's gone by the end of the
> >series, but as long as there's going to be another iteration anyway it
> >seems like we might as well tidy it up?
> >
> 
> Oh, and otherwise:
> 
> Reviewed-by: Zev Weiss <zweiss@equinix.com>

Thanks.

Andrew
