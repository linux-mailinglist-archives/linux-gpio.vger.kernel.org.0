Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAF05F556D
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Oct 2022 15:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiJENcU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Oct 2022 09:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiJENcU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2022 09:32:20 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BFD79EDB
        for <linux-gpio@vger.kernel.org>; Wed,  5 Oct 2022 06:32:19 -0700 (PDT)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E436641472
        for <linux-gpio@vger.kernel.org>; Wed,  5 Oct 2022 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1664976737;
        bh=6LkuqTP0xa6XajPgZoG/IjY8IZRdyk1AbTrKKTZip3M=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=mdDsovCOj0fBO4W3Yt+kwnmRTYxTvvcU+v/Q8DRckzz5HEQ2wuCBIqO3RHW6SYT4Q
         qT06zARvyntRDqju2tdoNrutGu3qGlvDYyux4J1vOJEUOTJGeVSmnHfCixq9hzl3LQ
         MUkJi8rQoDHnTdKzyxTiHtxTl/bf8HvoQB//r5sfroYeLObp54hTl0V/2UlGFW6PlA
         2XGxzwuFB9SKfFgm0CkSVJHv+I/imFOhraZdhVFFWFvWCIE/h0a7zSNbKhtOAAFAkI
         ZCXwiKSa2lgMD/wh3QzULC2QFfn0BSdeFNYAKfdZtV+1wSYfxqAEJUqWK5uhnWsTCB
         cYSIGhwxicFrA==
Received: by mail-qv1-f69.google.com with SMTP id mz8-20020a0562142d0800b004b18a95b180so5071619qvb.8
        for <linux-gpio@vger.kernel.org>; Wed, 05 Oct 2022 06:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6LkuqTP0xa6XajPgZoG/IjY8IZRdyk1AbTrKKTZip3M=;
        b=TZAdanlR0L0RRF9f7qHi9T6j6Tx6oxBlvz33JLx+aB1UQkJqSixznCZ0cl98vKpVHd
         uY4DwwNWk+Evj8JbrxRnepfASJJYjn/k3ZyYlD7ujPumY0Tkn67kP96KJenaoRThAJp2
         AQnadGyNVt+1UtNi8JUbiZNbPjAx09Lt1+EOc6r7gDvJq5rikMoEjKS15A83c2nk+g0t
         cvn29+jF/AJhAANN4WhwRQSzZNzWNGIwIz9W640F+UoywT4qjJmPqZNpizPUwNYe++Q5
         JDMTmu9/b+pmpT8h1E5fCREOhsSFp/MFTjRynTOc3KJql3Y45Pc7tgW1++U1QqJinbvD
         GtMQ==
X-Gm-Message-State: ACrzQf1R7tqv+eDKYuRf+nAjO6IK2tyNWvdP8qHrWtkdFJF94MNXgBub
        zCooa11+MIoFGDTaq8cqZdHKsdOWnnx5GOxf5/DpBc9+7bRlSBlkUAzrhe4pI6+fPaL+LnW9otT
        AdY41OXMgAog9KrQD9OoZ2kjSs8PRzWJCRSs97U65/lebUJzFaxoqod8=
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id ea10-20020a05620a488a00b006ce5caa37d1mr19656626qkb.37.1664976735804;
        Wed, 05 Oct 2022 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Xl+UsR78BPCM9pC3pjMNNB38LjTXXtDyoeNI34kPvrpVwp+y4DCHK0DykjnJjicQW6z4ascUy+oxEZUfANUw=
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id
 ea10-20020a05620a488a00b006ce5caa37d1mr19656602qkb.37.1664976735563; Wed, 05
 Oct 2022 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930074341.6386-1-hal.feng@linux.starfivetech.com> <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
In-Reply-To: <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 5 Oct 2022 15:31:59 +0200
Message-ID: <CAJM55Z91TL4eLOjZsRVZuxspcL40gG2MQRZf31h0L2yyaW--Cg@mail.gmail.com>
Subject: Re: [PATCH v1 26/30] pinctrl: starfive: Add StarFive JH7110 driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hal Feng <hal.feng@linux.starfivetech.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 4 Oct 2022 at 10:57, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Sep 30, 2022 at 9:45 AM Hal Feng
> <hal.feng@linux.starfivetech.com> wrote:
>
> > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> >
> > Add pinctrl driver for StarFive JH7110 SoC.
> >
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
>
> Since Emil submitted the first driver I would really appreciate his review
> on this version.

I tried really hard to come up with a good way to share code between
the JH7100 and JH7110 drivers, but so many details different on the
JH7110 that it's probably best to just have a separate driver, so that
part is fine.

As mentioned elsewhere this driver certainly shouldn't be accepted
without following the generic pinctrl and pinmux bindings. You can see
the driver I wrote here:
https://github.com/esmil/linux/commit/c2633315385fef1a25aa3711facef07d915820e1

It is certainly not perfect and far from complete, but at least it
does follow the generic bindings. Feel free to copy all or parts of
that.

/Emil


>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
