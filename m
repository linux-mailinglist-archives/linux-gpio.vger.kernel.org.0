Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DD1350040
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235586AbhCaM1r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbhCaM1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:27:21 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585E7C061574;
        Wed, 31 Mar 2021 05:27:21 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso1140695pjb.4;
        Wed, 31 Mar 2021 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBSMntEex66iPKIFZdF6l21leD2WIluDlLwMwMUQjy0=;
        b=IWSqarJl3ihff0wkELtkTWUfUDLeE08oFUbjg6D1AikmaBNkO8nGCnR9jmsnXZ3hZ6
         rmqAAaBHI7og/yurW0Iae7aI5Z2hHlKoxlKY/k9adNbh9GLN6V8fQVlNsNbByak3vePd
         gCw8Goi0AjxAbC1akmp0lPHG0wM9tzS/Bmz1FzTTIAK5zm0J2dvkwDfgFxOQafXL8YEO
         Kz8VWQWLtIg8sgY6KD/7NkQ6m5k9IUpAtR6/MyuC8ueky2XZFgV9FBg/kfgaEnIUmlZM
         9J47ceQ4LYXqs/scVsT5035q2dxzLMbOR1g0/LgGTLiCuEWoutK/60bQIxX26R7mOKmX
         7CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBSMntEex66iPKIFZdF6l21leD2WIluDlLwMwMUQjy0=;
        b=NA4XyMGkaXYfAf+UgOP8QFK5mjo06zJQKUMGu0JlCPI3ln6zCwrN1unEGeuEFKcv0R
         cf9C6x8J+dBJ3O5/MX4PZI7ITxQhO89krCTE3+XN8OV6st/uvY0ke+8pRRcsDJO+3Z23
         ztVb71m3UZZ+agBaawf5Z6c198acWyszemtf4hPY6pP/HsxuYWAG7p9lQRcDDx2sVDVq
         9mj3wX8WON3PPd9AjBQNlGY0eWo4cwqDBFdyt5ZIU4xgEgYIRRw16mP3BfVHXieRQrOi
         vIFiBCterZN88kTenfahXh/735A49H5tunzU5YUPtNSkaGEyAnSGCMq/+IlOEKxZ6ivb
         wTdA==
X-Gm-Message-State: AOAM5331ZAPc3DkWPlSgckp6g90fSGDflrhsyjB/JGDDBpG5sE7OlIhX
        L4h2DFABOoXa4mUMhrI2D33nVOfPiTUjJn++qOA=
X-Google-Smtp-Source: ABdhPJx3ECcz21f3ZEbz0rXPVEq69zVLoBvtvUmmQkt6g+sDul4/HOxnkqwCd3ldqlKS33g3bpWprXbEwtoj63yDjFE=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr3373321pjb.129.1617193640933;
 Wed, 31 Mar 2021 05:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-2-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-2-ada@thorsis.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:27:05 +0300
Message-ID: <CAHp75VdqtWS15YPvaPvy4yj5TdW7DDgFB+_bbavFqPBp1zm6eg@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: gpio: mockup: Fix parameter name
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 2:18 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Module probing with the parameter documented yielded this in kernel log:
>
>         gpio_mockup: unknown parameter 'gpio_named_lines' ignored
>
> The parameter documented did not match the parameter actually
> implemented with commit 8a68ea00a62e ("gpio: mockup: implement naming
> the lines") long before introducing the documentation.
>
> Fixes: commit 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")

Alexander, in the entire series you are using the wrong format for the
Fixes tag.
I highly recommend to add in your .gitconfig file an alias:
        one = show -s --pretty='format:%h (\"%s\")'

`git one <commit ID>` will give you proper value to refer to the
commit in question.

-- 
With Best Regards,
Andy Shevchenko
