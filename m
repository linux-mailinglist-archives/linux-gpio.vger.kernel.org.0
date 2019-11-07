Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04048F2929
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 09:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfKGIde (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 03:33:34 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42860 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGIde (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 03:33:34 -0500
Received: by mail-lj1-f196.google.com with SMTP id n5so1244499ljc.9
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 00:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=8ek09VPNO3gzdUGFBF3TCaBfdeVrnQreDy75VidkR8k=;
        b=iCIsC9jQ0h7fRCERESyv7qHVa1VfMPNIEi6ybyNfm3mavXJ2bKPuVK0YJFbRRfKZ5v
         F2jxkUIuVnnrLRXc30fmGVSe+EtmGaIDStPjPgRXYZtT8qAsMvN5UUh/dH4F/iBn09Io
         /ekD7tQMfPbsAzKmdNB0OxxY5eN7Xib8Y7ehxvjYMBU3ER43wCykG+8vJKSqWsSlngWC
         v3YzvI2L1pproqIJwQ1QQRr3zd0kiLd842yuaOWhtttnkGgeCZV3e9wChplDJSWbkbER
         /hE9xlN4GhQ4HAPt0PmwmwX4L+nEKFpKVavCUUuUXXizUn1DsMgr+RaFhRzDuhV3r5SB
         3tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=8ek09VPNO3gzdUGFBF3TCaBfdeVrnQreDy75VidkR8k=;
        b=IbabdW5biKewsSSRiAI6ab5Ce1+fl5yEm/+x3NOdi+aHddnNZDUopcoaWRcs0yVDcH
         CjQs+XfRepmaBe+Yh/1+VK2jMr0QVic33pUM1XvGf2p64NBuHHlSNgFiAR8gKPcdDllP
         DabAnZVVZNaZdrB3xpjGwe31J+7gGiXK+5MW2qtabvY6D56PY4cF9VPyNSIkIhmjUH9n
         XwsASedZhbSbfeojM7Zh57A9HSrAXkp56dcmQEdLwmv8RjJOGVX4NdVPgB6ZfNZ46NPr
         WaamspiTbNvYXBle50jTQPK7DictoNuRmg6i7aKYeSV0rExOGoC80BFXJ1yd6/1OX+kY
         C1HA==
X-Gm-Message-State: APjAAAW7C3pFZQ1VMAoYlG3nuWTiy04/F3BPFWZBN5Wzf92/dwhfE2WP
        08ZPf3+a8bSUji3Ue4UcBDXd5L1Cl9rJf0t3fcI+ettLS5Y=
X-Google-Smtp-Source: APXvYqy3fnhxCS+cSxF49rMSA9qUAdNpF3G5sfzA0e4O7PW8nFLwtb24eO1HlsGaUciuxkXxiUvyYeQ+C+p37lsomlA=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr1393623lji.191.1573115612016;
 Thu, 07 Nov 2019 00:33:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com> <42f40109e2926bca197b30fd9624c609653b23e5.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <42f40109e2926bca197b30fd9624c609653b23e5.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:33:20 +0100
Message-ID: <CACRpkdZWhN94dd=5vPH+oqdKb69FXdXV_szJEanuX18MNsnxSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 6, 2019 at 9:54 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
>
> NOTE - for gpio-amd-fch and gpio-bd9571mwv:
> This commit also changes the return value for direction get to equal 1
> for direction INPUT. Prior this commit these drivers might have
> returned some other positive value but 1 for INPUT.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Scott Branden <scott.branden@broadcom.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Reviewed-by: Michal Simek <michal.simek@xilinx.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
