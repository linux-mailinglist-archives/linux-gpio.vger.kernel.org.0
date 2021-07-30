Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B613DB70E
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238460AbhG3KTs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238433AbhG3KTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:19:42 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9542FC0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:19:36 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id c9so8855664qkc.13
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V8JhnK0JaTLe1j2WUtHenqsTJs5R6g7xYpo3dUxnCzU=;
        b=vxh2ZgtdKYKwarEBSe3f7fBuReTJ2Hzz+6ylTBSdOUu7Bsa4J4t9aEQLGOe8hxoFA5
         FNoABOhQ+oCxg8wTuOqn3QFTFoSHzxs7oNB2kew/vTeII/F1zy6r/ktNXMC7g1eZr8IR
         ZktcP6E1fYkOj+tuvaAr55VvuxASHtRrTljFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V8JhnK0JaTLe1j2WUtHenqsTJs5R6g7xYpo3dUxnCzU=;
        b=gqByvISJ10WckoOT/ul0RdvAOFq7sSnTILuNyQEoTWSubGyljhQ0kQkVPdQIVM85/a
         hZa3hAwPZzSUIww4pgcktk0Nf3dcFc5hgB9XlEi03odGKy9vDKFfRqztR1mqTdFk7JVw
         y0Agx7/ZToxW60O3T03NjupN0Jp4MeyJSDooB7ahAd69DEbF13gOhXhoJRWu28QbYd29
         L4KQs6aE8SWwHYULpYFI4zoO1XMQ9b71JVBsK1HPOn42QZvnMQgLOIX+t4RsV3apHBZZ
         RcdfL0FlO/F8UBmWRQnpykmI9f+YIVNObIOc2dD/kG5m8UWEU3lB5JnsJU5kKultP8pY
         00HA==
X-Gm-Message-State: AOAM531rDbjGcRC0WPRGAkxoAM5fFHwQXJh2UKH0w9jcWwvVDIs0c2f6
        s1CFG9/1troKhaaSYcka7Y74lkHIpv/yFeLO5aivWw==
X-Google-Smtp-Source: ABdhPJw9A7zOLsaIxYiSbhoqYdVI6Dy948DuDJK/ZvPsB1nOgnQgw930oGErqOWdYh71EOgokyy1FQb1iHwx3Doa6a0=
X-Received: by 2002:a05:620a:62c:: with SMTP id 12mr1581399qkv.159.1627640375777;
 Fri, 30 Jul 2021 03:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210717045627.1739959-1-daniel@0x0f.com> <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
In-Reply-To: <CACRpkdbE+_DJFhBCmtz5JwJupf7QkkWZhXrgf1KG_3rPqvEm0w@mail.gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 30 Jul 2021 19:19:25 +0900
Message-ID: <CAFr9PXmq6EWJv+Htp2W9BHJ3+UFFj+FjcWUrn22E6-QPZuAwEw@mail.gmail.com>
Subject: Re: [PATCH 00/10] gpio: msc313: Add gpio support for ssd20xd
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, 30 Jul 2021 at 19:12, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Jul 17, 2021 at 6:56 AM Daniel Palmer <daniel@0x0f.com> wrote:
> > Daniel Palmer (10):
> >   dt-bindings: gpio: msc313: Add compatible for ssd20xd
> >   dt-bindings: gpio: msc313: Add offsets for ssd20xd
> >   gpio: msc313: Code clean ups
> >   gpio: msc313: Add support for SSD201 and SSD202D
>
> I suppose Bartosz can just merge the 4 first patches into the
> GPIO tree

Yep.

>And you can take the rest into the SoC tree?

My plan is to take the rest into a "mstar dts for 5.15" branch along
with some other bits and send a PR to Arnd and Olof later on.

Thanks for checking out the patches.

Cheers,

Daniel
