Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF6870D698
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 10:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235614AbjEWIEO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 04:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235411AbjEWIEO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 04:04:14 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F08E4F
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:03:32 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-78412128326so3501943241.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684828940; x=1687420940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/B3kiCliFfKeFEtWk8i6ctleQ5AEphVCcNSN8Gd7fE=;
        b=Kdd9zM9V/1FhOp66ETDWIQ6UtOjjuBH+3NatzUyc2NLLocDAG3YSv9pv9QMBTGEDLj
         S/1nghoeFJRrZ1AmP9ciN4HHQqh28fdMJGWdRW4IZg1IWVFFRGq9o/hjyTYXpmrzYHI7
         sj1L626xWgZbvcIx5cN6pcN7by41T2ycFkUjjvfHprKSBXvrEGSr1zg3R/PoN4sOGCMa
         NvbOA9fQQJZKph0AQHn5Ph4QJR5X0+sodgj7X9K5Nts9CrUvJJWEkkyQQ1f2jvg42jsz
         ZO3HHDusrIL6g/uEEQJX4GaPeputNroRtM04NUY/W6GzpA7O6hBp9QVT93Ylgjq9sHba
         cdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828940; x=1687420940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/B3kiCliFfKeFEtWk8i6ctleQ5AEphVCcNSN8Gd7fE=;
        b=XXQq7ScOtUr9ddqSPZkgrjDWFewv99vvFEvNkR/NZkRrHkhXOVKbW0+RXnERK0NDdD
         pzKQBwvqjfSlsGsk2lkJEpmsmPg1aGShMcE1/aVz/zWr3Z9UGHQTxoQODKkFU6u+geyQ
         RDzNiMwdQ9xpMG92Xl/8+UfDRvC+ixOPBVmVHsnfh6H8+n7eR1XYWdAaDGU8ORAxDSvN
         pFRflLZlUsWOQcHu4m3fb8GRiz1Sx7bsuKfWn2hhINtqGDZ+voLYz5zxCP0OwpVoCgGw
         CV5diTc8xWKoy3AojPwaYNATAB9hNfdREw+uxUDI3lqYwnUiOygmKZRdhrrtTMBgFuw1
         EgSQ==
X-Gm-Message-State: AC+VfDzJJSbWScfWxkzQXQF8NAj/V7qrDgmjKGy7AZrIljqwvBCOVKOM
        QMBgeC017l6t031gukKJ/aQEVbaOsvwFxZ1heBJdwLoIl6lA2TMNB0I=
X-Google-Smtp-Source: ACHHUZ5NKPzGMQp9jYc3t4B2JFbW91QnVKKPSXW7Ixm1CrykHmyaR9lR5tcgX9FeK9VFjujnNuYjfdbc6RCwG62iLJw=
X-Received: by 2002:a67:ee16:0:b0:42c:9a74:c724 with SMTP id
 f22-20020a67ee16000000b0042c9a74c724mr3834033vsp.3.1684828940027; Tue, 23 May
 2023 01:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230520031150.20062-1-warthog618@gmail.com> <CAMRc=Mf3uKRwXkkaZdOQS2-a_iph--M3FrVd3dfqqt5wK8aDTA@mail.gmail.com>
 <ZGwjNt/jZ+MsIT8c@sol> <CAMRc=MfmxWqMWxckwfRH-na-4GKBGd+o_wVrkRBF7UoJ+CUrQA@mail.gmail.com>
In-Reply-To: <CAMRc=MfmxWqMWxckwfRH-na-4GKBGd+o_wVrkRBF7UoJ+CUrQA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 10:02:08 +0200
Message-ID: <CAMRc=Me-wp3AvGxZXC6y=t-_tWvxJ0=2sFcK6aME6nRawkqMkg@mail.gmail.com>
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

On Tue, May 23, 2023 at 9:41=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Tue, May 23, 2023 at 4:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > On Mon, May 22, 2023 at 06:29:27PM +0200, Bartosz Golaszewski wrote:
> > > On Sat, May 20, 2023 at 5:12=E2=80=AFAM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > >
> > > > Add more detail to Contributing to make it easier for new users to
> > > > contribute.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > > > I was tempted to add something on formatting with clang-format, but=
 I'm
> > > > not 100% clear on the formatting policy myself.
> > > > Would be nice for that to be clarified.
> > > >
> > > >  README | 14 +++++++++++---
> > > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/README b/README
> > > > index b71739e..8e726fe 100644
> > > > --- a/README
> > > > +++ b/README
> > > > @@ -275,8 +275,16 @@ were selected and help2man is available in the=
 system.
> > > >  CONTRIBUTING
> > > >  ------------
> > > >
> > > > -Contributions are welcome - please send patches and bug reports to
> > > > -linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mai=
l subject
> > > > -line) and stick to the linux kernel coding style when submitting n=
ew code.
> > > > +Contributions are welcome - please send questions, patches and bug=
 reports
> > > > +to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-=
mail
> > > > +subject line).  Note that the mailing list quietly drops HTML form=
atted
> > > > +e-mail, so be sure to send plain text[2].
> > > > +
> > > > +Code submissions should stick to the linux kernel coding style[3] =
and
> > > > +follow the kernel patch submission process[4] as applied to the li=
bgpiod
> > > > +source tree.
> > > >
> > > >  [1] https://github.com/bats-core/bats-core
> > > > +[2] https://docs.kernel.org/process/email-clients.html
> > > > +[3] https://docs.kernel.org/process/coding-style.html
> > > > +[4] https://docs.kernel.org/process/submitting-patches.html
> > > > --
> > > > 2.40.1
> > > >
> > >
> > > Thanks for doing this. Maybe even add a link to the linux-gpio mailin=
g
> > > list main page and archives? I sometimes get mail from people confuse=
d
> > > as to what the linux-gpio mailing list actually is.
> > >
> >
> > Fair point - will add something in v2.
> >
> > Anything to add on formatting?
> > I was going to mention clang-format, but IIRC you tweak that a bit wher=
e
> > the old way looks nicer.
>
> I used the kernel's .clang-format but in some places it resulted in
> worse readability.
>
> > FWIW I'd rather the clang-format was definitive, or if you can't get
> > what you want from clang directly, that any tweaking could be automated=
.
> > Essentially that there is some definitive format that can be applied by
> > a tool - I'd rather not be spending time musing over whitespace.
> >
>
> I agree. I'll revisit the kernel's format file and see if I can tweak it =
a bit.
>
> Until that's done let's leave it out of README though.
>
> Bart

Ah, I remember now why I hated the "official" kernel .clang-format
which the kernel doesn't even seem to use itself because this is an
example of what applying it results in:

-        static const GPIOSimLineName names[] =3D {
-                { .offset =3D 1, .name =3D "foo", },
-                { .offset =3D 2, .name =3D "bar", },
-                { .offset =3D 4, .name =3D "baz", },
-                { .offset =3D 5, .name =3D "xyz", },
-                { }
-        };
+        static const GPIOSimLineName names[] =3D { {
+                                                         .offset =3D 1,
+                                                         .name =3D "foo",
+                                                 },
+                                                 {
+                                                         .offset =3D 2,
+                                                         .name =3D "bar",
+                                                 },
+                                                 {
+                                                         .offset =3D 4,
+                                                         .name =3D "baz",
+                                                 },
+                                                 {
+                                                         .offset =3D 5,
+                                                         .name =3D "xyz",
+                                                 },
+                                                 {} };

Bart
