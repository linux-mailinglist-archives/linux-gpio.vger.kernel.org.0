Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17DE72CB86
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 18:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjFLQbW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 12:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236815AbjFLQbL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 12:31:11 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB36DE4E
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:31:09 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b1fcda0f92so55421811fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686587468; x=1689179468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzWyJxygcw1XCuk5NX8ElApLdRbOlJuDChRI7qdObDY=;
        b=EOxUPJS/2J/giMir327jx6ZCMiw3b/0UanL3WHRi2koiLVU9YQ3SjCBEJbR5cHjZID
         QJQMcpZZXXsJ8flEVr4CPjIetR6Ef9Bw0jyuiPxcfpdbFB3meJbQCkKreY9O+s/PGWzr
         3cKtQ6oofMju2ex27aCfRkfW2uIig2/FlrQHU7oej8j+gaNLRGa77IYjMDWOCJtnmhK7
         xeztyiab8ycltHbD2v6F7d+kWQVBxnGnIEkN/SbMyAYUlh2ImPjhNC6Dj4E+S8cSQfGT
         pjl3M1breXIdePs4rdVS5I/Fm+OxNDY7rmMOcqDO3s4PN5ifJjW9JN1q2bWpSmTjcUAN
         GTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587468; x=1689179468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzWyJxygcw1XCuk5NX8ElApLdRbOlJuDChRI7qdObDY=;
        b=dtXDpfwPmghEr6ipYtl9idHo1AK8YIdkMZctuEHxZDUXd3tJl1u4/GyOfT0VAWlKZ2
         aW8a1TuzPMPSTpp+OPCaxabKSDOXoJDzZYmawEmyHhYmArBmCwAVPxpOXpjlbmyjj41o
         6j+ZmDzILvdGJ0DsJxliYPxXdSDQNkTl0dTzK0sme9x1Jhx8jIKCif6vYzZBzgcklmkH
         xlE5rPV5HpUdRDrM7Fm3Dq2xqDPQX+tjAYieRZNsEY6Ri/+0Si/ap3BezttVAibqMCAu
         USQjmd9yUov6TNZXzk3zF4cPLwY1MdZbg6q6BOs4NU79/flmbcNdXX/Hq7z0TMOfpbD6
         PIQA==
X-Gm-Message-State: AC+VfDwqI3ovGy23uSUCHFCQ8RpRlCywPGqN+QNDnEGtaHwdeNbjl2JM
        C3z6GlIv4WKU1o/wOFH/No/C6ng7ZcZY4gmVru4GJQ==
X-Google-Smtp-Source: ACHHUZ7cyzlL84VD5N6BfbWBUlyWIDkQbaYp8tsoAxhOw6kcXuRELdhErJpeyb90CL09slSNUY7kywpcTA6irx73U9Q=
X-Received: by 2002:a2e:884f:0:b0:2b1:ad15:fe3b with SMTP id
 z15-20020a2e884f000000b002b1ad15fe3bmr3220094ljj.8.1686587467924; Mon, 12 Jun
 2023 09:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230612013049.10708-1-gabriel.matni@gmail.com>
 <CAMRc=MeBQFeafXxR9fGjUCSh0UhZKvcO0pZxsRYCNHX=s87E6A@mail.gmail.com> <ZIdC5sCnXwVa5LZ6@sol>
In-Reply-To: <ZIdC5sCnXwVa5LZ6@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 18:30:56 +0200
Message-ID: <CAMRc=MdnwKvuJjHagifhDrE8v_50cOk5gMYFpp3Qv6mcOc2=xw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH V4 1/1] tools: gpiomon/gpionotify: add
 idle-timeout option
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Gabriel Matni <gabriel.matni@gmail.com>,
        linux-gpio@vger.kernel.org, gabriel.matni@exfo.com
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

On Mon, Jun 12, 2023 at 6:08=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jun 12, 2023 at 06:05:11PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jun 12, 2023 at 3:31=E2=80=AFAM Gabriel Matni <gabriel.matni@gm=
ail.com> wrote:
> > >
> > > From: Gabriel Matni <gabriel.matni@exfo.com>
> > >
> > > Add an idle timeout option to gpiomon and gpionotify to exit graceful=
ly
> > > when no event has been detected for a given period.
> > >
> > > Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>
> > > ---
> > > V3 -> V4: Submitting patch with git send-email
> > >
> > > V2 -> V3: Addressed the following review comments:
> > > - Simplify the commit message
> > > - Clarify the help description of the --idle-timeout option
> > > - Declare ret variable at the top of function for gpionotify, not req=
uired for gpiomon
> > >
> > > V1 -> V2: Addressed the following review comments:
> > > - Renamed timeout option to idle-timeout
> > > - Timeout value is now signed
> > > - Reused print_period_help() for idle-timeout option
> > > - Added the idle-timeout option to gpionotify for consistency
> > >
> > >  tools/gpiomon.c    | 14 +++++++++++++-
> > >  tools/gpionotify.c | 17 +++++++++++++++--
> > >  2 files changed, 28 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> > > index c2684c2..e3abb2d 100644
> > > --- a/tools/gpiomon.c
> > > +++ b/tools/gpiomon.c
> > > @@ -30,6 +30,7 @@ struct config {
> > >         const char *fmt;
> > >         enum gpiod_line_clock event_clock;
> > >         int timestamp_fmt;
> > > +       int timeout;
> > >  };
> > >
> > >  static void print_help(void)
> > > @@ -57,6 +58,8 @@ static void print_help(void)
> > >         printf("\t\t\tBy default 'realtime' is formatted as UTC, othe=
rs as raw u64.\n");
> > >         printf("  -h, --help\t\tdisplay this help and exit\n");
> > >         printf("  -F, --format <fmt>\tspecify a custom output format\=
n");
> > > +       printf("      --idle-timeout <period>\n");
> > > +       printf("\t\t\texit gracefully if no events occur for the peri=
od specified\n");
> >
> > I think it would be useful to state the time units used by this option =
here.
> >
>
> That is already covered by the period help:
>
> Periods:
>     Periods are taken as milliseconds unless units are specified. e.g. 10=
us.
>     Supported units are 's', 'ms', and 'us'.
>

Ah, I missed the print_period_help() call here. When actually running
gpiomon --help it's clearer.

Thanks, I'll apply it now.

Bart
