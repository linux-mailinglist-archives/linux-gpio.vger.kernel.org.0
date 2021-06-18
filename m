Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCCF3AC72D
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 11:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhFRJQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 05:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhFRJQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 05:16:20 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A4AC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:14:10 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id d13so13023168ljg.12
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fk/g4Uf4e6ndK9NTLJ4fya67I6nyHsWdWmINzLkYxxQ=;
        b=Ej/kae+4z4muiWg6EWVSQJZ0hKf207pahpJvxNxI5rzvReNLTOakQyMu0hPKFKQapC
         KdfIPU1/IY5qQj8piocGrYiAvwhAsKgD6Aac0EfK5OBIgHBnb0t9I5fWbElLuPl9j7uG
         f8EsIa72iX68DlTtcVZ2ZytW6itc2zcRTL2NmByb6VBTT/40OIdIokHxEx3crUwnaeej
         do28bIC90BwWHOqkQQANMqlKuQAUvGklT9o4LJ+nOW/mFuWiHSGCUkSA0RXj+USUl5Zu
         gL+aEhP1YsJsUvXvI7EYMZVd4VlDwDMgbNhmdQLYBjLy9adLLvADaViX2g39cl3yZ8oY
         AMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fk/g4Uf4e6ndK9NTLJ4fya67I6nyHsWdWmINzLkYxxQ=;
        b=IJGOfY8S7zx9gbX1otwkeijganEG5wdLAvWSsZhsINXFh1Z7BfQeR36i9ecRkXhCcM
         Cg+CcsJhH5RUnunkGjATSudxl6LNCtDHFdGhe5BoTAAEOBGGw5be9l3wDQIHG2VzZAol
         LGVgUNzQKzUyS78usObtG943bhbI2lBcgEHZWR5nZBr0MpZZW/D8a+xH5FJnsdUzGCOV
         yHNEi2GyM2tPZ3N+ahoDWeUWaVAmTypu2d7kMzdMkM7UMba6TH1S9I8FPUtzSK/EwVYq
         CZEDZeoerSlESTqbFbt9ar3pZHYTsCZo6xQtGutdVHz+I3vIksD3vWf/EQoZ3vcM5Zd4
         8Oow==
X-Gm-Message-State: AOAM531EHjH14wnJa03N4KYZUIpoUQ+zb1iRkXJGF04oHcTsII3Prws4
        68ZkouulO4LrDFLFCV8tUdLkhtDVNEw6OPKUXhI9mw==
X-Google-Smtp-Source: ABdhPJxO5angft3VVWPEspBXdSa1jj492/Lqu/sjYy6Szkm5Bb7VcFbM7lZNp02NJxKP3yiLMp83/cpYtRf0ZvPmzDg=
X-Received: by 2002:a2e:95d8:: with SMTP id y24mr2468745ljh.368.1624007648913;
 Fri, 18 Jun 2021 02:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org> <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <YMlwTiN4Y9bK3M4Q@yoga> <8d58da79-8e54-048b-db89-8c1caaa0320f@metux.net>
In-Reply-To: <8d58da79-8e54-048b-db89-8c1caaa0320f@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Jun 2021 11:13:57 +0200
Message-ID: <CACRpkda9g5JJyroTWi4C=2+YCABhKTyxvwvo3C4zGa=+xGWWfg@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        "Alex Benn?e" <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 16, 2021 at 5:52 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 16.06.21 05:30, Bjorn Andersson wrote:
>
> > Combined with the virtio-i2c effort this could provide an alternative by
> > simply tunneling the busses and GPIOs into Linux and use standard iio
> > drivers, for cases where this suits your product requirements better.
>
> So, you wanna use virtio as logical interface between the two CPUs ?
> Interesting idea. Usually folks use rpmsg for those things.

rpmsg is using shared memory as transport mechanism and virtio
is providing this. rpmsg is conceptually a child of virtio: when the
subsystem was proposed by TI Arnd noted that virtio has large
similarities in shared memory transport and as the potential reuse
for buffer handling etc was excellent virtio was used as
a base for rpmsg/remoteproc work.

Yours,
Linus Walleij
