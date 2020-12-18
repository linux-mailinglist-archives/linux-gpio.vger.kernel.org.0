Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D662DE719
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 17:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgLRQBr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Dec 2020 11:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgLRQBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2020 11:01:47 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61936C0617A7;
        Fri, 18 Dec 2020 08:01:07 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id f17so1581907pge.6;
        Fri, 18 Dec 2020 08:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DRM/wBZDVRUf6b3umPWfvNsEtcdrtOMQW/bD+f2otgU=;
        b=KGL6XFshSDIGuPnWo+jL/LRsXLpvUktlDkWZfYWi1f4v3svvLiXJ8R1RZP8NGEADuR
         H7CWqKSWQaOJD1avCfj0dCW2S83YVSUr4ruH8U3MWoCFCQCGALq5dKxJIiw7GNipHWId
         HW6H8HT9O/75yzySCljS9Vb2rRxLMo6EfRyj4VTKaTTKkf6rjOtFAVt2oyJOsQMdOetF
         6kFn9MYUFlB+D3UhbA821cB5uPwoYvNCVYPusAU4ehtLlxj0YCxUvZKbCSf7UgQw9kFN
         RClczXzyx48+0MOH+eP7crd9TxYBJNlZ4doIYgNu3lDTvwkXbTuQfDuQblqzAYd9Uik4
         TFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRM/wBZDVRUf6b3umPWfvNsEtcdrtOMQW/bD+f2otgU=;
        b=NrL2Sc0PtJfsUThNPAICuLTL0qCaDiYyt1KOpWChpoJ76YLXSEaJ9SFIOsWIl05QFq
         SsANO+RbCtCwkbFceAu8Kkxrd/ffHKpurkbfWXJ6Pqf3DbRsDrF4mEGHdv1mvsAdJSHZ
         oQMmfIR8n0YU7Q9v9ygeyzjy5JRiKqnKvS4XAdKr7k3dL3mIlP20zFSzzL2K8frbboL/
         uouObV1HYOhGZ9c5rlVVjpBGoF8nlomAN6qJbmduv4dPXVL5oZwExbTJoSYYgId9ZRcN
         vzYKBNSEz6mP5415DJP2EA32etYTEKm6Z3g5pnm0duSVI5gcS3ESKFA8yClA0iLJPzAu
         7TuA==
X-Gm-Message-State: AOAM531vpTuainLYiOqtZPG4zVXtum7bo/IHZHBz3fEokKU7VHo8pQ/H
        PUgWVOIjLfJcoPJ6oMZScPeQx5Y0ru38NX+RYnY=
X-Google-Smtp-Source: ABdhPJxDkK/OPlvT0Gz8glaf95BmqQokOcq7IqBqzVNc2OhKjypyZwk9RZpoxdqzfbFHqQlNoTWdBxfWAqVczvQvtd8=
X-Received: by 2002:a63:74b:: with SMTP id 72mr4772037pgh.4.1608307266722;
 Fri, 18 Dec 2020 08:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20201211042625.129255-1-drew@beagleboard.org> <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1> <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
 <20201214214419.GA1196223@x1> <CAHp75VeN9xLUKFBXZfo=XzNkdv=BSRJW59=cUjyY0TekF1JONA@mail.gmail.com>
 <CAHp75VdGEe9F69=uzaDiCf9C8byh6ThuCJLMch1dBXEH4MA2Sg@mail.gmail.com> <20201215224212.GB2086329@x1>
In-Reply-To: <20201215224212.GB2086329@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Dec 2020 18:00:49 +0200
Message-ID: <CAHp75VfbEE0t2g=uzux5=dhgAHwv15OKpVr+xrF19VskO7HnTw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 16, 2020 at 12:42 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Tue, Dec 15, 2020 at 09:39:18PM +0200, Andy Shevchenko wrote:
> > On Tue, Dec 15, 2020 at 9:36 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Dec 14, 2020 at 11:44 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > > On Mon, Dec 14, 2020 at 07:55:12PM +0200, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > With regards to parent directory, I did discover there is
> > > > debugfs_lookup(), so I can get the dentry for "pinctrl" and create new
> > > > subdirectory inside of it.  This is the structure now:
> > > >
> > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_35_pinmux/state
> > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_34_pinmux/state
> > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_33_pinmux/state
> > > > /sys/kernel/debug/pinctrl/pinctrl_state/ocp:P2_32_pinmux/state
> > > > etc..
> >
> > Missed part to comment.
> >
> > I was talking about
> >
> > /sys/kernel/debug/pinctrl/<$PINCTRL>/mux/<$PIN> (maybe folder, maybe node)
>
> Thanks for the example.
>
> What would the value be "<$PINCTRL>"?  The name of the driver?

The name of the device instance. This is already done in the pin control code.

> The "ocp:Px_yy_pinmux" directory name comes from dev_name(dev). Is that
> the name you were referencing in "<$PIN>"?

No, the <$PIN> is an actual pin on this controller. However, I think
we probably don't need this, just supply it as tuple of the parameters
to be set: like
echo $PIN $STATE > .../<$PINCTRL>/mux or alike.

-- 
With Best Regards,
Andy Shevchenko
