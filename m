Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA1D2AEC75
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgKKIyi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgKKIyh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:54:37 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6231AC0613D1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 00:54:36 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id l2so2170096lfk.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2020 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aD1AfCvZlvWjOPfJpMntzLU6+ypH7NUl69bOZ/Wxqbk=;
        b=s7+nX1K/OJHLO11XMmTdSdA+MQE8moSXpnO9nib5IGF4ObtIqIj+bDP24RgiPQg4zJ
         JSQklC9ZLIebDipupC4wVcr2Yre2xhgXhqJac3EBaQriJsnVTL8tTgmeYoZC6nw0/Nhr
         zTqs6KiSghzwpBXM9YKFkoCS6qJig92khJ7x7Pu/b8mHtmo+vtltnKlu1A4yKz24bB5B
         dRpwSo+LJbckjfCkE7UcbCrJgXgRV4cdSOnOgXDfm5OEVWtTpylqGvYdn/7/kOd+GHL6
         Wg0w6Xf3EA4L6m3Ph7pSvpK2WtcbsGIiSD/0iovJlVvKqHh2diltJIxmGkJ6YEjNds4B
         Dj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aD1AfCvZlvWjOPfJpMntzLU6+ypH7NUl69bOZ/Wxqbk=;
        b=BogA87rLU4AiCLw9lYHQ2jeZDtyusyVktYWYSEjcIz+Mi7eDn9zGZGrB753KeN0Wtz
         9+krXMbmL8dR4EGmayfHla+lJ+HxbiLrdhm0MDKK1+d2NdZk+iF5JDWnyJh0xzbluZAu
         gIgBjthvgItuMY/xNjNwo8QsDM7nmbeL4DYyT5pVRGDltLX4Dy2aYFEl9iEHWB+HE28E
         Yij1GKJGL3mJfECbLTi1lXA9cyOyaH7+fhajLA2FY1qS2z1Zo+w5JugdaCuR3mSguklV
         wvPOrGY4GlFPfKqyAoFB1IKbLSb0S96qPKDW9Ip70Vb0Vndh6m+y80XShB29ZWmWA7k5
         8ZPg==
X-Gm-Message-State: AOAM532zbBaDQyVp7U3n5cHiuaxrgxdAxNDTVOTqKLobqGbwv+nGEahS
        +aMiXygKPtOITJQsSfqI923LZ23w6Y93D9oDGwZ2ow==
X-Google-Smtp-Source: ABdhPJzSBoQWp9WPLNXo2qnhAfYTqUxCkYyYqcrkPjDDVovOHwT986yuSnhjzGjEskWE8hTdRWErEe1Kl+s2OHZEKwk=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr8747179lfm.333.1605084874837;
 Wed, 11 Nov 2020 00:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-10-damien.lemoal@wdc.com>
 <CACRpkda1Pd3hTiEHWDOAz3zCMA6WK4VmvjkNv0O_ckFaWQ-zSw@mail.gmail.com> <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
In-Reply-To: <0fdee1f9986af095a3f7d329f8907cfbe49dd7c0.camel@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Nov 2020 09:54:24 +0100
Message-ID: <CACRpkdY1sgkhPfb+ci8oXqw0N7Gr+Pr_=3Auh-mH-8yWcOUR=Q@mail.gmail.com>
Subject: Re: [PATCH 09/32] riscv: Fix SiFive gpio probe
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 8:00 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> I just realized that I forgot to add a Fixes and CC stable tags. The patch
> should have:
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Cc: stable@vger.kernel.org
>
> Do you want me to resend the patch with the added tags ?

No I just moved the path to the fixes branch and added the tags.

Yours,
Linus Walleij
