Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A72456046D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 17:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbiF2PXS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 11:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiF2PXS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 11:23:18 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4042615A09
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 08:23:17 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3137316bb69so151169937b3.10
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nqhKijJ1mWH3iv+qlrJv9N0/7O+wydulo+70v8M0TJw=;
        b=kkvlBXCCd+abrfUeM94Fg61mDMU5qk1X5N8GZEwVELqN4zgseTCgRyWEbiw4XYt7UX
         R+pMXaYeDZs1Seqh3pTbtXs0p7y2y9jcIdyQm6GwOLc1+hB2YUydBqqJio3mJPpAatdR
         hHBL8m33i25kqsCojGg0mM6hqLCe2d1z1bG1PYDrqSzou/lBQangkRyHEuTRGlpYlwsl
         /ZCNF3kugHzQsGe07+mYxUhggKMW8is6ipQ7S2wImj/FTwxzsR3bROspdxnTDDD9bx6K
         pjyinuPNviRY5yX/rF5hUCrsP/eojV0oWxZpO+V1SdB+2nl0KH8K3Ovzno+9qqVQ/c81
         UoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nqhKijJ1mWH3iv+qlrJv9N0/7O+wydulo+70v8M0TJw=;
        b=vOd0uj07Gi7nA1PU6HCRjEf6snlKzhqLGySeehlaGBUtsl044R3FzVb1SRVlcpj3Zu
         5JMf38iGQFOn0JFeGaQIUq5cCbgv9eQ6Y5xfZT+kbKgx2i1mujzt2eHH+sLTNO/zCZVt
         qeEr/rdd2tV/3WGaeui008LyhWP5nXWt6+7dGZgmhEj6yG8ajbGg/ixApZsPBoJdc7Rt
         qJzw13rqgYrwQnuuGJWLcvdWbmOYxPK/6LHyLId+XlS9Yj39iF7OU2gpF5gblx8apDTg
         kemY6KBOUpesCBXQgZsFqeYVeZ/0cbx02zQyUr0ln0/ozK54ES4mgt7p4TJxXJzU3XvM
         qJPw==
X-Gm-Message-State: AJIora8w+QF9d1f1gBWd22P5UhIc7pkhMMMpHbrJ5j9omDpd37VNYPw6
        P4GadT8OCq78Ccj8d21aWBy3MqP7/zWy1rmtAiU=
X-Google-Smtp-Source: AGRyM1uGXKMzifPqVciCSrMVGHRbr2jpzgG9yh0Iv+6Kb9HTcbN2q1I6pLpkK2DQZ9lUiKr4GYdCHbP4mDHd4qceWO4=
X-Received: by 2002:a81:1889:0:b0:317:987b:8e82 with SMTP id
 131-20020a811889000000b00317987b8e82mr4365298ywy.185.1656516196355; Wed, 29
 Jun 2022 08:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol> <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol> <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol> <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol> <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol> <CAHp75Ve5zpwgc9kk06LYJU8GveXFdgbgyyxXoQm0dy_OiLTF2Q@mail.gmail.com>
 <CAMRc=MeS6MhcN7+58F4Hh5R9ZZjAFxiJO594_iuSTFrDUUbKaA@mail.gmail.com>
In-Reply-To: <CAMRc=MeS6MhcN7+58F4Hh5R9ZZjAFxiJO594_iuSTFrDUUbKaA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jun 2022 17:22:38 +0200
Message-ID: <CAHp75VcWcZb2Nu_d-3Ae6TGS2sr0qzjhPqF+YrUuRWm0-zu4og@mail.gmail.com>
Subject: Re: [libgpiod] feature request: output state read and sustain
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 2:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Jun 29, 2022 at 12:58 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Wed, Jun 29, 2022 at 12:48 PM Kent Gibson <warthog618@gmail.com> wro=
te:
> > > On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Jun 29, 2022 at 11:27 AM Ji=C5=99=C3=AD Prchal <jiri.prchal=
@aksignal.cz> wrote:
> >
> > ...
> >
> > > > Do not use shell. Use proper programming language that may give you=
 an
> > > > easier way of handling this, i.e. _context_. Shell tools are
> > > > _context-less_ and here is the problem you are trying to solve, but
> > > > from the wrong end.
> > >
> > > Actually my proposed gpioset for v2 will support running interactivel=
y
> > > so it can maintain context and be driven from shell - for cases where
> > > basic scripting will suffice.
> >
> > Dunno if it's the right direction and if I missed any (additional) disc=
ussion.
> > As far as I remember the idea was to introduce DBus aware daemon that
> > should handle the context of the line and at the same time consider sec=
urity
>
> And it's still very much on the roadmap.
>
> > implications. Allowing shell to be context-aware is a hidden mine
> > field. What will happen if the script/user forgets to move the line to
> > the proper state and the chip will drain a lot of current? So, at
> > least PM concerns just popped up immediately to my mind. What else can
> > be problematic? So, I dunno, it's a good idea to allow shell to leave
> > a line in some state when the user actually doesn't care about it
> > anymore. At the bare minimum this mustn't be default behaviour.
> >
>
> It's not much different from letting your current gpioset run in the
> background, is it?
>
> Kent just submitted his first version of gpioset, you can take a look
> at it and review it. :)

So far from Kent's and yours explanations there is no evidence to
raise an alarm.


--=20
With Best Regards,
Andy Shevchenko
