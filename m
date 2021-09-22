Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7A04149F6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 14:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhIVNBW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhIVNBV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 09:01:21 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FD9C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 05:59:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id v22so9394426edd.11
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pSoJIXr35rFnlokhgNJWaQ6VnQjZIMNtIQJHG4KJuo=;
        b=0Xs3h0tZceaknYL3akQEmks3dw72GQV74kIG2o8NJ6+MC3JbGLM6uz6pxtjzI2xaeq
         k/+r2GHByjiaSSTc2leZAI+v6Z5B744Ol09VqWYbzeHxz1f/1liFxHT9fgDm9ZV015RN
         rtmtQLZ7mA+3KWDoHUTWdtqEeunW3cQNThfbon7+9RzHwwZhZ7AsbS64O5ndTGoTDfVP
         2HgZ2l8NuqoX8k2NrqIrzpeYvF9LjipNm3CbLTtqDVkN8EXmFRZIscPmAXemvNIdpRP+
         mQ0AVWSk8ztdnVH4YeZvoyn8tsbS3q+7SiC+IorxNrGlU8c3Zze8fNOiwZfU3ebg7Am0
         M1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pSoJIXr35rFnlokhgNJWaQ6VnQjZIMNtIQJHG4KJuo=;
        b=b3rU+Eib4JfpsuszbxHxn+PuaJs9ei/bbh14t3KudzKSdqgBzPGZq2ID0AmJMmrlml
         KKBcSSSIuLkEFVNRsF+d0MUEqr6LjKKvu8tZPNpD8aCB3kikyD8qcyCX0e41gCYQMGHK
         UBOGTZGTD/6Uz+08zhP8SYQpQT5FqrzaJ8IcPVq24TaUqcxObN1H3YitQEBzURgR94sC
         gKXse1kguZKK4t19lpFMlTzYpxBm+sSJ0W2qdChHxvg7HguQZ1yTYxsda0+jAtsqScl4
         6H6YuItH8WNQFtHyorWnkbQhtzDZ7aqg93mwEBrenUoFmFmPDbAhQLmVhoMPGEUxC5qE
         AP6Q==
X-Gm-Message-State: AOAM531lG/fbzP8UfP765p9EnlXzHNVv4vPXwMR+8ALA6qMD/OhYUvsj
        78Rb6uGQU3P94z21j3kme6eua4tmsYKXSfSDSuLO9nYlyGU=
X-Google-Smtp-Source: ABdhPJwiWAt2ppa1u0eIaDK4XBCm0Av95uY8tBRlsV18OM3JoEBbUd8xhHUXTJN0LSwk6yveqco7RzHl7KGGxCjUVUE=
X-Received: by 2002:a17:907:785a:: with SMTP id lb26mr42212730ejc.77.1632315587935;
 Wed, 22 Sep 2021 05:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210728234607.GC14442@cephalopod> <CAMRc=Me_UsY8b2wJx3CopJ2eX1Qb=fdSRqq_sRyR2vGXVULTbg@mail.gmail.com>
 <20210922114924.GA24226@cephalopod>
In-Reply-To: <20210922114924.GA24226@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Sep 2021 14:59:37 +0200
Message-ID: <CAMRc=MdFGNK8aLXz9AwrqGtmpebdO5SGZKnKuap3wFx4QRJdTA@mail.gmail.com>
Subject: Re: [PATCH libgpiod-v2] gpioinfo: Show edge detection and debounce
 period if enabled
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 1:49 PM Ben Hutchings
<ben.hutchings@essensium.com> wrote:
>
> On Mon, Sep 20, 2021 at 03:52:17PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 29, 2021 at 1:46 AM Ben Hutchings <ben.hutchings@mind.be> wrote:
> [...]
> > > @@ -166,6 +196,9 @@ static void list_lines(struct gpiod_chip *chip)
> > >                 prinfo(&of, 13, "%s ",
> > >                        active_low ? "active-low" : "active-high");
> > >
> > > +               if (debounce_period)
> > > +                       printf("debounce=%lu ", debounce_period);
> >
> > You should use prinfo here for formatting. But it would be even better
> > if this became a flag - like the bias, drive etc settings and be shown
> > inside the [] brackets at the end of the line - something like:
> > "[pull-up, used, debounce-period=1000us]".
> [...]
>
> Well it's not a flag; it's an attribute with a value.  But if you
> think it should be grouped with the flags anyway, I can do that.
>

Yeah "flags" may be an unfortunate word. I should probably have called
the last column: optional attributes. Now that we have a growing
number of line attributes, I should probably rethink gpioinfo output
formatting for v2.

Bart
