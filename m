Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D0E6225A5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiKIIlT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiKIIlS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:41:18 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CD417A98
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:41:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id t25so44750352ejb.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aD7P+b1uJUWmfha0UC290WbFB/lsLxBpOULEsetw2oY=;
        b=Wn17EPbLbvZsY5ILrWq0J+sZeBPdyBQs/4D+UZ+7nTpCWqN8Un+9B8xFnza+Aqbw5z
         nhf9NOhO7ojI4ojvp8zAOouAvJE5vgU/NLvIvSxdA3bn8Fe4cTZXxgEs7uOUjU26rQgK
         KjtH4YvLA/C/c0MMGxagw+vTPl7ptmwRE1jGgzlEQRW7hPpJXswRpM1WGJmMXWtampCB
         JMNTWcB0VTdBgsE4WbG6hX7DlylHAFx0z2py/oqCG0pVpqFGlx0Y+Ty58RdmFqIX4NU3
         3FjTjxjejf1hXJZuN6SY1aAh7zzdqBSf5x6FubRfG02AuwKZb+xxv2iz3LhBpPYyEAo3
         tqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aD7P+b1uJUWmfha0UC290WbFB/lsLxBpOULEsetw2oY=;
        b=tIo4pfYAoG2CT4q3yEklkW3Z1pp4lGXQzYCgtymihHWzbpeBYjrkr2wIF1jqGZpq2v
         /VhscExNxQLlBCtBxS9enu9mGlsMvSsEQdI49cDslN0FV3ZOJaZdIyLfeD2GosiKPCU7
         T+gJwsrPf0LnanwtIhFNKg6x7Jzbzc7CUvYT1+0v83U99ft0SsZOBjeXNOSp3oFyNN8d
         2vCvUH9FTJTAwSWv19qOd5xD2Ee6CR9vwsF3zbZYHV+oh93JJxE0QdE1XiRHvyXdp1id
         0AxNrJRuRBYM2h/CSAkx8o1KzqMbgHI3/lgKUwV2YVbnl4rQVYk6JnDGzgjzwuwd5ahd
         RHvw==
X-Gm-Message-State: ACrzQf2H3ZLreA6/SLWTGpZQdiOlHptC8VVWf0iQSuXgtN6uEtt3W5cN
        HS4XOnmjvcdC1fk2ufvlkpNFUcFwc6FXtPJjZRjz7Q==
X-Google-Smtp-Source: AMsMyM77dNEurx0K4wYpHOaGDDYKf9s8IrljC312Fyhe5ZOrTX25Qqzgql5RjsUYV6qF2rC8phpcgEBboZwOfgFaKuY=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24184204ejc.690.1667983275461; Wed, 09
 Nov 2022 00:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:41:04 +0100
Message-ID: <CACRpkdaUv0=Q4X3VyN6hDZKTrchKpiA-H-aBSnj+8CWU6=TfXQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Nuvoton WPCM450 FIU SPI flash controller
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 5, 2022 at 7:59 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Jonathan Neusch=C3=A4fer (8):
>   pinctrl: nuvoton: wpcm450: Refactor MFSEL setting code
>   pinctrl: nuvoton: wpcm450: Fix handling of inverted MFSEL bits

I just applied these two patches to the pinctrl tree, it looks like they
can be applied independently of the others so I just did.

So no need to resend these or include me on subsequent patch
series.

Yours,
Linus Walleij
