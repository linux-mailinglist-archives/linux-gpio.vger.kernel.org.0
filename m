Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 894FA4BBF89
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Feb 2022 19:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233264AbiBRSds (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 13:33:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239209AbiBRSdp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 13:33:45 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCF010AEEE
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:33:28 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id i11so15286117eda.9
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xf+EfQHrOFctXGZckTQ/b9goCl/xI9MpuCym/Y22HYg=;
        b=oZoDH5dLfyNhcT/59+IXQt3gyYRSrdwnA5giR4lKbPD/FBp+WbpGpqASzIzxUdJSV3
         RACg+yUT2RDYL8rV9ueOX/DPdJ5XF5mAqiqYqURo8pr+yNLmeOXieoF4Gujnna58b470
         GbZ0PepvTEHXU4fehTSXu0lD2mMoXuYEIhc+VtPdyt9i5oBfh/Pptc4tCwaG796N9tGL
         b0FsbDUoUw5shtiacx4eURZYOBPv/sB5k75pIzOrgjTsAz87tcc9sT6YrxAyifaMpn8m
         W1wIqdNkuEmSNNNAJOM40AZ3IX6IfD0qwCCDMmbzmm84gyhkokYYD38OtDqsAkuuMijq
         04Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xf+EfQHrOFctXGZckTQ/b9goCl/xI9MpuCym/Y22HYg=;
        b=F75Kcq05+pGBAoQ5Jkzu9h4pguQngqrvCrdwCYnWft7Y5bTDQxPsUhLtoeEdUAm4zD
         kc5jpby5rrhufNYySCsiXaRl/vWayZ2UwpHNlz340EsAR0eG/it9POh/ZiGeY6M91+i7
         sBYbn/p2+rFMBi0HT4AEgrqTiVi3/xmZ5QjtJvKyxJjGgwvkm7Hx9xa497TxtbGtLgkw
         KbxAZSKBBELn4JTKmXzaA3bp0+S5m+1PL0ZNlIwvz4IxTINb/g48aaQuTlKTu1hXvtzs
         J7OHNOoMg0UyXx/3fAJbCQ8tZqPOtAdKFYwEC4zcPBXwFoGwRGykuVM0klO2tvYngGyt
         BIVg==
X-Gm-Message-State: AOAM532yvbSC4QaQXhFJhZI/w+dfEAajkKbGF6mRernDZ1JOr+zDefHP
        UME/myEbYHFyk2wy/rqv+CpcZiyf2ICCyhJPJ5uE6A==
X-Google-Smtp-Source: ABdhPJziWOcPSgcxAcKIa6GFOC8Fz5ZaeLkYj3EIZncR65e2/qEsBEMbvfRJvLmQtwviIxHq12ctqzD+6ak7hJ9tv6g=
X-Received: by 2002:a05:6402:4c6:b0:410:b8e5:334 with SMTP id
 n6-20020a05640204c600b00410b8e50334mr9438596edw.321.1645209207130; Fri, 18
 Feb 2022 10:33:27 -0800 (PST)
MIME-Version: 1.0
References: <17c74834c56e4345ac2611b92c301e2f@eckelmann.de> <20220215041124.GA15474@sol>
In-Reply-To: <20220215041124.GA15474@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Feb 2022 19:33:16 +0100
Message-ID: <CAMRc=Mfg-h-QP=Dm7gTXfpTnitUZdyCyybp2mNuyhiUoyiWRjg@mail.gmail.com>
Subject: Re: [libgpiod 1.6.3] Do different lines have to be in the same scope?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "Hummrich, Tobias" <T.Hummrich@eckelmann.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 5:11 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Feb 14, 2022 at 02:01:29PM +0000, Hummrich, Tobias wrote:
> > Hi,
> >
> > last week I ported part of our gpio related code from sysfs to libgpiod=
. I use the C++ bindings. I had some problems polling two different lines o=
n different gpio chips and finally realized that all was OK if both lines w=
ere defined in the same scope. Out of curiosity I'm asking: Is that really =
the case in version 1.6.3 and was this intended?
> >
>
> No.  I'm guessing you are doing something wrong, but I'd have to see
> real code to be sure.  Code > 1000 words.
>
> As the lines are on different chips they need to be requested
> separately, they can't be combinied into a bulk request, but that is the
> only restriction.
>
> > The problem was this: When I declared lines locally in a method and cal=
led this method to get the file descriptor, the file descriptor was the sam=
e for both lines. Like:
> >
> > int MyClass::getFiledescriptor(const std::string &linename)
> > {
> >     auto currentLine =3D gpiod::find_line(linename);
> >     return currentLine.event_get_fd();
> > }
> >
> > ... returned 23 for both parameters "in1" and "in2" while gpioinfo told=
 me that these names where unique.
>
> I'm very surprised this works for you.  Note that find_line() and
> get_line() methods return an unrequested line object.  You need to
> request the line from the kernel using request() before calling
> event_get_fd() - and that should throw if you haven't, which makes
> me think your actual code is different or something very weird is
> going on here.
>
> Have a look at the gpiogetcxx and gpiomoncxx examples to see how a
> line is requested.
>
> What does gpioinfo show for those lines?
> Why do you need the fd, anyway?  Are you confusing it with the offset?
> And why poll when you can get edge events?
>
> Bart - the need to request lines is frequently misunderstood - Gasai Mapl=
e
> had a similar problem, thinking get_line() and set_direction_output()
> would be sufficient to set the line output value.
> Consider updating the documentation to highlight which methods require
> that the line is requested before they are usable - even if they do
> return an error or throw in that case.

Make sense, thanks for the heads-up. Will do.

> This also applies to v2.
>

I don't think so - in v2 you can't do anything without the request
handle and you only get it when you call gpiod_chip_request_lines(). I
will add some code examples in a dedicated directory though like many
other projects do. Code > 1000 words. :)

Bart

> >
> > It is OK for me now, the two lines I'm polling are members of one class=
 now, it works as intended, and I'm fine with that. But still I wonder if I=
 misunderstood something or just did it wrong.
> >
> > Is a new version of libgpiod published soon? Then this whole text may b=
e obsolete.
> >
>
> Indeed, if I were you I would be looking at the libgpiod v2 branch[1]
> that will soon obsolete v1 and has a slightly different API.  e.g.
> gpiod::find_line() is gone as it is problematic - instead you need to
> call find_line() on the appropriate chip and it now returns the line
> offset.
> That is assuming you are on a reasonably recent kernel - libgpiod v2
> requires kernel v5.10 or later.
>
> Cheers,
> Kent.
>
> [1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/?h=3Dn=
ext/libgpiod-2.0
>
