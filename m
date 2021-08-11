Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B7F3E8CB4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 11:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbhHKJBA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236328AbhHKJA7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 05:00:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313CDC061765
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:00:35 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m18so3410467ljo.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ByYMlbMTyxkiBAaSmL+WOHNG/B2x6QEQfrThcArQKRw=;
        b=Xn2tYDqZkw3fKcnhQZLg6e4OaqolCiGbM848DSvUY18JusO5D+NdAuA4WuQxXRSYrT
         /5EMIHXOAPJ5utshYtZquuBHQKvCv9syhSFaQSvqQxy1G1KpLDGqPH5ZZ9Iv1SL4QD5Q
         mA+t+YGkJLNpyPaeObi1Ve1IRZZHmBs3t5p757rQyU22tVAKLjaKGsp5GiraguJvtvA0
         UOn4pPGrubN5ZT1RvwP3qy3chzJ1xp8SvkmvvWUJTIYbM6n9Pomc6/Cq4hzjPOsaFuMz
         yQDF39mH4OUR8yCfJLmu7/n6jlWSiLeoH2HgYYEAaBJnsE2WffF8DPDGimOcoJdpVL95
         fUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ByYMlbMTyxkiBAaSmL+WOHNG/B2x6QEQfrThcArQKRw=;
        b=PfSMZPyfw5h7nDzenkd33LtA/2oLj3We+R+BsO/HGf1JESzZUmM84BvsO6C30T9h35
         BdgHSifRBVursoKdJYRV2nrB1UOXy0lL7t+s5SfmH5xgh3hOYzgMZB3BQ6Q37CyoUlYS
         3FYNeDp8YlScQHRQKOJYxLQACIleYqfhOgHVOrUzIqqGjrDkrQ4dtu130Ve987zZHcwL
         b74+wMkTSk1PhSMgIrfM6ED28vBNFeiowXqgeFTWAbh15v/GGEly5f1LwW/srIz1874v
         gtcWFflTxitT+Ad6XEs1I217UPSLB8/M6+th+nPaLWKRlnK3PMVWF6BOCFM/ghXue0Qy
         ECog==
X-Gm-Message-State: AOAM530xkV1NV1G3h7mFgsMTemDEwVKAG/Ue5QZ9N02xaWUjfDw24heO
        qgAKljyuSc4JquZbyCj1CDvHlSPO/U7+mTXAdV5CQw==
X-Google-Smtp-Source: ABdhPJzPGdg6StS/V0/ilLK95SVU9vwc4TnCmVmPA4yxIJY2EvfBR5qOtuosUnK2p3OSXtx8OTSM9RjguR9Tgv6OaPo=
X-Received: by 2002:a2e:a4ab:: with SMTP id g11mr20952ljm.273.1628672433464;
 Wed, 11 Aug 2021 02:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210728144229.323611-1-krzysztof.kozlowski@canonical.com> <20210728144229.323611-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210728144229.323611-4-krzysztof.kozlowski@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 11:00:22 +0200
Message-ID: <CACRpkdabg6vDKSRL6_AJUOMm6L_zUFCxf9nBz-MbfA5rLGcHng@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpiolib: of: constify few local device_node variables
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 4:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> gpiolib does not modify struct device_node, so few local pointers can
> point to a const data.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

LGTM
Acked-by: Linus Walleij <linus.walleij@linaro.org>
I guess this needs to be merged with the other two patches?
I suppose in Rob Herrings DT tree?

Yours,
Linus Walleij
