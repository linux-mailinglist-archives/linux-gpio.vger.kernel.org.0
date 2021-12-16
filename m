Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6984A476CC1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 10:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhLPJCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 04:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbhLPJCb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 04:02:31 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEEAC061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 01:02:30 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id t5so84178418edd.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIbH4SBUTuR0l4tTL7AOxNkBOgGIn/iy+LZnKcqvvgA=;
        b=o8+RashkwgCrlNotfXLtqTsFevD8f50yVDdW+L4a62MZUsf/U1UGMDnJF8P2YoRyha
         GEsAMaruSO85MGPl4XWKn15AooxtYn3QF4lLMPSziwQSmSgjMXDBouRA8fM/qli0LMbZ
         xV3AvI3IZXH1ssWssl6jbadMCEN3IpF6o38TscsPT66kWBDxo/y8lblOPMw9109TyYUQ
         T95h4i+AAnASqpU3j2emLTbXsLWEKxUMuAxfn19SdAT3SK0xceneHAeT3cSe6b5Ry6VU
         SGrPEa8oCv6+FNiJVy7tn4fYFCzg/Aol32zEajFd0FZWfe6FpWTOSGSujXP1J63JPKke
         ORuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIbH4SBUTuR0l4tTL7AOxNkBOgGIn/iy+LZnKcqvvgA=;
        b=QgOtEAVUAmKTNzWGq5QZIZkeFnia8T6EpvDOjhN3xSMuSq6iqwPE+v6CRDw8dKPE3R
         a05YJIt5zHMRYelGVq+42VfLLs2ikTO3Jg+7dOkTe5hKhK7qjxh7dVCfoNTcKshKuIsR
         XdWPefH1er9MfhpZqVRqQd3xcBL6eKug+5Pebzxvt7WbPMNmoks4yb9/pmO1IUHHOAjF
         A51wTXfro4Cx6y4GShwz2EEYrJiYTXelj1i6YtF8pLoVyxUWDCR6dwer5d7cTLXdF/4J
         ksYVj93Aim6jnB6dkmMGcP0k6SgaXMRQrZyhSbOmgUpRQg2RoMADGSvK7K92AZ93ims1
         ptBg==
X-Gm-Message-State: AOAM530f2r+FuGHHCJMlUXDFNmFma3JGa5VPYcoBq2tKOWwSLxjgD15A
        5X9KTjWcY2Two4B+dmfXmbyUIQMyCl/cmNaSl77XMg==
X-Google-Smtp-Source: ABdhPJySShxGp6YbFcUrtOlrqvy9G7/3hwoav4HzaV1/xvWq/Hhe1DphVlmvTcYd4WCYYxbQtiCJBZEzhnGMkyZPWCE=
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr14700005ejc.101.1639645349406;
 Thu, 16 Dec 2021 01:02:29 -0800 (PST)
MIME-Version: 1.0
References: <adc9d6a4-5cab-d8c1-a7bc-d9edc673e4b9@axentia.se>
In-Reply-To: <adc9d6a4-5cab-d8c1-a7bc-d9edc673e4b9@axentia.se>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Dec 2021 10:02:18 +0100
Message-ID: <CAMRc=MeukM8-1P6t9LBgjs9VEQ8JhqNyUVAiZ1yaALsPSxSUTQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: allow line names from device props to
 override driver names
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexander Dahl <ada@thorsis.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 14, 2021 at 11:00 PM Peter Rosin <peda@axentia.se> wrote:
>
> Some GPIO providers set names for GPIO lines that match the names of
> the pins on the SoC, or variations on that theme. These names are
> generic more often that not, such as pioC12 in the at91 case. These
> generic names block the possibility to set more useful GPIO line
> names with device properties (i.e. gpio-line-names).
>
> Allow overriding a generic name given by the GPIO driver if there is
> a name given to the GPIO line using device properties, but leave the
> generic name alone if no better name is available.
>
> However, there is a risk. If user space is depending on the above
> mentioned fixed GPIO names, AND there are device properties that
> previously did not reach the surface, the name change might cause
> regressions. But hopefully this stays below the radar...
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Tested-by: Alexander Dahl <ada@thorsis.com>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---

Applied, thanks!

Bart
