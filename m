Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AABD2B8D4E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 09:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgKSIbR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 03:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgKSIbQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 03:31:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5FCC0613D4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 00:31:16 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id s30so7029672lfc.4
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 00:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dD9rky4ve/3yeOeb2jz9nhw/ArNmnvoFkM24bv6ZR5g=;
        b=YnWWSkbIJAH+Uwp8ABh7T110r4gA98K5j+2KEuG+K56xqOwP4HjnvsuWc/uuMY5ijN
         o4yaGwjvdo4uXLVlx31vl/X5BZ+yivt9AKIAjeEwoalAg7Xlav5K27ilcBrHSY0rVgP3
         sWS1y4tKULbg1yvmjrNp9W/WIH1E4XgtbT+29l9GlWBli5XDUdOsKRltG0xti4W558T9
         1F4AsNvgcVquGOJhaw0dLYQ5oBwXRs6Zka8A6oGDowIdEjsXF5ZAa9fHBm8e1d4ZPcXO
         30OOk+pnMBEayBwQYSDWw1GoeDsO8D0RPvfoO4Yppwh+AgdBmO4yiOas/mYxK1vK0Q9L
         wZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dD9rky4ve/3yeOeb2jz9nhw/ArNmnvoFkM24bv6ZR5g=;
        b=HQMCW1qPdMSC9E9nnzl+aCNMMtDu+rTzyRmMu3wm3awXZEiTp3TYfnJySsXvW2UNgh
         kMgeH7Z6kMprNIfIa3BoDJEUcD1DCC/35ZkEEXvYojMoyGiBZXV2qTF0Lvob0HzrDma0
         w+BcsSioJ2AD/DLHaSxUoz4EHErFbC9kZrDUxWrGfZTt3n7w8oe+a67v+SrSihx1dnYH
         FiNs7E1qymDNI4m5PF5HaC3lO8Klboqfreu2xxcfGKo8B3M3h8BzkD6sKmGpuBwuKfcD
         1kZ5MpMoA58WJ3jK2tJRhH0t/aJDhq/eL33H8NXFUaKuCXf/ZGS+y6+dCwhTycp9wYWO
         mJZA==
X-Gm-Message-State: AOAM531m17oJzc6LUOSa8MPSSCz1eGLgns5cSJkpfW6k9+S0W7Dg5zkt
        nLuK2nVIw4jk4IBwfcnd9HC6XCbiwgCUKnMXumlA3++GjXNx0Qty
X-Google-Smtp-Source: ABdhPJyqJRaAClkp4a64WIVvSBr/IrIDpykV6ouzcE3hFbLHF1HqEypodxtBVqNmfbBOW+5ivHBrSzR7XmjLB0okI+M=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr5113364lfq.585.1605774674867;
 Thu, 19 Nov 2020 00:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20201116152625.GA20187@black.fi.intel.com> <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
 <20201118141811.GV4077@smile.fi.intel.com>
In-Reply-To: <20201118141811.GV4077@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Nov 2020 09:31:03 +0100
Message-ID: <CACRpkdZO+OGvYVF1+ZxgnaMO-HUCCJ2oAJPQgP_zKQwXeOLtCQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.11-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 18, 2020 at 3:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Nov 17, 2020 at 10:24:37PM +0100, Linus Walleij wrote:

> > Thanks! I merged in v5.10-rc4 to the GPIO devel branch and
> > pulled in this on top, works like a charm!
>
> I'm not sure I understood why you merged v5.10-rc4, but in any case thanks,
> result is great!

I merged v5.10-rc4 because the pull request says:

> The following changes since commit b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3:
>
>   gpio: sifive: Fix SiFive gpio probe (2020-11-11 09:53:09 +0100)

And that patch was on my fixes branch, which went into v5.10-rc4,
so in order to have the base commit in the devel tree I had to merge
in v5.10-rc4.

Yours,
Linus Walleij
