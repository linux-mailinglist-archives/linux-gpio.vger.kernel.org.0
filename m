Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94402CE952
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgLDIQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728013AbgLDIQa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:16:30 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDA8C061A51
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 00:15:43 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id f24so5566730ljk.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+k1qgO29JdecjqgUrn+EfM03fZMfShm+Q74wK2D/vk=;
        b=XmRLwbRlU1vLghBqdnHzKLXXvFM2BGFTjmqYq19H/7CXWhgk5YxxLxfpmu12fprlUu
         CZEkG3olajP+EHsE2RaKc5Nl77RD8ip8xEjFqiTb4XRTKkIlbyL0vthPeVU5pDQCMqFJ
         4qjdl8G3Wot51SqgG0FXCHPvRxQYFPyNhbRi4bH6l8qVUYDUDdKxBxwoPvH/uNKD29Zx
         yIWh3nBH8Zwofw1McYh86M1AqDq8LJaAwSwTkfPSYBx+DjkLB0NQJcL4nd+j+n3+pBam
         4/5x5smmjssGVZyH72FoHwuNgbaVWAUNaaJxEi9XECAgPieZD5hvuFSOy24SAHDCzFCU
         JKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+k1qgO29JdecjqgUrn+EfM03fZMfShm+Q74wK2D/vk=;
        b=YF+x6VEZOrcdqjIuRVN32kqyvKy5CSbYCIjqKcqlWHJFMlClDhGPxBltLYqW7fRQZT
         cCk9QPOWvQx0O/ZNJ3vxSPSC5XsTXj6u/CRbT7sui4JpOX22yd2AMczmY2NMmJR7nh7R
         +nBZneIbjijksEDWe2POjKGeYCmlyMZiBcS1pCTu6zlQX/j65hO/pRz0C7AgOnKe2Fs2
         AeWD7Q76ZJ75iVRUByOiPUOLzYAtgO9IAEOkQZvMkMOOyZ+BJhvBDT4YLCVMtYn8ECzl
         Ql1ZxD5qr/fdacE58fSJKw73d3QYyP5vRhWwwajVWmsK2NE3rfn2av9hvwZnt5tlUKAx
         8s1w==
X-Gm-Message-State: AOAM532FhMrhrmIDdompxAOI7bfb/cJaVMUj44plvetMiTmIUWK8FdbS
        sNS90ZzdA7cpsCRDYB96jVKmhY/VfbSJlvR2sGioi/53u0T8YA==
X-Google-Smtp-Source: ABdhPJx5xMLC2SbQ/cP1+LTC/MdYRBq+BrK80il5gK/ULug9NraaulJu4Me/HwCV6NfEThkAlAzq5Yy27AIZiQyJ6B0=
X-Received: by 2002:a05:651c:39d:: with SMTP id e29mr2709273ljp.144.1607069742412;
 Fri, 04 Dec 2020 00:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20201203100448.17201-1-brgl@bgdev.pl>
In-Reply-To: <20201203100448.17201-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:15:31 +0100
Message-ID: <CACRpkdb0Z2gPDhRxT5V=FXF0mOG=tJkR7Mbk7LK_xko4NN3mjQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.10-rc7
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 3, 2020 at 11:04 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Here's a bunch of fixes for you. They're rebased on top of v5.10-rc6 because
> the gpio-zynq patch depends on a function that's been merged this release
> cycle but post rc1.

Thanks! Pulled into my fixes branch.

Yours,
Linus Walleij
