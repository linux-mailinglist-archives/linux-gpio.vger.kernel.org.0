Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510012D857B
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 10:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405462AbgLLJ6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Dec 2020 04:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgLLJyn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Dec 2020 04:54:43 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB514C0613D6;
        Fri, 11 Dec 2020 23:07:24 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id y24so10481121otk.3;
        Fri, 11 Dec 2020 23:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Flhom67ds9ymrrKQK7zkgwpDlDfY/C0Q9ikgWxRj8R8=;
        b=GdFx2pbu4P8FXB13bFwq2ESsRhj1ey2X7JeaUrRLkwwYnXNKphABc3htJRMeoZAWOi
         I1E/TlO4KxYEQ4BQoMEisYew5A0FEuJl9XaZER07Z16CcGyX5N/WTOCvT3heqsYzNv+R
         axVUcrii+caR3kqM7ecKVqL19nQQbwLirQM8yZ4v+5sswdd6iDfueK+5rPfxuZQccFr2
         IKqbX6xouMTtztwV0wS3oz1CSryNW/41BvU87/1r19KULBG9SkjU+Y+OISPZqaK62d+H
         EyQsbM+PGwq65Hyx608W2sJcHXikZIYOa69oGJR8djjhtldjy3mqjLkHPAMhH4+bLVoN
         OHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Flhom67ds9ymrrKQK7zkgwpDlDfY/C0Q9ikgWxRj8R8=;
        b=imEdER7f3qNnLlYxqdkWpz7BVY+2Dmy2tAoMb09mpxU4R8aWrsm03o9KR45NFf5uby
         lFzzVZhavLXOG5oF79KKXzxn009itp8LJt+ZHV9NtGGcKVsAvYrlS1XC2RBrRvhSqyMH
         0vQJcPT/xu8QCsoOT78m1IJxiHuSmWgOKDWuj3gtbL0RjzHvuBvySadF0AC4UWbtEZbd
         9SKzlnWF+taNz7P8Ztvl+5bYsbmuXZIOTzg8RsNCzsnZOCUqpqPXEqfAC4bGSplOvmdP
         XeQwKRTDXuxEu3l0J2WDLk79L0ae0FnxqNHrRyudrXQa9p4m28kt/9qKmLXvKTk9+OZx
         4DiQ==
X-Gm-Message-State: AOAM532LQnKmRvqtESO8wRthrNwaJ+ElnlWjwpDfM5h2xCeUL2NMek7G
        MbpU5HwJ7eBuXmZhep9b+1Co9FFmMSvnB9jCkgSL+Yjc
X-Google-Smtp-Source: ABdhPJx67J1mwkC0UPJwy1tZ8U4jal9WssG0nKYl/10dEhTsMC4VM4W/0hr95qUNdVIYSa0hr3ZS+SYvpd7CMREWy34=
X-Received: by 2002:a9d:1f0:: with SMTP id e103mr12701957ote.74.1607756844044;
 Fri, 11 Dec 2020 23:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20201207081151.7489-1-sergio.paracuellos@gmail.com> <CACRpkdbXZ2t2w=DJ1ECGj7otNJhqoxq2xt88hBhRVbnkqcA+Gw@mail.gmail.com>
In-Reply-To: <CACRpkdbXZ2t2w=DJ1ECGj7otNJhqoxq2xt88hBhRVbnkqcA+Gw@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 12 Dec 2020 08:07:13 +0100
Message-ID: <CAMhs-H9BSbvY6Z7TygG_BrcVZuy+-2Uo_B+GHsYZFy4JUN9UqA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mt7621-gpio: convert bindings to YAML format
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 12:24 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Dec 7, 2020 at 9:11 AM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
>
> > Convert the mt7621-gpio device tree bindings to the new YAML format.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Patch applied with Rob's review tag!
>
> Yours,
> Linus Walleij

Thanks for letting me know!

Best regards,
    Sergio Paracuellos
