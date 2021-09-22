Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8034146E3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 12:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbhIVKpX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 06:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234851AbhIVKpX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 06:45:23 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63D5C061756
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:43:53 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id l19so2442904vst.7
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qo78C9hpTaUZzshSE3JqG8ok1Cx6hErSNU/DUKP7eFk=;
        b=oAitpk7+hwMaSzXiFoweF6+l6LfDs62vtoxg8zfF1Brb15BUTYk0A3vw7YvX0PqHzx
         L4Y/1RMN6CUwiDmNgPLuzuz0kCe9a8KNFrR9e6uq0s/rAbH0FASu9fzwqqrYY6SNOxN2
         o7W9NfSNODqb+axmlIUsYV9UlFO6bLMt+5v4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qo78C9hpTaUZzshSE3JqG8ok1Cx6hErSNU/DUKP7eFk=;
        b=HvM259AX1o7IaCJr8FEJ11sF4UpFgmsYNOjKWRsUMXtebvQtruQNZEiPkheVeD/1fw
         HErnlPhClzocbu4E4E264d6Vvj5UH79jxeLzP2unCgubjvmB/MchuQ29d1w+XfH8THHW
         1MtrduBTr9rpArHlxGDHX6UIwIvT7SU4+7FUM9pZldkTyMqLHwlnSf6pfsAGTwrIgtLU
         OcCeb+UbLlo23hruqcd340l4vpvqcVjUsoCdEW1zwZbga5MACUt2ObEFm+cKABGgsP1U
         2y38Zvjn8uDlqzRTF1W+w0gi0C/KRXtx0oy8k9W7pCN3fUdoILFiStrM5NqkCc30+D0/
         DwUQ==
X-Gm-Message-State: AOAM530Yos4XfK64rPbAHFvvOSUW2zxZKtAGtnCotPWXegv02em25EsM
        w0qAALgQjOmTpex9nIb9j3HHNqJS5NVqFKv3pMgtJw==
X-Google-Smtp-Source: ABdhPJwPF6z5EYCd61rZYdUMIeZzdf+8Q0cyOmNAUaIoUh0BCayeTwfyb8i9gArK7fN+eXHN7cvjsRzmQx2wAsZ8Pbk=
X-Received: by 2002:a67:c01b:: with SMTP id v27mr11715890vsi.45.1632307432766;
 Wed, 22 Sep 2021 03:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
 <CAFr9PXmFHanrx4Frg3hQwo-RbAY-UXxC=FOAj++cshSHa99z3g@mail.gmail.com> <CAMpxmJUoG7qPhy2CxapCn1M=w_AssOQsEmyvXO18OpedM6hBjw@mail.gmail.com>
In-Reply-To: <CAMpxmJUoG7qPhy2CxapCn1M=w_AssOQsEmyvXO18OpedM6hBjw@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 22 Sep 2021 19:46:01 +0900
Message-ID: <CAFr9PXmCygArTf6njAwOz9b_j6J6vZvQXz3MHT=3gNZy6hU+5g@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart,


On Wed, 22 Sept 2021 at 19:20, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> I only have a part of this series in my inbox and patchwork doesn't
> have it at all - can you resend it with me in Cc?

Sure. I want to do some fixes to the DTS bits at the end of the series
so I will send it as a v2. The gpio code parts will be unchanged.

Cheers,

Daniel
