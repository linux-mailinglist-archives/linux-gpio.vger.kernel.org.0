Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60EF2466EA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 15:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgHQNFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 09:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbgHQNFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 09:05:10 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F377C061389
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 06:05:10 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id t4so14413815iln.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymgNimsPl6stCTVcrW44vhlSWam2RzlWgar+7t+xoE4=;
        b=gOWOzk/TKp/Z/UPJGXca3/9GVks+Ho1J2k9KWr/KaIsz0A3dv7LJVFcZr+7UtkmZj3
         dRiN68TAfbDYdF1UnOv+TdnWEE89Di9LGwycMIy88xJHkswKK8FJjPk1tjBjgpIGJSWA
         hpP+tT/MC3ZfVAZRjokfMxbEXhUeRik1MD404K7wSloRoSLLgwdRiA+S1s8l+JIt9iOK
         zZ7BXCTrCutZTKH0iHCetfFWzhBQQjwL3kz/q2/mNgWD9ZrLQ1NmosMTS1//mZYYkwT3
         ht4Y2y/UZDdARJDbEuv59HrNHSGAMf+781U8BSI+BV7qfZVexls3NVju5joH8+TzFK1+
         G8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymgNimsPl6stCTVcrW44vhlSWam2RzlWgar+7t+xoE4=;
        b=bIfYxkb3cOuFfVQ5a3FKkVRHkDeA8Eh7oz/XWiYPHdq5cD1U1r7TiZ9uMCQnvStxaG
         c9+TwqTzBtTUtYyAFh05WC31/X//vlTCmSR2MiFOWO7U9KfheE/+aAsMJLIBQkmhsY6T
         n2prOZq8DYuicGT7F1uEdP75TAqid/mn4wmflZcU9LdNz9g6t1Y3FTIm3xSW2kTVOwSR
         BQPK7XqE7qgba9gGLzSHfiQWh9eVlYqU2+4SjqoW9TYe8O9QJeNzqiXsGF6JeQIJnvXu
         2D1cJbokgC//c6F9lVbfoJR5vJNFpMhStW/NXLv3En1MBemkrTwDsmy12ZZJNmyuDgiC
         1rIg==
X-Gm-Message-State: AOAM5315nFeChiAIBU8000y3SSYuQlUg3OceN1W8FexpyHGuud/JJUO7
        7l1mcWQkfvYUGRhOmRquG92d2KLinaQVCed2oYK8TpFDvD4ibw==
X-Google-Smtp-Source: ABdhPJwjpHTJmeqr3ui/acWHE5FICsSdBabYW4rH1GjTcUJIocT2xNmbu9jJ9f998oattHmZVpBIiF//0Bifs9wd7JI=
X-Received: by 2002:a92:d30a:: with SMTP id x10mr13649653ila.287.1597669508078;
 Mon, 17 Aug 2020 06:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-3-gary.bisson@boundarydevices.com> <CAMRc=MdLXhcauwSeFKxeBbJUUTVTHCw3Pwkkxx3Emmao7MnXjw@mail.gmail.com>
 <20200817082303.GA91176@p1g2>
In-Reply-To: <20200817082303.GA91176@p1g2>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Aug 2020 15:04:57 +0200
Message-ID: <CAMRc=Md81RAdG9Ekh5u+=VtS6uNxP3NCOi_e+DwzXYLbGO+8=w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] tools-common: fix build for Android
To:     Gary Bisson <gary.bisson@boundarydevices.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 10:23 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> Hi,
>
> Sorry for the delay.
>
> On Mon, Aug 10, 2020 at 09:15:18PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
> > <gary.bisson@boundarydevices.com> wrote:
> > >
> > > program_invocation_name doesn't exist in Android, getprogname() should
> > > be used instead.
> > >
> > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > > ---
> > > Hi,
> > >
> > > I couldn't an equivalent to program_invocation_short_name, so the
> > > program is now using program_invocation_name all the time, hope it's ok.
> > >
> > > Regards,
> > > Gary
> > > ---
> > >  tools/tools-common.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tools/tools-common.c b/tools/tools-common.c
> > > index 12bde20..1d7fc2c 100644
> > > --- a/tools/tools-common.c
> > > +++ b/tools/tools-common.c
> > > @@ -21,7 +21,11 @@
> > >
> > >  const char *get_progname(void)
> > >  {
> > > +#if defined __ANDROID__
> >
> > I'd prefer to keep libgpiod Android-agnostic. Does prctl() exist in
> > Android? It too can be used for that.
>
> Yes I understand. prctl() can be used in Android so it would definitely
> be a better option.
>
> Regards,
> Gary

The name returned by prctl(PR_GET_NAME, ...) is equivalent to
program_invocation_short_name. That would mean ditching the full
executable path everywhere in messages. Alternatively we can just set
the full program name at the start of every tool. I'm fine with the
latter too as long as we don't stick these __ANDROID__ ifdefs in the
tree.

Bart
