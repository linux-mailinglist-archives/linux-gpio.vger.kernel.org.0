Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5263E1CBF
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 21:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbhHETbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 15:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235611AbhHETbY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 15:31:24 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB23C061765
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 12:31:09 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id s48so10846962ybi.7
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fL8fo3oMGGdyhjep5qev4L9S+lO3A55pCdtFOtBwaxs=;
        b=susPQoo7vDrRfrwzXtBy22f4mKDn99gxcKYS3WdgIv0Ttkg+CxyTBlKqI73LsdPEx4
         DR0rXmw+2M9BrAFs+9Cyc5jmMnJlNuJwJwd/e9fsd3mQP/AroV8yein4SlqXHcgcFtod
         qnviLaCCI41xrhhJrrSSknBzTEd333w3q5ltYQJ3BpPfKI2XnTn3a0SfPAOk4feNEWmi
         b7Z9sNYTlbZX6rp+EmlakSpUCymwol4dLhPbUwiRnKsVI9X8fBtcFt/b6P/P25LFEYj+
         FtKPbw9seF6TpGIB1zr1EyQLxjIF2xewalSu+FUe6bizmrcG+kN9OtKY3sCGdWke66ps
         GODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fL8fo3oMGGdyhjep5qev4L9S+lO3A55pCdtFOtBwaxs=;
        b=hVS/0RBia0XwTUiR6Ntv98g2cB9rwLeseOUjucI8m5mmQBniUlLVNoKuArfVc6l/sy
         0fIiSg5L7Js3coELUBWxGD3nu1s2GOOPsWUiokbH3TDlSgBFlV3Jg6X8HXeCaxZJY855
         k8kPA8ECDjos01SXGaAyuS2cdS8yAfeQ7fhdXAZI8Sq0lusLGyBWPg1R+AR2mGg+IiOS
         MW3IOioTAOqcGhR+6IfDgNWnIYs3wYTQYoggKvR6QkoPOhj38Yr5JpqXSDaMiRHOUn8D
         EdzmnIzmVpgHFdF1bxuAGM1fbCPpV4/bLIWoOdlDLEEZm+9K1HOz5y11kI53gyv5RG+X
         61ew==
X-Gm-Message-State: AOAM5317EqG8LCun7RiCIOh3xgBHooqaZtTa+bj2aF+72cfJMKa55kXr
        XWCdQqb0gE5gp9Sg1Jsty57tLyD4JBQPAbEaUuZ8vw==
X-Google-Smtp-Source: ABdhPJwCu69IUV8/73ADKF8rJAeJL2gGGYFSxKuIudS+v8IePJBtkREFBqch3JyZnL622pPLRF9YZCwdVFS53Bk5er8=
X-Received: by 2002:a25:bc2:: with SMTP id 185mr7963251ybl.23.1628191868491;
 Thu, 05 Aug 2021 12:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAMpxmJWZm_N3yPKa2+32PNOyCUuSbjqWiDBSO3WHjKekZj8Fzg@mail.gmail.com>
 <1626670001-22832-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1626670001-22832-1-git-send-email-akhilrajeev@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Aug 2021 21:30:57 +0200
Message-ID: <CAMpxmJWDX8GifOWcAgnn0BMPhyRpLSkWEcAsr=F4rZ-1OhUqUw@mail.gmail.com>
Subject: Re: [PATCH v6] gpio: tegra186: Add ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, kyarlagadda@nvidia.com,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, mperttunen@nvidia.com,
        smangipudi@nvidia.com, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 19, 2021 at 6:47 AM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Add ACPI module ID to probe the driver from the ACPI based bootloader
> firmware.
>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> v6 changes:
>         * Rebased on top of v5.14-rc1
>
>  drivers/gpio/gpio-tegra186.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>

Applied, thanks!

Bartosz
