Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00691216C74
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgGGMDH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgGGMDG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:03:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3386DC061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:03:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so49524547ljm.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YH/VxHJ3AGs6CZr/wDufvaXGnXEL37As4napaZvmJwI=;
        b=Bgh1b8lny6xvbW6+ct6t0vaU1Jiuk1+UbOS0d8piluPPBGIXBoT6fW7BVBSL7RHC63
         fEwHuYtJRRgTOHhbS2rN6Tjv4NtcokJr8Fuoa7BvDxlhthTf17pY3yOCrhuNLV3gkrYG
         Q4R3d+gPzj9akoo0jD0im55k7lI7uXK4QpdEzdJsmEJxDe4Nb2ojQJhKD+UQ+YtvdV8H
         ZTjUu6RzuTMzq6LAahoT55UVyxUCAbEEUhKJ/VvC7TrN4hv/IrpXz4dTMVhhSmFMYZNM
         xcw1PbLOYtWC79erbC2q965s5SZDvI1mznoOTC7Wo6tcIWKecnXnph1xJwDHHTVaozHM
         aPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YH/VxHJ3AGs6CZr/wDufvaXGnXEL37As4napaZvmJwI=;
        b=CiE0E4fWNWLZ2Pzed0HTUqUv+S9xK89rRvF5D8OuEcM3qm3TPt1y+y/W6BuUkbmTYo
         /hpw7P5ANnhluxCPcJSVWfXBipw07o7+/KTXShOfeVB7NPlLZTx7xC6zifRFyLbOV3WX
         lgVaHv7tv83FGaKEh7dW/L9oMv0tn7L5GGI3CzAldxjZgI+Ey1+yS5aTY9ONxhuSZMmH
         6wzPc/HcLzY+Vg/4lOXfYBSW4D/7gO+sdspFuneoGQaWp2cmiWDFQbwgxXfLlEYAJPCs
         I5BAdE7+u/uGGp0CPm0juuiIHo8znXjv2I216e/QodX+iWxoQPnAMWc9p/p+gyE6xnYA
         8Drw==
X-Gm-Message-State: AOAM5317V8LI9/4Vwxu43NqPG+eI37GmHCXiBFY9Koy7RGUT6BuJTsV5
        NNCEMKV6+p8x8JmJiMJ6Uml9rpzau/a4EXm3PbstUQ==
X-Google-Smtp-Source: ABdhPJyR5v0EwI80g1kmy1SXVGsVqQpkid61MlRrKwlnDjYgLnU+qYwazQ3V+EyiCn9ABxFKleq7Kr5Bjuu2lykaDYY=
X-Received: by 2002:a2e:8597:: with SMTP id b23mr14035216lji.338.1594123384691;
 Tue, 07 Jul 2020 05:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200622192558.152828-1-konradybcio@gmail.com> <20200622192558.152828-3-konradybcio@gmail.com>
In-Reply-To: <20200622192558.152828-3-konradybcio@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:02:54 +0200
Message-ID: <CACRpkda7b5a95ZpLmZ07awzSHenfxyzxFR46s0cUa_5JzYQ3tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] Documentation: Document pm660(l) SPMI GPIOs compatible
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 22, 2020 at 9:26 PM Konrad Dybcio <konradybcio@gmail.com> wrote:

> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Patch applied.

Yours,
Linus Walleij
