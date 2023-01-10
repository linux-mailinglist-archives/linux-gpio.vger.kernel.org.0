Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCA7663A97
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 09:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238041AbjAJIKv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 03:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjAJIKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 03:10:24 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B937748812
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:09:33 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-476e643d1d5so144953387b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tq8ocMuirduWJZqIgZEnM5IOavs3CaIqud02LDlW6K0=;
        b=LsppTRULCPtgrdu92sd2DvxhFH5CjO+Pb9oI3rJi2U2Vk6P2qo5FIWBFWN5Yd4Xm5B
         45a0vFI5SiCxTbbZxHYHgir8L5ME4ifLyw6OrHbXTmIX+ynERp/tm2pUpqzQYCR03e0d
         Nntk4u5gmccPLWboOLyOYsB+PeDJuweGa+7crX2pZTC7v4er5ioTMgseeY8YPcbj4x/S
         eGSpXmk11beSs0XSNNsFvCrIAQEszyAwKEXUqFEFYYDds3kpjbsoGn7pUVel16QJdaSK
         AYNXVinvhWMslI/KcPS5XGnYtraE4dBTsZEV6sAhSoN9LuSC6z9sjm0gDzr6THVA02VC
         1zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tq8ocMuirduWJZqIgZEnM5IOavs3CaIqud02LDlW6K0=;
        b=PRNibsOlGrVELvKQCk67WtfWx7Z5cRKVvVHbORn33i6UPOJfYWqIsVQEw2NkLGgUQw
         BCEQjqOpe4Eml8sp960jtQMHoqW6xh+zyJW/P4Wr0qjBhIOYeb6icj/jfeNGoe06YU8X
         Lbiu6JmjKzCKeS05bxFD/WKjiwV6glbtwziIrnj3RgM9dZTCUFi1pDj6kVmr2PSj98RG
         f6KWDuhDAHFcAxW61VT80keIQJ6e6eihD6ZuK2AHWoU/sZpVgx9hyXat+F6Jx1wLy/6Q
         wo0IckuRz3zPuIIwi8qctRgdUmOJSjW6L6fIWS76UCaM3uJ/CDGAPmMrKoQsSg+C/rju
         FjBA==
X-Gm-Message-State: AFqh2koJHOXn/jiHNuV+NnwHqrYSyVLDb3+OcwpFYi/LT166DlbHtbJL
        sXRpZ9+Uigy2cRiH9sNUbnH3SpckUxMM4/EJ7Oz1Xw==
X-Google-Smtp-Source: AMrXdXsR8JXSoiTv7T0NjBKpFyvsp3SR4ElGO0TYvtJbEI39ppUyftmvesxRs5Bx1pnG9jyO0CZTOvKZ19L6aQaKdYo=
X-Received: by 2002:a0d:fd46:0:b0:463:e60:e538 with SMTP id
 n67-20020a0dfd46000000b004630e60e538mr224921ywf.130.1673338172985; Tue, 10
 Jan 2023 00:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
 <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
 <CACRpkdaL2J7F2sVjVcTtFTfK1exZ3Rmjhc_dYxuo2DfhYq_8gw@mail.gmail.com> <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
In-Reply-To: <CAMuHMdUeazkEXWh+R9iy3TLc16b=OX9rOzAoB1=X=K4wOo9pRA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 09:09:21 +0100
Message-ID: <CACRpkdZC34xdgsxrMzNy++fBtf36M5ppg-FO0uKpy5q=UGS2Ng@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 9, 2023 at 2:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jan 9, 2023 at 2:16 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Jan 3, 2023 at 10:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > If this should go into sysfs we should probably create something
> > > > generic, such as a list of stuff to be exported as sysfs switches.
> > > >
> > > > It generally also looks really dangerous, which is another reason
> > > > for keeping it in debugfs. It's the big hammer to hurt yourself with,
> > > > more or less.
> > >
> > > Yes, generic would be nice.  Anyone familiar with other hardware
> > > that could make use of this?
> >
> > Drew was using this for Beagle Bone IIRC, Drew?
>
> Yes, that's what I remember, too.  And I tested it on Koelsch.
>
> But again, that's for debugging purposes.  For non-debugging
> operation, we need something different.

Actually Drew's usecase wasn't for debugging. It was kind-of production,
but it was for "one-offs" such as factory lines and other very specific-purpose
embedded.

The placement in debugfs was mostly because it is fragile and dangerous.

Yours,
Linus Walleij
