Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EE6230B56
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jul 2020 15:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729496AbgG1NW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jul 2020 09:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729433AbgG1NWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jul 2020 09:22:55 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8916EC061794;
        Tue, 28 Jul 2020 06:22:55 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gc9so11579392pjb.2;
        Tue, 28 Jul 2020 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nf1O99k+zsvJqjI/za3C3+LNhANhWMX3dBWewicGWoQ=;
        b=vV/8Y6WpSwU9HTxSD/WJ/EvnS9XpQW0xb0WmXdXvTjR59DT26u+VWyuBNuaIaAeLjr
         AaNLCzhBn8d81jnuBLGyc+snvUOJghb/k7EcDcrfQfA2sboAIKDqIrXsFNCuG8OdVfkw
         WkrOXWDMF4bD6LrTz+zbhPB5ZsyN8kYxqvm4Ar7m5yuTLFczPk27/mlyUAVJiI3HRtSe
         DolevwAoBLh6X4rFwk0Re7o30X3vbGJICz1stm8S11krtGYvLuoaGIm4VSvoRGKcwtk4
         hTX0tS2XykR3BGO445hOjNkLz1KymFyQMpurS4RSMqPAhujHSIiYUk69nyMRNpSqVRVT
         CuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nf1O99k+zsvJqjI/za3C3+LNhANhWMX3dBWewicGWoQ=;
        b=gEEGbPFeZz2zlwfx0HKW/oGmY+TCU8IETXpsydHKwfbwz17nhuwxSLPorOikSMNVEu
         x4pkgpDm45R63w3rXrKM8AkS0LgUaj3iBwyVVJB17ezXJz1T2RGTCyoic1iWTNFFvxtg
         c3DlERueBhFl3qlS/h90xFST6Bb1SF8XSoeGSSv6HuWYQUc6icNHngM4zqpB26UgMjfW
         nJjMyRLDkXrMqL+jID9/eszfxH9fx7TQqc/NkFCVICr5bTlju3DfNbaNY1kSURJeURsF
         PkH+1XVuGInOtgY/3n8Ztcob8b42uJBDWrFj7JJwlAXGp4wURUUUayMYXQeSKDOuLFzW
         rtyQ==
X-Gm-Message-State: AOAM533JgRT0U8cjiVyH825bq4YNqdZlgCW5UZU+OTirXZgfmlRG4x0b
        ztNwSTmff3Ht++tVb523pA+NDRXsQJUxUbbkHQU=
X-Google-Smtp-Source: ABdhPJz9Jk45e1SqiyDKZYa6RYOm/76TyaeUDRNkM5h0Lo0ybef78akWq7E7BAoASP7zeSOXUIr+/b2GIFPWGnB8Bpo=
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr7486754pla.18.1595942574825;
 Tue, 28 Jul 2020 06:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
 <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
 <20200723100317.GJ3703480@smile.fi.intel.com> <20200724230342.bhdpc32rsjw7rzbl@mobilestation>
 <CAHp75Vdeg6v_yLYjxZPJM7SgDP-fou6SEuaE8+TFCNW4c2r_rA@mail.gmail.com>
 <20200727215010.qzhvavmskfoaapi5@mobilestation> <CACRpkda5Ki+itbvLsxSLj4o1NRKdf9P48kbYXEgArDqcEcWA7w@mail.gmail.com>
In-Reply-To: <CACRpkda5Ki+itbvLsxSLj4o1NRKdf9P48kbYXEgArDqcEcWA7w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Jul 2020 16:22:39 +0300
Message-ID: <CAHp75VeY0HMKXJCP2Ds=BWdWduevXDqUK1pkF1G1fUTQn7uC3Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] gpio: dwapb: Convert driver to using the
 GPIO-lib-based IRQ-chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 28, 2020 at 11:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jul 27, 2020 at 11:50 PM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
>
> > It turns out my "mostly" was wrong in this matter. It's 4 out of 17 patches,
> > which make the initialization in the same order as mine:
>
> I'll think about fixing them up to all look the same at some point
> if noone beats me to it. Sorry for the mess, I was just hacking
> along to get this work item finalized.

I have sent three patches (two updates according to above matter and
one is a fix on top of your template clean up I missed myself).

-- 
With Best Regards,
Andy Shevchenko
