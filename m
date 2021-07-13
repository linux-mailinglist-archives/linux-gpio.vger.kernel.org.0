Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC373C6D17
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 11:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234849AbhGMJUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 05:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbhGMJUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 05:20:24 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44E6C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 02:17:34 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id s18so21063255pgg.8
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uqNhBNG+4fjzTOl7sjGDlkVinj+WYeIv4tJx8HDvc4=;
        b=nMnp599LusQm69nlZwtjgkns9ZcMncO5rgjHNEjzMSZVtmzxow7AeRE8qfRjLHXco/
         9auDrn6ZIQBxSSJ6f2x+imo4E7asdEED1oubWq2jqATsef/f4Hnpr4bacRsit0hxJBG3
         Wpw2xao+n23tY4pierLE4U7fwlpy+w1Iysjf4QRf3HAJCSoeNfS52s9vUtZbCTymwP9U
         r2Uhab5syzXIUG9Mhmv7MOfYs1IzJl+YguCHkXZHn6k2EN1qZdkDTri49nClcX7gbE92
         CL/hIwFtSTKVz+AczNREkvX7QdYfBGa9Kq7mWgAaaq6nNe0QjY21M1Fr8BJG38DqQpVn
         U2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uqNhBNG+4fjzTOl7sjGDlkVinj+WYeIv4tJx8HDvc4=;
        b=L631evrbkWDEXvk3KsylCehGZL+Ytk7GgAYqpdJCqj2qEHHdSXR+/Di06N6brr8Om8
         IOcsnjihGUAVyOJCHl2eDULBUSGBciTxkumxULJbG6hhqLGdHOMGwjc9I8jKPhotpWuG
         EUEJploryz2aBS1382Er8OoRfB9UHPFNgWv/8fC/9goz17AQ+HbabTWYtulxLn+SOT/v
         WH5xFqmgu04d7yXfmqmxZqRLXDlaE1/dL2t4HqplC35mjCKDJAR8jVQzfpjNJkOrUkl/
         AxHrpSjJ+i75CkWndXN8/Wnvesg8KXIY6iP7mXZK87D5eBU4QAed5bDGu1coAek+tZA4
         WtLA==
X-Gm-Message-State: AOAM531t3J7pVvkeJ4QcfKpRooCg82yS/usgsrJvBBSGKP7Brml1czBm
        ZekDFqDEYRQZ6i54Nfvmnb6PxaiCGtWEh1fC5hs2qUtRHoW9NBDt
X-Google-Smtp-Source: ABdhPJxejWwk04y9+zOm3WNF/rUZxHSXrc4eFIwFoJFoNxRBgNbPbWiyJjufoJsuzlsB9kprrEz732+AV09S7irgPnU=
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr3449827pgm.74.1626167854361;
 Tue, 13 Jul 2021 02:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210712210836.GA3636@cephalopod>
In-Reply-To: <20210712210836.GA3636@cephalopod>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 13 Jul 2021 12:16:52 +0300
Message-ID: <CAHp75VdSVB4shmAO2Oww=UU_5pqR=W3JZ98ChjZwZaRZ9gbVdQ@mail.gmail.com>
Subject: Re: [libgpiod] How stable is the v2 API?
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 12:09 AM Ben Hutchings
<ben.hutchings@essensium.com> wrote:
>
> I'm working on a project that requires GPIO debouncing and is planned
> to use libgpiod.  But debouncing is only available on the unreleased
> next/libgpiod-2.0 branch.
>
> What we'd like to know is whether the current C API on that branch is
> expected to change much before release.  I don't expect any commitment
> to API or ABI stability, but it would be helpful to have some
> indication of how much change is likely to be needed in a client that
> is written for the current API.

I believe this is the right thread to discuss and influence if needed.

https://lore.kernel.org/linux-gpio/20210621191830.10628-1-brgl@bgdev.pl/T/#ma70b1ab80804c09644f4a018ff5eff10464b195a

-- 
With Best Regards,
Andy Shevchenko
