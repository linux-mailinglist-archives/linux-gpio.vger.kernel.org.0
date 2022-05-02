Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7507C516F9D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 14:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239363AbiEBMiR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 08:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238129AbiEBMiR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 08:38:17 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1EC12A9B
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 05:34:46 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id m20so27452318ejj.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7G60P7Vc11DTAayxfBFr6C1h7UY4OhbhXZXVirJwSsw=;
        b=6aMarv7omMDAdGPhtQrDm85WD22vmpy1uX7lTtWzHHYTRaSj02wNYDL9DoEd/ZZZFW
         zS0662LAr0Tqtp6YXac04pjNz/L1t2cAsIp6ik+/E/l+p+j8A0yRa1nb6LGBaawFpk/w
         lxg83KE+PtnDFKY8XSPdrWyhh7n5fqxpHdYXV2JVn+EkBsyvCFTU5nYP/nOccWJTlRuc
         JOuzj9zj+4JTfBi7Pw3Wwky6Zksr/CZCvBDwbeFAHg0fOEH5TehgFskZS5RnE+10FC/+
         gFZxGuKHSQ6aZtpYmAg5OctDkbg6ViabsiGaKiZ64nci6RcJpSJHWsd/B3K+fLb7yJs2
         DjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7G60P7Vc11DTAayxfBFr6C1h7UY4OhbhXZXVirJwSsw=;
        b=f8fIaCOQ9/sREGFhQnla9eJFg71lzntmenw2pKR9hgm3IEyZZ4v8SMjv540mD0J+IF
         vaHbfpZrwcG2e1mcWisn2xeEsWFebeMmMrAPRV++XZ6J3v5AHypfrNLXZK2ohKfxT/23
         8ia7+M7dEDbxlncGn3dtfPHKGdBPMcHO1EUvk5zklbFoqxKlWbqHl6yT1RBf9WXvjm+f
         y8Mv9NnMUW0rLt0J1HDz9l4GLziLwwpJObB/EBojNT0WybPI+aJTFSoJSasyPH0UuNZE
         cec9N7EPf2waQpbA41m+Wj0F4OCl41hvczguMWAGXtyBe5EGJsO2lXQGY+4eDjQ3hsVD
         fCXA==
X-Gm-Message-State: AOAM531lSnVdy/nFp9y3M1D93+0KymdmvEeBX0ATfK6JzPiEwaVzNftN
        gDci+yTidMXRY4TpY1BnUzL/Dp/M9xDaytffWOVThw==
X-Google-Smtp-Source: ABdhPJzHZWuxfpDd1tRg7hAzg1iMAXscWXXnXlTkCzbK5oQjDibzJsgG4f/W8qIRi+43SiwWqYE8K/ZnIbwQ9nCk9Es=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr11159008ejc.636.1651494884634; Mon, 02
 May 2022 05:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125023.2664623-1-brgl@bgdev.pl> <20220426125023.2664623-6-brgl@bgdev.pl>
 <20220427060153.GB118500@sol>
In-Reply-To: <20220427060153.GB118500@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 14:34:34 +0200
Message-ID: <CAMRc=McZirBT_sdWxrhVomUoODTb-tz-og86Zf6KY4BBMXOw7Q@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v6 5/5] bindings: cxx: add implementation
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
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

On Wed, Apr 27, 2022 at 8:02 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 02:50:23PM +0200, Bartosz Golaszewski wrote:
> > This contains the actual implementation of the v2 C++ bindings.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> [snip]
>
> > +
> > +GPIOD_CXX_API ::std::size_t line_request::num_lines(void) const
> > +{
> > +     this->_m_priv->throw_if_released();
> > +
> > +     return ::gpiod_line_request_get_num_lines(this->_m_priv->request.get());
> > +}
> > +
> > +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> > +{
> > +     this->_m_priv->throw_if_released();
> > +
> > +     ::std::vector<unsigned int> buf(this->num_lines());
> > +     line::offsets offsets(this->num_lines());
> > +
> > +     ::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
> > +
> > +     auto num_lines = this->num_lines();
> > +     for (unsigned int i = 0; i < num_lines; i++)
> > +             offsets[i] = buf[i];
> > +
> > +     return offsets;
> > +}
> > +
>
> My previous comment was "Cache num_lines locally rather than calling
> num_lines() several times."
>
> You cached it in the wrong place - it should be first thing in the
> function, so you only call it once, not three times.
>

I fixed it when applying.

> And the throw_if_released() is still "redundant as this->num_lines()
> also does it", and it is the first thing called here - after the
> throw_if_released().
>

I think it's still worth having it here because at least the code
makes it clear, we need to have a valid request here. It's not like
it's a hot path where this additional function call would matter IMO.

> And I would've made this patch 3/5, not 5/5.
>
> But I'm fine with this set going in either way - in fact give its size
> I'd rather see minor tweaks applied later than go through another round
> of review.
>
> For the series:
>
> Reviewed-by: Kent Gibson <warthog618@gmail.com>

Thanks I applied it for now as it is, let's get it into master with
the Python bindings and then polish it some more there.

>
> I really would also like to see some feedback from C++ developers that
> will actually be using it, as they have a bigger stake in it than I do.
> But that is up to them.
>

Indeed, any idea where to post that to get some free code reviews from
C++ devs? :)

Bart
