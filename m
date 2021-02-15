Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510E831B810
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 12:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhBOLfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 06:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhBOLfI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 06:35:08 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7B8C061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 03:34:28 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id d3so4570571qtr.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 03:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6Vt/zq2mVbOTdHDt2vBi7oIM+dVUGPzuFdV5WmS3eA=;
        b=J3jZyPdoT2D++v3xquXBh5/CEFegdr7nh353YXTA7BqqZpO6PbLBbh2xippakIy0Zm
         D+EmuqSi/JNwxwFUh1Y2axAmCJ8kWhZv/sWm6KAeRnbwbIBfp8l9fTFFH/dS6DnTbMjD
         zorOcfhM4qpAphALGm7SF+Mj288Eq5DiLPtSHsWv6DRxXeTRxYz7e/4KPsw+94bouUon
         RuFh8VCqUiiRbudAijoWu4FSYzA2FzD+5KAafkxljOzTrz9VqAQQuGh6WQpE+lbF/G0M
         Ml5OqZyt4DDnv3hmEtOp8Fb7AQqqyx4G2AZpotu/x7PAAmiDtCAdpZ9u1fWP7A1OjOie
         1Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6Vt/zq2mVbOTdHDt2vBi7oIM+dVUGPzuFdV5WmS3eA=;
        b=ViIItQho73ZURE1Ad8MP3gVx5FYrfg7PDD/fH0ktpI3yFW5F7fvsx6mFzmKGfntvsb
         S2rjYYAlDd6F1ffhe5JxU/ZxR5+gjLv7zvS6qU7f7dvkOxIHShp8GM4pFmAn0ZumaMsq
         T7MFTSgy6TqVKuriO6qP9Eeft39gAkjxiRc/DrIYgYOuRkwftULFVFnJs2/SoenAIaLB
         1J9WZi2U2rFB7vmecKWcN7hXRa5M3qLtzAfBkZrXev3kAQs63yir9WmynSRmGIJrZyOL
         l+L4rOBCu2ik+QdDaJvOOmAWxXFHnFJfyQTqGnPYu+717YcjrINslpZ47manHCLbvLJl
         9srA==
X-Gm-Message-State: AOAM530gXoMET5l/7mqUKNWszHu2NwASWUdWl1pSLuBhqxU2C3jfs0yy
        iYWQT6RsEh+vqaDQTDsT1+wA4JvmV7fY0snQhNA=
X-Google-Smtp-Source: ABdhPJzn8ow02DGOplem6pPdBRrTe7eSiISGWMgimStnVoUtTASZ+eF1eq0cJHauG9aJtVJNKrLqkynGiUejcOJ8RAc=
X-Received: by 2002:ac8:46c1:: with SMTP id h1mr13324193qto.345.1613388866992;
 Mon, 15 Feb 2021 03:34:26 -0800 (PST)
MIME-Version: 1.0
References: <CAJAEvhib-M-UQeoCDs+aex-hdE-vJSQk=C5B7z4A9WmR+JcxQQ@mail.gmail.com>
 <20210213002336.GA7405@sol> <CAJAEvhjQv5hg9GvFXTFotq5ctsKnzXaTdb56KmkqQepAKcfAuA@mail.gmail.com>
 <20210215091134.GA20088@sol>
In-Reply-To: <20210215091134.GA20088@sol>
From:   Pedro Botella <pbotella@gmail.com>
Date:   Mon, 15 Feb 2021 12:33:50 +0100
Message-ID: <CAJAEvhgoiUCaR2_AWwCOqL5N+GoBZe2T4cyZpx2WFg7USma_1Q@mail.gmail.com>
Subject: Re: [libgpiod] Bug in python binding when requesting output?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Yep, the use case I'm developing for right now is probably not the
norm for GPIO, so I understand if I have to do some quirks to get it
to do what I want.

Thanks again for the help Kent, much appreciated.

Pedro

On Mon, Feb 15, 2021 at 10:11 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Feb 15, 2021 at 09:15:00AM +0100, Pedro Botella wrote:
> > Okay, got it. I have understood the function incorrectly then.
> >
> > What I wanted to achieve was for the output to keep its current state
> > if it was already configured as an output, which I thought would be a
> > reasonable behavior.
>
> The general policy is that userspace takes responsibility for the state
> of the GPIO lines it requests.
> If selecting the line as an output then you should know the state you
> want the line to be in - any residual state is generally irrelevant.
> Having said that, the as-is option is there for any case where you
> really need to know the existing state of the line before changing it,
> but that should be very rare.
>
> > So I will instead wrap my requests with this:
> >
> > def gpiod_safe_request_out(line, consumer):
> >     if line.direction() == gpiod.Line.DIRECTION_OUTPUT:
> >         # already an output, request as is and the output value won't
> > be modified
> >         line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_AS_IS)
> >     else:
> >         # Read current value
> >         line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_IN)
> >         value = line.get_value()
> >         line.release()
> >         # Request as output current value as default value
> >         line.request(consumer=consumer, type=gpiod.LINE_REQ_DIR_OUT,
> > default_val=value)
> >
> > Which won't modify outputs, and if it is currently an input, will keep
> > the value at the pin.
> >
>
> A line being an input is electrically very different from being an output.
> If an output line is set to input then its value will depend on the
> particular circuit - it may be pulled up or down or it may float.
> Either way the existing input value doesn't generally mean much.
>
> Again, if you know the line is suitable to use as an output then just set
> the initial state to whichever level makes sense for your application.
> And if you aren't sure the line is suitable to be an output then
> definitely don't - that can make the smoke come out.
>
> > I don't think I'm the most suitable for providing a patch for the
> > uninitialized default_vals, I'm not very well versed in providing
> > patches to the linux source tree, but I can give it a try if you want
> > me to.
> >
>
> No problem - I can write a patch for it - just thought you might like to
> take a swing at it since you found it.
>
> Cheers,
> Kent.
>
> > Thanks for your help Kent!
> >
> > Pedro
> >
> > On Sat, Feb 13, 2021 at 1:23 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Thu, Feb 11, 2021 at 09:54:22PM +0100, Pedro Botella wrote:
> > > > Hi,
> > > >
> > > > I'm experiencing what I think is a bug in the python bindings for libgpiod.
> > > > I believe a line.request with type gpiod.LINE_REQ_DIR_OUT always
> > > > results in that line being set to '0'.
> > >
> > > That is correct - when requesting a line as output at the kernel uAPI
> > > the initial value must always be provided.  If you do not provide
> > > default_vals via the Python API then the output should be defaulted to
> > > '0' by the Python binding.
> > >
> > > > To reproduce:
> > > > 1. request a line with type gpiod.LINE_REQ_DIR_OUT
> > > > 2. set the line to '1'
> > > > 3. release the line
> > > > 4. request the same line with type gpiod.LINE_REQ_DIR_OUT
> > > > 5. get the value, it should now be '0'
> > > >
> > >
> > > To clarify, the expected behaviour is that the output is defaulted
> > > to '0' if default values are not provided.
> > > So the problem you are seeing is that the output is not consistently '0'?
> > >
> > > If you are expecting to see a '1' then you are expecting the lack of
> > > default_vals in the kwds to leave the output value as is, but that is
> > > not the case - it should default to '0'.
> > >
> > > > I think the issue is in "gpiod_LineBulk_request" in
> > > > https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/gpiodmodule.c
> > > > There a call to "gpiod_line_request_bulk" with default_vals being
> > > > passed as a pointer. Later on in the code, this parameter is checked
> > > > for NULL, if it is not NULL then the values in the array are used as
> > > > default_vals.
> > > > I believe that a NULL pointer should be passed instead if no
> > > > default_vals have been requested when doing a Line.request from
> > > > Python.
> > > >
> > >
> > > Agreed - passing default_vals uninitialized to gpiod_line_request_bulk()
> > > is a bug.
> > > It should be zeroed, or a NULL pointer should be passed if the
> > > default_vals were not provided in the kwds. Otherwise the output
> > > value will be set based on the uninitializezd contents of default_vals.
> > >
> > > Would you like to provide a patch?
> > >
> > > In the meantime the obvious workaround is to always provide default_vals
> > > in the kwds.
> > >
> > > Cheers,
> > > Kent.
