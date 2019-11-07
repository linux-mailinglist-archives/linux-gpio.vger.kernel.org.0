Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11D14F2D6D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 12:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfKGL2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 06:28:24 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34767 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfKGL2Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 06:28:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id l202so1660890oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 03:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cpQjLE52lJkcpeVm6JFZFPxhm8Z9vm21QtBUWqhYBow=;
        b=htAguy5FW61tFrSkSlDOiv7+yjXbBbMO/yb00qULAZsW2ANxYVz00/vs8VkurXFjd6
         7px0Cw8oMBCJrE+LR/inEHVKVmVEm4EkpFf/My5TbEQlxXe0B7egABZM/oLCsM5X398Y
         ykSC2ipEX6k7aOx6w6A39tg6xfLVtm6CpKrOm3ewqkz4dJGoeBT8itlLcuVX83wkOU0N
         BddYYcebzpNwSJErQl/syAlBHlMKHHy5wfb+Kf23vaZynw8nzk1W3DogIdhgpbxpOWwq
         WLlolkCFE9n+RuICPoQRJ19sIvcSNXZPR7xgSEm4rHw20UXy74QFSpjXalNTDmVd5PWq
         /Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cpQjLE52lJkcpeVm6JFZFPxhm8Z9vm21QtBUWqhYBow=;
        b=XBiXWhW1KyEPm25Lxp7ryqoFPHDDeL9cc9zAkMfysfSeHvNXAh2mTH8ylpSfKeomsg
         uP5WiFwsyxzLasiQDeIfEeLeGC2IlRKMwBLxYU13zhao6Kv6sSwd2eKyc9sOy7I89trc
         mzo7/uDAmqccYtQPuHzhLepPelY1aGZ10bp4ArwsnE8cmAtZ+5hyXuClcjXurWjxNLWU
         bWd3LoFbx4SZeNmsZ655BAEWGUWVVhnhFgdEJrjq8zOmDli4Wn+fQr/9zVcE8+xgjpRH
         bNGXClI/x05csXw1D0uzAb/GDK26OnW5VX4KPON1vMJ4WszROYWi39oohn6YS3YHVavI
         KTRA==
X-Gm-Message-State: APjAAAXZL1OvcFSE2BcPyLUs2nKossOVZs7nBXz7zZr1KrmPsp2nM7OT
        MkJFxy0FQrLTTdmedZF1ni5L5W0Ni8FGO9PJqqrOaP7b
X-Google-Smtp-Source: APXvYqxIWTqQAyAkpyu7yKSh8ZoNQyGU4WKdSLfICR+47q0HfeXLrJi/ylT1m3TTo3D3pnKl1ekVDVJxWcpW9JZVkA8=
X-Received: by 2002:aca:b757:: with SMTP id h84mr3030666oif.175.1573126101414;
 Thu, 07 Nov 2019 03:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com> <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
 <20191106064842.GB3478@sol> <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
 <20191106165804.GA12770@sol> <20191107103943.GA29374@sol>
In-Reply-To: <20191107103943.GA29374@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 7 Nov 2019 12:28:09 +0100
Message-ID: <CAMpxmJXJRsUUU34561jVjQEot58N27P8UWFz292yq_XRSW0ftA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 7 lis 2019 o 11:39 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> On Thu, Nov 07, 2019 at 12:58:04AM +0800, Kent Gibson wrote:
> > I've pushed some more changes with the updated API we discussed earlier=
.
> > Those new tests I'd added now pass.  Yay.
> > One problem though - gpiod_line_set_config as written has no way to
> > accept an as-is direction.
> > Hopefully I'll have some time to take another look at that tomorrow.
> >
>
> I've pushed some more updates to my libgpiod branch[1].  They fix the
> direction limitation I mentioned (I was using the wrong set flags),
> and extend the tests to cover all of the SET_CONFIG fields.
>
> That completes the C API changes.
> If that is ok with you then I can take a look at the corresponding
> changes to the C++ and Python bindings.
>
> And I guess we should move this libgpiod discussion to a new thread?

Yes, and better yet - you could simply send these patches for review
and we can continue the discussion there.

Bart

>
> Cheers,
> Kent.
>
> [1] https://github.com/warthog618/libgpiod.git
>
