Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C6C43A829
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 01:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbhJYXal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 19:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbhJYXah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 19:30:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E416C061767
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 16:28:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id c28so11827686lfv.13
        for <linux-gpio@vger.kernel.org>; Mon, 25 Oct 2021 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2jLfqODImegdyXeqCFCRv0DRtHzswCpaP9EDsnOhsqE=;
        b=VkRwmFs+UC+5N5+Lua5QAFc9GjTeu4QhnyQCxzTQ97C3wCgU+kd950IiKTmkTRxnkc
         XSrU++KPuOTDAIT2ASvNw1clCKGSMQmhx91oENhD2wcbgbkmVCAuQQdhBt2sSI/dDTzX
         wJKYmTg1MIC1mGbhrn27nZt8jRxB8TC4qVgCiS6aTJXZnAEO/Wb4hRD4GGgY1F5siYq1
         D93ac0jCKtPLMzH8wjP1oualVDceCiNk+A4ejfMtQH2dwu3nV8aXALkMzB9jDJT1IKzW
         kWZ+OZyD+80inmcrO/OAX71C25wYHf9mqp4UPLYpfOhkW9daC9EwaGY93JNZl3koj/ga
         xeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2jLfqODImegdyXeqCFCRv0DRtHzswCpaP9EDsnOhsqE=;
        b=akJI3yAxrzw+sOTvj/4aXIIw/xyZGNEnWBVVFX6d5sqtTEIRRWrzul0kIseQhmsblJ
         tDrqM5c/mmCW0Kaq8leKEiSQyHzdia7gE8fFj/aUawovpIXdGK9DiJfpIZx4IYDjkh0r
         huJoHtY2ICwR9k2Q0o54dyc+aQwqS2hisrzqdNaym9vGNKaJeucYvoExUsIxb/ZHfNvo
         h4i/X/rug3Bze0ShHYGj2Bb16pxdE0NPeRdovnovik0Yob7+4ZctzwRgqhYCTbtIqnbH
         trmwyEvHRJkcZmIJAUO5eE+5MuBkEEXEMP9MicOxVLGHTdO7OM70OKupOWP5oo31FwmG
         yXcg==
X-Gm-Message-State: AOAM532stz0KFKnJEDEkCmFQWSzuR53AXev9k6lBE6PvqaT7f8cNdRG2
        mlLQoEFBG4wCiF2NBQ5RJWkNPJ8i7ba0Vu6OWDZV0g==
X-Google-Smtp-Source: ABdhPJzkOPHytZhWgL6j0wryzg6V/Il2HFi9TqQx7KnlVfV4W2fcE4lNTTk9skbA4uLwH+eFc0IoKOaLk5HckUncqQg=
X-Received: by 2002:a05:6512:3d22:: with SMTP id d34mr6400800lfv.229.1635204492715;
 Mon, 25 Oct 2021 16:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211025110959.27751-1-pshete@nvidia.com>
In-Reply-To: <20211025110959.27751-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Oct 2021 01:28:01 +0200
Message-ID: <CACRpkdapa8ReOf3Tfdi9LruatJO_GLEJaX8c6YuHooXDpreyEA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Use correct offset for pin group
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Suresh Mangipudi <smangipudi@nvidia.com>, kkartik@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 25, 2021 at 1:10 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> Function tegra_pinctrl_gpio_request_enable() and
> tegra_pinctrl_gpio_disable_free() uses pin offset instead
> of group offset, causing the driver to use wrong offset
> to enable gpio.
>
> Add a helper function tegra_pinctrl_get_group() to parse the
> pin group and determine correct offset.
>
> Signed-off-by: Kartik K <kkartik@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied.

Yours,
Linus Walleij
