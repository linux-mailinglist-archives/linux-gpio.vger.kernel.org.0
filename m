Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C371E32ACFF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448183AbhCBVS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578603AbhCBPZZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:25:25 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAC5C061225
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:22:13 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u18so10774327ljd.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f7QSrAX2oqY7QLjr4MxaIMFXX49EKilktcV2ECsEf50=;
        b=cAq5Pz+8cNmAYm8ExEJ9vm+wSdHVgbjmay62d3tVTEqElC5eYgW2ldc3Gnk1x+fI/G
         6GE+3goeGPkCEoXaLkGgz0MeJAfwzvSlC3K1+ne8sGjj/tS+KOZkuW1dksS6Q+0Vdld0
         T2hMc7/1ANQIcr+avbf47sElOB5vcaHlu6XZFKvg6dSCMXsdbop34ABaKfUkdrs20tz+
         IFR4GDsXNd9vq+8kUhiSrYOTYPSUp1bRo7JNEkd9Es+gqF2ZBgYlOqeffj4Kbu6/S9M4
         pvwKsywYu7a/Xpr867+K70RoANlkA6ZHm/iA5DLFYfFRLECHLk02AtoJvo2MWbiLf2Iy
         3rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f7QSrAX2oqY7QLjr4MxaIMFXX49EKilktcV2ECsEf50=;
        b=Wsy16hU/QhNN4nHdIGfu1F3bBjXbUSaD/LVezqM1IU0KF8QiMJSDDvDm1eJXDxdXEZ
         0Jj9qL1Um5psAGo+cIbZdQNV7C5sS891G2A6Gjt0Z8HJKf0LIudyrdb4pClda+ixt5Yh
         LOGA9/nMtVxE2SxCyykdfMTi5w/D7XajLSm9JrE0dvzhjVVH8AkYR96BtwLDCIgUtk4p
         G2vTePfXaX5x6vbk2wt7O+Y7uPXuVDxm20nuNmBT385Fbpk4d5lXfKZDCe2Vvy7a2fOy
         VxpGTvewPfdhXyj0InQ9sM0MLGd3KHz+6mo31lQMdWl43QD9g1evhwt0hFrMIgkt96S+
         JJwQ==
X-Gm-Message-State: AOAM531yOHDl4a7fSiTofFI88f0W71kW/H8jl6h6wF/l231GtfCc1WU1
        YD+5oQWXLlFhCzatSOLWpJQlpXGzZm9TJyzW4QbyOtAChdfUAw==
X-Google-Smtp-Source: ABdhPJx8R82A8WHsc3N/khCrQlVXn1aC5i8ZAMzKuDJ7RHWDwOiw3j2ZB3RZnLmIOBWiwevgGmCVy4o5lfwMV2nrjxc=
X-Received: by 2002:a2e:9041:: with SMTP id n1mr12412389ljg.273.1614698532143;
 Tue, 02 Mar 2021 07:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20210225164216.21124-1-noltari@gmail.com> <20210225164216.21124-4-noltari@gmail.com>
In-Reply-To: <20210225164216.21124-4-noltari@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 16:22:00 +0100
Message-ID: <CACRpkdaL1-Mw85hrJNbKk0rY2txeQ3bYVS9TYpwQ=+R3Wvxpug@mail.gmail.com>
Subject: Re: [PATCH 03/12] Documentation: add BCM6358 pincontroller binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 5:42 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add binding documentation for the pincontrol core found in BCM6358 SoCs.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

(...)
> +  interrupts-extended:
> +    description:
> +      One interrupt per each of the 4 GPIO ports supported by the contro=
ller,

4? Below says 6.

> +      sorted by port number ascending order.
> +    minItems: 6
> +    maxItems: 6

As noted in the review I think this interrupt controller is hierarchical
and this is not needed. All that is needed is for the chip to know
its interrupt-parent.

Yours,
Linus Walleij
