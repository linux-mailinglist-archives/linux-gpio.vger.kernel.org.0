Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1269634CF2D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 13:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhC2Lfk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbhC2LfX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:35:23 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72808C061574;
        Mon, 29 Mar 2021 04:35:20 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so5764998pjg.5;
        Mon, 29 Mar 2021 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Umme6mEPlLLIx55BS0/fsIeUWDF0jAkw4yGXSPzrUwc=;
        b=brFXGjZHymZcp686J9d/6p2f8IT65PLY2NBImZxpbx5+mGPhPaKBwL+hAGI1XLqNWU
         nB3ac5y5ej+oc5dRA8Y0pIj6Ywpcib2ECoDJLC2AC7wvbvYdBNIXejmAQWr6M9vEYGlm
         XGemkv431JO08H5OPHM0pLE4OaLfs4vS+eaG3jYmizQU6Ek/eqe2fZMMPClEtpODUkxU
         ff8NLv9S+KzN+vVr8CMFY1AUwPHgth2vrZrwzcWkfiGTWmzyq3LduA5Vj+v22rldOWtm
         kZ2wm+it+9TY5ZZQqvWTiplmGjslQJu+WC6YXdO6sU+tlVwqHnkzGskt96p21B1W61QQ
         Nq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Umme6mEPlLLIx55BS0/fsIeUWDF0jAkw4yGXSPzrUwc=;
        b=qgk64eJ5q91nAWLct1CvRHjnemipstaK6m2eCxt/b/CyoSgfkJgEzRfR3LkEEyUdAr
         m7n5FKydlVvaIBTWWtH77W1n4ROiQyH1Kiv/Gd2fCYpIKvR7llcbJXu3yqZr06AXXFJp
         APeTTyLz6H5kz9AmyWDde5uBK1h3D/9BLuKveSgO6DSTVOEkLVC1YAKs/70CMilwe5Sg
         GHkgSR3N83qxHo87U7sN4TSSKo+Hz5R0yYpMvGbXJrGbqsxuF+uXnpdM5hOL2QuVXao/
         HDqjzcszTM3ilIiRQEMhDU+bvUcoCYaoWBz2ORP1kQHvTvnRe2YsdNauWA3LGdYBiMq+
         8t2Q==
X-Gm-Message-State: AOAM530bmUsJKY7Y4qPEBjgUmQwgEkIqASbP2pyvKbt7mFRLjoGXqltp
        e2zjVf4lBVKO35+ERxnFN/kTMuZGQ2AUJ0Gj33M=
X-Google-Smtp-Source: ABdhPJw9Z3cD04cZW1D9XRH2rAhuFWVzadwm4hfCMZEGCTzN1BM+n77RrvvFbcEELGixncXb6MLAn2pEtP2QhPhPYic=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr28359551plb.21.1617017720012; Mon, 29
 Mar 2021 04:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 14:35:04 +0300
Message-ID: <CAHp75Vc7x=VoNqQKXOyxhkixR3SivQn3yGkejTkZ8bO0Tv6bDA@mail.gmail.com>
Subject: Re: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        sean.wang@kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        jg_poxu@mediatek.com, biao.huang@mediatek.com,
        hongzhou.yang@mediatek.com, erin.lo@mediatek.com,
        Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com,
        Sj Huang <sj.huang@mediatek.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 2:32 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This series includes 6 patches:
> 1.add pinctrl file on mt8195.
> 2.add pinctrl binding document on mt8195.
> 3.add pinctrl device node on mt8195.
> 4.add pinctrl driver on MT8195.
> 5.add pinctrl drive for I2C related pins on MT8195.
> 6.add pinctrl rsel setting on MT8195.

Patch series w/o version is de facto v1.
Dropping to v0 seems not right.
You missed changelog.

So, send v2 properly.

Material to study:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-- 
With Best Regards,
Andy Shevchenko
