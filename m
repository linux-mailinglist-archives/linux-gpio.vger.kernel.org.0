Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3321E458C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 16:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388948AbgE0OQ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 10:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388141AbgE0OQ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 10:16:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF401C08C5C1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 07:16:57 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x27so14540686lfg.9
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FuzjfjlzHPprP4TSOtbM1ZEB3SE33DMlpuQWvQEOJp4=;
        b=dQZ8rWhJ9Hcvp7qj7cA++0h2o6FrlcyQeEJHfaFByOPaO+D75DzJZUEA3Yr2Ofnval
         lkn3XcNuX8ubJoWju8amt7l6hXkcuY8XDSW4JEbpt2ce+93zRyDyIsl05bB7LjcfPk9k
         3rP7SKgVn8RtzD5AEKM+D3H+ejZyFU8LKp+kKPiOcHi/6J9nzAndzZ1pc8m9Zk7VpXnI
         BM6h5+mjzBbC3kV+B/9FHZE3czrvK8ej3OhOuEr1hWav19bi1n13tKoi4/6PjiMKqFse
         KX9RrCpuCEYodLyfbBcqEv8mSSur9mZ4nSPVRdnbt6yOBJDFCopYGDiGKY2fwHPsSgkM
         6FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FuzjfjlzHPprP4TSOtbM1ZEB3SE33DMlpuQWvQEOJp4=;
        b=ZB+GcY37P9wvXX4TjFPZNQqiBC9aih6aVcTLTwB6oNS3AYWPGMepBMRcBXeZ2hfCs4
         Mw2yGpFWBs9HeTv5cXJVXz82UuW2LuzKEWT0JXRM5Eth98vaZIv6tMnJqX1czzO4CxfN
         MxxtK8zP2WKE3Cwca8K8nwBtKrNscAtQSs+xKr2LTUBpS/dOiNxnvER7l5LT7A+og7VY
         pXMGhksDwW+Z6Lhc1hs916Utq3N+xNFBcr70k3TDCMfo+nIEIY9TbapONPrtbaX+ryFH
         Kdqd1hJso8Nyo3IoJ5XDbJoPSCfOEubaGRB+NicJpyLfCQJzrj8sxC2mAU/labSsz8bM
         kv6w==
X-Gm-Message-State: AOAM533G0JoDK/Jxas2OTOQsAEga7AZRoY1CBZcTBrusMiV0zUg94I10
        ZS/HToOUNT//yDExYzhnmgM+/A6x5fHKA88bee+Iww==
X-Google-Smtp-Source: ABdhPJyLg5926MIWhx8Yq+pQ7kWSauZgYtD6dbdUIwIE4lG9z1/5g7rZRrbU4f1U+6lxl6vswk6T26PdCYZL/quNL+0=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr3242509lfi.47.1590589016271;
 Wed, 27 May 2020 07:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200525194028.74236-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200525194028.74236-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 16:16:44 +0200
Message-ID: <CACRpkdZHz5V-=e4gR0qZCM+=2847dPnw=3OMxw7Tv75Eehpd-g@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Separate GPIO_GET_LINEINFO_WATCH_IOCTL conditional
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 9:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

 We already have two conditionals inside the outer one to check
> if the command is GPIO_GET_LINEINFO_WATCH_IOCTL. I think it's
> time to actually do what I have proposed in the first place, i.e.
> to separate GPIO_GET_LINEINFO_WATCH_IOCTL from GPIO_GET_LINEINFO_IOCTL.
> It's +13 LOCs, and surprisingly only +13 bytes of binary on x86_32,
> but for the price of much better readability.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, had to merge in v5.7-rc7 for it to apply
but I guess that was expected, thanks!

Yours,
Linus Walleij
