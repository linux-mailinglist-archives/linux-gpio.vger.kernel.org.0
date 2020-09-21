Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAA8273517
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 23:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgIUVn2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 17:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 17:43:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CE1C061755
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:43:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x22so5643901pfo.12
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2020 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=asYRm/SFumXdDArao+C6BYDYKMWP66N60oziE6h/3rk=;
        b=DTaqnJ8pnVOjpRmJDXJ51ltd3npFeq7YrLqPJhJPqgqYYbOPFE/zh+HyqpVAgrzojw
         tjBJgcztvNcoBlmQdsj/k19iT3EqZEqqGzjO3xdXGLQawggSPPL9WYPLorz6DQEPTKx+
         ne2FdgCGpRn18RqFk0w+3+yHcpVRrvW7LKAG52gKChqDK3llUhac6B0angJUFDaCEJm4
         9F7pRELqebD1Pdv7KYvZyRwjgtiCxotaVtk01sfWtb58U19emrPzqgioudgOOcCDVL+q
         uJjM5iUHJC2OURMwAe8K3NY+xR6spP7xNGyEA/Ohfzg8qs06MNPpeQE6jwBDvtwWUFXk
         Mh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=asYRm/SFumXdDArao+C6BYDYKMWP66N60oziE6h/3rk=;
        b=YMyaNB7fs2ehgRIZ5KwXOoKAucdn1oPE3seQ7HiF6qJRORKrnu3ENi7sWYQWgmi49I
         8JHOqDUr3+bsxcEvU5ZW1fBUFFa3zV9VNBPPnyvp1kA0w5aloBkOL7aaogLtEi4+E8Nd
         2bI+2PzX7MkWPW/zpGTSnehn+ewRnmPyoXtfCk6Gai1UwdLoVrO5e+eDDLA3hGBCvQAJ
         AsLypup232vsVT2aEV7GAgG9BSqjEX656b/PYFNOm7n/Je4fmpQtLmPpfI0bNzPzb1yX
         og9bVbDiG4sRGeS3tzYRRfuWEs8Uv6fMfx6sqql5uejI/z/VebLsY8vDwvUHHcBFQCgM
         HPoA==
X-Gm-Message-State: AOAM531xhgAG8IIQZl0dNBnYOLCKur/fAOBebC5G4hNAvNDZ5nLmFliF
        Qg92ZaQYjY1amZf80+P5ZCUfPT+5oaQhbnvzJpeNGS8Xql1SNg==
X-Google-Smtp-Source: ABdhPJxhpRAEbJ46dnXAC1D44dN8XfterSOwldM+uqWiLfc/yJSkHS29way+/S4rUMQp8pkHTA79btXj/i184+Vv7v4=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr1511956pfn.73.1600724607375; Mon, 21
 Sep 2020 14:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200914155714.GA43910@black.fi.intel.com> <CACRpkdb7tP-Zz0ycpss885nWOx-LoT6iPmRT5b-FrBM+x8aLpA@mail.gmail.com>
In-Reply-To: <CACRpkdb7tP-Zz0ycpss885nWOx-LoT6iPmRT5b-FrBM+x8aLpA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Sep 2020 00:43:11 +0300
Message-ID: <CAHp75Vd0L7AZnWfZQBycztS_OEORb4J=DQpS_cjdOf5cSOQRkQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 12:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Sep 14, 2020 at 5:57 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > One fix for v5.9 cycle from Hans.
>
> Hm the pinctrl fixes are based on v5.9-rc2 and I got a ton of changes with this
> so I suppose it is based on some other -rc.
>
> I will attempt to just cherry-pick it to fixes.

It will break fast forward. Is it a problem to have v5.9-rc4 there?

-- 
With Best Regards,
Andy Shevchenko
