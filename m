Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7C645184A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Nov 2021 23:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348432AbhKOW5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Nov 2021 17:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348851AbhKOWyf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Nov 2021 17:54:35 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82610C03AA3C
        for <linux-gpio@vger.kernel.org>; Mon, 15 Nov 2021 14:06:07 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z10so51846303edc.11
        for <linux-gpio@vger.kernel.org>; Mon, 15 Nov 2021 14:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DydRu7SpBSGXsY1o+1JsxVZaNRTPESv1WbRFhErfJMM=;
        b=NsZfxABNmHEDn3cAEnxfzvehuxWUKowwXgKM2/RzHN1gLJBC2Xbn4Kmf7YkcAbdSQY
         Wvjred1hNAkJMPqPI74nlx9auc5zLsTgpHtzZA9DgkYndFOWzEF/M6Xo9y7ScSKQAiRT
         4x6aB4KBn0QPgpWdz6ZmI+xN6jJ9m0Sg72N+L1tk6h2fqM/BY5nX10HGkE9zYHLaZvIb
         QjwndfZqoBl8hupCCgNgE8JcrZ9WWx4h1sIEjiCXAu9KivroAGA8boMT9Q+mTdiBYQmC
         wX+OZ8qBocm1oEPw2/9/Vzz719VkQEz5/GWml2T3umjZ7AgD1MtLVw+rZeRTgQSIQXSP
         Nfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DydRu7SpBSGXsY1o+1JsxVZaNRTPESv1WbRFhErfJMM=;
        b=LggwEIOCLaJibbnlN9M6gTcsV1uCEWSUo8dwi9Fb1MsbXJ9fG9MYk5oL0sTepi16VG
         lY59Ds4+lmEsfqwA51U4QEzR9XLuoDXpJTFC0edrugCLomdoUtZQE66SPZzxX6m3UfW1
         Ev0kTPKPDLEn1veHfT0TylZrAzr0S7Ja0gCgb0gDDoOwBnDHXioWbayPpDzTW8fAl26R
         FVmcwpHNp//QL3sygZwq2vRoUUI9Z87h3AZcuq4uusvbFXv0pWfFUO3M4nX9o08VyWXi
         Kgdxpdovuyc9kHSfio8gCealuU5//bRTDwv/vxLVM6/+qny1t8LLFrLWLj7qKFo+jisS
         Ls9w==
X-Gm-Message-State: AOAM530DABt84JtVwvHZ+9ADqQri+2e3H65Yj7QfWXqt/nU6B3Otgv2P
        BP/R4w3F05sMcB9XWx7elF3oD+8wqwuZs2pFAMJhZg==
X-Google-Smtp-Source: ABdhPJwSi1BR2b9pVA2sLcVwhXu9OEXIKNaFyg+koHsL/tNEQcgfiypLJF0L+hXMaCL8HnPm+3CzHQPwuJd+6mtEA64=
X-Received: by 2002:a17:907:1dd5:: with SMTP id og21mr3099771ejc.233.1637013965985;
 Mon, 15 Nov 2021 14:06:05 -0800 (PST)
MIME-Version: 1.0
References: <20211025015156.33133-1-brad@pensando.io> <20211025015156.33133-5-brad@pensando.io>
 <20211028072616.p3mazud3vi5jgynk@mobilestation>
In-Reply-To: <20211028072616.p3mazud3vi5jgynk@mobilestation>
From:   Brad Larson <brad@pensando.io>
Date:   Mon, 15 Nov 2021 14:05:55 -0800
Message-ID: <CAK9rFnwjDrGO5u83vc19QenFoCmYs07Nzo1N76SsKC8BLXHbvw@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: spi: Add compatible for Pensando
 Elba SoC
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sergey,

On Thu, Oct 28, 2021 at 12:26 AM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> Hello Brad
>
> The patch name "dt-bindings: spi: Add compatible for Pensando Elba
> SoC" doesn't mention to what bindings it is referring to. For the sake
> of having a more representative git log I'd suggest at least to add
> "cdns" vendor name in the title, like: "dt-bindings: spi: cdns: Add ..."
> Otherwise it's impossible to understand to what bindings you're adding
> a new compatibility especially seeing you are doing the similar thing
> for the DW SPI in the next patch.

I'll add "cdns" to the git log for the re-spin.

Thanks
Brad
