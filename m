Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 071834D2AB2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 09:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiCIIdq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 03:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiCIIdq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 03:33:46 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA4F99
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 00:32:47 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id hw13so3209872ejc.9
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2022 00:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FtSNDCfggaZ4Oc3CC1cVH9jZNJQZ0eD0hzlw7F/IPYM=;
        b=lf/Ddgtd8Zmy9jLRcWcrzYQQPai6JLeKuLAY+PKT9ZeJz+PMBDIius2yQTj52eGTnL
         GmdVE/k9vmD8yibo/6ACSixKMoY6Dx/+Y0wp1Sogu0uZLZKyTzorXMIlG8fPPjTqZ32g
         m9i3IFOvThexym8al/MGpM36/kpkJ4xfr9Nc8bgGUjqFcjBsFsnXY7qaz9eqknfc6tmO
         910RpjgTuVJErNRCGMNPnK1M/0rS/ZSVVf55/a8QjUgOAP6Qub5DKHivdv8ultFKvp6I
         VGcJf0nx0lpaJh1iZK8GpAUm5NA0F5I0f5nB22cJMygtFNkIUqn7XzgJBedIzjBdeeQt
         yP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtSNDCfggaZ4Oc3CC1cVH9jZNJQZ0eD0hzlw7F/IPYM=;
        b=T64mlrNDkMkkeUVSbl0WIqL9wJPKDewlJq/PRZX+oHT4AZ5vw6ohd+DfmZDFsp5+Ru
         UfZHQfHor07jQgwFSzfypkAQ2L/L34GzyKT7wnPNSZN2vmltkz/oFAVZ+SJy4B77KCwI
         tJfG/Dn20krKmRo1WBoP2yS3IecqLxxvBJRKjm46xerYcfTStdbxF5G6MsA0blYCxilm
         5Zf/97tkb0Da8Dlf73ef/nViG0L48P6dVPLkYEiLiepTe/JjCtXVSjad+sUGM9h0V9vD
         Yev3lAUec6f6ot6ySIptQj8X/ZM0W6gALqyTfQW7conF+ka6UQ8PmrWuh7hZBfJEX4sE
         cXqw==
X-Gm-Message-State: AOAM530hXBwAl+yfggsZKCoAOG6AK7WND+DIveWeqYYbWtOVe81HVQGb
        eHqMe5kLlPvHhPOG5IvKqKFv0yH2hZkdXbH91YedyA==
X-Google-Smtp-Source: ABdhPJwnb13E0iJ5Prcdo0a3a+9mKNJgBhMXPo8Ctlu/5ANe4Mrm8/jJ5RwDwzU0sF7e+UHnwTm9viHc7XldihpyVLo=
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id
 dt11-20020a170907728b00b006da97dbb66dmr16497451ejc.636.1646814766009; Wed, 09
 Mar 2022 00:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20220308152233.493098-1-brgl@bgdev.pl> <20220308155458.GA72687@sol>
 <CAMRc=Mdck1HUZwVOad+FJ-Dc7t8jA0J7qpFwpWSN4x9_vB+7rQ@mail.gmail.com> <20220309012525.GA28192@sol>
In-Reply-To: <20220309012525.GA28192@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Mar 2022 09:32:35 +0100
Message-ID: <CAMRc=Me8cBe=Nk8_2h--8g1d-Wk5W_ugnvhS6xsUVDinvRorfA@mail.gmail.com>
Subject: Re: [PATCH] treewide: use size_t where applicable
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 9, 2022 at 2:25 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Mar 08, 2022 at 09:26:56PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Mar 8, 2022 at 4:55 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Tue, Mar 08, 2022 at 04:22:33PM +0100, Bartosz Golaszewski wrote:
> > > > size_t is the unsigned integer type generally used whenever variables
> > > > define sizes, ranges and numbers of elements. Use it throughout the
> > > > C library wherever it makes sense.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > > ---
> > > >  include/gpiod.h      | 30 +++++++++++++++---------------
> > > >  lib/chip.c           |  4 ++--
> > > >  lib/edge-event.c     | 12 ++++++------
> > > >  lib/internal.h       |  2 +-
> > > >  lib/line-config.c    |  4 ++--
> > > >  lib/line-request.c   | 10 +++++-----
> > > >  lib/request-config.c | 12 ++++++------
> > > >  tools/gpiodetect.c   |  2 +-
> > > >  tools/gpioget.c      |  3 ++-
> > > >  tools/gpioinfo.c     |  2 +-
> > > >  tools/gpiomon.c      |  4 ++--
> > > >  tools/gpioset.c      |  3 ++-
> > > >  12 files changed, 45 insertions(+), 43 deletions(-)
> > > >
> > > > diff --git a/include/gpiod.h b/include/gpiod.h
> > > > index 0512a8f..e6a4645 100644
> > >
> > > [snip]
> > >
> > > > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > > > index 112257c..28030fa 100644
> > > > --- a/tools/gpioget.c
> > > > +++ b/tools/gpioget.c
> > > > @@ -44,12 +44,13 @@ int main(int argc, char **argv)
> > > >       int direction = GPIOD_LINE_DIRECTION_INPUT;
> > > >       int optc, opti, bias = 0, ret, *values;
> > > >       struct gpiod_request_config *req_cfg;
> > > > -     unsigned int *offsets, i, num_lines;
> > > >       struct gpiod_line_request *request;
> > > >       struct gpiod_line_config *line_cfg;
> > > > +     unsigned int *offsets, i;
> > > >       struct gpiod_chip *chip;
> > > >       bool active_low = false;
> > > >       char *device, *end;
> > > > +     size_t num_lines;
> > > >
> > >
> > > Also makes sense for indicies into arrays, such as the i here and
> > > elsewhere?
> > > I'm guessing there is a lot of elsewhere.
> > >
> >
> > I'd leave it for now. In most cases there's no chance of exceeding the
> > max value of unsigned int (size_t is unsigned long) and it's also an
> > implementation detail that can be changed later. This patch mostly
> > addresses the library interface.
> >
>
> The checkin comment says "throughout the C library wherever it makes sense",
> so reword that to limit the scope to the API, and we can pickup the rest
> later.
>

Will do when applying.

> And this is for the v2 branch, right?
>

Yes, of course.

Thanks,
Bart

> Cheers,
> Kent.
