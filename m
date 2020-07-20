Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B422261BC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGTOQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgGTOQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:16:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12952C061794
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:16:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j11so20407251ljo.7
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CfVCU5mHCDeITY1rM//7ZpN//MVZr1rSQIhyKmVtOzg=;
        b=D0FdBC7SOJT1hoV2IiUH6Eaq72kKwsLCWcjJhyuRbRsxO7Rst9US5bLsUu/uswLx+r
         BA1JKJ1DqJJKTxfUSkxYMzWt9tGuNubOZLSnCwjmfEF4p5x5NMDCBGPR99F6nqtqMqTX
         0pHVdSY91l8NVK16xRWRY4o0e6C5N8l10mAfQENoAyqsEIy3VgCGQWKE9iqfk5g7xOEb
         GqXf2mNYaeQDmxtXnxtxkRzJ0POTkULXYoC7/WMpjOfeWOy1J11ZCm9SgY/Jn6hnZtRu
         hkb3o2K9e4NAg1UMqo4+dj3I8NIpxw5ZPF5/u/yM7oW/U42AJe1vE4pE+hE4Pm5Hk7GO
         82WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CfVCU5mHCDeITY1rM//7ZpN//MVZr1rSQIhyKmVtOzg=;
        b=FN6HCuHBLZRngyUGeTe+LraBL3gBs2WGFmj0LPSUs7yCAnxvm2MVaitkExprBO2fUH
         VKVISmSvMRJoIY2TL1CTn255kSqjqT6xc/3YFpNnx6Mrt3wlYcKcAxSvTXp/PRWskzti
         m6G2zxTl0SXz5fM6LrpI6Bpt5h9724h/XQe1sZ1pRmgp4PuvUwL41f7rq/sjafFnyinN
         rTPJxFVjjogDFWg1M1+sXXluCZQr1p9xHLo8CiqA2yO+/X5rF0TqL8vbInULgjEgGf4l
         7ArwyY6OkNlOAXNx5cYkT+7u+tHJarvBVtMYsIk5x7gSpxBlYK31ixjxO0cly7GtE0Oz
         owbQ==
X-Gm-Message-State: AOAM533lk6uyZXLFwxzKJnd8yb3OgTiPRZMWZZoWslPdeptuCxE2cmU+
        Rs/9BsK0NXKWTTEa7j5J6fe7eBcaK8+90YaozW8Fmw==
X-Google-Smtp-Source: ABdhPJxCdtE5WzgJ33QEckSvFwyWtiAS2vzwpoohX8wqofbxOOkD2khe7ZOVTsb84s/0pYwurWaEsvPkRPvE3gGmlv4=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr11280888ljc.286.1595254600586;
 Mon, 20 Jul 2020 07:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200718120807.19714-1-grandmaster@al2klimov.de>
In-Reply-To: <20200718120807.19714-1-grandmaster@al2klimov.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 16:16:29 +0200
Message-ID: <CACRpkdYXS09FNE3k9e2rc36zcPrpJTBiptVTe35R+_efNZ0VNw@mail.gmail.com>
Subject: Re: [PATCH] pinctl: ti: iodelay: Replace HTTP links with HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     Colin King <colin.king@canonical.com>,
        ext Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 18, 2020 at 2:08 PM Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
>
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Patch applied as uncontroversial.

Yours,
Linus Walleij
