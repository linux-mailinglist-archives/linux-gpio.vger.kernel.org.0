Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C9A3DB8B5
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 14:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238801AbhG3Mi2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 08:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238742AbhG3Mi1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 08:38:27 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E5DC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:38:22 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q2so12162220ljq.5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TPrFNXDo3fiyz0l/s2CJAtmfo7kIvxhcbaJib7tKDk=;
        b=vpScR3U25Ovsfdyt7Y7crUtNpsGq4dweZaIpvd8TbQumwlSW4i5tBuVwczmFcoNcag
         E5iJtmPSdE/flOnlqdoR7VnY2Urk4sEyFZoAqDFiQJO4l9KdnfJleH0V44thWadtf/Pp
         O5XP0NtMiDiHDoIV9gE95mHJYDORJ7LY9PJIAXJP+sX16UMVzKbr+c8A3E3WyFcfvKef
         6xpUyXD21hyy0FeF/GtvAkJOw8bvd2wZLqzKPjMCgab5KGN4rAkcNQ+qAj07dMlSCrnd
         XwWPyN8bK8PK5WXgLWMPU7HuJ5GnwHucT8meJhzA7QvtdiyCQideDgaHRNQFqE3wsUG1
         8sXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TPrFNXDo3fiyz0l/s2CJAtmfo7kIvxhcbaJib7tKDk=;
        b=dTDPBLINTPvn5KJpPLFVwnumKyTTjxd01H8nAlnZ2AYqveJdXhPrOWmzTBSwJ9Ze6W
         0E8YCKVdojOMUz61MUAqssmfjDZ+Bp1HMahxB+M6zy2Hz7ZejlldABNYeQ7gzDoJB3Sy
         ZIQAB2LTIqPpvrCnyHRkAq+g8hpOQc8om1T7t6QfLe37jO2RaPzQn/IlQg/04O6SbpXS
         GZYs+eCUO0autTeE/iW9ThJJQbyg52VGUsQwfQ9lhXhfa9s85vc4G9Zj5m30x8n9nlOB
         +FgiVHHpN+jPDQ5Q4ts4GlU4DxtFyMW73V5bEj5JgUNoqJmPidAjXu5Wr/7ImrAfgxMC
         MS4g==
X-Gm-Message-State: AOAM531VcQ+2rNjh8RVnwgB/6TMD7uJ5xQC/lm4GwAFKeQRDobhAgM6e
        4aJTaUtrbE3EgrTxoukQ6eQbvH46FJcqNsvLJAggoQ==
X-Google-Smtp-Source: ABdhPJwQP9rYUjp+G/nfNIv5a0w33o23MO0STAgKSfw8PMCWe/ucqXTK5QcMMJ+7QOP5dAlI1PRu3SaENWjQzVQNYHU=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr1528246lji.326.1627648700492;
 Fri, 30 Jul 2021 05:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com> <20210721030134.10562-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20210721030134.10562-7-jiaxun.yang@flygoat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 14:38:09 +0200
Message-ID: <CACRpkdbFw0SE8iHs+Y+D-oUBrjxkB_1gqdL2TCYHtd8EsT_edw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] pinctrl: pistachio: Make it as an option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 5:02 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> So it will be avilable for generic MIPS kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I just applied this one patch to the pinctrl tree, let's see if
it works!

Yours,
Linus Walleij
