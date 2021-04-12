Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C4135C7B9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 15:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240002AbhDLNeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 09:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238002AbhDLNeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 09:34:23 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3305EC061574;
        Mon, 12 Apr 2021 06:34:05 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id s14so1812516pjl.5;
        Mon, 12 Apr 2021 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pjHW4XTRsl1wYF4qZYdcelMTAy0IBBCksHH1WS+omlE=;
        b=MnPALWznjnz/cu8jMvdqHAG0Up0fYcBUaRQSpUsWkhQbKEfoZUd9ATvHUIK5gA0NVu
         HmyIYWad0CWwaMS7EsQsJThFbwSacdbHQeMV1i20DxBWW6B9QTKq3zQmzjgybOooxKnP
         htvxPXSnRoPsHFlE0BOi9V83y/vob1iQ72VkZVpzKfKToikl/zLGlL0G9Wqf0/18grS1
         KjxwGmp7tBcHU0PTOZ8dBAmHL6khTTS8hVhG3xXZ0PdaDlrxCvPXFspzLx2QhSgqGcK3
         HMBEnCk2w8ggM2Q4RzX6Eam1Sw/7eltdSteLn8j2S7cl3m4/3TvARSwYfwUV5qIrBE+t
         uw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pjHW4XTRsl1wYF4qZYdcelMTAy0IBBCksHH1WS+omlE=;
        b=ReaZ/s4F+nav9OeVQ5T1CjVRriuzGFcUt6bjEC/pt1Vb8xjHAeSdpK728cLNQp23lq
         XoPohnAj/DNOjQY36LIn92F7RY31EQr84PKDyJHa14qdDdT8y1ySaaBb1UaMRuEnQJSH
         AghQTb1bzPr0irPXOGl16SnkEWZuhfn5JKt99YycAsYAsTeeoqXe3Kesly+LSRyTrPbG
         93WcfDpNqeMLVZ8UBHNhAB+lhbc7vLkLVSMIUaphI/7syIll+xRH/cQ2JY+LSaGbGh+6
         13r++oKP74mZ9FWSaMmj5IqMoAi9EqXcuZ2WGlDOM69OfNDTsaVGPH1wh92ofKK6/GDA
         Torw==
X-Gm-Message-State: AOAM533KGpFEFCvoHhFnLfU9LoFxQeq3LZiE/L9v9i2t7xVUHRvugadh
        SEIIIv0k9mCu5WlEXYR2yBUT8AE/UWpQz1NwCYo=
X-Google-Smtp-Source: ABdhPJypL6Sgp40ZheF9duG6Z/2tCTtJ9JDjKbwColpcsDzH1Okztn7XqqAbB9SliJcoyjFRqfRUEjPgvwzgWkVA9pg=
X-Received: by 2002:a17:90a:5407:: with SMTP id z7mr29801094pjh.228.1618234444625;
 Mon, 12 Apr 2021 06:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210411133030.1663936-1-pgwipeout@gmail.com> <CAHp75Ve=1EbJ1qOjnTLKOwvv-UKLfxMHS-UUp=ET0zoJ9fV=ng@mail.gmail.com>
 <2004066.IobQ9Gjlxr@diego>
In-Reply-To: <2004066.IobQ9Gjlxr@diego>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Apr 2021 16:33:48 +0300
Message-ID: <CAHp75VdWES51UPiKayYZ15Mr7pS-Aaz51hKNFmyhbv2JqwPwPA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] gpio-rockchip driver
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Peter Geis <pgwipeout@gmail.com>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Tao Huang <huangtao@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 4:30 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Am Montag, 12. April 2021, 14:13:37 CEST schrieb Andy Shevchenko:
> > On Sun, Apr 11, 2021 at 4:35 PM Peter Geis <pgwipeout@gmail.com> wrote:
> > >
> > > Separate gpio driver from pinctrl driver, and support v2 controller.
> > >
> > > Tested on rk3566-quartz64 prototype board.
> >
> > Can you give a bit more context?
> > Usually separation means that hardware is represented by two different
> > IP blocks that are (almost) independent to each other. Was it the case
> > on the original platforms? Do you have different pin controller (or
> > it's absent completely) on some new / old platform?
>
> They are separate on all Rockchip SoCs.
>
> I.e. the pinconfig (muxing, pulls, etc) is done via some registers inside
> the "General Register Files" [area for misc registers]
> and control for the gpio functionality is done in separate blocks
> for each bank.
>
> Lumping that stuff together into one driver, was a design-mistake
> from younger-me back in 2013 ;-)

Thanks!

To the submitter: Just for the future, please elaborate such things in
the cover letter.

--=20
With Best Regards,
Andy Shevchenko
