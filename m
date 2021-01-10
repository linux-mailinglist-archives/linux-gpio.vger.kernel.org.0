Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E537F2F0490
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jan 2021 01:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbhAJAZb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 19:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbhAJAZb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 19:25:31 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B628C06179F
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jan 2021 16:24:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x20so32101800lfe.12
        for <linux-gpio@vger.kernel.org>; Sat, 09 Jan 2021 16:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MaNjSrG8taLJEzXd4CfVhlhv+S87fFrkBRWdE4GXbNU=;
        b=G8CJ6yX91fKSLE4hDDwBLWMD7zoM/coT9SC/zm9kWRyySwDSMvvyHUFNWSMzgok6SO
         Lxn5dJDH31e0i0pe1U/qnjX/hiAuZbs90ZAqY53pPMVzmMtdgDerq08JTffI9NWSBSZB
         IfDutdLr9GtspwSxrBNesP1zKWI00tRSii4fBGexW6C4Ohc2o38OTrpecKWH23DWz6i2
         bowTwVCAvxljAKg9BdqEjSeu2IgVTWok6FxoKbkoB5v6Icvu5MCHgA0lOGkOWlts6Tpe
         NpwdN2lgiOrjYeo1D8JDG442LUnAaM5m2E4VpvSD8San20rdGlIh90BG+347KxbSHL+X
         m1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MaNjSrG8taLJEzXd4CfVhlhv+S87fFrkBRWdE4GXbNU=;
        b=GsqXuPMnoz69LIROx3ZSq3rRYuF/pfThsAPD/xMxYzSjL6sRkd+nrgvMPPheTaed8k
         qf0MuHd4/P+c0jFPaYFudDErjJqEVgsbMUx2hGYiapR4+RFFSjRcrAte5RPSRztHVpG0
         PLDSSnBSAc+5AR92YfxyTnj6oc79NpfZDuSrOls8rAWbqbRW2xzwNRh3gAHO0PSl2HJ5
         99XuZjyd8Pr5LfP30UOqzTib1JGlcok0jMkdrkVul5clLwcYR9lt8uBvW4xA0peugcRV
         Z9sVqhu63dXClAA5WyvsvFpZT4NG7aKvILR8R85kwD2npHU9i9wrn4//IfG+LKgZ2nkG
         jUiQ==
X-Gm-Message-State: AOAM532Fd+7SsJvYGvon3cGsE9t+6ko9u6SPi0WzDBBC6N+CJrXa313L
        Y/cIOylvRO5v5PH+i/Cs1L49MqYPT+pzqbLgFmLs/w==
X-Google-Smtp-Source: ABdhPJzWhUb8OaCqZ+wGW3wghfI4OfSe4HcyYD2SElJtQEE0jHkfmLE53PIQAkoRBbNxCjll818U9BU6+WvJ1RvEg5U=
X-Received: by 2002:a19:6557:: with SMTP id c23mr4137115lfj.157.1610238288101;
 Sat, 09 Jan 2021 16:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com> <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
In-Reply-To: <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jan 2021 01:24:37 +0100
Message-ID: <CACRpkdZXgN91jKBDvf=P5_6ObOaacQa2PGL3-jP1gBW__ZyOaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Mark Brown <broonie@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 10, 2021 at 12:11 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
> Il 09/01/21 23:11, Linus Walleij ha scritto:

> > The major review comment is that it'd be nice if you look into
> > using regmaps register cache instead of rolling your own,
> > and also possibly using regmaps locking rather than your own
> > as a result of that.
> >
> Actually, I really tried to use regmap's FLAT register cache and after
> many, many tries... I had to give up. I just couldn't get it working. :(

This needs to be root-caused. The register cache in regmap is for
using not for decoration.

What is the problems you are seeing?

If it is fundamentally so that regmap has limitations that is one thing,
but I want to rule out that we're just not using it wrong or that there
is a bug in it that we should fix.

Looping in Mark Brown the regmap maintainer.

Yours,
Linus Walleij
