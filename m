Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499E132018
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfFARWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:22:49 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45355 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfFARWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:22:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id u10so3389962lfm.12
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yD3/2nMu40iWkCJApa1un3cbczzFbKdO9B0J2VVf/BQ=;
        b=fdXIboJGEs9ESGymq78yu8qUEGAMvfm1YFl7lJvcJq74hnBGstgi3nh1Ht7YV0Ckm4
         XZ8/FKCIUqFbF3v+mtlW8LWp3BuPT8bjmcahkROSYSZ+unuhb8849YDQDon13YS/gZfp
         uqWhz3jP9iZ+94jHeB0wTBPQfgfM6Pu0642rIFbomK/rrAllD8V5JoaaDMLqZQR/p5uT
         +XXXicxvkrcPkwk79q4OPIxeqDLvbxQrMBWbUjjiOHV7zOwrgtn0YYyGP5/11yMmrN3N
         bKZby/3X/rUyhnTaBnkGhFORTADk5zbD/ISe7q3l0wAQJGUCu8b5HZys81i0NHgpcqJB
         l7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yD3/2nMu40iWkCJApa1un3cbczzFbKdO9B0J2VVf/BQ=;
        b=DFODLTtBGLZDN0gNQ8vHFTo5zH5z2KngO/TsO+Jg0l2eB9lJZGGExbBlrD7X1kTlVX
         DPXftU1MUUND/zbNslbI39f6NJ6EADKzsu7uwBJdYTaK8hqeaVGCIB7LhHmIJgXIDogr
         Ap8ZN3MydvAUu/LIKIuBkB20RMak/wlrs48QvNiItNWptHoBAodmIVj8HC/D12rqHKSy
         6zMwOd2osC2QW2cQd39ifWTyXJV23yJjlc6LPSqLyh1m7PmUtw8i9FpcqtsERpa6iUDd
         9TWJX8npI+IbDi+BiDgO/8ForLwJGWAwNvXhkQZtqufGKI6JNuu0r63VCvFmIzLJ+CVH
         UEfw==
X-Gm-Message-State: APjAAAVJ+2ooOCPgGV48BiaE/imTotMCPIZY5ulXbfM/R0fcV8IYt5tC
        gIZSdLAwIjI9ka1qJdRo28C88eDdonE8EWiDmaWJmw==
X-Google-Smtp-Source: APXvYqw55gN5VS0X6O9i9hhjw+uvDGiRLwxkuM3dwGJ0LgEBcvGtcO3QnqZCk2Lc0KpmVCUEwbZz3DIJZLpEdAK2dJQ=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr7439447lfu.141.1559409763924;
 Sat, 01 Jun 2019 10:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com> <1558007594-14824-2-git-send-email-kyarlagadda@nvidia.com>
In-Reply-To: <1558007594-14824-2-git-send-email-kyarlagadda@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:22:32 +0200
Message-ID: <CACRpkdb9swUxO9GBvZQMVu0t0-77Pr9W5RivuiVhgrM1eBGtdA@mail.gmail.com>
Subject: Re: [PATCH V3 2/4] pinctrl: tegra: Support 32 bit register access
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 1:53 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Tegra194 chip has 32 bit pinctrl registers. Existing register defines in
> header are only 16 bit.
> Modified common pinctrl-tegra driver to support 32 bit registers of
> Tegra 194 and later chips.
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>

Patch applied.

Yours,
Linus Walleij
