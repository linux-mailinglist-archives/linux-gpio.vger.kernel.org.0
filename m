Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808CF4D277E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 05:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiCIB0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Mar 2022 20:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiCIB0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2022 20:26:39 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DFC8B6E5
        for <linux-gpio@vger.kernel.org>; Tue,  8 Mar 2022 17:25:31 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id o8so640326pgf.9
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2022 17:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DTZE1GGOUc0Xe5TILzNdPovBOGas2PsoxFXqPJI+Jj0=;
        b=ojc/DUmqKIdqpsAcz+SeC8FPpha6Dxy5tdar4XP+3ku46vQ7alATxkEexJnKwys54h
         b2kSKP+sKFNwK5n1kWctmO/vR+405x3WSb3MO2+A6v2o4FfGqsHhmQQueyB/EtPcPDOj
         +0y6/au89lDwfmX4vlxr2p5rKF4/Q1sLYsuEzULoJrmxcy6c/QECvkxhJ3St6KBM/Tyo
         rNKmxA5A1uvlsixrYXg0G/FW4IfjS1/KAs7QC5X3meLAn7qpvTxEzT40UCRyc7XXooK6
         bAAZCNoeQzx8EkFjOm4gIbSiYq5MLLyu/InjxNHTBarN9W8A0m6Ks33jHLWGD5y1Wwwv
         8wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DTZE1GGOUc0Xe5TILzNdPovBOGas2PsoxFXqPJI+Jj0=;
        b=oO+2UGqknrFNGFnaOOis0UxZspRHvnluvnI2y4gl4pH65t6/3GWjg37XQvNCE1G915
         CMM0ejhKpLfIS0OwSTeAEj4V/QCe6Cw6/1wi1G6mwrhUsQzG0LVBNp9Jtndl7ahf9kUu
         Siq5YhBcpmuTec0aGsM1NTdYAY8yuRcZx4/jPsvKJmSBB/a4E/4LrxkWoXgaTzFTtdnT
         z2xIgn+qynqgoT2Op57vwclHkBiXkAlJhJ320jr5Y6qegp4ELJ8DPp13Cb7CFtVRaiqx
         /L9BkVjE5g2JvqaNJQ6gnOENAGctDrDeV9bXCABo8nezR60qXvrl8ty1RVIeqa/3AN+k
         yRLw==
X-Gm-Message-State: AOAM532G+qJmOzJkgZg6cYUzztDBM0NS+edYmChXzXhlmKSRsSlHOTwn
        /pODpi9iwSfJU9hObt7YkuE=
X-Google-Smtp-Source: ABdhPJxB2t7e+LE4GUuKjlyT3U4GG7VApCl/3zrEinu6N7/eFu0scNYzQBlvgjuaUgXFRHxFrKiyJw==
X-Received: by 2002:a63:d23:0:b0:364:f37b:947d with SMTP id c35-20020a630d23000000b00364f37b947dmr16666669pgl.263.1646789130849;
        Tue, 08 Mar 2022 17:25:30 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090a178c00b001bd036e11fdsm4150486pja.42.2022.03.08.17.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 17:25:30 -0800 (PST)
Date:   Wed, 9 Mar 2022 09:25:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] treewide: use size_t where applicable
Message-ID: <20220309012525.GA28192@sol>
References: <20220308152233.493098-1-brgl@bgdev.pl>
 <20220308155458.GA72687@sol>
 <CAMRc=Mdck1HUZwVOad+FJ-Dc7t8jA0J7qpFwpWSN4x9_vB+7rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdck1HUZwVOad+FJ-Dc7t8jA0J7qpFwpWSN4x9_vB+7rQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 08, 2022 at 09:26:56PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 8, 2022 at 4:55 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Mar 08, 2022 at 04:22:33PM +0100, Bartosz Golaszewski wrote:
> > > size_t is the unsigned integer type generally used whenever variables
> > > define sizes, ranges and numbers of elements. Use it throughout the
> > > C library wherever it makes sense.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > ---
> > >  include/gpiod.h      | 30 +++++++++++++++---------------
> > >  lib/chip.c           |  4 ++--
> > >  lib/edge-event.c     | 12 ++++++------
> > >  lib/internal.h       |  2 +-
> > >  lib/line-config.c    |  4 ++--
> > >  lib/line-request.c   | 10 +++++-----
> > >  lib/request-config.c | 12 ++++++------
> > >  tools/gpiodetect.c   |  2 +-
> > >  tools/gpioget.c      |  3 ++-
> > >  tools/gpioinfo.c     |  2 +-
> > >  tools/gpiomon.c      |  4 ++--
> > >  tools/gpioset.c      |  3 ++-
> > >  12 files changed, 45 insertions(+), 43 deletions(-)
> > >
> > > diff --git a/include/gpiod.h b/include/gpiod.h
> > > index 0512a8f..e6a4645 100644
> >
> > [snip]
> >
> > > diff --git a/tools/gpioget.c b/tools/gpioget.c
> > > index 112257c..28030fa 100644
> > > --- a/tools/gpioget.c
> > > +++ b/tools/gpioget.c
> > > @@ -44,12 +44,13 @@ int main(int argc, char **argv)
> > >       int direction = GPIOD_LINE_DIRECTION_INPUT;
> > >       int optc, opti, bias = 0, ret, *values;
> > >       struct gpiod_request_config *req_cfg;
> > > -     unsigned int *offsets, i, num_lines;
> > >       struct gpiod_line_request *request;
> > >       struct gpiod_line_config *line_cfg;
> > > +     unsigned int *offsets, i;
> > >       struct gpiod_chip *chip;
> > >       bool active_low = false;
> > >       char *device, *end;
> > > +     size_t num_lines;
> > >
> >
> > Also makes sense for indicies into arrays, such as the i here and
> > elsewhere?
> > I'm guessing there is a lot of elsewhere.
> >
> 
> I'd leave it for now. In most cases there's no chance of exceeding the
> max value of unsigned int (size_t is unsigned long) and it's also an
> implementation detail that can be changed later. This patch mostly
> addresses the library interface.
> 

The checkin comment says "throughout the C library wherever it makes sense",
so reword that to limit the scope to the API, and we can pickup the rest
later.

And this is for the v2 branch, right?

Cheers,
Kent.
