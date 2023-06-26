Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0742473D995
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 10:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjFZIY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 04:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjFZIY6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 04:24:58 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445E5DA
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:24:57 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3fde9739e20so27620731cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687767896; x=1690359896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbUkuJVkXlqDpMrmK6V5sS1/JMEhaS/0B6i2/bmrP8M=;
        b=hl+S7V6jKT3P2zW0NmB1YdLJ6TYcJlqyIbW80fG2vJQimQooasBoT3XZBjy0gG9jqB
         0ykGpvYxipJrkbknklMNzNc8hTn52vneE6RGJ3qIVdcrUgusD5sOr2kI5IUuiiJMIVzo
         40yelTu6p2qp9DVLPluVusLU77WH0sP1qHkiCVvSfFxQW5ge5IdxqIqcRGd3NofeDlmD
         rjyHZJOFIJ78t2yAtuEVyUkj0Qpzou/YOM3Gqk8W3E4bj6+/RQZoCCxC4ta0vXmWARtR
         VQQM0KHAG3TGtSn4fauhHQF7PGumP0X4S4jWZICTCsrvext0mvD05EVP0gJF80JEA3TS
         hSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767896; x=1690359896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbUkuJVkXlqDpMrmK6V5sS1/JMEhaS/0B6i2/bmrP8M=;
        b=DEcso2afnS3q1eCkMTZkz0RYvv4QHOm6uRwW6y3FC7TmW+hIL5lKhU44wq6BtvHoER
         wyWBTfzndvj/iN3srwD+gvqkecN/PvzNmMSgqDpHXb6ThVVsDzz1Fs1hpepmm2QRbrAN
         n/1SqaONPcOrT0kWrzekMT2wAzGeK7jAWYf3M8xIS8EzRsSt1ZF47A8OsWddNCywSx0O
         +7aUwEqHxISYw49Dt/Fepz0jdBsmv+cMHk0V/TZOG3I52VKmEmhq18pOLYD7BDfmsP/v
         zSeLxNAJdD5mwO8iTUm9Iqb79N4x6/T8Ca6ZeDDgaGQTzssknmYFWS+FN0uXNJPpHrPU
         izIg==
X-Gm-Message-State: AC+VfDx3UPjNisVHoQN6te9xZv4MEN3OeftoXPFbtC5sxEZCq0eBwmiL
        +qAIMfpxhIeA2JUHs/CtlJD8EeqqtNgYIssSC0ZlxqBLJzndard6
X-Google-Smtp-Source: ACHHUZ7uzD7SQy7uwk+r+iHrKCMaKDb0IoNIxrdxMBDoY7jOTRyJvzlYl2KEwP36rEkCtn0w0W7mVIoPQkI6M+NDtmA=
X-Received: by 2002:a05:622a:1315:b0:3fd:eb04:346b with SMTP id
 v21-20020a05622a131500b003fdeb04346bmr30558537qtk.38.1687767896336; Mon, 26
 Jun 2023 01:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230624052054.13206-1-warthog618@gmail.com> <20230624052054.13206-2-warthog618@gmail.com>
 <CAMRc=Mdi2cGYjV3GV-iqOazscnRe=swfToRyT2TfeJPv=_yDsg@mail.gmail.com> <ZJlJ30c6psXjtXnz@sol>
In-Reply-To: <ZJlJ30c6psXjtXnz@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Jun 2023 10:24:45 +0200
Message-ID: <CAMRc=Mc8Q5EWEjpANqOD+tqWphPKK5++VogPm=-Sm+STMhXqkA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/4] bindings: python: examples: replace tools
 examples with use case examples
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

On Mon, Jun 26, 2023 at 10:18=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Mon, Jun 26, 2023 at 10:02:33AM +0200, Bartosz Golaszewski wrote:
> > On Sat, Jun 24, 2023 at 7:21=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > Replace tool examples with use case examples drawn from the tools.
> > > +        while True:
> > > +            # Blocks until at least one event is available
> > > +            for event in request.read_edge_events():
> > > +                print(
> > > +                    "line: %d  type: Rising   event #%d"
> > > +                    % (event.line_offset, event.line_seqno)
> > > +                )
> >
> > This still uses the old style formatting.
> >
>
> Well spotted.
> I only fixed the one you pointed out - didn't even consider that there
> could be others.  Turns out there are a few - probably all
> cut-and-paste.
>
> > > +
> > > +
> > > +if __name__ =3D=3D "__main__":
> > > +    try:
> > > +        watch_line_rising("/dev/gpiochip0", 5)
> > > +    except OSError as ex:
> > > +        print(ex, "\nCustomise the example configuration to suit you=
r situation")
> > > diff --git a/bindings/python/examples/watch_multiple_line_values.py b=
/bindings/python/examples/watch_multiple_line_values.py
> > > new file mode 100755
> > > index 0000000..658ecee
> > > --- /dev/null
> > > +++ b/bindings/python/examples/watch_multiple_line_values.py
> > > @@ -0,0 +1,42 @@
> > > +#!/usr/bin/env python3
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +# SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
> > > +
> > > +"""Minimal example of watching for edges on multiple lines."""
> > > +
> > > +import gpiod
> > > +
> > > +from gpiod.line import Edge
> > > +
> > > +
> > > +def edge_type(event):
> > > +    if event.event_type is event.Type.RISING_EDGE:
> > > +        return "Rising"
> > > +    if event.event_type is event.Type.FALLING_EDGE:
> > > +        return "Falling"
> > > +    return "Unknown"
> > > +
> >
> > As there'll be another iteration, maybe change this to get_edge_type()
> > or get_edge_event_type_str()? I have a preference for function names
> > to reflect the action in general.
> >
>
> Yeah, I use _str elsewhere, not sure why I didn't here.
>
> What an I supposed to resend the update as given the remainder of
> the series was merged - v3??
>

Just this patch marked as v3 is fine.

Bart

> Cheers,
> Kent.
