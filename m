Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9447534A672
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 12:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCZL2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 07:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhCZL15 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 07:27:57 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45EAC0613AA;
        Fri, 26 Mar 2021 04:27:57 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id h20so758826plr.4;
        Fri, 26 Mar 2021 04:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QO3NLPPJwyOqpOimxVpVmrZArbAwjmokGvw4OSoT19w=;
        b=bBvND3I/A8EzQPVZH7o0EfaI2nfjgdtBCSlD/1S/zMc56dA4tAkUbfwiEIDtjenZrV
         IxknWdPswzJKc1MYKflpsQy9WNmhLz0RfGf3X5gdUrHLNIVSuWh6Uu2pSuChhK3/6rVg
         EyfihvEtoK0OhgjoluUaXHBJsfR3BmOQzIWphw3p0JH5AY70v5oPAYV6lTCbztth6NiR
         qvC0kToYlnDxz1knIlcfiGL0RG/jgAlybbUK/YUQZfn3nGFQtvWTFgpW0PICJryt8t9y
         fEdaJK4vKUd+WGPtXjAUJy8KT+04ZaSjaCVFpKJKVBpTbpb1/Bd/PwOUNTa/OXEScbny
         2zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QO3NLPPJwyOqpOimxVpVmrZArbAwjmokGvw4OSoT19w=;
        b=ox7sWf/8wn3c9aUjGjYR/tuDdndq7a82KVJzV7Qxk+qR5PVosKtnf/ctY9Q8HqWSV+
         Q+cnaXVGAP1M92JXBoXfGjS3W707qoaXbSz17fYubsPOOeefvcXjOoRJoGa4nY4Shnnp
         7tAijYITqpOuerZGSTkCPQNuLcqGyxFKU0a91psm11GzL1eUg2ZEvUGGd8SVD3ptIFp1
         AZ1wOaN0k+naEBY/vtY+FLRYBwahrqGxHFcCP7d7i0riASLYrZobnAJUF2gDJspb3O4c
         mpo40V0sQQso7IAmKenAGNphm2dP7gMb1qAwiuaLiPFLnAiuwNxYqmp0Z72pXup5ghzQ
         t3rg==
X-Gm-Message-State: AOAM532V3KEz0yn0gueWoRIZvXYQcOB5ThyoRxTMJWwv1axnO5RE8szb
        D3f5qmvI9i/IkPUXQrQ+HjaQxx3XAkzVbaB/wqY=
X-Google-Smtp-Source: ABdhPJzFCCHR/5hD2t+5lnAN5w6WbfW2UzKfFRx6yhSELTcI7rsccE1WGTHiU0OUSYTfaspCW7NNITUrLlbGGJN3CJk=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr13868397pjb.129.1616758077348;
 Fri, 26 Mar 2021 04:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com>
In-Reply-To: <CAHp75VdxRkX15Ts+L1UJdXbpoaTu3Ue6o9o=Yh2cRCXCEi1jwA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Mar 2021 13:27:41 +0200
Message-ID: <CAHp75VfazasTLAotZ+T_xCoFiq-D0vcKqQAosopNMeJXP93nng@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 26, 2021 at 1:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Mar 24, 2021 at 12:20 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:


> > +#include <linux/of.h>
>
> You may do better than be OF-centric. See below.

Ah, yep, when you switch to unified device property API, you would
need property.h and mod_devicetable.h instead of this.

-- 
With Best Regards,
Andy Shevchenko
