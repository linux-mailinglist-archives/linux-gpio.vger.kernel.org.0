Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0300286041
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 15:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgJGNfl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 09:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgJGNfl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 09:35:41 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C893CC0613D2
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 06:35:40 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y11so2309403lfl.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+w1W+CUXGGFXbZ34Qh5CjZMXrIFvrZ3lWXBN60hppFc=;
        b=eH1+4bAxQ4Xw2n/zbFWwccR3SePzT0zlwNq4GU+LGKhCNA43MoCZwQdQMjjUAcMuGh
         dsluM8ozYSNELiEQJFLaR3eiEn5++Dq8al3D8Khr1tTZPks7r68Wpt3sMEXduHALpgAH
         cUuaTKI0v+ut5Jl+ezPoJNv9Az1p9q+Mqv5kV+gUHpQCMkPsrcmwYwyDD9bEp49cOiYr
         u9O50ktsJyTOWWV11DouAXXAxK67iKi9Rk4kjR/SMSFQZnBr0YjP7aqLRc/FE+sVl1Ic
         zIrd44diWdrcacEuYGR8KZyA8OSaK5fqklnFqa4WgbHRkmOYgq2U4pp3PbNa8Q/GyEAb
         x6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+w1W+CUXGGFXbZ34Qh5CjZMXrIFvrZ3lWXBN60hppFc=;
        b=hFSUNXB0BrJeE3hiSfCBJ6oL5XOAE2iWanL3nmia32Yf2fjfXTtsFaiTScbjA4jxL5
         n4qhyFsADVWj6rF7aFfwA5S6Qdteg92zEbKHpwURByEaAWD9ygQqzldCokIqUyLO3an8
         rYDuV9/18wZikNiD5EYYv5YztYgW+CfMJy0mFpF60V21N/M4173iwUfxBWf2DTWRsqNw
         b5VVaILACf9+m51FHgVv4/vj/RRlZpF3HZO6zm4iGoOmvT9tqAjcOlF0jmPsj6hnptsg
         IjVBwxLaGUEQbNSAR6vH/3+3h1GEvV6y69KkBdpug+Spw9tsvUbOLnb3QeG/CcyHLXfW
         HlYQ==
X-Gm-Message-State: AOAM533VVG3XLawUJixiM8P7kmq71mR7VAId6zZHYpOe6f7vEp62KQ7Y
        ogg3JZbXYyb8Q5fJZwPvwHtl0+9lZwIXE63K6N0HXQ==
X-Google-Smtp-Source: ABdhPJxFSWzDMt1RxkzVv4jvQRcoDe70+B0vvDwTNRVoglFOA+9S9Jcc6j31TSUtwhUg0sN0ZV0nqIu6f4fbXjVmpGE=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr1043456lfq.260.1602077737755;
 Wed, 07 Oct 2020 06:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201007111145.2306213-1-lars.povlsen@microchip.com> <20201007111145.2306213-2-lars.povlsen@microchip.com>
In-Reply-To: <20201007111145.2306213-2-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 15:35:26 +0200
Message-ID: <CACRpkda0RAK2gp-ZB6LDxAnQP3=VGrsfqkfV0=3FiSFfNhOmjA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-mchp-sgpio driver
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lars,

a new version of the patch set arrives while I'm reviewing, haha :D

On Wed, Oct 7, 2020 at 1:12 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This adds DT bindings for the Microsemi/Microchip SGPIO controller,
> bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
> mscc,luton-sgpio.
>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

(...)
> +      reg:
> +        description: |
> +          The GPIO bank number. "0" is designates the input pin bank,
> +          "1" the output bank.
> +        maxItems: 1

Excellent.

> +      '#gpio-cells':
> +        const: 3

So I thought you needed three cells exactly because the
middle cell would get you the bank. That you now have in
reg. So what about using the standard twocell?

Yours,
Linus Walleij
