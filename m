Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4C06439A9
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 00:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiLEXnT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 18:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbiLEXnS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 18:43:18 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D454B167F4
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 15:43:14 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id AEFF05C0284;
        Mon,  5 Dec 2022 18:43:11 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 05 Dec 2022 18:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1670283791; x=1670370191; bh=hQ3zzu9l9j
        YbUHVuSzVtJy9yQqoOfpfrv4OtCyRPW8s=; b=duWYik8Lr94XNYgNQnClQtBKC9
        yaWx6ca/75TfhrI4SU5+Jve0a7qlOA1iwgkpdg1kCG5pLhqtF9fduDeU3VcZpWgE
        tqHT9cLga79v6imimDgNwsOrgq1Acld6+ZvehJ+iv/nWIkMvROqD96HVe2eQV4wH
        RL6deGb7vTxlPa+RYqLZqSP/reujrVwIdl+10t8litVJxVGriUeeRG0ROkHLTkBl
        5nGPALKqZaOJvi7JDA1H8O69RpSbCqvvPMz8ATKpvMujTd6gBFnUOht5j0tvFlKE
        Rx2wFycuu2RCp5QvYvEFQ2OwuJYm/OJxA1YWi+nM21B/qAwIzza8zMJi7hww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1670283791; x=1670370191; bh=hQ3zzu9l9jYbUHVuSzVtJy9yQqoO
        fpfrv4OtCyRPW8s=; b=iyUfQZyegYKOpv/2OzXZraB5GcYoiDV5lbnTXCNR6BeV
        +V/sAYKo4l2j/qQipSsbM4w7q5pPp02kbfvqlX1hpaH+MNrjf93zkwaxNA4XLeCF
        Zn/LRZx4+953N6qeT3PJQcplYyhAVBksmhhT0nXi7B5upNoIuWK/rV4qTSovwRsE
        7SFmbtpJ4bnkoXKdXY+QCD22vcPj+4DyFUXH+HP+3vILZWtlR0rvW0LWY7aONUE5
        a2FRLXyjyh7cVdQh4/LmiIWUX9QaMDB7Mvak9OuQ+wYcR8u3H+mRQVIgFIceTzhi
        cYK9IERP1uGi+JA2/m6o9UV3VYkuI0+16AplJroIRg==
X-ME-Sender: <xms:D4KOYwxfsfnCtb_El727wrxtPECew2HFFY6V72XSMY-TB_AqsSMGsA>
    <xme:D4KOY0Rc8PoFh9Rr9eJuDsk4ASOTqJsZp849nYOa4Wt--Cs5VYydZMr7Qe8CKS43f
    wlPB838YlWhcZyF3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepvdevvdeiueetheeiffdthfejvedvteffvefghffhueduffehvdekfeev
    ieeujeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:D4KOYyW5TMnvZBDg3j3Pk3t34WttHUNpFWyIcXbPPxGipDVr-eib9Q>
    <xmx:D4KOY-h-Aa1XyavDUysodarcxlby2AHwoGrGFrEvF8zvXxvMl6QkLw>
    <xmx:D4KOYyA9y2tJXTyI-KP6doboFZYXm0N-fLn_C9_DzIqwIAJeqADbdw>
    <xmx:D4KOY9N0PVjn6JNHgIMXBaJHchaQy0LxVotSCink11A77dGxS5P20Q>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 154D31700089; Mon,  5 Dec 2022 18:43:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <192b4b5c-22f7-4859-b3c2-165eca677328@app.fastmail.com>
In-Reply-To: <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
Date:   Tue, 06 Dec 2022 10:12:49 +1030
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

Okay. As I was working my way thought I did wonder whether it might be 
better to split out the bindings where they have their own build 
systems (python, rust) so the relationships go one direction. Currently 
we have the library build system referring to the bindings referring to 
the library which seems like a kinda awful sandwich. This is evident in 
the build.rs files for the rust libraries.

>
>> However, the rust case isn't quite so
>> simple. In order to handle the dependencies of the rust bindings I've
>> called out to cargo through a custom target. It's not great, but from
>> what I could see it seems to be the path of least resistance given
>> meson's support for rust.
>>
>> There's no support for installing the rust bindings through meson, but
>> this is not worse than the support we appeared to have under autotools.
>>
>
> I think Viresh too wants to keep cargo as the building agent for the rust code.

Right; I think this is the only sensible approach given current rust 
support in meson.

>
>> It's worth noting that you'll probably want to disable the rust bindings
>> if you need to run the install phase for libgpiod under e.g. sudo but
>> have used rustup to install cargo for your unpriviledged user.
>>
>
> Current autotools setup doesn't install rust bindings at all, can we
> keep it this way?

It is that way in what I've posted, but `meson install` re-runs part of the
build phase which is what causes complications in this specific scenario. If
you can run cargo as root then it shouldn't interfere (... setting aside
potential issues running cargo as root). I didn't figure out whether I could
*avoid* re-building the custom target in the install phase.

>>
>> We end up with a net reduction of 254 LOC for the build system, and,
>> IMO, a single and fairly readable language to express it. Along with
>> that comes easy integration as a dependency in other (meson) projects
>> and a straight-forward path for their cross-compilation.
>>
>> Let me know what you think.
>
> Meson has a steep learning curve but I really want to move over to it
> now and will put in the time to learn it. Thanks for doing it. The
> patches are functional from what I tested so far.

Great!

>
> One thing I'd love to see changed is: put all API and ABI version
> number next to each other in a single place so that there's less risk
> of forgetting to update one of them when making a release. Is that
> possible?

Absolutely. In the spirit of keeping things that are together together 
I distributed them into the meson.build file containing the 
specification of the associated library target. But we can just move 
those variables into the root meson.build file without any problems.

Andrew
