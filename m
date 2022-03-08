Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EFD4D228E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 21:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350180AbiCHU2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 15:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350218AbiCHU2G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 15:28:06 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2234450E1D
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 12:27:09 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id yy13so464102ejb.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 12:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MqFL3yPidhcRIP5MuD8StDXpj+aJvemm6z+OJvXoxJY=;
        b=SCau3UZu5WA9EAsaAMCCAabZ3bpHHjKbf62DUQjGG/BEYFY+/hbaLKmW0DQDomwY+V
         Aaa2/XL/fz6d16O8LSFxeP22X8upVASdgi/glGZX699GxxMRmoqEJhywwAXVh1DFjdrG
         d6scvnSdOvH3wOE0lirllHmTYm4vCBCMZ29uD6RMHHSrNES9X+we0JMzwBmDFZ4BvKV+
         vPQvXRfAkWghszojBYAyrB1/G+iNJ9HUvssUEfPaDWZl6JtYhn+KEoGJL9eQ/piS0714
         9GOPEl9oG0ZTTJqo1AC0+l+Bu2rVbZrJQJIxmlmSNZToBBUBSv271Y+hgWvnXghxoXlE
         vj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MqFL3yPidhcRIP5MuD8StDXpj+aJvemm6z+OJvXoxJY=;
        b=YQYjuk/JL58mbZir2GBc7GDy0bSzJ7/I/CjLfTqE+eGC2t4+oXT8O08GKfnrZXBFDY
         tW8hrMyws+IdfFaAGB4XXkpR2O9H8IZLkMKT6/W+iboVnVFGKZaSjkWOp6kPCdVlfxVh
         tDU61NSxIIXiVec4el3QKbJZqt+bfKBX9Uqukc/wDaGChyK0PN0BefnsXndum96BENnI
         n5v6xukg9KLWFZli6NtQFAjoKWcW6+Ag1KOf7ozRyMfjmfGuIpwYwZDZx97nSP+Z0x/y
         FechnRa8JE/v5JReQqU1xnal3icndVxYErrS+aMA5mrZ0KosR0ATmFd9nQsXejtCzB9J
         EgKA==
X-Gm-Message-State: AOAM531hJGqYr+C99NkigaVDrhzh9FYBgcpx8mJa5n/d1aQdokm838dL
        hFPvCKoUlkvn63Ey3rLVkXeaZ3KmL5O3tzbkKKbIDA==
X-Google-Smtp-Source: ABdhPJyoXcJh9DS25No2url5+4JTO5G9hJImU3MwScxRV3pHE1hPFAySl1mt2f2y+czFlPKrKk2iUMMQKQJLD1gP9Yc=
X-Received: by 2002:a17:907:7f0d:b0:6d6:f910:5136 with SMTP id
 qf13-20020a1709077f0d00b006d6f9105136mr15498175ejc.736.1646771227614; Tue, 08
 Mar 2022 12:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20220308152233.493098-1-brgl@bgdev.pl> <20220308155458.GA72687@sol>
In-Reply-To: <20220308155458.GA72687@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Mar 2022 21:26:56 +0100
Message-ID: <CAMRc=Mdck1HUZwVOad+FJ-Dc7t8jA0J7qpFwpWSN4x9_vB+7rQ@mail.gmail.com>
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

On Tue, Mar 8, 2022 at 4:55 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Mar 08, 2022 at 04:22:33PM +0100, Bartosz Golaszewski wrote:
> > size_t is the unsigned integer type generally used whenever variables
> > define sizes, ranges and numbers of elements. Use it throughout the
> > C library wherever it makes sense.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  include/gpiod.h      | 30 +++++++++++++++---------------
> >  lib/chip.c           |  4 ++--
> >  lib/edge-event.c     | 12 ++++++------
> >  lib/internal.h       |  2 +-
> >  lib/line-config.c    |  4 ++--
> >  lib/line-request.c   | 10 +++++-----
> >  lib/request-config.c | 12 ++++++------
> >  tools/gpiodetect.c   |  2 +-
> >  tools/gpioget.c      |  3 ++-
> >  tools/gpioinfo.c     |  2 +-
> >  tools/gpiomon.c      |  4 ++--
> >  tools/gpioset.c      |  3 ++-
> >  12 files changed, 45 insertions(+), 43 deletions(-)
> >
> > diff --git a/include/gpiod.h b/include/gpiod.h
> > index 0512a8f..e6a4645 100644
>
> [snip]
>
> > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > index 112257c..28030fa 100644
> > --- a/tools/gpioget.c
> > +++ b/tools/gpioget.c
> > @@ -44,12 +44,13 @@ int main(int argc, char **argv)
> >       int direction = GPIOD_LINE_DIRECTION_INPUT;
> >       int optc, opti, bias = 0, ret, *values;
> >       struct gpiod_request_config *req_cfg;
> > -     unsigned int *offsets, i, num_lines;
> >       struct gpiod_line_request *request;
> >       struct gpiod_line_config *line_cfg;
> > +     unsigned int *offsets, i;
> >       struct gpiod_chip *chip;
> >       bool active_low = false;
> >       char *device, *end;
> > +     size_t num_lines;
> >
>
> Also makes sense for indicies into arrays, such as the i here and
> elsewhere?
> I'm guessing there is a lot of elsewhere.
>

I'd leave it for now. In most cases there's no chance of exceeding the
max value of unsigned int (size_t is unsigned long) and it's also an
implementation detail that can be changed later. This patch mostly
addresses the library interface.

Bart
