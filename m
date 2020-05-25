Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6D41E0D7E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 13:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390165AbgEYLln (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 07:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388696AbgEYLlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 07:41:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C40CC061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:41:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a25so8770643ljp.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DwdjF0Ue67Sj/Pl5fSyKVWCmeyW6oEYcnXakGvQJHew=;
        b=jaoRXRcLC5ll4JhxX10uEVRJ41Q5RkA27cdh9uS3nKRej2LciDH6hzpvyUxipgi+U5
         gGEs5JM0h649U0962y9zxwKiEK9IhGlqgX9hr+iZfj4D9okOridFVnkhOZQT9aM6uKp4
         wKs53j3bIOKcr8Cg+1W/pbSgpwMmYbKoWrSO++MBe/+ieemSnRvP6HPyGTivWuWuHGZo
         Plou4TMB0zl9fqMtOdpZQTGHdysntDU7bfqdaQ8DkkpDH45NuPn/1WIJV2SzMCSdzEsK
         ZtssI9eE1l2buaJ6jL6BgbIWWKZGocl6SR3LjWdyBx5G3MiwEBjEsP/yXjSqn3zIz+so
         vYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DwdjF0Ue67Sj/Pl5fSyKVWCmeyW6oEYcnXakGvQJHew=;
        b=KMdJjhyi8RAb82va++MRjyJv2vxYm3VGFJcb7kSyGKeLkymbWEI4/9hmmwAyx/mWRE
         76sJi9OTPLuoZtDxJetP0uTBNgYM7A88m86+ysnN5vYAqiSGcr79nJ/sOIyfpDui0qSL
         euXlqsPvrI4kJZOhPAUMOgLcUSDlEFDrDMDgfLpFvMti+xV+HY7CFCtj8bLrulMeB3Bp
         0AbQ9HoCaSeXnp33TuyiQdeSzSwQNPcWMinGawFVGUH7Bo4JFbeGDTL0DzYWb1KpxpSa
         6gWCdLp8fUK0j3wsJwBV4pq3KyE0GHnJ2/HiRYTRypXSsABFviA9dY0/lFCzrEPZIXqW
         VbrQ==
X-Gm-Message-State: AOAM530EdaaTpLNG+CoqFq2E1QBXViLLFtU9oozQkJQoRunEpo47+W+Y
        tf+m5cmPdXwfYY3FT6Whfp5yWmOltXRd3RvCfMEKDQ==
X-Google-Smtp-Source: ABdhPJzmAF2fPYPuX08EOV6Ek1vROzWyd4lTeFHVNjZzIF6Goyz2gdDExdfIB4Roq7kbyBarCt6itfaazrSXen7+9BU=
X-Received: by 2002:a05:651c:32d:: with SMTP id b13mr3226363ljp.283.1590406900778;
 Mon, 25 May 2020 04:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <1590234326-2194-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1590234326-2194-1-git-send-email-yangtiezhu@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:41:29 +0200
Message-ID: <CACRpkdYOrdXDMq8MJ2dPQSUf--zaX_tWZd9RYR2FQPHc0pujJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Fix return value about devm_platform_ioremap_resource()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 23, 2020 at 1:45 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
>
> Fixes: 4b024225c4a8 ("pinctrl: use devm_platform_ioremap_resource() to simplify code")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Patch applied!

Yours,
Linus Walleij
