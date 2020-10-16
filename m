Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6033290764
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 16:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406218AbgJPOmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 10:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395258AbgJPOmU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 10:42:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E810CC061755;
        Fri, 16 Oct 2020 07:42:19 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d6so1381813plo.13;
        Fri, 16 Oct 2020 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVM45nYJVMYXAbkTU2+ioyOUEwvIX/0R0Kb3UcZPgnk=;
        b=JeLyn4hgNSIIGZC73c3UhHFxozOtnpIfoi0nUwxmg6LrS6uDS980DBnjM7oXH+2tK1
         Nx6g41BJrtQvrbIkWWw0xcmeAZidQ3oVh5lJaA2PrOVAapDFb81YG1Jsu3jly8Ludqfw
         aiOsb4/fQ4EOU5on/su8KWeMIym1YbbolriAQmG9kltZzo/dkHAP5OiWHZy/FHDwtJJt
         3/JfpGjYpXV00q+o64k77bxxvKnI17RfV9n6eWiC+Abf0Wki365AFThqgQfd77CSF2Pw
         CZU8VB96TnlaxPFMANZEm/i5XB82bz/H1n93nSslAYmzJETQaQKeoZu6cuwqJ5K5XhXH
         sGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVM45nYJVMYXAbkTU2+ioyOUEwvIX/0R0Kb3UcZPgnk=;
        b=KHROIZZsbmdbBJW7zBBvUKg3fj+aS+6skdWNLa75X+rokkQ73VBitU40Qe+O1JiBkd
         2P94DpGKeavZUDVdKL9RD2txd7h9Cuejh2QcoRXTMXEViHcuyQVVgH1sTmMcxxxCj1B5
         qtARuzXrHnBv6PGyfa6K6GiBNKPI0HL5hbK5sZyeGqvsg02fZz1E+hZE/n6SEh1AcMyT
         FxkIaa3w+BqlTmuzJFpGb2UpjivRPBp+GcdkfHBHKFz02IPMdsatXfizA5mhGQdiSYcj
         dNKbL3Om8JfcCbIJ7ATiPTiGqhQm7G4KUwrDqjvOw2SL8UuU692NVhO0PBg1rK33Xb6S
         4ayA==
X-Gm-Message-State: AOAM532xCOSqItRrUx4mt4FBwO7M36MDUE+xN165IqF7Q1gj2C+w1z8O
        DY0vxGhw/hHtlW+CguHHLe69whM6bS1K5npCUj8=
X-Google-Smtp-Source: ABdhPJyLwKUyWwiaVV/dwyfQRPP5pjP1t4ZC+NAL1cs1Ahz7ogeX0JAHYlPdk81DSe3t0c/0rb/A2lxSdXhi/qqk5Xk=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr4443081pjb.129.1602859339375;
 Fri, 16 Oct 2020 07:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201015115524.24e3c36b@xhacker.debian> <20201015115903.2a782f78@xhacker.debian>
 <20201015120457.qaooft5y5dzl4z7s@mobilestation>
In-Reply-To: <20201015120457.qaooft5y5dzl4z7s@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Oct 2020 17:43:08 +0300
Message-ID: <CAHp75Vf2GZ_kQT3cdr2hRtGqe8vA8as4EP7qH0_9uCkrk5PP2A@mail.gmail.com>
Subject: Re: [PATCH 8/8] dt-bindings: gpio: dw-apb: remove never-used "snps,dw-apb-gpio-port"
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 3:33 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Thu, Oct 15, 2020 at 11:59:03AM +0800, Jisheng Zhang wrote:
> > The compatible string is never used.
>
> Before sending v2 could you run "make dt_binding_check" for the DT schema
> modified in this patch? Like this:
>
> make -j8 ARCH=mips CROSS_COMPILE=mipsel-baikal-linux- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

Do you really need to install all cross compilation tools for that?
I think it should simple work as

% make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml

-- 
With Best Regards,
Andy Shevchenko
