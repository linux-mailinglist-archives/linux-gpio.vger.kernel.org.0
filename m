Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3223613265B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgAGMic (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:38:32 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46865 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbgAGMic (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:38:32 -0500
Received: by mail-lf1-f67.google.com with SMTP id f15so38729999lfl.13
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xNdg/eGe2spHZF8Ar7NLXHqFtzVzxyf+teERuO/bVjc=;
        b=IBgA2Em6iQG71nytT7MVKkAkSpchm34hogp9nrPDVFD2uq6bE3RLvT5EC2lmzO6J6c
         Dbg1dYo4ATLwVPgn2RytyJdEgTF84i4p/VdfrHVBASGlIo/MAWHtdDIDJErP4DFAXMh3
         aN4WgMRJ1rLGHzDYNjfegkvyLIlgRMuRRr2IftbxWokVUQTvks65sqQ/2lcGa1brrus0
         50pN1du3FO+emJhqwhHyfYqrCvhVETASPAVhymc1hEnaXzq3JRmoVXDN00dq1VCT5laB
         Q+0jWOsP1P9M4W9EabnTv4RrlSWAniEilZ7hgrBtP5rtkEooAK4qRb4b+dGg2y2mIqYi
         dXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xNdg/eGe2spHZF8Ar7NLXHqFtzVzxyf+teERuO/bVjc=;
        b=eVFNLTgyu78r+z9MoQv28bS7rW9dcHSczmrhE3D2ttTMuHyXjtk2ghQafYm2ZtJQOC
         qROGsUXF815wymvCbuMimXaorDh+gC+6mSEN/Oi5dpR7l1KgV6CgJ81hhfklw/cjYfbW
         9BoRNt7WPiCe5x6ivndiajlXzlyJbEyM5L6WJvPY8nZScBDivE/c+e1J1+h7SihK5PI0
         shs8PiQcGQJCWwz/wdtTqHtmRsPTnc14W40Bb25KtVCufgOZx6ZCQ8Sk3gFfFoTkP79F
         TznYwu2gBnDLuD7G7jjn+TDTT3EXLkWthSN2m/IBvUZ9phXuaK6OASROn+9VXhOkdtWN
         kclw==
X-Gm-Message-State: APjAAAUOQhNe8HcJ1STU/GblIE0mmhx4Mk7d1fSAvp8FMs0zzWa2tANc
        sDG/pi55AxGYqEBIsaMcCWYR5OyJkJGvAH1bwMizDA==
X-Google-Smtp-Source: APXvYqyjy7HCbuFJZMBW/ujChvDuspmEEyJbLXUF8TFZisyKZFmn1M7N7wpY7pWWtfq9hM2MIuNebIt0EKDUy/5fjNI=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr59247202lfd.5.1578400710421;
 Tue, 07 Jan 2020 04:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20191215183047.9414-1-digetx@gmail.com> <CACRpkdYAKS50-CNmE0nRNQanFxKejoHrwxho3fZXROoLZUb4+Q@mail.gmail.com>
 <CAMpxmJVi1hy6a72M7rAHP0AXW1Z4cGp8H0O6ayLMwFm9UL3WPQ@mail.gmail.com>
 <CACRpkdaNAzpDu6uxETnuDGxnXTJTh0LhcE=9DL9-Kwi4butZLA@mail.gmail.com> <CAMpxmJXbR8=esuKhMKzD8LGFC6_Rz4uQXJ2egCXGLj_eauxS5g@mail.gmail.com>
In-Reply-To: <CAMpxmJXbR8=esuKhMKzD8LGFC6_Rz4uQXJ2egCXGLj_eauxS5g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:38:19 +0100
Message-ID: <CACRpkdZZc2z9_9tjwOEYCuv1fzrqJ7Eb5UK-T9GA+6BqBYe_LQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 10:31 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> wt., 7 sty 2020 o 10:29 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> > > Ugh, I now noticed I responded to Thierry only after applying this to=
 my tree.
> > >
> > > Anyway, it shouldn't be a problem. I'll take more care next time.
> >
> > OK shall I drop the patches from my tree then? No big deal.
> >
>
> If you're fine with this, sure!

OK dropped them, hadn't even pushed the branch out yet.

Soon reaching the top of my mailbox so I will be pushing the branches
for the autobuilders and later tonight for-next.

Yours,
Linus Walleij
