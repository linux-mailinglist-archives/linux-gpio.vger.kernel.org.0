Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302BE3905E2
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 17:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhEYPxM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 11:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhEYPxM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 11:53:12 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C190C061574
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 08:51:41 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id f12so38799449ljp.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2BITxJeURolxCke3CdL4VW8uGYWErBJVsMNOBoANVg=;
        b=QjMPWfR77EmfcdcbElloKCE5opIP7wXaOU6VDNR2tsUFCeXzG2eMZGp66BqROg0Cz+
         ucJ7EBjOAJcqDi7ddqOQ8kthv/Xi6OrMnPnEIaygfCLPWQWG1scEInilWoBL3UazFlIq
         ma5PJWhRhP3Ds6P2Q9d4Yrw3hZeM0OClMQ8AyQCjNIvlA2//n+SmxQv2SZUPigNjv/N9
         cRzy9MSGxn/O0kTqryhgqillQluWLg8i1I7koyJIYEeTVIEKTSNBverpwj5zClfFHDIN
         JDRFlX3qWSoigrgt3HRdgf4eskN+tbsaXFAv0qyVukmjsY4T0WdswBO1b0bCxAUyT12O
         qmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2BITxJeURolxCke3CdL4VW8uGYWErBJVsMNOBoANVg=;
        b=sH5NTNF2PJzF7B3iOFC8NoORdmF59xIHwMA8rLI0bDotzuGZWwZiYOjvY6k8J20Hsb
         c7Rq6jBUD5caUCDbzKgnbgcsakYN4kMDuO4WeZcf6Ks5+oHGZSR3D35OB50gTo3dN5D0
         IQjJNoI4tRcmh8SjQOVxEYJ01lcLyr54G1DNTjOf8DfBCc67jxcsouAL11Sir8X6GP9L
         WxGEsCrbHLq3H+8kxZugJ+2ulsBrRhDoJlyRWEvMg6FghU344AFlTlrovC4w2rKXUP67
         ma1rXvDBPIV3smIdkTWmBSLSnMxyxlLRV2oz61WAAda0sTlbb6KawGaJUiNcghFYHFUD
         zTLg==
X-Gm-Message-State: AOAM530Uvk8v+Z/wSudaptW7v1Vh34BsJxgA200OiKx2Dojel5WsoJVt
        PNvvnpgITj1NuAaH2UnArjPBYdQ4nhiyauesmVk3MQ==
X-Google-Smtp-Source: ABdhPJzze4bqogalPiiXYhQSV4Axxug2d0T9vkqKGYvuw+UgQeq7Qiie3zdmCDwElEOVv90Z9aoX6pYIJgLmld5LqEs=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr21422534lji.273.1621957899615;
 Tue, 25 May 2021 08:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
 <7f19bf2bb61ad64a9df94ab16bc1cca08e8efe43.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <7f19bf2bb61ad64a9df94ab16bc1cca08e8efe43.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 17:51:28 +0200
Message-ID: <CACRpkdYjFoLD83Kn1WMR3fdn6=eD5MpM16wOmA41Oqp__AcM1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: bd71815: Use gpio-regmap
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 1:30 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Utilize the gpio-regmap helper and drop the custom functions
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Very nice!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
