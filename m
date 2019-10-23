Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080BCE1DBB
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 16:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733186AbfJWOKx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 10:10:53 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:34203 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732167AbfJWOKw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 10:10:52 -0400
Received: by mail-vs1-f66.google.com with SMTP id d3so13878151vsr.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fG37TgkjRgodwOFImG22RhwIkrCCrAzjQbxW8lk57aA=;
        b=D2NK+E0jUEC6S8U5LXxwgNzVFeiIChH36mUSdgsJZx4/1Q0yUsGFQ91kDxfv6nmUdo
         d73pvbw5WW0VT366SU5S69b9U1t/ZLipm/28Q5/rXMHI3/fuMNLkJwXwQFb8iJvGBbTp
         olEDcFDWzo9IU8jfTj7YpKqO9uSrNl8b8wFkuHZh0nfE73ZGxqA+Smbbav8zQh4iUY+6
         jWGV2W3ThEDm0sRQunB/wKmyPNdiZLPvXGPL1nEp0en1JoDwjSOihiN0fl5YYT+GM5wQ
         5G1Njjcy+15KJjhQ80PzwazP1lK8UnlMulZozbwZM3Crn+yZ5OPbifcFN8T90x+mfgO1
         0+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fG37TgkjRgodwOFImG22RhwIkrCCrAzjQbxW8lk57aA=;
        b=d4vfHhrQ+0aFvxSvBAbzgHH/1WDlYhG57nEaG5O/COzcIl1/821yfW11H3DgeXlHKE
         v2FCQy+Hn4fXF7L5wnJ3p64kcgfBKNiFUcUGTQdG0FPb1/y0S6Mk6285J23lbMB7MwkV
         urQG8k7oqEoPupGoiLne0XUkUrSEtcfyjD/tZ47bAqJWBWlCCYJIaPFPZ7ZyVPqjDhEo
         Ebo3B3Vsmv6IwFIEG0iubvdDwvQHSHbsuGP4JXcdOUPdgV7a9Epue+lsz/XcuBdhk1Qn
         whA1x+AneLI+dizBYCevVOhLq2ZneRpDdXU4+RMTcq6+wvlsdhIoqRnF3GECnjp2hLBb
         engA==
X-Gm-Message-State: APjAAAUMr6JrGtK5Ba+vzQE7ZuPy9TDZA9bhUINd/XMeVPoRdnBc38oH
        2arwVzvXcg/tnD1SipyN+NIN8D1DTfTXV2oOr5xhZg==
X-Google-Smtp-Source: APXvYqyBN27XhVntB3JqKmKsl042MmlixEPkG6vgrf/n1wSvy5PQikVfBPMGE09acfAUnJ/mSqYDFU/nehFejtIl/LE=
X-Received: by 2002:a67:7944:: with SMTP id u65mr5866520vsc.10.1571839851606;
 Wed, 23 Oct 2019 07:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Oct 2019 16:10:40 +0200
Message-ID: <CACRpkdYdfaLBgw=dGAK+xyhX3ru9SYa+QPNyAWJD4Y=BbfxUKQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] gpio: pca953x: Convert to bitmap (extended) API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 7:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> While converting gpio-pca953x driver to bitmap API, I noticed that we have
> no function to replace bits.
>
> So, that's how patch 7 appears.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Nice, I see that Andrew picked up the patches so no action required
from my side I guess? Else poke me.

Yours,
Linus Walleij
