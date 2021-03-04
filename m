Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF50232CE44
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236511AbhCDITl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236536AbhCDITi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:19:38 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C956C061574
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:18:58 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id e2so25057278ljo.7
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKpE7AB3B8yj7ip5M0juhBDFHrYKd9OzJtgHmGKFGF8=;
        b=BFezrt5r3E509RL8PRm8d7nraqZx4eCLk6nI6xP6ZSqKCikGBFSgzHgAweQYoQel53
         8p8zDl8Xl3t2LfP1YcoUfdVmXYAy/3FUcIJcHKXl9mMI9shcfyi9rZXcdFseds6l0F2N
         S+iIb/D7p/N3Uqdg7FdROGaSNyAiHN77dQEvNt4YtZ/SGVFr+2X5Ien332wIjmkauW0o
         qQPvrwGPB3qstPQnYsdogXumOhy+wd2/kotFYpoCn0E+s7b9aII/vS2YAChNDuBFMnKl
         4qEW+X2n0eTWDeZTtIH5I6dEQYjW1nfHdQUWjFB3GhdaiXr9qcqvgOj/EHnA5zXAlTAC
         MkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKpE7AB3B8yj7ip5M0juhBDFHrYKd9OzJtgHmGKFGF8=;
        b=PgbGtCvwPzxjUqZaSBzoKyi4fyQCHlgNxf6Bg1ZawyxumDaf0shXl2MInhVCOnPTV2
         1lXyW1fF8Pp2UsYUgo9G8QMWRymUwFEIsDEbugSqVW3dBFHShPruPViaMaeOwfSdfu2q
         MwHtEYJxQsx6qDONiptiJWfbM6egiV/uhYGV9K7PLc0lLrvEH1jom1dYm1jKLmmmtE4i
         Ng4ol2q7ZAwuRtZEIF0wcyAMf2e59RIzY4QfTQv0mbP8NSoh50ZQo6K31iHxl+TphgX3
         dhpS68M7KLSnE8cP8bRXAdI2pLi/1PNCVR2ZIYl+HOq8pDabfVv7+ZGAhuHTXST+BoPW
         k9jQ==
X-Gm-Message-State: AOAM5328r7sgz1VoBTtC2YsTsAiP1gZ4jrwjQCgW6jmBIOgpAk5H+K6t
        MCKEN+Q1D4Fx/9cEier3HQ7VeACffLmeP+4Nl3kHCw==
X-Google-Smtp-Source: ABdhPJyRVTCRr6C19Jx3r+MDw6/bFutW7QtHtmn9VJKmj3yJqoG8YWzapGyq42EX3KDfZ7IwyeC9KLpnpe+UQbgCiw4=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr1580285ljj.467.1614845936659;
 Thu, 04 Mar 2021 00:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20210223064211.120935-1-jay.xu@rock-chips.com> <CACRpkdbqkCEMuZdwgfPJAhnZBKW1KV0+1MnXqNvTjm300jaS9Q@mail.gmail.com>
In-Reply-To: <CACRpkdbqkCEMuZdwgfPJAhnZBKW1KV0+1MnXqNvTjm300jaS9Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:18:45 +0100
Message-ID: <CACRpkdYkBD0-AWz6gWrxK_5GjM6_mSoJ4wR64BijsJ8juzuFug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: make driver be tristate module
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 2:18 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 23, 2021 at 7:42 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
>
> > Make pinctrl-rockchip driver to be tristate module, support to build as
> > a module, this is useful for GKI.
> >
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>
> Patch applied.

Dropped this patch again since it breaks x86_64 allmodconfig.

Yours,
Linus Walleij
