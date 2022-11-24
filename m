Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14F35637B6C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 15:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiKXO1u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 09:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKXO1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 09:27:50 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F119F5A8
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:27:47 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id u124so1686955vsb.5
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C2GOy6Ki/r7t/SYtvH76xrNGZn20ufhGUU7LAZ0xlkA=;
        b=RJ2JF1HD15MJP0pBXfnGx7+Z/yZUNCOpV7gbV3xPsskaGn3tBYhtfSiaSG4dJB0BNs
         zKF4dsGHhf/EynYAwr/hMUESV+GMZeUYtKkmTKhYP8BSH7zw0RdGqtOIVBl9DjVPdpbL
         FsRSOmtMd7QZg4WSCL0ZvPytt3Pa2DIWOlMeNloDab0s84PqqJJYgB49j5SEdSX/xRlJ
         GgfMaAABnHqhCLCa2Qj1NesCuN09CxYfg08qyLFNclA+Sac5gCdmz4XRePFjrG8ox4Xl
         k3E7oQ5UFKuP0GNuiRbVGeOnluMeJkxP7mWNXXuGQxampouugSgpXoWSeK5oFutV34cm
         kpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2GOy6Ki/r7t/SYtvH76xrNGZn20ufhGUU7LAZ0xlkA=;
        b=E4iRBDPql6FD13nnQlof0G4cJfZ/6tjrX+nrmeMGtgddlel11eHHea3ZV0+PSD7kHZ
         o50DzTKHCjJGGJB2s+BWh8hhJhyaSoDpiEEvDpfB54Ak+vMvS2LT/GbtMEzqralh2DFB
         EIdwNdhjoSualMwaLc0OmUtp8RrIYGlQBSh6mT3EFVY2riaGKxIdIi7uXiqmMzGjSVHQ
         pQq8wfyaQikFKlNgzV6/734mh1udWCZqJzfRziyFAExv9PVbIqyxfZyVGbaHnRuNcSe1
         hf6ndMx+SjUHuSJ76fT+498xEp42tDitZL3BnnOCodNChV6aqb2MOXhV8C1XgVUdlJmx
         PTXA==
X-Gm-Message-State: ANoB5plfhDWeBqJvaZe7b48womJ/JGvh4NYpQ8UYXGTfXQzVi3pdYVVT
        EJh2gBTIsulvwBEh7s2zbLondVE2toT7WLVadEFBlA==
X-Google-Smtp-Source: AA0mqf4aJ/wn8/rZOpjcNmDgKuBNSY7gQc4XYDzGpWeNqqtWmfWzsOAVWg92uaXpGMVQk1UUbpJznBJem3pCyRO9b+4=
X-Received: by 2002:a67:fbd6:0:b0:3ac:38c7:1bdd with SMTP id
 o22-20020a67fbd6000000b003ac38c71bddmr9516770vsr.9.1669300066238; Thu, 24 Nov
 2022 06:27:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7> <Y39yackN2u7q2Fxs@sol>
In-Reply-To: <Y39yackN2u7q2Fxs@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Nov 2022 15:27:35 +0100
Message-ID: <CAMRc=MdUTXVV1tzvFdU8c9B_CeHjYB77A-EW4gSoK+VG8PbB_A@mail.gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 24, 2022 at 2:32 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Nov 24, 2022 at 04:15:01PM +0530, Viresh Kumar wrote:
> > On 23-11-22, 19:37, Bartosz Golaszewski wrote:
> > > Could you take a look at https://github.com/brgl/libgpiod-private?
> > > There's a branch called topic/further-libgpiod-v2-updates. Can you
> > > check out commit 5a4e08d546a8ec32757e6c9cc59d7a16939721ea and tell me
> > > how you'd make rust bindings work with it because I'm out of ideas
> > > (and my comfort zone)?
> >
> > https://github.com/vireshk/libgpiod brgl/fix
> >
> > For the benefit of others, I am pasting the entire diff of Rust changes required
> > to make the C library enums named.
> >
> > The part that can be improved, but I am not sure how, is the Error enum. Maybe
> > Miguel or Kent can help ?
> >
> > The problem is that the InvalidEnumValue Error needs to be generic, which makes
> > it:
> >
> > "
> > pub enum Error<E> {
> >     ...
> >     InvalidEnumValue(&'static str, E),
> > };
> >
> > pub type Result<T, E> = std::result::Result<T, Error<E>>;
> > "
> >
> > Where E can be i32 or u32. Currently I just cast it everywhere as i32 to make
> > it work.
> >
>
> I don't see this as a problem for generics.  Whether the enum is signed
> or unsigned doesn't need to affect the Error variant, much less the whole
> Error type.  The Error doesn't need to respresent the type of the source
> of the error, it needs to represent the type required to convey
> information to the user.
> Just accepting that the InvalidEnumValue variant expects i32, and casting
> from u32 if necessary, seems appropriate to me.  Unless there are some
> extreme values you are concerned about - but then you always switch it
> up to  i64 ;-).
>

In that case: Viresh: can I include your changes in my patch (giving
you credit as a co-author)?

Bart

> What is the problem that generics solve - that a subsequent bindgen or
> gpiod.h change might change signage on you?  If so then cast them all
> - even if the cast isn't necessary at present.
>
> Cheers,
> Kent.
