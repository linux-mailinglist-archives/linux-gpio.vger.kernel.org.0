Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37DB570D562
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 09:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjEWHlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 03:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjEWHlV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 03:41:21 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBCA118
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 00:41:19 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-76fd0036c7fso2213686241.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 00:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684827678; x=1687419678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHyk7awADm0n53ff5rEdoaHMS0eVX2WuNYo9IqkuoeQ=;
        b=U1cO3NhCim2UO/PsIEWpdPTrb2xPHS792/8xkKdM7u/nRPmgxLN+LNHYqw/D9LzWSd
         ugZWOjIgV07p896/9Ci1dveY4DmdndRZMcw9kIx9ULM7RyX1pNh8QGTsMWmWYBVGai41
         lyEk6yWRRte5kgml23kxa46XMnut37yjqL4nEJFYT+wa9WoObRQjpyocqYu7DTS8Zfo6
         IeyB6k6zMOqbqwtKAFdmBmynTTGwPA4iilU5xB9eBDprMv6NvAZqFt+bNIrnglISNUdl
         pVsAt1O41QX7k/nG0WBaBYDTH1tlYVxRfqmeB7NbxZeBwN6JzQ6B00hBMP8veFJRmouQ
         ZiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684827678; x=1687419678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHyk7awADm0n53ff5rEdoaHMS0eVX2WuNYo9IqkuoeQ=;
        b=InF40QuWjRda/Euj/3otQobcb/wJyst7M5xFWKv5uuCOoSoPX1c4Z576NdivKAaC4S
         SW5xYdPSk6zEPeazWGdFcIkpOloOIloAIGn+MoDiIz3LeRKVxtzA2z+GzOwoBM1oMxJP
         26I81ceCMu1IRNMXCzrFmvz8GbvdZD+sRttU1dfe3/isJLF0bgVvXFliElIYwcc7Jf3C
         +3dLC3oG37Ug6AbcoOlB0zvSBK/vkVXW/ZQcN3SWVWT31cnxoA39dj/1rCvNq6ulhq+P
         RRl7xc1Q+HuN/MqyIS3V8tQf6ldzYx0d8b5eJz9lcefqswPtir8borY0ZUfI9vKcQYDO
         Q5hA==
X-Gm-Message-State: AC+VfDytXWEPdXwUFJofOERCp8kckMgkwDHQ9Wo8AOH0vWJeHgfuF8+U
        YHWmpmAnU+G6myYABgyJzBkI1lqfHKsV3en0HuxvGA==
X-Google-Smtp-Source: ACHHUZ5jvC88Pt+uubdHrVYAayj6LfEdLV769+C/5Q80T67pK3YMsB+AqKaT86RPOmERQzfOjPZAlebFz44IsllHULE=
X-Received: by 2002:a67:f79a:0:b0:42c:37fe:b810 with SMTP id
 j26-20020a67f79a000000b0042c37feb810mr3353784vso.21.1684827678119; Tue, 23
 May 2023 00:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230520031150.20062-1-warthog618@gmail.com> <CAMRc=Mf3uKRwXkkaZdOQS2-a_iph--M3FrVd3dfqqt5wK8aDTA@mail.gmail.com>
 <ZGwjNt/jZ+MsIT8c@sol>
In-Reply-To: <ZGwjNt/jZ+MsIT8c@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 09:41:07 +0200
Message-ID: <CAMRc=MfmxWqMWxckwfRH-na-4GKBGd+o_wVrkRBF7UoJ+CUrQA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: provide more info in Contributing
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
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

On Tue, May 23, 2023 at 4:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, May 22, 2023 at 06:29:27PM +0200, Bartosz Golaszewski wrote:
> > On Sat, May 20, 2023 at 5:12=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > Add more detail to Contributing to make it easier for new users to
> > > contribute.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > > I was tempted to add something on formatting with clang-format, but I=
'm
> > > not 100% clear on the formatting policy myself.
> > > Would be nice for that to be clarified.
> > >
> > >  README | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/README b/README
> > > index b71739e..8e726fe 100644
> > > --- a/README
> > > +++ b/README
> > > @@ -275,8 +275,16 @@ were selected and help2man is available in the s=
ystem.
> > >  CONTRIBUTING
> > >  ------------
> > >
> > > -Contributions are welcome - please send patches and bug reports to
> > > -linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail =
subject
> > > -line) and stick to the linux kernel coding style when submitting new=
 code.
> > > +Contributions are welcome - please send questions, patches and bug r=
eports
> > > +to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-ma=
il
> > > +subject line).  Note that the mailing list quietly drops HTML format=
ted
> > > +e-mail, so be sure to send plain text[2].
> > > +
> > > +Code submissions should stick to the linux kernel coding style[3] an=
d
> > > +follow the kernel patch submission process[4] as applied to the libg=
piod
> > > +source tree.
> > >
> > >  [1] https://github.com/bats-core/bats-core
> > > +[2] https://docs.kernel.org/process/email-clients.html
> > > +[3] https://docs.kernel.org/process/coding-style.html
> > > +[4] https://docs.kernel.org/process/submitting-patches.html
> > > --
> > > 2.40.1
> > >
> >
> > Thanks for doing this. Maybe even add a link to the linux-gpio mailing
> > list main page and archives? I sometimes get mail from people confused
> > as to what the linux-gpio mailing list actually is.
> >
>
> Fair point - will add something in v2.
>
> Anything to add on formatting?
> I was going to mention clang-format, but IIRC you tweak that a bit where
> the old way looks nicer.

I used the kernel's .clang-format but in some places it resulted in
worse readability.

> FWIW I'd rather the clang-format was definitive, or if you can't get
> what you want from clang directly, that any tweaking could be automated.
> Essentially that there is some definitive format that can be applied by
> a tool - I'd rather not be spending time musing over whitespace.
>

I agree. I'll revisit the kernel's format file and see if I can tweak it a =
bit.

Until that's done let's leave it out of README though.

Bart
