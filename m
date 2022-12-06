Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8286439EF
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 01:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiLFA1e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 19:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiLFA1d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 19:27:33 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F47CC
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 16:27:32 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id A0E635C020E;
        Mon,  5 Dec 2022 19:27:31 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 05 Dec 2022 19:27:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1670286451; x=1670372851; bh=9elvlFBfNH
        bL0nwSHRhs490CW4rYJe+qzpl97jgt3ho=; b=VTSZXSIiXIF2r01l/xeUeCKDin
        odpdgNOLoheQEKul61DcNL1EPmiL0AEiycOPSbXIIhdQ339rduJU5243rY1O+TlB
        /UgDDRjoIeuqBeqNL/0Lvzjp6zzKrALE04LOBFWsd7/3q/SkBkxBJuq7sKkgYFPs
        LAlP9IGuiDSvPeEv0Rw6+8aWH5Fr3RCYL/hRpP4GldY76z1+bv6glxNSEpNTQUSI
        nxQ2zeeb18x05igHz24UuyrLKje3feBxekjFY8pIoQ9kmGwZ0FkQ9S9WoeaxTofE
        /0anhBfBNsaxfdfSZ0gAt+6r8Oos4vPXvPFoqfZwtiPH6+Xb9GfCdVwgvVkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1670286451; x=1670372851; bh=9elvlFBfNHbL0nwSHRhs490CW4rY
        Je+qzpl97jgt3ho=; b=U3z2o9Im7E8va+fZFMlbqyH2SG1SZeUvqB8S9klCG7on
        ZKAp+jU5MjPqlqGxykC37eYxjjeLQEtgZMBsufDuaiV7b+gbgQ5l1EIswOybIsd2
        qry5qLivAwDRjgz65N7tY2lQK+1kCXT6PKDVNXG11hlDNmtB0432II3WoRP5G3vt
        Ok2QgkSd35lBVGJ5tyRPuu09EefES40pArdBWzzpHncsMLIzIgH1Dql25EJxPVBv
        A+CC44GhzImHZx5ssgM3FHrG+T9r2aCS/0wFgMarMW/ISXwU6wlAO9Sp9fBITZ0g
        zAELPE2tNLx5ewQPQ0gfxsREjnvVFh5SRlD0mmpvuQ==
X-ME-Sender: <xms:c4yOY7aS3Co-MTyu3Z9wPujH0TP2hZXeOvjrq3Nop2Pe9nEI50D9qA>
    <xme:c4yOY6YXeMe0qcP0IIf-iXRJnv-mYGCnntIGXCvPss7AWwgc_nvEM9j84H8gCskRL
    ULqijgGmAD9T2Owdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfehveef
    teekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:c4yOY9-NyYu_ZcQB28G3JwbWdX5vbBtdE_FAijKPb8MSEfKORU1uKQ>
    <xmx:c4yOYxouvwpPpTFco1L4d1joV0XM4hSjLRylyaw28G-vBpeG09AjYw>
    <xmx:c4yOY2rBDZ_UT2cJUoUn9LB2PJ3uzACDMxPj9IeBFB3nR4rWIsUsdw>
    <xmx:c4yOYzBkVCOJuNuHbH_M8zNV_TMr0kVrAvVcYkfop6cfZ4iNgcUiKg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 65D201700089; Mon,  5 Dec 2022 19:27:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <72c1c5ef-8cc4-4ff7-9048-c9095e930e83@app.fastmail.com>
In-Reply-To: <20221206000648.tyc57i4b6jwyb4y2@vireshk-i7>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <20221206000648.tyc57i4b6jwyb4y2@vireshk-i7>
Date:   Tue, 06 Dec 2022 10:56:57 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     "Kent Gibson" <warthog618@gmail.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
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



On Tue, 6 Dec 2022, at 10:36, Viresh Kumar wrote:
> + Miguel/Bjorn.
>
> On 05-12-22, 19:55, Bartosz Golaszewski wrote:
>> On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>> > However, the rust case isn't quite so
>> > simple. In order to handle the dependencies of the rust bindings I've
>> > called out to cargo through a custom target. It's not great, but from
>> > what I could see it seems to be the path of least resistance given
>> > meson's support for rust.
>> >
>> > There's no support for installing the rust bindings through meson, but
>> > this is not worse than the support we appeared to have under autotools.
>> >
>> 
>> I think Viresh too wants to keep cargo as the building agent for the rust code.
>
> I am not the best guy to ask around Rust tooling in general and
> probably Kent / Miguel can help here.
>
> Sorry for the stupid question, but what does "installing the rust
> bindings" mean here ?

There's probably no useful meaning given what you've said below :)

> FWIW, for me the only thing that matters is that
> we are able to build the rust bindings, along with Make, and run tests
> somehow to make sure nothing broke. Since this is a library crate, the
> user crate will mark its dependency and do the build itself too.

My experience with rust is (unfortunately) superficial; the meson
conversion achieves the same outcome as the autotools integration (runs
`cargo build ...`). If that's enough then I don't think there are any
further issues.

Andrew
