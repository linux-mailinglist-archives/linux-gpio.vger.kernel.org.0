Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781E12A7A25
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730830AbgKEJLO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbgKEJLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:11:11 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78014C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:11:09 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id h6so1237360lfj.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R0y5gVIpn/AdoIrclQ35fvG8jExsjx9oUlGQ4SSdRvM=;
        b=OBDEBRw1XQC3TF3Ujh14Do4dSNZfC5XcJwZ3/bgFQ+sx4K3XUmiyLaQCtmaraJniD2
         dI4T8c1xdRCYc6hOieisMIn/BXIYYXXtbrCoXXUVcu/n+dNMu9HYYQeMgGgHgLzHavoN
         LVWiu97oelCd0Chcpw0NeQODveRSIQ3u2xOhva3fn5rWs41Uv4WPEsBnKriGOIqQzXaw
         F2ndncW0lLmvkp/UJuETbVOhB9Xu32Mzoac95D9wwg9vHDOuqEoFLTr3BRoVVNWUSiDY
         ZMKimJPPn31JOs76+XDZArTABgEXph3X4yOAOpezGHK0+DR1MN4bp/BbwS4ynjAbxx0E
         mN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0y5gVIpn/AdoIrclQ35fvG8jExsjx9oUlGQ4SSdRvM=;
        b=E7ylgLnTQyWbuo7+sKCnz85VlIqqHhwSx7hMou6IcKYKgKuKmM8DUxLDfVU/o7+BMN
         KXVoFAR+XtMV7+aztCO+7oQgxlSCKqlyoySCMAY2T+RjdDglv6tPHGXqztKLpEt/Hl7y
         9gxpVat/TwVaWzAkZvKR1dhGGqRgkG1/xKQ+rc8u1lfK38SDHLMScCWETnG27fBg9FQ3
         SXDOzEtNP/lMgY6AlRl93Pct7w4om2XyukBcZoB4T8c1O6lsfhy5RD9/qhVKYEK3jr1P
         RWQ+OXnhuI/yljv36a9ujXImogvcWh6SlyjpC3oi7wW0eVvcmr98ZRLBa54ngMRu0gzl
         C+4Q==
X-Gm-Message-State: AOAM531ILAn8inFoaXjOAv8nJc+FtTymXvc28NGgISm0lU5f44CKNXDQ
        UnkW7JT09xZ1nR/9OGCUSwOrxXn1HeWt4TqHQFvDvQ==
X-Google-Smtp-Source: ABdhPJzqB9jSOZSfJwAF6NxekJgcXcBnjncy+ksjyFQ9f8WPlYctN2Gs84q49hGyTJZnrCtPAjPxbSo30cnPWuokgKU=
X-Received: by 2002:a19:824f:: with SMTP id e76mr564699lfd.572.1604567467941;
 Thu, 05 Nov 2020 01:11:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1603055402.git.syednwaris@gmail.com> <5e94ad3c156b98d2ed28617b2ca25bacadc189d5.1603055402.git.syednwaris@gmail.com>
In-Reply-To: <5e94ad3c156b98d2ed28617b2ca25bacadc189d5.1603055402.git.syednwaris@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:10:57 +0100
Message-ID: <CACRpkdbZ4US4Onhr-AmkPoqxQU0enrsicx775kLKdpEVtkTbhg@mail.gmail.com>
Subject: Re: [PATCH v12 3/4] gpio: thunderx: Utilize for_each_set_clump macro
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Robert Richter <rrichter@marvell.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 18, 2020 at 11:41 PM Syed Nayyar Waris <syednwaris@gmail.com> wrote:

> This patch reimplements the thunderx_gpio_set_multiple function in
> drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
> Instead of looping for each bank in thunderx_gpio_set_multiple
> function, now we can skip bank which is not set and save cycles.
>
> Cc: Robert Richter <rrichter@marvell.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v12:
>  - No change.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

If Andrew merges this through his tree.

Yours,
Linus Walleij
