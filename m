Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBDF2A8105
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730660AbgKEOfN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:35:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKEOfN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:35:13 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573A0C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:35:11 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id u18so2586389lfd.9
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z309JsXWECO0iyDgtcmyju8F+C6v3OJkibkVpUPfi34=;
        b=HsiXs0VEUiEakbq3EXNQB/5+Q3y+7iqJsjnPA/Kth42Zs/uHRmD5ehYw+sWkcRqdRx
         L5FwizhETXi5cQBx+5LZ2BYMCgD7y341SmxGtQ0lyOipTVgC3nWqfSF4VYBzE0EmnSOH
         x17U3045IcT1LhWp3h/DtNF5qBJWlLCVS97E3FwUFhegzvIAyoa27/NhndNMO6Ohy7/i
         clz0AfYWo+OvOakT64KFovD6uvi+EXrJdBp2HAUUEui5OnJ9nwmNyCY1liq3bxrFqM2f
         wn7XubM0JOg3DfICI0O1voKT6Rms9hSTr0UR13OODY+xroSdkZ/bSDlOBZ/XfgZZ9P5x
         4MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z309JsXWECO0iyDgtcmyju8F+C6v3OJkibkVpUPfi34=;
        b=N19HzfKDHkIWB2S9VCqMzNhmill3iouMeFcA+ZwQlwVLeK1QwNkdMj8mozKjG/YXZi
         Hi535eDvAECDZEV1//7uf58kB7TGodL/nheU7Atr7AOcyS6z+CCYYl2wKojIy1LoHfF0
         QEhUBV+ylzLCBBR1mNUYTR1com30VCgtMLu7sJ4oAjnlvoFK5I2SySx9lFtQofL7ibXY
         3vKsYqvslaTBiUffPU3mA126yRDBhA6aPboj9IrqdofnlHF9X0t8APHq0/JB/kujvj2E
         ZPzBhSYEvTP6rhFMxv0YoxlHyZWJkW7+ssbo6t26Uuki6+Ooq6MUOWUy7xai1O17Y1vK
         JWPQ==
X-Gm-Message-State: AOAM533c34Kmhd6vtUoneURrXkWfcO6qZjExcfhforevEsKj5h3KXVGU
        chTqVnHFdlQNIcm2NuK9agJH/5lX/3ON5B4TFLrXog==
X-Google-Smtp-Source: ABdhPJwi4+FDtHZuNaZ2D07E95crUVSI4V31HmhkquL7JVxvR4IkomX9YeN0u5y/BL+pxjnLsc2vjrD0BOna3+dEwDk=
X-Received: by 2002:a05:6512:322d:: with SMTP id f13mr1037730lfe.571.1604586909849;
 Thu, 05 Nov 2020 06:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20201027084417.10137-1-billy_tsai@aspeedtech.com> <20201030055450.29613-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201030055450.29613-1-billy_tsai@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 15:34:59 +0100
Message-ID: <CACRpkdY+oOWoEVEn8ECckYkUcDUJw2Ts4JMAu0bCbVxs3WNvZg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: aspeed: Fix GPI only function problem.
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 6:55 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> Some gpio pin at aspeed soc is input only and the prefix name of these
> pin is "GPI" only.
> This patch fine-tune the condition of GPIO check from "GPIO" to "GPI"
> and it will fix the usage error of banks D and E in the AST2400/AST2500
> and banks T and U in the AST2600.
>
> Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Thanks Billy, patch applied for fixes!

Yours,
Linus Walleij
