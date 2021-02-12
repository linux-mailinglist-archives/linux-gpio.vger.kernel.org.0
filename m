Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694A2319AFD
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 09:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBLIBH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 03:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhBLIBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 03:01:05 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D885DC061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:00:24 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id j6so1473458ljo.5
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JMauD/9EvYdCOf+B8IsO23EoRoUgYrZILEIQhqwURpA=;
        b=WqkBXR5OJtDKT6GlgHRZIxFOtsuxo5APnhHHacLazlKhqis4Cp3RhWTO/cvTKL1sNK
         GVAPdRsYJjlVOaXESzxOt9X0YDmfCTbQeWFnKDJsqtpx+Z/W7b/BFjUNiBxwdzXifuHt
         lt4MJMF6Kj9Gwe9hCpeQ/cCSKpaK6HK1poBKEbiBWCTfJiifSnCg/BoTcbxq957yAG/O
         GgWUQKil1+F9awuMUWZ0qth/GRUZaskx6oyeHSJ16/GpPt0wsVGjSoGtDuI9x1ovFVdv
         x4JBdOzcU1qYEQLNNn70Q3dNhrNGdKnacuNUmXikvIRWVZt7JU399/kYZuAJJUIK9R3A
         mcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMauD/9EvYdCOf+B8IsO23EoRoUgYrZILEIQhqwURpA=;
        b=pvhXr6StN+ZKOqiSyhxfVSLE7CUK/V4NI4KvcatcsDdThNGWofHnflYKkHD/TF4xVc
         b23u17kGGhc+7RiyJ4ndBOnu5dGc3qwgW25X8lSLVrckrsuppe8/cRSneoXFUcewwy6/
         yD1xMmAjxk+CO7kiB0EM5rnXCv+P7c2Cs7YHkDpkCV6M+MmU///8lySyFGRJCpyPUmJB
         nYwqv4Zofm7riwQKwxx/t8jIzJC2r/McuBDQ+TZqixcFB1SM9GvHHN6nYbPWXN92PRPH
         0FF3s8NSEq/LD91GiL1Es0Aku15c4oFtbBgatp/e4CT1cmujc2npqDvW0moi2k+kVyB5
         tnrw==
X-Gm-Message-State: AOAM532T9f7bWuwOP1SDZgAqdCAjqRzMcILLUKrNiapatYGwa6rgljKI
        UAnH3IkjVr1GUG0DzjmbwHpbgRAmFiq56j9IDMxZSMs73Yvh3A==
X-Google-Smtp-Source: ABdhPJy8zTdiYBeOx/4RS/sICzMfPWGmjjqQ8UXPto5BZ0gcQegTu9i7uLIH7yHjIK7+n1pqDgKEs4ZEUR3lbe/fm3o=
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr1014522ljj.273.1613116823437;
 Fri, 12 Feb 2021 00:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20210125203542.51513-1-drew@beagleboard.org>
In-Reply-To: <20210125203542.51513-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 09:00:12 +0100
Message-ID: <CACRpkdZywt0Jae-=fwqRk7DkRBtxdUNdkVcghM+coGMmcSL4Ag@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: single: set function name when adding function
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 9:36 PM Drew Fustini <drew@beagleboard.org> wrote:

> pcs_add_function() fails to set the function name in struct pcs_function
> when adding a new function.  As a result this line in pcs_set_mux():
>
>         dev_dbg(pcs->dev, "enabling %s function%i\n",
>                 func->name, fselector);
>
> prints "(null)" for the function:
>
> pinctrl-single 44e10800.pinmux: enabling (null) function0
> pinctrl-single 44e10800.pinmux: enabling (null) function1
> pinctrl-single 44e10800.pinmux: enabling (null) function2
> pinctrl-single 44e10800.pinmux: enabling (null) function3
>
> With this fix, the output is now:
>
> pinctrl-single 44e10800.pinmux: enabling pinmux-uart0-pins function0
> pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function1
> pinctrl-single 44e10800.pinmux: enabling pinmux-i2c0-pins function2
> pinctrl-single 44e10800.pinmux: enabling pinmux-mmc0-pins function3
>
> Cc: Jason Kridner <jkridner@beagleboard.org>
> Cc: Robert Nelson <robertcnelson@beagleboard.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> - correctly base on mainline, sorry for the noise in v1

Patch applied!

Yours,
Linus Walleij
