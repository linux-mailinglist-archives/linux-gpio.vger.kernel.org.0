Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF32A34E72C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 14:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhC3MKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 08:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhC3MK2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 08:10:28 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EE8C061574;
        Tue, 30 Mar 2021 05:10:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ha17so7650315pjb.2;
        Tue, 30 Mar 2021 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jnJaAgpyhjiwbq4U7p1677gg1DviXnXWcp+6L/6OLo=;
        b=bAae/I4PJspRugS6/zShUM6AMXW++tKUKvjh9L5iYrgWBXIfa0sqIwmYDcNP6mUSnb
         Nu2aEOPEVah+JLqnlH5bi5x/3dgjKxF9kTsYMwIST2QYdRvhxnBvCbwdVYDdZuCRdXhr
         YnKn22BuIzI8FaUMl1MFqPo5zJesTUWeZ3mVuoQOYFrSwVMWn92jljJ+cstDZWV6SfZQ
         KDzSwGrVFQ99pObA0xEphGJ/toq9Yn3qLLR7vbsa97Qe6lHvDPbdRuVJihRzEihsp+5P
         brAzvrHst01H887amyZbwwwRl6c0BINidScq+u/38rJjPQXLk+ssuSQ2Gzkz89jnb+ag
         qBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jnJaAgpyhjiwbq4U7p1677gg1DviXnXWcp+6L/6OLo=;
        b=FkBZzm132ZnBpiunZa/bTAf7AsmRwEPE25sXYicIlj6eOgZw67DQDF2AJCfpQud23l
         JU4kGBwtetjALFZPAuMMfwcn8If1JV42znUnsunBnNk051GIPKi6xZQhEAqsBqr3vo7a
         M0O86w6oOmd3Y2kSRcyedkveoPGcPCNK9oOI3obIxtyQRMhz/ONCKVQXYt54+WP1V/wQ
         ITYFy88iN2GOP3QcYubpKdLYWxdsr1tI05xsuF0qEu9iI28uJ8O3QdPSl0gG0ozeUIqo
         vCs9XPbwDztcl0ZtnJLQyEescJzXyaR3/h11l2nVzC57qFYe2CmzK2VyEhBOced5frhu
         Mdlg==
X-Gm-Message-State: AOAM532Z6Vi/w5TbGNDpzx6vgJPvniV7xa5N46jfPDTlgh4M+H/KC/md
        /ebpqj35bbczTki6cfR2NWaun0K9L+rKEThRYPc=
X-Google-Smtp-Source: ABdhPJzy3oicuUg028toUXily4Is/nE7NidUJLa0WZYfUuxCCww1CHlSuZil3E3cnWoZzBWGbUH2IH9JCZEn9Ddzs+I=
X-Received: by 2002:a17:902:7883:b029:e7:32bd:6b97 with SMTP id
 q3-20020a1709027883b02900e732bd6b97mr20940802pll.0.1617106227535; Tue, 30 Mar
 2021 05:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
 <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com> <e388002df6dd121b238918724f3b43637831d2cc.camel@fi.rohmeurope.com>
In-Reply-To: <e388002df6dd121b238918724f3b43637831d2cc.camel@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 15:10:11 +0300
Message-ID: <CAHp75VcfovXsU9J6Dn5kR_zf9g5wUGndiC5OBPci=XaGUosgBQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     linux-power <linux-power@fi.rohmeurope.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 30, 2021 at 3:06 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Tue, 2021-03-30 at 13:11 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 3:58 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > >
> > > +struct bd71815_gpio {
> > > +       struct gpio_chip chip;
> > > +       struct device *dev;
> >
> > Wondering why you need this. Is it the same as chip.parent?
> >
>
> This is exactly the reason why I had the comments you objected in the
> probe. dev is pointer to the platform device - which should be used for
> prints and any potential devm stuff.
>
> chip.parent is the MFD device which provides the regmap access and DT
> node.

We have a kernel doc for such things. If you commented it in the first
place around this structure, it will be obvious. Now you have dangling
comment somewhere and no clue for reader why you have struct device
pointer here.


-- 
With Best Regards,
Andy Shevchenko
