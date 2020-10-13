Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84CC28CF10
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 15:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgJMNWA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 09:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgJMNWA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 09:22:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA084C0613D2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 06:21:59 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a4so20379907lji.12
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ACveS3MnDWEz76tc05B9yNTeKoU1SrKlur/INU6I8SQ=;
        b=fRcwWfj4xvsx3uJBVGKYyGUPdAf08QiBQ8DH27c+wOV9DsEKVBf0h3DzcNMzSC5RIi
         lr3OZJWBQFBLIHvc+5IM4jdnhy5Aoq2E0sc7gCCo/W8vFvubOixYhQGcrCUBsIsTOhp2
         tjvu3D7wFV78gFfZAvGXSmSEdWV4rD/D8XvuPWG4P4m7Jlksq2naSAQWqjBtBVh01/5d
         /bOdZGL4NcTt6h6TsLyh0j/CNxqZENrSmLgrUaB/JY6dyHCAd596EE33Vf19zGPd6PJC
         wXdRgz1B6tzwND8puQeAcdo5qjWL9VIBHfkx/RIQiiVhnZ3R1VwKFFfTCaLX6XSaUVIh
         YWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACveS3MnDWEz76tc05B9yNTeKoU1SrKlur/INU6I8SQ=;
        b=gLlrmwnVB2A6tVNrnUW0O4V9DplX3MKtmNjWxyt7zxYMrw/fQ9aUrhlBzA0It4XYe3
         ov98+ugpaQMg8Qvqu/rkzjwaFzIE28Z8B9p0zWvnojY5p1jdM5TDn0V9WgZ8ExVaHcf0
         OtXZ882M6zLUrdItCE6vQE22NXdERnqOpIzvDnw+D7qlaPZ384KfGOuEXc6XVGGif7FA
         A0jo+NWOfdWG60GGz9fuh6L2uJMxgP4U8Bfkt11XgsNyOlL1IQ+7GU7IRwHYGe4PFPxp
         zAq+AJpp9tFZzXO1cyOZpPyrBAxjpWn04UBPxKjre7hlW8Yykrtu8xexqEA9S5apcx7x
         Bw0w==
X-Gm-Message-State: AOAM531DwFdQhL5IGTyn3EqbGUVbhf4fwYkLapN4sUABztPCIrVTL6kD
        NSD5EZXlvBR/6i5l9Y8PaiaS6GWoRaz2Sywby0DqLA==
X-Google-Smtp-Source: ABdhPJzDHYR/9h8G6d7Rsd3jkAp3Sn2PQxrdZWXTAzZqH7q46HJwJYT+M4TyeoHepiD6MgNw+q8RzuudRY3rJHawaes=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr11816992ljb.144.1602595318063;
 Tue, 13 Oct 2020 06:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com> <CAMpxmJUbxuAHmcf_1vP27qb1gSXTfE1OBb8X3MSoESpa=pycgQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUbxuAHmcf_1vP27qb1gSXTfE1OBb8X3MSoESpa=pycgQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Oct 2020 15:21:47 +0200
Message-ID: <CACRpkdZ+9-bFg1zYXE=ppGUa0OY0f9-+QRefd1q1OMsLEdh1dg@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 8, 2020 at 5:46 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Mon, Oct 5, 2020 at 9:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > I'm intending to add some GPIO chardev documentation to
> > Documentation/admin-guide/gpio/chardev.rst (or perhaps
> > Documentation/userspace-api/??), but that is taking longer than I'd like,
> > so in the meantime here is a collection of minor documentation tidy-ups
> > and improvements to the kernel-doc that I've made along the way.
> > Hopefully nothing controversial - mainly formatting improvements,
> > and a couple of minor wording changes.

> For the entire series:
>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Linus: can you take them for v5.10 through your tree directly?

I am waiting for Kent to respin them addressing Andy's comments
on patch 5/5 then they can go in as fixes I think.

Yours,
Linus Walleij
