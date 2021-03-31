Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEB5350072
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235537AbhCaMfL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbhCaMex (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:34:53 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7996DC061574
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 05:34:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id z8so23574357ljm.12
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dFqjU9npbfAiJPjQLmI+M+RybtJ5vhGUyhsF6doSqyI=;
        b=h0SNS0Wa7EhYwbikHHJIVisUd4LFJSO2Nz44p7BadySlsBJ62fo0hFepZxl2aWHIqK
         dtMieivVFKi0ZKeVvHhSYJ1B6nzORdk3MAD15n/jaqdllb/no7mRu/qagqBhg9yKUjf/
         VaakvGRVrFeVQKcEAironzNCOcgn9/2etFkRpKRP1Bw/2vNJ9ngzhXQdFxE72eFBzbdd
         e/myUoCdhWzGEPhS2L7DrFmwfpxL55vnBS1zNaJeI1305MQXwr65h5QldndkhgxkDLAe
         mpCvzXTVsGA7Tb2YbJFGg2NVxKN+aylib2XHPy1vLeU96imgAEOd8jMz5TsM4DxZS7Zf
         YC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dFqjU9npbfAiJPjQLmI+M+RybtJ5vhGUyhsF6doSqyI=;
        b=JnyD+LfZ1NpRHSonlv11bXzn7R41qQWlCTEuAWOwqlRlyR2FtRVcxVSnDDqM4pcGbP
         7VWv3czasv5aKXkGoDJDux5nKrTF95fGIVOYb2pb589PfQ4zWcemo6quqTrPNxTzw9pa
         w4Dd/mYVg2K5ZhWDBLOFHge7C9OvJttUBnbECHLUUlTELnY/Hj+F8XBzungWPVtySzgQ
         RFLBu3+RzdadPCG0PrShzTZMqdTDogt/ejcDFKhFVZ6fuQeUJho4UingEtbxVRo5e9Yr
         E2wWePcCkBDV88DEntQECxPXFXK6Zb3zaYQq//OpuuDbWbs7p3phsL7FRbnPhCL/ssu1
         wokw==
X-Gm-Message-State: AOAM531jWl0LYbEAfEJRwJpLsGGI3Uit7RLQKyKf/dls8X05CtkA5V9d
        Ul9j4oK6FLriUnvzF5vZpQ4rspQnE7MymWmc5+nzL1dxBRgzfw==
X-Google-Smtp-Source: ABdhPJw3cme6kjK0vmUWk+gv2oZ2HGJXaQ1HG6k80Zij8UVamoe61YuHvdLVzeCEM/kTpX91grpKC/ENa+Lxb8pR6sc=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr1866248ljj.467.1617194092044;
 Wed, 31 Mar 2021 05:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210330103225.3949-1-noltari@gmail.com>
In-Reply-To: <20210330103225.3949-1-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Mar 2021 14:34:40 +0200
Message-ID: <CACRpkdYMSy-gmcmFKsj2fKzFbrb29RLyU=ah4Qa4c4gdXwnCnA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm: bcm6362: fix warning
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 12:32 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> The current implementation of bcm6362_set_gpio() produces the following
> warning on x86_64:
> drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
> drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
>   503 |        (uint32_t) desc->drv_data, 0);
>       |        ^
>
> Modify the code to make it similar to bcm63268_set_gpio() in order to fix
> the warning.
>
> Fixes: 705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

Patch applied! Thanks!

Yours,
Linus Walleij
