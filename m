Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E27E724234
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 14:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbjFFMcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 08:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237197AbjFFMcu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 08:32:50 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C96AE62
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 05:32:49 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso1949137241.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686054768; x=1688646768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEoeXO1zkgrgimWkT9oSBlvMMJVHa5gs9I3y6+HDeD4=;
        b=MhKFEtcH7h9ywU499AkZaFhK7smgHfqt5cLUS8t8T7ZldeUmqFNqWAuy75K4pl85Yw
         Oizd948DHSeBU68jMmyOt0gY8maFvUmXvVdz55nIPvHMBycSd60k/SaDC1W5e+UAt7jU
         qr3ZYqoY93y4adLrgEhD9EbzQh1isfNeK3bjMFawGWXX+v+IfJfz+wW+tqyvxv/y2fV2
         zxjGb2P/5i4moDRq/8RxFR/118c5ghyQl6q/xUR+ahQ302euJDdhPU0VIgmWq/V33qIp
         1pWKd/95+3u/xIczwJlCYZeD4ABYenv1J8I/E62ToXOiLoQDAYgqlxoypKqmmr719Q0n
         sYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054768; x=1688646768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEoeXO1zkgrgimWkT9oSBlvMMJVHa5gs9I3y6+HDeD4=;
        b=Mma7J5+7qqGMBWdVLrSFjCkUBppe1P8PFi4we09mqJYOkWdG+xmwWBDATVEK+W7H2g
         O8l/Rp2ahFnPcnklItDL9rwKcjmzQMlNJ4RhfIb8m1R2G7dAKbFTSxNhGb6BIwrFCV0F
         q/qqF4iBNA0ZPQ/EpdNZwtG5ThcQPro6IFKAEgKHliwilcuIC/QGz5mWDCxnQ0zkU7Xj
         wOKOi/AnEsj6wMo42FOHND14IDPBRBYvmAl83bskDsMbyru7TJkXMIgWO6sDsffM3GCa
         9/me9OATT5++r4cEYJ40V0C6f1xNQ+e4Cg3wihUMB0+I/jHMxq1iUzPg5cUd12XFyrKK
         i0ug==
X-Gm-Message-State: AC+VfDwqEvFyb1o6R4lWUTND/LRPq59ZNB5pYEdqGJdJJPjntCuigpGN
        +dVxABlCMLC8blBpA87SNiuMko1wpGSbZ6AuMS5MGkLa3qu5Nxbm
X-Google-Smtp-Source: ACHHUZ5+2QS8OjrGRiSFSO9Jtbo+NJ3qUJ34i4WpjpubKFEjhu5Hcu4sNc+tetUp555vaV4LejFDQWKRqLw1ZHp4FTc=
X-Received: by 2002:a67:d013:0:b0:43b:24e9:a742 with SMTP id
 r19-20020a67d013000000b0043b24e9a742mr981751vsi.22.1686054768735; Tue, 06 Jun
 2023 05:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230605204335.4060789-1-joe.slater@windriver.com> <ZH6rRD5B2hNyXcuV@sol>
In-Reply-To: <ZH6rRD5B2hNyXcuV@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 6 Jun 2023 14:32:37 +0200
Message-ID: <CAMRc=MfAjiJhc5qpuHu_=Zb7NhAnw4GFNXEFN8Gh9ZfV8NOWLw@mail.gmail.com>
Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
To:     Kent Gibson <warthog618@gmail.com>
Cc:     joe.slater@windriver.com, linux-gpio@vger.kernel.org,
        randy.macleod@windriver.com
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

On Tue, Jun 6, 2023 at 5:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com> w=
rote:
>
> On Mon, Jun 05, 2023 at 01:43:35PM -0700, joe.slater@windriver.com wrote:
> > From: Joe Slater <joe.slater@windriver.com>
> >
> > The test "gpioset: toggle (continuous)" uses fixed delays to test
> > toggling values.  This is not reliable, so we switch to looking
> > for transitions from one value to another.
> >
> > We wait for a transition up to 1.5 seconds.
> >
>
> For future reference, the subject line should've been
> "[libgpiod][PATCH v3]".
> The version goes within the [PATCH], and 1/1 is optional unless you have
> a cover letter.
>
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
>
> Here you would normally list the changes between revisions.
> So I'm not sure what has actually changed since v1.
> The loop limit went from 10 to 15?
>
> >  tools/gpio-tools-test.bats | 24 +++++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
> > index c83ca7d..05d7138 100755
> > --- a/tools/gpio-tools-test.bats
> > +++ b/tools/gpio-tools-test.bats
> > @@ -141,6 +141,20 @@ gpiosim_check_value() {
> >       [ "$VAL" =3D "$EXPECTED" ]
> >  }
> >
> > +gpiosim_wait_value() {
> > +     local OFFSET=3D$2
> > +     local EXPECTED=3D$3
> > +     local DEVNAME=3D${GPIOSIM_DEV_NAME[$1]}
> > +     local CHIPNAME=3D${GPIOSIM_CHIP_NAME[$1]}
> > +     local PORT=3D$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/va=
lue
> > +
> > +     for i in {1..15}; do
> > +             [ "$(<$PORT)" =3D "$EXPECTED" ] && return
> > +             sleep 0.1
> > +     done
> > +     return 1
> > +}
> > +
> >  gpiosim_cleanup() {
> >       for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
> >       do
> > @@ -1567,15 +1581,15 @@ request_release_line() {
> >       gpiosim_check_value sim0 4 0
> >       gpiosim_check_value sim0 7 0
> >
> > -     sleep 1
> > -
> > -     gpiosim_check_value sim0 1 0
> > +     # sleeping fixed amounts can be unreliable, so we
> > +     # sync to the toggles
> > +     #
>
> You said you would get rid of this comment.
>
>
> The patch works for me, so I'm otherwise fine with it.
>
> Cheers,
> Kent.

Patch looks fine but interestingly, I'm not seeing any improvement in
terms of execution times. Is this to be expected?

Bart
