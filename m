Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE413F460E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 09:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhHWHxR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 03:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235100AbhHWHxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Aug 2021 03:53:17 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D05C061756
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 00:52:34 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id q3so24861781edt.5
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1rfDGeeo5hi6jMlfgetDUtaokqcAh3kTDlXOyfReA1g=;
        b=FQRoTgDXxSFRoGuHCY7C2L73uzxtmNkskrpPHXd65NbK9pOyGfKpziIoGBzrQiKyOd
         HFEHif87s9drG//6M8qGTnxB5r5IxQTlatdbbHg4osH5mv5SIn9StgPwBa3TbHEH1b1x
         4WGczOnJOmfT3KG4ipxITSb3JztPm7PFab7S8mE/tstm2rjZQy5tHJLN6GeTxTnXwLhU
         8uYqaas2lYtH7NimfAgVR0g9uhMakyiQBH6xpYlepMIDgqt4mFROhUlJyiVHCKpEkiNX
         sCuJm+fiTeLpwkfisIq7odj3/I8rX76z4CL90TEKufHLb2GTUNI4+/p46hwjKITwqw3V
         PIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1rfDGeeo5hi6jMlfgetDUtaokqcAh3kTDlXOyfReA1g=;
        b=Ly4umW6ZgcT1+EJ9moBTReDmu+zmg1FS9mTlQT/KDH2KQ/9VlsR+AEKcdZi8xnOLjv
         n8VDNjuvoO/m04utJtbE9BmXJbJ7fg4MnjH0Ev2j1NeA3sEtFGh7tt9UAs7OovUHS1fa
         4tHTDFx5T1qUHMajTNKIJMSd1YtowdvqfNl+tCNJPpRfas8m/Cfy9hWXVL1bIZa9JdFq
         XQsut+37evU109QCcPsFFQK2MyMVkh5zKvickdCL2wkF7mxt5rYJ75EbDoIuS2+v46b8
         iYsh31lmO6E7QaRuD+KDpswvIM3kjOxUJ2nqBmsrbjmZNTRSn0L0ycFpJpFEHyJ5Gcbj
         6Q2w==
X-Gm-Message-State: AOAM532M9Besejal2HmuqnpuyEQF+KbHWwrRe02Le449g9q2aS+1yFN0
        hIejIL7Be+h04iDKf3uev3PMWJ6ki54FIQAuDJbzFQ==
X-Google-Smtp-Source: ABdhPJwT2r6zydo3fcEPQiiUbD5IYC++Da4/w0hicy4e2VN2bEllim1g0g3jFudSLhNStJ81XJi+dv8f/+m3dOba0y4=
X-Received: by 2002:a05:6402:1395:: with SMTP id b21mr35406057edv.119.1629705153070;
 Mon, 23 Aug 2021 00:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <56ca9b1fc803e393a67e875bed4f900c6a432085.1629347189.git.viresh.kumar@linaro.org>
In-Reply-To: <56ca9b1fc803e393a67e875bed4f900c6a432085.1629347189.git.viresh.kumar@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Aug 2021 09:52:22 +0200
Message-ID: <CAMRc=Mfm7EekU_LbujfPxo+NzGTErC44yj-aB+Zg8DXqo7eX5g@mail.gmail.com>
Subject: Re: [PATCH V7] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stratos-dev@op-lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 19, 2021 at 6:30 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This patch adds a new driver for Virtio based GPIO devices.
>
> This allows a guest VM running Linux to access GPIO lines provided by
> the host. It supports all basic operations, except interrupts for the
> GPIO lines.
>
> Based on the initial work posted by:
> "Enrico Weigelt, metux IT consult" <lkml@metux.net>.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Bartosz,
>
> Can you please pick this up for 5.15, the specification is already merged now:
>
> https://github.com/oasis-tcs/virtio-spec/blob/master/virtio-gpio.tex
>
> I will follow up with the IRQ stuff separately.
>

Applied, thanks!

Bart
