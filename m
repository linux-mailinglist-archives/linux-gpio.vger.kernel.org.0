Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69EE936AFF2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 10:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhDZItM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 04:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZItM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 04:49:12 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE6FC061574;
        Mon, 26 Apr 2021 01:48:28 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y1so12909381plg.11;
        Mon, 26 Apr 2021 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GrsQ0OopQ5XAi0kLHAMeMV1+0k283ypQv+yqfPMB/F8=;
        b=BqQzW0Ir23ShYJNmIqDQYVPFYHiFAvs+kzU55ONptIb9lCBQDIUfAZQYyayCcJg6qb
         N4C2Ft6QgMaGQKdbNZHOtqmOILPrN8/+hqPdFrIaPwIK4gFZz5/yAGayc0JHFaWypSTa
         vwaXyIkfjg5k0zGP18249IhB3K0kIQSjQu+wLQoXgdqJB92ezZdO95slMXqPwGgilHwV
         EBVeDbbLEJp5GCvqAMDzkxc1a3OchRXkJ94Kx2q/9Xi5NuZ8DENy+feMSh6+flrYSuzQ
         YUoIppLHhafWTaAZGEYUHpqvQN9D5w9CRvqKyIYwMq0pQ7oRRcThZE7TJibzz7P5Eqs6
         D7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GrsQ0OopQ5XAi0kLHAMeMV1+0k283ypQv+yqfPMB/F8=;
        b=GTL77W7tsLc0elPkJXmJ+rUyIwWkDJ7m/LjwtWAKca0uXV/TJNxRQb4GoN3OZNWtBj
         gASJOakeDS8W06SxqWmNbQK0KOH2ndPIGWaxhzQDR7WVBiB3dvvwqzug8SOsi/j30ilo
         DSveS7/7Ow7CY9EXun7l2OkbpisUxBNFQa2X3pPxSckPoLtMHPSfo7MVRNxM+ZGyIBXX
         8QpS3Q2+feqmuGPSeIYs1hL2OuH+bMZbbTnLn+wt6GjRwyVl62M+APEOM6qoqZPXT/ZJ
         0Khn21GHhyNoOYazEKb48OKMgpReWRy+QOJWvKMXoRH4+m837vmKc6YHSnmwc4kEDVUW
         ykpA==
X-Gm-Message-State: AOAM532Zd+at0HPt0HdXDD+h0/DT++MDLkyqJ7Da0VGBpT+pARBvfMrz
        KzAzAiuRGqwQ0QWI/+ZpljixEZWmKpjIiSLiKXcipm8nE64=
X-Google-Smtp-Source: ABdhPJydJ1eIT1CJnoDDThCgrG1lYxFSYGV1Wcvb+xuHCUEdev1b/ECaOlKz2CZ1bjX6kesYMdJjTn7gzeU5OgEa4kI=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr17493642plc.0.1619426907826; Mon, 26 Apr
 2021 01:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com> <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com> <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
 <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com> <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
In-Reply-To: <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Apr 2021 11:48:11 +0300
Message-ID: <CAHp75VdrRx7kc9OfRuGjqHHvM9akvzsHYSJgWKfr783wvTdhuA@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 26, 2021 at 11:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>
> On 20/07/20 10:17, Linus Walleij wrote:
> > IIUC Rodolfo's idea is to provide this with a DT compatible.
> > The use case will be industrial automation-ish tasks from userspace.
> >
> > Currently the only mechanism we have in the device tree to
> > assign a use for a line is the "gpio-line-names" property,
> > which creates a name that is reported upward to the character
> > device.
> >
> > Rodolfo's patch is for scripting use cases, assigning some lines
> > for some cases to be handled by scripts, not the character device.
> >
> > What I am a bit worried about is if this would be a Linuxism, as DT
> > should be OS neutral.

Not only neutral but be software'isms free!
It's only about hardware.

What I understand here is that we have missed the intermediate layer
(let's call it 'platform abstraction') where it's related to the
platform and neither strictly speaking hardware, nor software per se.

> I'm currently using my solution for GPIOs management as input or output lines
> described in the DT on several systems.
>
> Are you re-thinking about this topic? Can we go further for inclusion or should
> I continue doing out-of-tree? :(


-- 
With Best Regards,
Andy Shevchenko
