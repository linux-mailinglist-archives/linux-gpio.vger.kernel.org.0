Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808A03AB68D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 16:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhFQO4n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 10:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbhFQO4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 10:56:41 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E256C061574
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 07:54:32 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id hv20so4400048ejc.12
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kP9FZJ6E9jOuvBEfkZXpWLxsS4aT6M+o/FNvbytEBx4=;
        b=TAos1Myg6tlEtCXWGma2vcvlxK36hv6B5mhPDSIIXLJYHBezJ9p5/jWLLPjdXyNYV1
         FxomDl3fMGV0SvrzgsumjDVbUm/n8EgyOTJHV6KVK5soWZejWDV/gpXg7RtzmUyH5f7i
         nqIcyVq1AkuAyFzDLbrtLetR1gtiFS/w6kPyk3/YUICArZ6jnEzitOo+uce7OieRAmYu
         eZw1rgReSSuT7johry48W+XUPoF0o8ODuBNmlXNZD8e6z5wt5ZBH+R+jXKC4mgXfKJA8
         dP5pivfJr8M3DePenSPzKXIEjFp22RUrjlGZMMHzmrfMfNqpu0p0h7dTxpinblwIIHRZ
         ve0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kP9FZJ6E9jOuvBEfkZXpWLxsS4aT6M+o/FNvbytEBx4=;
        b=aqV/cHVSkUi6g9p2NxOYd88HInmRZowDJT0yQHdpLJpDXwKuz0s2sPIw1gqLFmrrxZ
         +W+wZ/6bzVHRKjiKzideoYESRusLVS7SkCDGXSZc73amlFUuspT/+eQwoL04CD5ArHLe
         DkwvUgwpDgB1HyScjsR7nyWVUFudrM0IJB3dGE/sHpj3aMhA/1yKUFTECiQnig6IdOTi
         +2AfKCe4p4b6YjUCXFYNV4TYJpYMfLz91BZ+P8cZ9RTc35V5ESxysMz231DPQewdCWMB
         aHKr8ktF2mCiWJeW+qXbr91DZ2HTrpxVp6VhRWqdKhHLmql/XRBY5WEBefrSoXXdT9KI
         GpOg==
X-Gm-Message-State: AOAM531JPlJ8IqvvoCifwHOmZfqkNgVONDp2xTcX86sD/KIX12wt2IGQ
        zh58nt8Lk+omCD37mu4cLfDR2ibKVzzWn1fXnQWe8g==
X-Google-Smtp-Source: ABdhPJxrtEngye1FPnWP5qJqASxWqbVqz1llqVe9GVdKKRDt8N04M+Sb6HXeXjfsZEZA3AoWNAfc503S+WZNzPFUUYE=
X-Received: by 2002:a17:906:5648:: with SMTP id v8mr5645692ejr.421.1623941670599;
 Thu, 17 Jun 2021 07:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1623924351-22489-1-git-send-email-akhilrajeev@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Jun 2021 16:54:18 +0200
Message-ID: <CACRpkdYj9utWedo1-5NiRJRCHqhUmzYXHQzo8rvVq_4PETr0oA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Akhil,

thanks for your patch!

On Thu, Jun 17, 2021 at 12:05 PM Akhil R <akhilrajeev@nvidia.com> wrote:

> From: Akhil Rajeev <akhilrajeev@nvidia.com>
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
>
> Signed-off-by: Akhil Rajeev <akhilrajeev@nvidia.com>

Please include ACPI GPIO maintainer Andy Shevchenko on subsequent
posts, he is looking after ACPI handling in the GPIO subsystem and
always provide excellent reviews. (Added on To:)

It looks OK to my untrained eye, but I don't know ACPI details
and expected behaviours as well as Andy.

Yours,
Linus Walleij
