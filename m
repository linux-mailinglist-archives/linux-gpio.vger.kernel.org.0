Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E1641677F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 23:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243304AbhIWVdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 17:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243273AbhIWVdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Sep 2021 17:33:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B385CC061574
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:31:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p29so31218683lfa.11
        for <linux-gpio@vger.kernel.org>; Thu, 23 Sep 2021 14:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rSGexge/yTWailPe6Hp1VQxkjzvMXlLhdnN0SKm1jgk=;
        b=sHXkka97oocc/Avp1+G2WMg9/Kqe44NKcVXC8YurMm1Q5arTOo5d7SR2gd6B1r8KGQ
         u/j2JVVDjd7ly5+7pexUjhyoYw3zCMTNN52V8f/V4vvVFsLVZsvA6g/ApYzKnvyLyT3t
         wYJoedt+57XP5OjI9uDm3fzhHhOVPCXmbOZJUkYJ6fXWAOnwi+QCCYi10flo+mOzSS8S
         5DDRevo5UgdPYGZgjQyhPBVeVHY2UqrDzMR6bTYXos0netmhu+Nx4SdZZG501lTgi3QX
         ZBRqucDMnx8uDcnfDk5sLD3v7M+mWcBAuosQEmQmNGGhAzRWVFiFacjPHmn42MSpnvJJ
         zGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rSGexge/yTWailPe6Hp1VQxkjzvMXlLhdnN0SKm1jgk=;
        b=DkE35HZYcas7rLfkFeh4Oz7OLir2/hVlJAYXVumTNY7CS22InQrMagUU5GP/gmACtf
         T3S9B4uB1vhU4vsqOR9KCUlMcF0HHcJ61mW9sYliIU5DnnmdAEb23EKSTBXgmfali0Hm
         aJXK241Ra6+9j5XJhLqGh6XkPVnDvciF/Wjj0GfEiK28RopKr7gInCkjznKFYY2ii1Nj
         FoexbvXxjToSsav4brdBds97nmHYv4hZvd9+tei84PSE1i9yIWYeMNZkOgFCcsO5IlGO
         Wy5O3nlB+TdrTD+eWXEfEtjXgxohb1KoT4VLjKtMHTIIdVUnmXcf2xxcVkMI8G/3QiaO
         BzAQ==
X-Gm-Message-State: AOAM530tLdmjNarmdEKP7gJRZxjXfeP0HWZMnxG7MA0k1hivSfkhtGEg
        pu5NTlnqCnk4bHxfzUtbBEFgw5r385BdNUgJDrn4Og==
X-Google-Smtp-Source: ABdhPJy2mfR57uNliZEcdzZTcs5ysF9NDOwlJSo6qcE2nsS01XTmcffsKxwYrHi5ZVuTy9LqrP5bV2aG6k/zenW3gho=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr6179225lfo.584.1632432696061;
 Thu, 23 Sep 2021 14:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210922025640.11600-1-zhiyong.tao@mediatek.com> <CACRpkdYASy3KMm4VXPrMyvVpONK78gwRn6kthK534pjWb5mhvA@mail.gmail.com>
In-Reply-To: <CACRpkdYASy3KMm4VXPrMyvVpONK78gwRn6kthK534pjWb5mhvA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:31:25 +0200
Message-ID: <CACRpkdbM3hoAxMSaoGDzF84rxmawghHFcSdibs9wANxWn0iynQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] Mediatek pinctrl patch on mt8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 23, 2021 at 11:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 22, 2021 at 4:56 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> > This series includes 5 patches:
> > 1.add rsel define.
> > 2.change pull up/down description
> > 3.fix coding style
> > 4.support rsel feature for common ICs
> > 5.add rsel setting on MT8195
>
> It appears we have consensus so I have applied this patch set for v5.16!

Speaking too soon! It appears there was still comments on patch 4.
I blame my gmail.

I backed the patches out for now but this is starting to look really
good, try to make sure the patches also applies on the "devel"
branch in the pinctrl tree so I don't do any mistakes when merging!

Yours,
Linus Walleij
