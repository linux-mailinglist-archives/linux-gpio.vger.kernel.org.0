Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A197410D29
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 21:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhISTna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 15:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbhISTn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 15:43:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84348C061574
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:42:02 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g41so24703008lfv.1
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 12:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=267Y5GG4wv3jBVNFLCjYNg4eEpoY547mjd1IsPwkZZ4=;
        b=aCEfsATQGKUcZ6Gbf07F1Ad396sTKdrW+S3XJ9iraG9sqiyz/afeQxWCIk/lwOXWWu
         vmHOByZNuk5iXVZOfH39JWTuJ43DVu5kYyEflMaLVzqKsLtvGXOT5Z5MH7JYhHgR2Vg7
         0+uN2m38f58OtVTQBeetop+lFeFnf9ATVg1sHCh9OsjFUIHSd7e/f33b171Sch/cqbQ1
         5KdGzTp0kNomZzOClhbZFDzi0Cf8L3whqyfMhoIe9RgyAuYV3bA5/j3l4kQhBIkCgIWm
         kvE825n+8A0Ad3rA/rnww53FxHBs6uWAoPA6JCYRETNN/Sn0KDQ3VuyQV314Qby5eqZ1
         dAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=267Y5GG4wv3jBVNFLCjYNg4eEpoY547mjd1IsPwkZZ4=;
        b=SdAOcfMfQqJh5NHMbbw8xgKfnH2+alqz/7B2z/SHMLX7i5ZVIY435wnRNbTlp3zOHY
         OhUScoCdzuIANf7Dy980WMjiZEi9qHa8ZZ5aQiu3QCq72NZoJ5x4ctQ5FnlvHZ4Vaq43
         PSSmZr71IahjltBrRLKjkhimfMyDrhksgqIZlR3AhceJC+v7JR9jx8bpPQKsOiJVRd/M
         HJbEj3oay+s561lX9dvrdaCTd92GptUHY9lo46L87gzI+ZzFKM09jBBhVD1CJi2KZw8H
         9jGfKMPb2mgcCavr1Hb46onBlNONv+XFDZozkcNeuW+p1vHG8kkFkMmUM1qNEKLZDv0S
         zmbQ==
X-Gm-Message-State: AOAM531itVb6vxtG7dLvDBzLfAjAYSgsqXa78G22IZNHsxuZubwFdZmD
        8hDlqNspDXLp1zZ7gWWp8Or4a2VT5Sh1cZwoXCswfA==
X-Google-Smtp-Source: ABdhPJyOo0GRxViJevniGs7x1CN7wVCSU7UZCda+WhFRVhOAhvLyfjPAJB50V+BaC7FyiDJ/fYxFy0KgzWfbWa2BcZw=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr13156944lja.145.1632080520043;
 Sun, 19 Sep 2021 12:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210917105412.595539-1-thierry.reding@gmail.com> <20210917105412.595539-2-thierry.reding@gmail.com>
In-Reply-To: <20210917105412.595539-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:41:49 +0200
Message-ID: <CACRpkdboaxpVhLHRmWw8vtuXNZB8z5okSYLCBae-WzNjpbyK-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: tegra186: Support multiple interrupts per bank
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 17, 2021 at 12:54 PM Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra194 and later support more than a single interrupt per bank. This
> is primarily useful for virtualization but can also be helpful for more
> fine-grained CPU affinity control. To keep things simple for now, route
> all pins to the first interrupt.
>
> For backwards-compatibility, support old device trees that specify only
> one interrupt per bank by counting the interrupts at probe time.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
