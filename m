Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788606AD8D4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 09:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjCGILF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 03:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjCGIKj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 03:10:39 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9092693853;
        Tue,  7 Mar 2023 00:10:12 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 29BA65C0561;
        Tue,  7 Mar 2023 03:09:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 07 Mar 2023 03:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1678176573; x=1678262973; bh=b5YPtPzr228O6J773nicUMGrLRtP9amT0AK
        OdzfEeJ8=; b=ditGi1i2seqv/e/ys32x2lck3gEVfFg9zXhB3cGT2OGlpGy+M3E
        qbTeu2Hg4yhylR5Up7VYgjy13qx9Y997C5VDI7OkSDpskCwWsKhYxjnPXV/vzOb/
        qt8YjOS5mfYPmV4BRNX4CTIg1bhj3iFCRGzPgElvQGPu7T3LNZq0Q56Zy4xGkfLL
        kP+pI0eKldRqZe9CgA9kSVuvuubTkki02oPMtbBClqgWjW1AucOosTp+uJ0Mqnas
        bX35kZzRdI7OVu/Z+luskdZEp27hoBbTx5Pzlc3Zs67GdxRCx/fMZjEGRwdYQ6Bg
        ZGRTgZWOF7VC+M6+ivJ+vdZZaS/KuARo5Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1678176573; x=1678262973; bh=b5YPtPzr228O6J773nicUMGrLRtP9amT0AK
        OdzfEeJ8=; b=KvjNMVtIqyRNrFwlu90goWsC+DSDYmVfPkz9QjZ8FzDVvY0iG/B
        183c3btvlgNaaNjZ59LGXeYKw2adyqUmOrVIO6jvsCK89Quy2E3fvi7NUFnEx++6
        JAQXpGjUkQ61C8/S/bqEaM0tjolNC30M0SO8F3DlkDBJKNzJYQwZu8vGy/4qYcN8
        uf/Xzi8WSLEu+va0HQxmlxWmxbr8CXbXvVGxyGNMMYSFirN5knBsWzflBElsjHfq
        5KmyANJySImTiXTVjABNqUEGg3pr5LzDWR0xvU81NZm6rO637Rg99galf6Reix3H
        vtwMRl9SQ35UEJH3XqCis4GTJw1PDEQHrhA==
X-ME-Sender: <xms:PPEGZOSZoXgCyQw1tDxXH_uyHBOp1Iwt1XHGgP67tHClUK87UaB-Kw>
    <xme:PPEGZDx6N2uiU7eFX4X1k6dqh6mMuiy621Fw3c337uFXc2BFTyktryaI5c2MHTG-n
    W4ilZLitLThBfLjDVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtledgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:PPEGZL1LIS2YfdVESnz6_q4bBk0cKv1Fg4FBjak4Fg1xLvR384tDDA>
    <xmx:PPEGZKB5WB5AFeZOcadCvV-JrGKxW7o7PyBd4LLAhmEV9QbpHSttAQ>
    <xmx:PPEGZHhNtYSDy9d1GouYo72_1YbLzsMDdeqNPc00CmlTvhllhIJEzQ>
    <xmx:PfEGZNa4WEbWLL-2S1xAvEuMmTJFAKWlC5t8PzC4oUzJuoQ-88aIzA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6A7BFB60086; Tue,  7 Mar 2023 03:09:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <e4cdd1f9-fc79-4f91-a4df-ab5f5a94faa3@app.fastmail.com>
In-Reply-To: <ZAZqy+LFkZuj+T4P@surfacebook>
References: <ZAYCRPsKR8Je6LOW@black.fi.intel.com>
 <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
 <ZAZqy+LFkZuj+T4P@surfacebook>
Date:   Tue, 07 Mar 2023 09:09:11 +0100
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.3-1
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 6, 2023, at 23:35, andy.shevchenko@gmail.com wrote:
> Mon, Mar 06, 2023 at 10:50:40PM +0100, Linus Walleij kirjoitti:
>> On Mon, Mar 6, 2023 at 4:14=E2=80=AFPM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>=20
>> > Hi Linux GPIO maintainers et al.,
>> >
>> > Combined series to clean up headers in the GPIO library and drivers.
>> > Along with it, drop a few unused legacy APIs.
>> >
>> > This tag is immutable, enjoy!
>>=20
>> Thanks for coordinating and getting this sorted and tested Andy, perf=
ect
>> job as always!
>
> You're welcome!
>
>> > intel-gpio for v6.3-1
>>=20
>> But I think you mean it for v6.4?
>
> Well, techically speaking it didn't make v6.3-rc1 due to cross-depende=
ncies.
> Starting from it it may be applied to v6.3 or to v6.4.
>
> Up to you and Bart, but I prefer not to rebrand the tag, if it's an op=
tion.

I think it was clear that this would not make it into 6.3 after
the decision to rebase on top of 6.3-rc1. However, the tag name
and description both look like they make sense for 6.4 the way
you wrote them.

    Arnd
