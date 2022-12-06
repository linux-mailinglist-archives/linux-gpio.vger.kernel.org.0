Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C00643A85
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 02:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbiLFBI7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 20:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLFBI6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 20:08:58 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65B86567
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 17:08:56 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 976D05C02A7;
        Mon,  5 Dec 2022 20:08:53 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 05 Dec 2022 20:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1670288933; x=1670375333; bh=EHW6OtiUs8
        cewav3kCZ6RcPiNrYvlAymtFDDKq9qBYs=; b=qGLq7AdlyNWnGycadmb72e0W9P
        m4BzaEn9ROg/3SC2AvPsXfSPyNZFOcmvsxknNByOSGLB5kPXLRAZc49dk/BJCCGq
        1fVpTHySoV3tt1AiOvP9rWZAvHLmWv0PVVyc1meu9syzL/KrJ6secVTxgZyDbep4
        OSYgRM6OJmKfD0X6ChlWzHw0etTQJQNTFrl4nrlkFDhL810W76vl+7fJPFhVzGTk
        mdByRzTSw7Wp3SbbYZFeRKKUn23xJWiMElIooeqa384CD7cel0CKyGDhf6oKrXbo
        YtJELQdnwj+KHXk8OiTd/fLn6S1ElLK9LuHcMprYHdZBCEEt28gSVNi9mEyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1670288933; x=1670375333; bh=EHW6OtiUs8cewav3kCZ6RcPiNrYv
        lAymtFDDKq9qBYs=; b=e9WQo0NlyrqWEWft8uuamuhmThUpOdQd2Nij6QzBozpy
        GdLkRv7OXimf3e3h9s9kXMjX06dCeZlGWnIAnHD/qutKt6V6X7EzDualcJjK3x7U
        SWgE+hNWJV93prjbb9AzCcWmzBKoTCqTbUyFFRYacsb0+eH4Vz7F1ohc+a3LpysW
        ZTx7hD/9b3swXZ+j8mfoU08KYizIIc3Xqf0WfjzkO0TH/UkcxESZJsD/LinH0h5c
        n2qcPqbAae7G4AfdKC0kwpBBhIbg1BIaT8fl1skbr4TkY3GKqLglaq8Mgv+ZqFi6
        /ClU+oI8pgWk9BdX9jpMZY8EVmqdW/k5PfLov8jIcg==
X-ME-Sender: <xms:JZaOY9PwXDgQJa_TxQYhffwIQd_fhMdBOhh3oMQuoiVwf_xnRAHSlw>
    <xme:JZaOY_83asTvGFQXj3xoJnNs7yBUIeHqBslHeJo59BIORXkTrQMG3gL8DOL2V-9LF
    -tGLroPfEUagmsChg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
    fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedvvedvieeuteehiefftdfhje
    evvdetffevgffhhfeuudffhedvkeefveeiueejleenucffohhmrghinhepkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JZaOY8RJ_ce2UTv6ZsqeN7gIBK5-RyK2Km51lVuOaZ9oFT8DjHXaZA>
    <xmx:JZaOY5vssfSxvLYGviu_mqwzuwRYIGRJ5bIbOYlBq2aesVCnVFnoZA>
    <xmx:JZaOY1fEfM8Nqq1KN1Jf2dxHZLdxI22gtk_b9CAOdlMQesWBHlqLuQ>
    <xmx:JZaOY1lbGKY9TfiFLNj0KDV8RYuCgqeknrqZ5YonILVfKsDJMG9MZg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5011C1700089; Mon,  5 Dec 2022 20:08:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <6e1e9744-d28e-4125-aec3-3cc243f14701@app.fastmail.com>
In-Reply-To: <CAMRc=McBhSi824Z3WT82SygLkfqP4jAbR7mzi131aQ5-A6GFQg@mail.gmail.com>
References: <cc4926af-95bb-4178-a760-d55821dfb626@www.fastmail.com>
 <CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com>
 <6e539372-b898-4732-b924-15993e52b4d9@app.fastmail.com>
 <49112892-07e4-4c1a-8ee6-d112cc9fb65f@app.fastmail.com>
 <CAMRc=McBhSi824Z3WT82SygLkfqP4jAbR7mzi131aQ5-A6GFQg@mail.gmail.com>
Date:   Tue, 06 Dec 2022 11:38:32 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bartekgola@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod]: Meson wrap for libgpiod
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



On Tue, 6 Dec 2022, at 00:47, Bartosz Golaszewski wrote:
> On Mon, Dec 5, 2022 at 2:27 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hi Bartosz,
>>
>> On Fri, 25 Nov 2022, at 14:12, Andrew Jeffery wrote:
>> > Hi!
>> >
>> > On Fri, 25 Nov 2022, at 06:54, Bartosz Golaszewski wrote:
>> >> Hey Andrew!
>> >>
>> >> The libgpiod project has undergone significant changes recently. A new
>> >> major release (v2) is getting closer and I'm thinking that it may be
>> >> the right moment to rethink updating the build system. Would you be
>> >> willing to take a look at the current master branch and see if you can
>> >> swap our current autotools in favor of meson while keeping all the
>> >> current switches in place (translated to meson of course)?
>> >>
>> >> I would be willing to accept meson into the master branch as the main
>> >> and only build system for libgpiod.
>> >
>> > Awesome, let me look into it. I'll let you know whether I can get
>> > something together quickly.
>> >
>>
>> I've put together a WIP series (though perhaps RFC was a better
>> description?):
>>
>> https://lore.kernel.org/all/20221205132207.94775-1-andrew@aj.id.au/
>>
>> Andrew
>
> Thank you! I will take a look shortly. Just for the future: Cc me
> directly on the patches you send (brgl@bgdev.pl), otherwise I may miss
> them in my inbox.

Yep, I meant to Cc Viresh as well but overlooked that in the process of
preparing the series :(

Andrew
