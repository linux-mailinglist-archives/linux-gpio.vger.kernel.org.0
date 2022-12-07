Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4216456BB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 10:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiLGJmI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 04:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiLGJmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 04:42:07 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02971C72
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 01:42:06 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id 6so7991423vkk.6
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NyfXjOBES3bc7MynLn8VXV09E2c2WUOp4jNIzRTvh+M=;
        b=NfO8zoweInx4gofV1Fm30fdWO50GssQ/iXBKzLXdVC62+qS30cxRo/7Us1nSJObohI
         Qn9AViW2mK7G/gutU9O3hsMGbNeNpefp2rnnmsjFD8lEO1yaoemBUFSW92/DkPg+s3aJ
         sN5A1mKeAix7dcbPyuyaspdfzFWvCFpAksVNxV0v5lh1D3S+o/eLyiayF4/kKj0P3dWi
         KjDcZ+kpVM84OFQLUyrG2Mpa1dJRHQ3ib9SDjy2kXilaqu3dne4qE8hXHNkHV46l8jpV
         orkbKzyOW44ffsInz2s7rHhPvFNGo2zhfrsz529R95uqRMerSel0q7FvnEW9uItTzOVv
         ArHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyfXjOBES3bc7MynLn8VXV09E2c2WUOp4jNIzRTvh+M=;
        b=e1PfcwbmkodwMa1qWBzouyC+F8aYFOgG3KIrOB2VlYv5quMmzTWPrbutZ3KhckaBRH
         hoVhOAuncNg0aMBrLKSInWBZM8SWs9WZ6cuqJMgIZ67kzJddhokICuSWdJB1U1zqDBE+
         zUL/CqTS0eA7zdePN3xnX4lLka7s6RC65pS1cLY4MKyqIXvaCM68no9p0c3/r3mBe+oD
         0yLbghlHUFKQyVa4NVRH0OizPTeEbs9vnH21OhxjuZ5YalLNl51nLcCMTzki6VX6/bFm
         1MXgUz7Sk6GCEu7/0rhJ/eQ3rrCjvSdrSnUvBaKyBe+SouGh7ijfY7Mab0mCpNv+mmDE
         KYIw==
X-Gm-Message-State: ANoB5pn9r8teSiIUhOIC87lCRLTq9rCSwKiyjfIOIdy3+Y0uPy7CrAwe
        0kVGoxFG017QAmFTfQM2EEp5NWP7PKeEs0sHkphUIA==
X-Google-Smtp-Source: AA0mqf7Sdl0XeTROaQYXQO2OM3oRj2ZxsZ1fbqSfzVXGvHTSGXWeSy9oobfVt4/UVa+YtAV3Ods31xjfxFPj0a0WuxU=
X-Received: by 2002:a1f:1342:0:b0:3bc:cc16:f662 with SMTP id
 63-20020a1f1342000000b003bccc16f662mr26505991vkt.33.1670406125048; Wed, 07
 Dec 2022 01:42:05 -0800 (PST)
MIME-Version: 1.0
References: <f36e4eeee8c5bb96cddcad31a3762c10406a99e9.1670316057.git.esben@geanix.com>
 <Y5BczAGN78xiKgDp@sol>
In-Reply-To: <Y5BczAGN78xiKgDp@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Dec 2022 10:41:54 +0100
Message-ID: <CAMRc=MfdAWh6-Xsmrvugy8wNEFeXR9knX4i8fwFuCfRbBcJ9Kw@mail.gmail.com>
Subject: Re: [PATCH] gpioset: fix memory leak in interactive mode
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Esben Haabendal <esben@geanix.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 7, 2022 at 10:28 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Dec 06, 2022 at 09:46:37AM +0100, Esben Haabendal wrote:
> > Even when readline() returns an empty buffer, we still need to free() it to
> > avoid leaking memory.
> >
>
> Good point.
>
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
>
> As per the README, you should prefix your subject with [libgpiod] to
> better get the attention of the libgpiod team.
>
> > ---
> >  tools/gpioset.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/gpioset.c b/tools/gpioset.c
> > index c49d229870d2..f087003af1c9 100644
> > --- a/tools/gpioset.c
> > +++ b/tools/gpioset.c
> > @@ -768,8 +768,12 @@ static void interact(struct gpiod_line_request **requests,
> >               fflush(stdout);
> >
> >               line = readline(PROMPT);
> > -             if (!line || line[0] == '\0')
> > +             if (!line)
> >                       continue;
> > +             if (line[0] == '\0') {
> > +                     free(line);
> > +                     continue;
> > +             }
> >
>
> Given free() is null-aware, I would just add the free before the
> continue, rather than splitting out the cases, so
>
>                 line = readline(PROMPT);
> -               if (!line || line[0] == '\0')
> +               if (!line || line[0] == '\0') {
> +                       free(line);
>                         continue;
> +               }
>
>
> Cheers,
> Kent.
>
> >               for (i = strlen(line) - 1; (i > 0) && isspace(line[i]); i--)
> >                       line[i] = '\0';
> > --
> > 2.38.1
> >

I applied it with the change suggested by Kent.

Bart
