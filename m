Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECFF1660B7
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 16:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbgBTPOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 10:14:52 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42938 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgBTPOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 10:14:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so4583801ljl.9
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2HGcoFXbyVbTV3eg7hismyxhu6dj14paC3J0LZjVjv8=;
        b=JppMnoQE1IcDd7cMooO8wrTS949VE3Rf9AEiBdqR3i0G7zQTgWdaA9zCNpK2nYMEWw
         kdLYxDmax/UsnA0Cv+uY3LrBW6q18f4OfUyT5xq1zbK6HzFfybo1dk17VlgKGLI+U4z3
         7lNET/xn2+cEztXYx4WWqal15IyBWAzi+wWObB8DD2FK3IMs2ZV8crf3Cvxebps+zChJ
         Yu24UACGUX/UpQ7uJA7aKSiEzzROngph4UQXkds9qL8NNSbETmh3kGHjYfYYJwv6wUnG
         /fVwZM6feFreuwPXNsvHpdAdR+XqOxqlmz7h6Rc/bayCu/YyImcXg+LrdYaExGefUNeI
         JqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2HGcoFXbyVbTV3eg7hismyxhu6dj14paC3J0LZjVjv8=;
        b=BJeYjj5NXkjqKr9DX/omR8eWVZxm2am/6EE6BnEw/gb7MbnKwXoZQFwikCeYwkRqMX
         UtCwQE0/CtSe0LgOkmEYALAJqZAa+PZLpodIDb17wouMt1mV7tGk9VEbJI6BK0SmsWin
         OoJC5KhOuEO0Mt0WgQiDQizzROgeO5T1BosaH7LzBdVbOs5yaTL2Acj/5QYuelLduJjY
         b/PhIquN8DIH+jAOoSQOfm89WAU9S6UE/8hBBM5n0daZdB4R9SKauVjDg40vsIFZTOkD
         wfniZSV9wYzbahRLAPW9FltN0RqQKRtqVFzqlIY8aiwFJt1E9RNBMw4tLEwOq55rh6Mu
         HUog==
X-Gm-Message-State: APjAAAWWSRHFlN1UKeaXu57xMKy0vz4HiSJWj0VmurkWSenkvEj14UDL
        9lCd6srD4l5PLN+yGOIlhCo5nAO6KSYjgzhSeJUXLw==
X-Google-Smtp-Source: APXvYqximU2hF5YQAA6qDC6WVIbiCSJIlm99ooaxT3H0C5jTGqzKFkBU+ytUiMHpo+Q/TVwdXj+JqE+CEg5n3KPW7DA=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr19780468ljg.223.1582211689431;
 Thu, 20 Feb 2020 07:14:49 -0800 (PST)
MIME-Version: 1.0
References: <20200218055247.74s2xa7veqx2do34@kili.mountain>
In-Reply-To: <20200218055247.74s2xa7veqx2do34@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Feb 2020 16:14:38 +0100
Message-ID: <CACRpkdYWsWNg9oetuHPt0VEz+WKKiqfbfuCu503tpRyZ=7nV=A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix some off by one bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 6:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> These comparisons should be >= instead of > to prevent accessing one
> element beyond the end of the hw->soc->pins[] array.
>
> Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Matthias could you have a look at this patch?

Yours,
Linus Walleij
