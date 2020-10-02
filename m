Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B315628176F
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 18:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbgJBQGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 12:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733260AbgJBQGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 12:06:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7CFC0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 09:06:42 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q4so1118404pjh.5
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=32RFD9pEyzL4DqsKBqZOezitkmLyCLEOvgj6CQTt99s=;
        b=i/6LXD9ZBcHE5Ia7IOIJdnmkB0xTC/mRBQV4XYlc/Xy6X1QKtmPdO/e5tHEEMiYeTl
         ldZTVweYXvWaqPhJz6fy2VaWPbenS2Z/KPGDsH5pOdF/lwixXsnXAz4XQ1+WzsYbRa29
         uuL6SeJrsIHQxjd0sulLlZvGsjN/8kRz8960sw+xFUPXZadb9W8Kk6PcJZ7R1cCEDXtW
         Kd4974O3arYTOfXjZNCG+o0u1zM3uS+AM9bee8O82m8LkmidQnPajqdEhSfXKW9RKpkA
         rZJaNI8NrocAbIQo7TPnremC8b1ZsqoWz3+lcFkfTNnoYw/Frrp95OYYv33gjLVg14MU
         121w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=32RFD9pEyzL4DqsKBqZOezitkmLyCLEOvgj6CQTt99s=;
        b=BEeJNd8+lychHcfQxpVIaF7kLciPD62IMT1OWH42iN6/7qg3ZLoZV9Ng7LoxhM0ywf
         rbletB+I0XET+Hi0LZtYa/rxy3y2Y6rbYdU41xtyalE+ETnBHokQswavl100YY2+AAFY
         2wetC5vwJQeqVUMU1hgioOCIZKXflMa7S+7955bL4UIMXGufhEP2J6H1s5S9rx5hPXwC
         fsg09e3MDa29PFma7G8OTSxbtVU64pr41BMjiZxkFZbdGgVrx7xege0oU8QRXkGREpnn
         P5o6UItvWhMsEeMMi6QOeTXB4H3cZ8zfm7UZzne7MhvvGmewJotjI5CB6ddlwxoVSkb5
         zE2A==
X-Gm-Message-State: AOAM533U8pWrj+Z2mimNmJ78Wllp/eHSTqmQ6Id3tq5Z4hpBW2kFCoS7
        ahbjLnBTFjIc6c7NFXCsjlY=
X-Google-Smtp-Source: ABdhPJy2M6GJNJgQ2gO6CqTGoXrJnmsyQNDvQKmzxJfzsMkW+R3gtIz1RzPwRJhLDGrqMktuVmGVuA==
X-Received: by 2002:a17:90b:3581:: with SMTP id mm1mr3599435pjb.180.1601654802213;
        Fri, 02 Oct 2020 09:06:42 -0700 (PDT)
Received: from sol (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id 141sm2523046pfb.50.2020.10.02.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 09:06:40 -0700 (PDT)
Date:   Sat, 3 Oct 2020 00:06:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
Message-ID: <20201002160636.GA117143@sol>
References: <20201002063148.32667-1-warthog618@gmail.com>
 <CAHp75VfVDsxHDcnwdO5TL=wx-rB6=cuCWOxj0oP7+kpZvKuH6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfVDsxHDcnwdO5TL=wx-rB6=cuCWOxj0oP7+kpZvKuH6A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 02, 2020 at 04:48:02PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 2, 2020 at 9:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Port existing implementation from GPIO uAPI v1 to v2.
> > The libgpiod external interface remains unchanged, only the internal
> > implementation switches from uAPI v1 to v2.
> 
> Cool!
> 

Not terribly - I needed a libgpiod-based testbed for my kernel
changes, and this was the easiest way to do it.
By happy coincidence that aligns with the path Bart wants to take for
libgpiod 2.0, so here we are.

> > This is a minimal port - uAPI v2 features are only used where it
> > simplifies the implementation, specifically multiple events on a bulk can
> > now be handled directly by the kernel in a single v2 line request rather
> > than being emulated by multiple v1 event requests.
> 
> ...
> 
> > +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE)
> > +               bias_flags++;
> > +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP)
> > +               bias_flags++;
> > +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN)
> > +               bias_flags++;
> > +       if (bias_flags > 1)
> > +               return false;
> 
> Seems to me like an emulation of hweight(), although I don't know if
> we have in standard libraries such.
> 

Yup, same here, and it was quicker at the time to just write this than go
looking...


> ...
> 
> > -       if (values) {
> > -               for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
> > -                       data.values[i] = (uint8_t)!!values[i];
> > +       for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
> > +               lines_bitmap_set_bit(&lv.mask, i);
> > +               lines_bitmap_assign_bit(&lv.bits, i, values && values[i]);
> >         }
> 
> Hmm... What about
>        for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
>                lines_bitmap_set_bit(&lv.mask, i);
> 
>   if (values) {
>        for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
>                lines_bitmap_assign_bit(&lv.bits, i, values[i]);
>   }
> 
> ?
> 

I find mine easier to read.
Yours may be slightly faster though.  And maybe larger?

> ...
> 
> >         /*
> >          * 16 is the maximum number of events the kernel can store in the FIFO
> >          * so we can allocate the buffer on the stack.
> > +        *
> > +        * NOTE: This is no longer strictly true for uAPI v2.  While 16 is
> > +        * the default for single line, a request with multiple lines will
> 
> for a single
> 
> > +        * have a larger buffer.  So need to rethink the allocation here,
> 
> So we (I, ...?) need
> 

The purpose of this patch is to move what work I'd already done on
libgpiod in my tree, in order to test the kernel changes, into Bart's
libgpiod tree, where it can be used as the basis of 2.0 development.

So that note is a reminder for Bart, or whoever gets there first...
But leaving it vague is still grammatically correct.

Cheers,
Kent.
