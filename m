Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC4D399B2
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 01:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbfFGXY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 19:24:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40230 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfFGXY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 19:24:57 -0400
Received: by mail-lj1-f194.google.com with SMTP id a21so3109061ljh.7
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 16:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yxnf76CubLzSCgXqXpm3Tzi+epD/T4P0TuWJfUgCO5c=;
        b=m7cbzg/qI+c44FkJJMtfka3ULkiYlcpI79X7AytRLLbncMH7UguQ+pmdFoSIdUQ4xb
         395kdBEA+7vIzXou6mzkhFaOnbg2G6WVZhTjgjZPNPiTnn7mThymVTCdv9vmRwNjli6d
         qr2CcHPVG2YAWGQ5HzNc8MSGj8lw8kgCTu22wQvaB22PTIPDMpRPp7FCzXhccEh9sOHR
         YseeXQCtF4KngoJUx/oUlBuVKGXanwNSs4NDsZ1vXs6ca6MlZ+667a2xeAYC94qsAXmB
         0DJdQlJq+UnSK/PlBL+kR3FZBg6+Lj0ESBAyT2iqyuQXZXAG6xtEzMt1Gjsxnhg7w6m0
         y2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yxnf76CubLzSCgXqXpm3Tzi+epD/T4P0TuWJfUgCO5c=;
        b=tCTT74l8d5te09aSL98FUEX+6DXtaquP9+4bqzBi70Ugwxv+lwrAftJek7cCB+LLIi
         d+V7Tw6SZqIZeMctfAQpqQ5r2VHDeMSzx4w5TpRhramrkgkLfzAAS0XcEz3lm6BzIPVR
         M6cpr+EHl7M7rrwxjbb3kgvA834/KkTIB6hlzG+/3ZciliO1f0DoDGUminQrI+Yy7syx
         iUB28K6K833805P4tBSJqSFGbtu9FymO38sqmYBgsDRythZ/lH5KhZG5MkwyaOgvhgBP
         k/EVMNN5rCATBYSHvtBesR/qCoyrhhfnuX35ZEMOHGsVnngs32tGpvfq/w3LmqJbGE/2
         pb4Q==
X-Gm-Message-State: APjAAAUa6TNpLJRjesukyZNSVyPc38RKaYMsfnKoeOplRTT+Njq67eJY
        Zq8/2Mq4l6A54k7WrRJmLHlX37dBsuVI/wo2RKn0HD78
X-Google-Smtp-Source: APXvYqz+5A0YHaUqFPfF5fc/C7ZquljZneISf6m3UY24XIeHmwjuL30ItSQeeaMXOgZ8MXGYNR70QQM+S+zI5+UI0c0=
X-Received: by 2002:a2e:5dc4:: with SMTP id v65mr20460259lje.138.1559949895389;
 Fri, 07 Jun 2019 16:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190606231144.GA1402@embeddedor>
In-Reply-To: <20190606231144.GA1402@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 01:24:47 +0200
Message-ID: <CACRpkdYXxHZ2KmU5Fz1eDXN=Z9i=uqwAtOWmpHam6F0U-eYySA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: tb10x: Use flexible-array member and
 struct_size() helper
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 7, 2019 at 1:11 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:

> Update the code to use a flexible array member instead of a pointer in
> structure tb10x_pinctrl and use the struct_size() helper:
>
> struct tb10x_pinctrl {
>         ...
>         struct tb10x_of_pinfunc pinfuncs[];
> };
>
> Also, make use of the struct_size() helper instead of an open-coded
> version in order to avoid any potential type mistakes.
>
> So, replace the following form:
>
> sizeof(struct tb10x_pinctrl) + of_get_child_count(of_node) * sizeof(struct tb10x_of_pinfunc)
>
> with:
>
> struct_size(state, pinfuncs, of_get_child_count(of_node))
>
> This code was detected with the help of Coccinelle.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
> Changes in v2:
>  - Update changelog text.
>  - Add Kees' Reviewed-by tag.

Patch applied.

Yours,
Linus Walleij
