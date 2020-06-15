Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F301F9015
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 09:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgFOHiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 03:38:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40406 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbgFOHiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 03:38:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id s13so12358142otd.7;
        Mon, 15 Jun 2020 00:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PFfNHgVox7KX7C95z1fc2WDvt6ykxqikNS/QtJNZ6S8=;
        b=nRR8nAQssd3tHaanXqlUNMKKplCGhFMDhveZQzz+Vu61zi4sbskOc058CE654nlSiT
         WIN9s3uYdOMTNw2bxVveEEz6ZRHv0B9XZfXMY2PGzXXLJ7CTD+ePQpRveaQuM8IWlvQa
         zrvgwGJgawZZisnV0Id1i2/+n4gK/SK4rN3l1TY+m/LnMQd4+DbNUfsTccIxIm9ZlBFj
         jKdYkzSs8QjncbwDGEXNeZpIuSNYKurJ12kmk4MCsZ/NYuR+CxbbgMV8V67DXClDrzc0
         UkACb+mJ4qvRli2M/jHqx7FZh0bIh9sjMfnFFU5g6X1zSgHTPp8AVk0jyMMXFNQ5Y/jr
         XA0Q==
X-Gm-Message-State: AOAM531UrOiZWiIPUQXrRg8vqFV0AWVXJwp78i/UC7SwT3E/lfBMPi4d
        lP5cvJuXVZp6W15CfDoKBIwKaHG5QA8wxc0+aDEoyYdh
X-Google-Smtp-Source: ABdhPJw1n6MZZyE41PxKdYk9SuES7QIn4SjvHd3chD7k1FUdfaufEWwdkiYC+uoydTPHuFwA5x2yDo0fkj7opPN6ftE=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr19213763otr.107.1592206732676;
 Mon, 15 Jun 2020 00:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592203542.git.mchehab+huawei@kernel.org> <72d7ec91a60e852d34f3e15bc5faef1f62a8260e.1592203542.git.mchehab+huawei@kernel.org>
In-Reply-To: <72d7ec91a60e852d34f3e15bc5faef1f62a8260e.1592203542.git.mchehab+huawei@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Jun 2020 09:38:41 +0200
Message-ID: <CAMuHMdV=omjGQUTZL0vBYhHDX+6GGn_Lx=2tMuGc4csJ9EKbkQ@mail.gmail.com>
Subject: Re: [PATCH 12/29] dt: update a reference for reneases pcar file
 renamed to yaml
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mauro,

On Mon, Jun 15, 2020 at 8:47 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> This file was renamed, but its reference at pfc-pinctl.txt is

pfc-pinctrl.txt

> still pointing to the old file.
>
> Fixes: 7f7d408e5a00 ("dt-bindings: gpio: rcar: Convert to json-schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that the reference will go away with the pfc-pinctrl.txt json-schema
conversion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
