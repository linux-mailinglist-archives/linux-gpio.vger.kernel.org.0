Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE4227E58E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgI3Jrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728169AbgI3Jrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:47:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4353C061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:47:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k25so1007832ljg.9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ol/xccxtcNaUn5n/W3xWoKSpLgUl5lz2xY3r3AugO8=;
        b=HOHADYLC0y2IrheXLaEGwD9rtt8CSvpYrABU0NMoOff2N7i5xWDIyolYguSu/rxYG3
         crVmEoxBJVMBAjHcC8sIBYlBN5zDpvWwoW8L3inLjcHO9aEqAJOiELTZ5Al5P2eEcpoa
         tWW9cv/StO52LiuDDrh1Pog8NexiLuZoElT7sVs2igD9k4DwcHxfYAXC5tHZAyUzasfN
         pcjptIkuodjmPCMmwfAbnLMTi8edmmWa48q3NI70UOUEMgGPXpAvhwbql3FIOw7aVaAJ
         4NsPXSf7r2zV05WOOtFJDSuq0TFDexprTnRypfnVESDmJecMcVQ4uPljeAZnAw+9Pj+4
         LE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ol/xccxtcNaUn5n/W3xWoKSpLgUl5lz2xY3r3AugO8=;
        b=arYOido+UrXYU4tuv/0Nq6/fzADv4t/QrRqujjQeZRP2oRSxl4b0lDeAE+oXUAaOfk
         /ti+aJVdMzVl1cLTguJ6G6f3+AJWlfJCrlAAmrkx/RVfOQcaGKE/tJ/OLij+CDSi3BLr
         Zn7s2ixJ3/XHtYgvVStoVl4pZ3dzWu2OpR+wg4kfMTvyXHKtvuXgun+V3LgT4FSW4NOc
         6kFfr5vKYsLjbqYW/WKivJpT1hnLE8dRAx4FEC48P8GP7r/QDNWXL+wFcBpNUqh7D2Y9
         RESpkeqKZt0Uny8Zy5OuoSnsbLJLLYbpKjYudJjfIUr1EZ3BBX60Q2zLV9Ydr7ZAvsaI
         pfyw==
X-Gm-Message-State: AOAM530upcE0nuA7Qg0Z5quWpFe6mpksrF0hoPrVFiD3VsrZL4q7bRUz
        KHqxB/r6bBJEq6byKvhRrVijL/tSOPY2IKbHZpZ30g==
X-Google-Smtp-Source: ABdhPJwoa/bnOD0ty8V2zJfl3gmzesmmlaUbFQLnWtsNhyfTCGEoZLeYcdQ5iyRgF0PDA+MSID1zGAuyWxM0WaI/dG4=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr590961ljb.144.1601459260374;
 Wed, 30 Sep 2020 02:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200921131056.92848-1-miaoqinglang@huawei.com>
 <CACRpkdZxgw7zmmWyVpxQ5N60Yxzj+u_LPAkRGN0qS3A4DqKNgw@mail.gmail.com> <5a88741a-15b8-e81a-0161-89442a7a1d82@huawei.com>
In-Reply-To: <5a88741a-15b8-e81a-0161-89442a7a1d82@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:47:29 +0200
Message-ID: <CACRpkdZFAjL5k9MdQWQoktHiFuHKacgPd4p49+dUqUYXNsH2=w@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: simplify the return expression
 of mtk_pinconf_bias_disable_set_rev1()
To:     miaoqinglang <miaoqinglang@huawei.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:39 AM miaoqinglang <miaoqinglang@huawei.com> wrote:

> I tried to rebase this patch to the pinctrl "devel" branch but there's
> no conflict. Could you please try again or show me some details?

If you used "git rebase" this might work for you because the git tree
can do a more intelligent rebase than me. I only have the patches
and they do not contain context.

However I actually want to apply it on a clean v5.9-rc1 (that's what
I actually tried, sorry for the confusion) but maybe it has some
dependencies so that does not work?

Yours,
Linus Walleij
