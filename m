Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707D3445673
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 16:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhKDPlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 11:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhKDPlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 11:41:02 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F2EC061714
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 08:38:24 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g14so22523006edz.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWnLFcwT7tvrb78BkLA2VzJNTVNmIKuCKatQDFfpGY8=;
        b=bquVr8mvGxGhCm78/2ZiZVH48HlPjT64Js+GQ16r7ey++dQwAi8wFlJDxxMTBkiSmD
         uMddJc7u8RO3sIEZnMEGhBFaSFOFP0iWgJyjFw6DG6rGdgQZ0fHQs35hFRYpWIKQu/BM
         BuLWE5gK56VlVuFLIyJk96dtYJTnvtPSXpsswsKg/ApbEbGSp21pxChOdlJhBYLRcK1r
         /5r3MVtNeHW1LBh9UJpnKdRxSfO7hQ2wMJJ6m5ZHmC/HUdJBGUApGTdYnKqwdMULGiqD
         ThkWxis68Kjv0/cIQ/+fm6X/uM1/g+x+2I05ux93m/mj/PTvkppf/M5X221/LcZGeOuV
         Xd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWnLFcwT7tvrb78BkLA2VzJNTVNmIKuCKatQDFfpGY8=;
        b=R75jhrnBdZFPBfhNKCFHb0OA6WEdGfioHBYVGPbPuKa+kfb4ZwPmgK+eY+/Ia+jDya
         FZ2WKLrG74m6MdXUdnyS9SrAuVoJV4Lj80wPJ6w7bGCPs3oxx/0VgEjQIo7iAdslhSii
         hpCd8i9njlwBBFBqlxcTfJo6w2mBE7HzwO2JlnI/USv5Wjn3qoIdJvhGhIH2jrHO6gGT
         H/EHBOkUtV0bQfAWdE0EXx3qwsoMzjA1lS4DQZlNFWqdoSsq+0YagspV7DxmoJ5EuZCm
         SFB6iA2obscxQ0P1LUkbp0MyqnSNMfehoc4wLN+KcFil2QvJWdssHOmdldSiJc+UHc5G
         0yBA==
X-Gm-Message-State: AOAM533Dfnmew25t65p/Cc/nJ3DOETQI3gPjkuXU1kbjr2e+QWMAj3uT
        fdicyDDi90FCr3FnO468YTB7uFzl7XVG6honbYR5guBpYcI=
X-Google-Smtp-Source: ABdhPJy2Wnt02ULsV8s9JjV2L/NY0u02M06Y2yUEdh7N5mBIKU2cP8MF+XqCmR9cwPYb+n3ya2GhLgwrP1jmGI+wld8=
X-Received: by 2002:a05:6402:1151:: with SMTP id g17mr66712185edw.219.1636040279674;
 Thu, 04 Nov 2021 08:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <ae639da42050ee0ffd9ba1fffc2c86a38d66cec4.1634813977.git.viresh.kumar@linaro.org>
 <20211022060746-mutt-send-email-mst@kernel.org> <20211025034645.liblqgporc53lkg2@vireshk-i7>
In-Reply-To: <20211025034645.liblqgporc53lkg2@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 4 Nov 2021 16:37:48 +0100
Message-ID: <CAMRc=MfPtRiBYxsTzz06qpUiNTSw4kPjz3B5YbH_WJ7zN6jvYg@mail.gmail.com>
Subject: Re: [PATCH V7] gpio: virtio: Add IRQ support
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 25, 2021 at 5:46 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 22-10-21, 06:11, Michael S. Tsirkin wrote:
> > On Thu, Oct 21, 2021 at 04:34:19PM +0530, Viresh Kumar wrote:
> > > This patch adds IRQ support for the virtio GPIO driver. Note that this
> > > uses the irq_bus_lock/unlock() callbacks, since those operations over
> > > virtio may sleep.
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > I think this can be merged - while ballot did not close yet
> > you already have a majority vote Yes. Worst case we'll revert
> > but I don't expect that.
>
> Thanks.
>
> Bartosz,
>
> Can you please pick this up for upcoming merge window then ?
>
> --
> viresh

I picked up the v7 I see in patchwork (but not in my inbox :( )

Bart
