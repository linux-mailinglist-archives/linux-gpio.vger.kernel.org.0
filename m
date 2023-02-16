Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D97E69946B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 13:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjBPMe4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 07:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjBPMet (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 07:34:49 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0FF3A850
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 04:34:49 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id v16so612467vss.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 04:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1676550888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/HBj6UW/lftzQuv/MKwSjRVbFJsk8wVKr+ojvub2Efc=;
        b=2jYfPu8jBhxLphA2pmvDpyMcRLN+V7+RKxGbu/BbYeMeVwA+i/7QMGZPLfbM9Omba4
         Qyw4sIijYwGTHoAbQkB629FihEBMF1SNAgoT77NnVpB4LdO7wpv+ee34pki5CclyfKg9
         BrBnPXZ/0a1+r/kuwXnhx7JEJhNWsshi5GOyo+YO4bQX6b8CrDkierLpCdIe4QLqP0j3
         V0cT6bCJUzCCT+fYsdaEgB9nCM/CRBY5isY7lUWpfhMstAgOm3hgxdQZe1sPNG+9owoM
         3+5jomQTa3o+LGVeCLQQoXm3QQ7u1Y4quTxTP4GH6raxgh5oESP6Sw2ErjUd4xhqM/O0
         UNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676550888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HBj6UW/lftzQuv/MKwSjRVbFJsk8wVKr+ojvub2Efc=;
        b=cgh6pkFqxmJAOUPIFkFSYiK81slcBxqaKOSx6kOoijiC+67xe18Pk5TpKaSXY/Kfa1
         0Ccey3KcgOeE7fk63pEOB4AgoojsAyCISXlDp+tbfX3h/l71TgD2xAlzDqB2LNpgS9LC
         GOPwND+3c8nm7kS5YhZlEYtr31x35XSvHmm5WZrbMtMuDhNX56oXL9mF7jCmXb0LUj5q
         hDsUvzsy7euKJSrD8ly2/N/roxSAXjB9M9G1Dds0zOzkcf1qFgzlLzOM2mpveAyv3Rqn
         U4VpYjc33HpFi2mK5eYD4RLryzxcvUenaoHLO32RxRAOyNrOhQKpqOExUAhYy2Z00Ytj
         sMdA==
X-Gm-Message-State: AO0yUKXykjgGylysJqlnnT4YNyGXaPEXOFyjKLyLfO3KgZKpQZt7LcSq
        jC/wpCvc5/i2MgOFiaW1MG4xJWH90GQ6lNkTv06F6Vp7hOljRw==
X-Google-Smtp-Source: AK7set9ngsnyGBtgfT57XrUP96wg2QQVRsAQX0UPIB5wXftaN2inB77MkcOuW/p8oA4RQ0vPAx2kQR6a1aPePMiMj9s=
X-Received: by 2002:a67:c01a:0:b0:3ea:5896:84b9 with SMTP id
 v26-20020a67c01a000000b003ea589684b9mr1036382vsi.75.1676550888163; Thu, 16
 Feb 2023 04:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20230215213843.1737181-1-linus.walleij@linaro.org> <CACRpkdbP9HQp2TwB_KLgp11h+DArOmtGYRS+gRBrGb244YqZ9A@mail.gmail.com>
In-Reply-To: <CACRpkdbP9HQp2TwB_KLgp11h+DArOmtGYRS+gRBrGb244YqZ9A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Feb 2023 13:34:37 +0100
Message-ID: <CAMRc=Mdk-7bQchQnHL8Lu5FDQSaWs8+zKLYTTfDPsxyovdjJpA@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Drop irq_base
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 16, 2023 at 10:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Feb 15, 2023 at 10:38 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > The OMAP1 at one point was using static irqs but that time is gone,
> > OMAP1 uses sparse irqs like all other multiplatform targets so this
> > static allocation of descriptors should just go.
> >
> > Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Tony Lindgren <tony@atomide.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Incidentally this patch needs to be included in a bigger set of
> immutable conversions (17 patches) that I will send out now.
>
> This is because of contextual dependencies.
>
> Bart: they should probably be merged as part of the big set
> if the OMAP guys are OK with it.
> Sorry for the inconvenience.
>

Can you resend all of them once v6.3-rc1 is tagged? I will not be
taking them in before the merge window, let's give them some time in
next first. Those sweeping driver conversions usually end up breaking
a thing or two.

Bart
