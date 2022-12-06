Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56039644E55
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 23:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiLFWFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 17:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiLFWFW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 17:05:22 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0CE30567
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 14:05:19 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 5FAF23200A46;
        Tue,  6 Dec 2022 17:05:15 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 06 Dec 2022 17:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1670364314; x=1670450714; bh=IIla1X70vM
        amSN12yM4wlsylWzkH9XKvj2ukhKL+/DA=; b=Wx8NJBg5thsjurypra22a/goYo
        2stxA3vbsKrO/ZrprwZVWYQftPL/rf0Rh+s2IDSUbeByfz1RqSyeuHEgY35u+fYu
        or/O10mhBwNiht9lgizIqMHfMtiBGhFC+8wxfnHDk207irGzcOUMsJeczgxADoPU
        EuSjubsoqCmIA5I92HBe6ci1iekvMICbbosHAq0xv4Ad4/9h3Mnj2KRpEejMYz6r
        gI8JJ0o3F2unTjqo/F++tNpYNjoemdM7PZv4QV2CRovl+xecBg2JYOakbsIgBFFO
        xmIW/uM8y3jTdyWh0VcADQ21azCK38gtyxVSb3oCyebHg72tVlvLuUpqtTmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1670364314; x=1670450714; bh=IIla1X70vMamSN12yM4wlsylWzkH
        9XKvj2ukhKL+/DA=; b=ECuezOgpnnm8Z8B7lPM5oaKFJtI69Ra5TTAf2/xw+TDf
        2xVBpzzs7GKsTXGpbwooYeVaaFV2jo+fvasJzxbvSEQ/t37MWzos1Z0etc7tLUwq
        P3/qyz3MY8WZyfkovvR3l9IvaA/mnSWSyWEigKgdj0p4l3ofN4Fd5Ionpnsl8+2P
        knRgMNRcaPdhK6SIipvYRwJA0A0bZSHlbbAjQ9dIOreXKMQ71/LMs0aAknVMxaQE
        ZcqJYAmFNG4gWv7276WNqXGrJUGSq8PGmRMuu5s7eQR1QBTUIOim18d0JP58iBFR
        MHPT1WBEZpfLETpYzehONFmhFHIwKHLjS/3rkhKCGQ==
X-ME-Sender: <xms:mryPY79ErIe2I43BD_R5sucOcBIr0MVHzDu7XVzBj9CZFht3AiUP7g>
    <xme:mryPY3v7JtTzVPEtngtJGEtIJ7lFatIx_ANONhy2-bL5RANK7aFpiK-vWM2CfQCja
    UJmKvndrU75IaJWaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigdduheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedvtdegvdeklefgteevgfduiefgtdehtddttdfhiefggfefgeekkeev
    uedvkefhleenucffohhmrghinheptggtrggthhgvrdguvghvpdhmvghsohhnsghuihhlug
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:mryPY5DtTdFUrv1aN1NBVWzSEbD3t-_HkDPt50fESQUCetmqyyuyfg>
    <xmx:mryPY3fyQEdtCJGYgS-LsbYn96CN4U9tkCvTtj3QB1F8L-Qf5q4IRA>
    <xmx:mryPYwPrdaTAsZfQN-dl6qdmX0T7PdJMR7BtJ1gaik2KKGM0yFA3Zw>
    <xmx:mryPY1qeFilmXzs_uy-gi6NY5uvhg3KOEf8pXpvcFVRglHo7AOoFPw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6EDB61700089; Tue,  6 Dec 2022 17:05:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <7fc4db18-cebc-4894-b3d7-12c9470e6a93@app.fastmail.com>
In-Reply-To: <Y49Xi1WO1yPjvMYq@smile.fi.intel.com>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <Y49Xi1WO1yPjvMYq@smile.fi.intel.com>
Date:   Wed, 07 Dec 2022 08:34:20 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
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

Hi Andy,

On Wed, 7 Dec 2022, at 01:24, Andy Shevchenko wrote:
> On Mon, Dec 05, 2022 at 07:55:29PM +0100, Bartosz Golaszewski wrote:
>> On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> ...
>
>> > Meson defaults to using ninja as its backend, and automatically exploits
>> > ccache[2] when available to keep repeated builds speedy.
>
> ...which is a bad idea for a clean build.
>
>> It does show! Full rebuild with autotools:
>> 
>> real 0m43,902s
>> user 2m40,010s
>> sys 0m20,172s
>> 
>> Full rebuild with meson:
>> 
>> real 0m10,001s
>> user 1m1,334s
>> sys 0m12,205s
>> 
>> More than 4x faster now.
>
> And risk to have a badly formed binaries (yes, very little risk, but > 0).
>
>> > [2] https://ccache.dev/
>
> ccache has downside of its own use. If we have a common storage for ccache --
> the collision is just matter of time (yes, have seen that in real life).
>
> OTOH requiring per-project ccache storage makes a little sense for the end user
> as they quite likely won't rebuild it many times.

Valid points. However I think they're addressed by:

1. Not installing ccache on the system, or
2. Overriding the auto-detection behaviour of `meson setup ...` 

Regarding 2, you can specify the CC and CXX environment variables to force its hand:

```
$ command -v ccache
/usr/bin/ccache
$ CC=cc CXX=c++ meson setup -Dbindings=cxx build
The Meson build system
Version: 0.63.0
...
C compiler for the host machine: cc (gcc 12.2.0 "cc (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
...
C++ compiler for the host machine: c++ (gcc 12.2.0 "c++ (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
...
```

Compared to the default behaviour:

```
$ meson setup -Dbindings=cxx build
The Meson build system
Version: 0.63.0
...
C compiler for the host machine: ccache cc (gcc 12.2.0 "cc (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
...
C++ compiler for the host machine: ccache c++ (gcc 12.2.0 "c++ (Ubuntu 12.2.0-3ubuntu1) 12.2.0")
...
```

This use of the CC and CXX variables is covered in the documentation:

https://mesonbuild.com/Feature-autodetection.html#ccache

Andrew
