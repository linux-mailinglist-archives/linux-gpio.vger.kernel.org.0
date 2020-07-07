Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6ABB216CA6
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgGGMSS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgGGMSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:18:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199E0C08C5E1
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:18:18 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id o4so24591346lfi.7
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SOnszkcT7TNdqVrzh07A8SyMxgSxeV8gTnMwaKIquLk=;
        b=N/OvAqBuFoj3Pd62waZt9/FVEceVBKbXkq4lTVip5frbC/0py1e7qlSOX/CaOcJ9KN
         0ebXE5iiaXIXyQ4zZoZ/VQWHhEOelXphjkuL5AH8WTrx3FrDh+7Lq7yQMGJnjPLYPGjf
         JlYqdmHB0kc4EsvML9Dg+v5OpEY/f1e+X5c3iVVMyrMs/Vj8caqxoTOpjfK6uHf7rAxS
         HCtI7caAC/hBKCsbr+Otirw4x55NLo9xlDxOyYY2pg0EfJv7aYkbVXr7eZT1NSwSEi88
         XvcPSH8TDp6QBHWzKhtfH++wuwbFvJXZZ9qs7kic+y2B6FLOMsY3iYjf8g7y4gqTI4K1
         nxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOnszkcT7TNdqVrzh07A8SyMxgSxeV8gTnMwaKIquLk=;
        b=tyrmqZ1PHrVaLy1RFdkoqIoKmxeynET36g0rIlPVa3mS+UGg/eI9nGsbkw8FDyPc4r
         DC3Xl5gw8yhbEDAZaO9f0uk4vw+8sT36G4YGfD/9DTL8Dr2kLuBEIy4KtSZp9hnJbU43
         LHdaLcwj0JV8qQIS697mYTkwSJfrB1XZdr9vQMAlXklv2pNJ/jVlS0009KGFWJnjaNbp
         QFcFN1vIXrZq8i/EVxtqnKIBpixy86U54ZPdRkP18/gagjFIOevG8SlAWLpSM0tdMilp
         BTaoM4cbNuleLVHbyw003KsdlSdmSUSwhEAebgONh1kobQ5Xqm83qvCv070DRPX3z21U
         jDYg==
X-Gm-Message-State: AOAM5336mSbWrnchNTEafeLJC7G0SRK4ix5yb1j07ETgAw39Sgu2BlgD
        mNJINjnflBEoJQfvmtwJmnXakAzrpx1gQs1I1mlBBw==
X-Google-Smtp-Source: ABdhPJxH0G4kh8NlF9pHPkG/HVOhx9RJ/tQnhLrHOKjaGWMKl3J+G1CqdUSXg1kIkjYFLaEAugmTgoODVIXAf9jL/7E=
X-Received: by 2002:a19:745:: with SMTP id 66mr32931901lfh.77.1594124296456;
 Tue, 07 Jul 2020 05:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200622113740.46450-1-paul@crapouillou.net>
In-Reply-To: <20200622113740.46450-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:18:05 +0200
Message-ID: <CACRpkdYsH9B4_6XLuc-8koMsA6JdFSaMokcF+k9KK=mz-CtUBA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: pinctrl: Convert
 ingenic,pinctrl.txt to YAML
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 22, 2020 at 1:38 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
>
> In the process, some compatible strings now require a fallback, as the
> corresponding SoCs are pin-compatible with their fallback variant.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>
> Notes:
>     v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
>         - remove 'additionalProperties: false' since we will have pin conf nodes

Patch applied.

Yours,
Linus Walleij
