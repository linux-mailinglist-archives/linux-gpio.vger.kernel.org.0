Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAB1A77265B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 15:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbjHGNpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 09:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233569AbjHGNpd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 09:45:33 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3E22719
        for <linux-gpio@vger.kernel.org>; Mon,  7 Aug 2023 06:45:04 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-583a8596e2aso41624317b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2023 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691415901; x=1692020701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
        b=c2hxnScmXyOJNNEwoKxei8znJecQS2wtI3TXpVfWBeONeEnG4vwx3hpcJpNe2AayPO
         0AMVZyb/lJSbUeTXtOm1Pe21cRqHs/VtGvkHi8MJvRMFFglgz/80jxQAaCUUe/phOgl+
         Qpm4Uk9oDmcOpnq7mI7TqxH1yYgAW7W51OpmZaeTlrdOKGOZyz/gild0J8SldxlJ8Vm+
         tWG35Hf6tHY/F2mjV+O+qDQgjBmuR6DtLD7/o7uSnQ2NONh4YbEdfL1P+dwcdwJJnrKp
         JkELJca+1W2nV5dANEMwy59TbI68sZY5P+DSD2wmKU1l6My7Ng/g6H72CJmoUzsZZFWh
         6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415901; x=1692020701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
        b=ONa2RWh46aL4A9WiworEVJMtgXfp98SeD467ktmN8WYTlcv+y+mQuLlJ3GNGgzbrKr
         /wBn9fHFQkkvUcZ5XffT3uD6jrpX5xTCE/IlegAr0jUuQs5sNgDVtWBAhXV8vchVm5RT
         of3PnBe85g0bRRHYERia7pVEb0n47h7z6z9/2BMsMPzYZyzrOr+wW/uEoDddNuUUfQoe
         ABDzAlPsOCtb4qYrQ/cnqQc3JdSMwDBXecoC/qsKPxmqxDIlSrO9uqV21QATB5r69Tvj
         B9bcpf5pdTVXdYrQkLQE7S8xU00N9xDyIC9yMM5OJEwVexLrjCIDbUIUtNrzttSGeCB7
         vAyw==
X-Gm-Message-State: AOJu0YzMVu7NTyHp8mVIvosJVevI/iGiEZXNua6c3mC/ZQF+XSNgyIvz
        HAssJSfI8Qiql31lmWeAi7fIfmQQTThvBoUHrXdJMg==
X-Google-Smtp-Source: AGHT+IHx1ajT83sKAnSY+O0ambUwFc4zjHyYjGAv1pUY5pxl3rdlLFD2APpbEZ6FIFnRNRDlCKdb6Khb5uVyVETW/uM=
X-Received: by 2002:a25:d70a:0:b0:d4c:a288:ef4 with SMTP id
 o10-20020a25d70a000000b00d4ca2880ef4mr4049416ybg.44.1691415901373; Mon, 07
 Aug 2023 06:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org> <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
In-Reply-To: <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 15:44:50 +0200
Message-ID: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl driver
To:     neil.armstrong@linaro.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-oxnas@groups.io,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 31, 2023 at 4:44=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
> On 30/06/2023 18:58, Neil Armstrong wrote:
> > Due to lack of maintenance and stall of development for a few years now=
,
> > and since no new features will ever be added upstream, remove support
> > for OX810 and OX820 pinctrl & gpio.
>
> Do you plan to take patches 9, 10 & 11 or should I funnel them via a fina=
l SoC PR ?

I tried to apply them to the pinctrl tree but that fails ...
Could you rebase patches 9,10,11 onto my "devel" branch
and send separately? Then I will apply them right away.

Yours,
Linus Walleij
