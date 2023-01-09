Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3D166276D
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 14:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbjAINmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 08:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237241AbjAINlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 08:41:39 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690171DDE6;
        Mon,  9 Jan 2023 05:41:38 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id k4so8597353vsc.4;
        Mon, 09 Jan 2023 05:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5nhHHKpWEgOb/xnXFhKmRiEf9h0MjhVKNoNPAqZUkc=;
        b=3jg6qb2lwGXCCWUJYF8qepHZnV+Zu1U4uKchJxhZM07FxqkZUK9Hz2jiXVLnndza7D
         0xxfCgAlCsn6Sl6NY+wdOK8GpA+AaNjhk8gY+zz966uqqydrDDluI3HiAyXd/txJXAaZ
         0eOlFjrrkf3FghtdZu8gLDIbs7jXKiPYezDXlXVGMCUy5WHJlt2RVYKq0DYe7cK7exQ1
         huliUpQkEXJmGzoQFkMFnr7YzZmHtgzuR1783awX7XwZPFZCowJywvUcB7LPXQ3hEIvY
         pletcKtd+PF5oAq/ATawezFy3IzoXVcRvV9naKaiA1BVVNiIrXeNirtOJdzlLbVQpBrO
         QqFg==
X-Gm-Message-State: AFqh2kqG9/M0vGqF1c/dBwNffKYXhFBq70an+boriR6b9fQ1dHemlBJd
        BrgOiSK0mVe5MVL+rDbhzftIwPZJI28XzA==
X-Google-Smtp-Source: AMrXdXu0tXYzxJAJp1rKG3H+b1pgDvkfujfSMfSAenX0zsmaJTTeBqx51FhC5fMf2zWQBmLowgUTWA==
X-Received: by 2002:a67:dd0f:0:b0:3ce:f7c5:1a01 with SMTP id y15-20020a67dd0f000000b003cef7c51a01mr3491083vsj.22.1673271697025;
        Mon, 09 Jan 2023 05:41:37 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id b5-20020a05620a04e500b006ee8874f5fasm5295758qkh.53.2023.01.09.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 05:41:36 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4c15c4fc8ccso113024447b3.4;
        Mon, 09 Jan 2023 05:41:36 -0800 (PST)
X-Received: by 2002:a05:690c:d8c:b0:4a2:63c5:6c59 with SMTP id
 da12-20020a05690c0d8c00b004a263c56c59mr2960035ywb.384.1673271696145; Mon, 09
 Jan 2023 05:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
 <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com> <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com>
In-Reply-To: <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Jan 2023 14:41:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
Message-ID: <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Jan 9, 2023 at 2:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > If this should go into sysfs we should probably create something
> > > generic, such as a list of stuff to be exported as sysfs switches.
> > >
> > > It generally also looks really dangerous, which is another reason
> > > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > > more or less.
> >
> > Yes, generic would be nice.  Anyone familiar with other hardware
> > that could make use of this?
>
> Drew was using this for Beagle Bone IIRC, Drew?

Yes, that's what I remember, too.  And I tested it on Koelsch.

But again, that's for debugging purposes.  For non-debugging
operation, we need something different.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
