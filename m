Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2385A8CE23
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfHNIOP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:14:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39644 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfHNIOO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:14:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id x4so11843518ljj.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zaG/7UdyaIFhX05cS2xYIpIbPOrXrLv/mGC2XIacwH0=;
        b=Yc92OLlHBJQCnEKSWpA1mKGG0JUh8gbeUrjAtI0OgS4P418XH/eDOCHlX93E/2CJ3w
         d1wVJLzVs+QKABy2uINiVW3n+eQ+UwW23Jda6fPVCRvh0Ldbf8c2Sb2cx49oWtoO1ihz
         BEQn19zyNr3n1EtxMBrqW7D0A9q+0YjwY96Zx8BOUEgfGD8yXls7zW3oiNFCJKkVTnQr
         g+CGPNvkG+yr9OCI/vdaAiqde3Pc2q5agepXdge3hlOHLgcFmzIt+Jjpe2ydAorCndKi
         +8Sp6oH4puH+hQpgUK5SD7uUYefUib5RIzFvc46O8y6RuG/vyofxy0sOCdwxhWhYWwQ9
         iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zaG/7UdyaIFhX05cS2xYIpIbPOrXrLv/mGC2XIacwH0=;
        b=r8kg++WFlV5KGYb5f1f0+O39jMFJnyTq9jz2Ua2sLULGSvkTvIN0/WtWSfFB77mstq
         FXtgw8uYlKbOVovg2jD2ZSbT45NXQG5rBFlQIz84Yvt8IQLC5oaOheg7PByiucHda/zg
         ChI+mRxB+bh1hbpSYUFavXd7IScCIMbOeihsSh1GgaVdXZlIt5j/m86wXVXAM3Kf9f08
         tx3/iaPZ+xXUToRXYfku9Aj/ibPSxOId163XEBqhKYpLIuEyti/M57VH3B2xJM4E0K9e
         fO4RTjwV1oHwXnmPgxf1uUW6t2oqhZAIiicqLw6VyPe5FlzUeJcZSqD+jnYh52QyYano
         RUaA==
X-Gm-Message-State: APjAAAX+SbDEsgelvKTJMc389yVwL5oLWahgx0E8+qGcCXys9INejtyt
        QpVuE1kgtC0e7FGM/TqUnyy0H89PGGsqbJLRDw1Lbw==
X-Google-Smtp-Source: APXvYqzIyGCVXUJvtCqFdjeExOWBR6oTr+xberM5+BO82NhIej28AjD92DKyh3qHI3IcHXX0bYXMJJjnsrhwkG8yczo=
X-Received: by 2002:a2e:b174:: with SMTP id a20mr9290636ljm.108.1565770452799;
 Wed, 14 Aug 2019 01:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190813205528.16651-1-robh@kernel.org>
In-Reply-To: <20190813205528.16651-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:14:00 +0200
Message-ID: <CACRpkdZztpUBWnUtJiZY030qVJMEB7gNstyXQeTYWUZ6LMwx+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: stm32: Fix 'st,syscfg' schema
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 13, 2019 at 10:55 PM Rob Herring <robh@kernel.org> wrote:

> The proper way to add additional contraints to an existing json-schema
> is using 'allOf' to reference the base schema. Using just '$ref' doesn't
> work. Fix this for the 'st,syscfg' property.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I've got some other fixes queued up and can take this via the DT tree.

OK!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
