Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D935347D24F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 13:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236875AbhLVMpY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 07:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236871AbhLVMpX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 07:45:23 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC78C061574;
        Wed, 22 Dec 2021 04:45:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id b13so8162059edd.8;
        Wed, 22 Dec 2021 04:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WwU+M4+gtPY5sprXjMxe0RIhaP0gfCPTwlCCSwnKhIo=;
        b=aG61JI3YZaufoPqPFExx03M0Ar+A7IJnDO2jjekhDmS8Xkjdy9Jt/ufZyJ4iWqsegu
         4WILvp/K7+L6CYUteS2qm7Yn4ggAr2YhHbH4luvePyrIN5mDSwCtxxX6CKwcKcxj+0BJ
         tF1OEliFOlhhkOoJCL5DprIaVtPJDUNdPgpadbQhZW+lv77kb/mlEuRiCY+3S+2I0GBh
         OipTs6FSIguoc6fX4lH8aMAJNGPLvsdfDa+t5QbgE63dIw+DQT5Fpr3GG7MpGMrSRq6m
         buLc9rakG42B9Q3HdLTSt2iZhBYm4nvDBXeRCJtlTTCkU0YGyb+AG85knh6pB45wmQnI
         jVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WwU+M4+gtPY5sprXjMxe0RIhaP0gfCPTwlCCSwnKhIo=;
        b=Quw4fvv6mqR3lhyKdsU+tXgCqlhp7TLD3NWFVYK0J6H0Dw8WeEN6EQ7cI2OvubYOW2
         gqGbF+iXrlsamPOBsrNfhx+RKBXU1K+NwXNM4XkfsL9UHufz7rSi/K7KtYuIw9fD12ym
         zEBw2QSB61fXuTMueOgYyF3uCX02WgHtyRAfS+0xF3IcehUpRy35v/6y9FE7l7Avk6o/
         iU/0utLAb7UdxPdJH98tQJmJ1uRpyqvzUfOxmdzM47fHe97drYsScMwDwuptW9AtbHgL
         b4PTABBUhDOg+N5RCNotEi0l4eoicoI7lg5q/amz2nGDqDpSFMw80O8x+sd2WqmQ2+4f
         Hfew==
X-Gm-Message-State: AOAM532oAL7ajdVKbQbVMWhJjSjnLyEH6FLPbYZFVW5RLZIm7jaDkpaO
        o7h1rFc8LRnfiWX/pSi0SO9EjQXlSjifRtvhx1M=
X-Google-Smtp-Source: ABdhPJwwPv4jwcSFzMmDx4mNPuThUjRdrlBj+jLYRxOWawoR3xAObsitEmUI9xijPpDq/Ayqatw2a0HllCE1+33GvQI=
X-Received: by 2002:a17:907:76d4:: with SMTP id kf20mr2365723ejc.44.1640177121914;
 Wed, 22 Dec 2021 04:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20211222111108.13260-1-zajec5@gmail.com> <20211222111108.13260-2-zajec5@gmail.com>
 <CAHp75VcdXR=vZ3=UX+GKbA1hMvQ=4rKJyPkg+BQskepL9SCSyw@mail.gmail.com> <daa0eaf5-952f-df7a-b8a7-08f7d34a8d58@gmail.com>
In-Reply-To: <daa0eaf5-952f-df7a-b8a7-08f7d34a8d58@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 14:43:23 +0200
Message-ID: <CAHp75VdaEdbzbnEDK+O0HrfEBqpJkdp3nJN79E784rbjkaT93g@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 2:30 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> On 22.12.2021 13:13, Andy Shevchenko wrote:

...

> As I pointed out we have over 1000 examples of empty line above
> module_platform_driver() so clearly what you describe as common sense
> isn't clear for all developers.

These are bad metrics. What you need to show if you wish to make a
point is a _distribution_ of the styles over the timeline.

--=20
With Best Regards,
Andy Shevchenko
