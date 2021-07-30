Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F363DB5B4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 11:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237992AbhG3JPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 05:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhG3JPV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 05:15:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874EFC061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 02:15:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id p38so1657514lfa.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q6CWB3KykagPZ7odVSHKVhg71bMUe7ee2Rfq81or/sI=;
        b=m79A2839S42cY7qYEN0XcMKzZjX4H0tCTceoG5vAByFET28jaJEmrcQgyVgclJTMxw
         f8VCHLE2wYvoRKisPVLpkyMPvhlA07Uxf145O51JKZPXnoTxAQ776ae2uHrs0hah8s6P
         3yNaSQL5UZSC1apk75SjRlkEcYLOPgEgeDa+wfcCp9+ysok+Ya/DfeA1ah4TyRNAffho
         A4JjX4ajtNW8QpmDZOuP+yyaikddNt1cCq3oe4dvxuI+rsVb1aJjlXjjBgHxzlpzbBUE
         rRz37C76RewNHWMEE2vTf4uPuArS5mpgReq1ZpQFIhhkdJEoXxp2YLB33EZC7qYfU5EQ
         /RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6CWB3KykagPZ7odVSHKVhg71bMUe7ee2Rfq81or/sI=;
        b=iKffcxYenvXfRzsA3tOM/VUrQ6dtDZ9/obKwn38WGs9BZ7DSD6OLCmoF9URXh0hD3k
         1D16dIYWOfe6ZqndPe8l9n5lDu+XrsYzxqarTsT9IrS7J6lEoYVzyqsUbJU1yP/XT07I
         h27on8UyCKJQH3J8J+Kzbs7GvwMVwF49xFwPxXt0b2Lz4CY6DNxbkDW6IzCf048x1Q+D
         fqxMYhT3ygjKvPZnm66XuG8ZvYHDre826ramBk35ifRYgVK0tafKBB0HTpBr5uYNAPJd
         IhMLz0517OxjU16GBA0F8uiT9Ci3neFN0OGoTWlPYi3xOEcp1pj1PFKt05DhtT7oWTvU
         Y87A==
X-Gm-Message-State: AOAM530nwaNj+azOigh6jaqmkLOr6gu5H8FOmwoz2Sf+Nln7btk60HmG
        AbR7gLKLg+ESBcMk7jewfvcdshgnaXhcY/1E/oymLQ==
X-Google-Smtp-Source: ABdhPJxxvAEFkVBCIWP4SJUT0bMXR30c2srAUgbdroOKs1TrecoN5MnBqbJEa4pZNa6bcX7Uoyto7wN2teGP6SL93AY=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr1215496lfs.586.1627636511952;
 Fri, 30 Jul 2021 02:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210716162724.26047-1-lakshmi.sowjanya.d@intel.com> <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20210716162724.26047-2-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 11:15:01 +0200
Message-ID: <CACRpkdZJaoQEJsAqrrAxWcpgx6J0OGoc_CkP0kUdNe-RPkRvqA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: Add bindings for Intel
 Keembay pinctrl driver
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 16, 2021 at 6:27 PM <lakshmi.sowjanya.d@intel.com> wrote:

> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Add Device Tree bindings documentation for Intel Keem Bay
> SoC's pin controller.
> Add entry for INTEL Keem Bay pinctrl driver in MAINTAINERS file
>
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Co-developed-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
> Signed-off-by: Vineetha G. Jaya Kumaran <vineetha.g.jaya.kumaran@intel.com>
> Co-developed-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
(...)
> +  interrupts:
> +    description:
> +      Specifies the interrupt lines to be used by the controller.
> +    maxItems: 8

Write here that each interrupt is shared by up to 4 GPIO lines.

With that:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
