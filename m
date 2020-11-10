Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F052AD883
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730826AbgKJOS4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgKJOSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:18:54 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8D2C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:18:51 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id i6so17786063lfd.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yEb8SLvwYM6675N1kcLu33g5b43ooDKnUWDg2MuNw70=;
        b=dySosniDNPpgvWYF4+JGAVaSJLsfzMMHchLwrnUw7r39jGDntjB0KjI86SPwnxMR6L
         d14V7OlbU1WDRfwoXkx6VPRKNYd+dKojut7EImce3jBAZL4x/MbsJSUO/UzMM8JMKyOe
         q2KwphZsBP2cGW06PXu0h64z9B6Ldr0uo+jezxWNRu5HFkDXSb9WS3dfHJmk4pkTHmun
         xAiWGNHwY+DHgl2LMrU9speqjv1MBlOl1y5WbsKUDsN5f8IoPPRIMk5+4j1WxCId9dtG
         811Pv4gP2GBQ8Tkdvihd7JqGt89vdyUiN7Pw4TdZUdPmbLgP0WmSqLHG4DF36jlB/XIe
         c62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yEb8SLvwYM6675N1kcLu33g5b43ooDKnUWDg2MuNw70=;
        b=Zc6hOtZtbXm7HnpxZC0DirMfL8sNFiUXkS2epaemg5bfPH4VyXeRyaWGCg/eSvsGqo
         4ov19xNNVXgLA/0OgdYVLpkM4AHSemEFckVaArcZGIW/0YsrSEAaFCHnNXohMLBS61+M
         1rAc9jPfIveXumatDC+RhLk3JIM/RrndxkwlMvGhzT9P+T22sGqYpLRud7jARRI1WKQf
         sNIG/Sg6FCg7bml8NKtoyXf/UOkhDfenH0Gj04GSSTv6s3CrEH+l8I7mc5MYs3LkVyKP
         mVZtWKAw3W0jO2qcyrS9Jprg3mcbO3C4lTDSwIwjS43R4VLwOiSE/AkUtggcTRVMF2kV
         zFeA==
X-Gm-Message-State: AOAM530OIVtVV8MdaY8ToLbjrpQ2VleFs1PmAlNjDpdLJ+YPYGzcAf6w
        DvRAIlTbZOkrMP/Z8E47QMBDX/MSyXQCmbZybkHxzA==
X-Google-Smtp-Source: ABdhPJx8DR3A9HZXVyV5Hw/ZIpPtbFQchtKdOZgI87BTIuRS9xLwWyIYq34Y5zWUwvd/nYChAFW4q26/YE5DXMVzvfw=
X-Received: by 2002:a19:ca05:: with SMTP id a5mr4558685lfg.571.1605017930249;
 Tue, 10 Nov 2020 06:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
 <20201105120410.18305-2-srinivas.kandagatla@linaro.org> <CACRpkda91ncAVGj8_qcEyKPnRQdJjXMMCQ4ZJ1t7bVfcCZF=CA@mail.gmail.com>
 <f6bfa003-b8c7-f0d1-24f1-14f45fa37a23@linaro.org>
In-Reply-To: <f6bfa003-b8c7-f0d1-24f1-14f45fa37a23@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:18:39 +0100
Message-ID: <CACRpkdZatw-zUcRNJRCcdjcv2aeYJn16PdLg3nonTMmWFbhxig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 12:08 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Some more detail of wiring of this additional pin-controller IP:
>
> This IP is an additional pinctrl block on top the existing SoC TLMM
> pin-controller (Audio) pins.
>
> The hw setup looks like:
>
> TLMM GPIO[146 - 159] --> LPASS LPI GPIO [0 - 13]
>
> However SoC TLMM pin-controller can only be touched for use of those
> pins in GPIO mode and non gpio mode is completely handled by the LPASS
> LPI pinctrl block. Apart from this slew rate is also available in this
> block for certain pins which are connected to SLIMbus or SoundWire Bus.

OK put this in the commit message, good to know!

I gues the pins are not quite "GPIO" at this point, instead they are
turned into LPASS pins?

> Normally we would not expect these pins to be touched by SoC TLMM
> pin-controller as these pins are used for audio usecase and the control
> is always with LPASS LPI controller. There are additional bits to
> configure/enforce this in SoC TLMM block!

If you start to use IRQs they might become hierarchical WRT the
TLMM. But no IRQ support yet, so...

Yours,
Linus Walleij
