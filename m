Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA656646838
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 05:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiLHEYC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 23:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiLHEYA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 23:24:00 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3D393A63
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 20:23:58 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 2A9E3320029B;
        Wed,  7 Dec 2022 23:23:56 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 07 Dec 2022 23:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1670473435; x=1670559835; bh=1c+KrosXuy
        hj3qaGH/mWO85O0L3m6FjaEWv9Bu9EedE=; b=RTtfyYrTf2xqV5wJk1vzBYOUAk
        pVs6YOMpAW3ZmCxrST6GzqxKShUsDZ1Lp5G2R9CaeEhx7zUX7ycxn8WLpFRwPSaH
        V2pHPnFNdP1nHaKDMYCJ4+o24x7ITQyQHKUFr+v+foTAHWlHZr/xpU96qXPi4sDT
        bthv2I/mgfI1HERcLL1wGYuixpu249BFcZN4eNsPZPMU5QBX9aZjrvuMFXLj/LlB
        MZgIwUjQR2c2lrZZvmux+WxfMGPb3fFclxi2JeKFisThW0nWlz9L3lcgnHW9qmJ5
        OPBGDldhnN12mTH8QmTe6v0A4Z1gEWbwt26/zmKgmC++LaBl2jJ276M5BH+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1670473435; x=1670559835; bh=1c+KrosXuyhj3qaGH/mWO85O0L3m
        6FjaEWv9Bu9EedE=; b=JA1aagyFRXA44/7cYOITG6kt2YyXThopH+qMFxC5Xllg
        YQt5Q8aAroMIy+gEKnQooiDQ723NpGYZe5rqESSoKfQU5Dx4MK52nE/6lK0eRM9E
        kgTfav5jHigiLHtt8EdxnIIgcpQFY86/yojqLmqGBJYkABVLG6tqtitnydI2B160
        AQl8PU2lk6PrHEwQqjQ9WbE4Jy08mYA4zRjMjhjiFkGfltuL+/tXKAckm40UGO1P
        OB6vsCKwm47LxP5l8qP33HWT7ahL29b7SvM9cm1J0Z4q5RqwuLT+af6tsxUqsfYm
        lbZjJkXh9exMkWhKmXKXhr21QyZo0lB4otZjTVJMdA==
X-ME-Sender: <xms:2maRYzJldc3mTWjxFn-GUbLa_vEWqJwCz6W_DiPWPJ7nQH45n8c27A>
    <xme:2maRY3Ie9eFwrCRNWFB5ki4QGsS7A7uz9mf3OiSCz1u5Q1-zJrDc6B348OHay3G2y
    vg915950vM03_RWYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepvdevvdeiueetheeiffdthfejvedvteffvefghffhueduffehvdekfeev
    ieeujeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2maRY7u6MFNGWjvf7SqmCFU65S4VtJ1URIBiaknr1Glh8Ck9GDtvsA>
    <xmx:2maRY8bvysZzGdtFK1_3gbuSbs5my7pMKuGu9vZhvMTe4n5qMPHV-w>
    <xmx:2maRY6a_n_JE4Zzl5CWTW83cjvhlDNn-PMzvlFA_4hoUk5ar8yusWQ>
    <xmx:22aRY6H_-_dCt68LY1EHfWWPQs5G2pbnb9gMKasEft8Cg_1X5Y-EUA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D70141700090; Wed,  7 Dec 2022 23:23:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <01a47fff-c21d-4309-a7a2-fa7a87f4e024@app.fastmail.com>
In-Reply-To: <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
Date:   Thu, 08 Dec 2022 14:53:32 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 6 Dec 2022, at 05:25, Bartosz Golaszewski wrote:
> On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hello,
>>
>> Based on a recent poke [1] and in-between meetings I've put together a
>> WIP series that converts libgpiod's build from autotools to meson. As
>> far as I'm aware the meson build supports all the significant options to
>> enable or disable features exposed by the autotools build:
>>
>> * Tests
>> * Tools
>>   * Interactive gpioset
>> * Bindings
>>   * C++
>>   * Python
>>   * Rust
>> * Documentation
>>   * Manpages
>>   * Doxygen
>>
>> [1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/
>>
>> Meson has pretty good support for handling python and so the patch does
>> away with setup.py entirely.
>
> Eek! No, please do keep setup.py. Autotools too is capable of building
> python C extensions on its own and it's what we use in v1 but I want
> the python code to be built the standard python way. I actually plan
> to post libgpiod v2 on pypi and split out building python bindings
> into a separate bitbake recipe in meta-openembedded using the
> setuptools3 class.
>
> So let's keep setup.py and just call it from meson.

I've poked at this for a little while and it's not a great experience.
Meson's design pushes back against calling out in this way, and I don't
really have the motivation to carry on fighting it to make it do what
you request. Unless someone else has that motivation, I think there are
two options if meson is still desired:

1. Use the meson python support as posted in this series
2. Split out the python (and probably rust) bindings, keeping the
   dependency relationships pointing in one direction and using the
   language's own package management tooling.

Given there's nothing to do in the install phase for rust we don't have
as big of an issue there, but it is problematic for python.

Let me know which way you want to go, including if you want to abandon
meson :)

Andrew
