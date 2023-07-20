Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2815675B806
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 21:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjGTTda (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 15:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjGTTda (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 15:33:30 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6345A198A
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 12:33:28 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-cb19b1b9a36so1040544276.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689881607; x=1690486407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAA4YKtARNm97BR+WbnNXBQbQzkaBKgEy0iMdJmOHMA=;
        b=USM3aXLAuUe8po5Nm7yr6OoNGynYpaik6D6wGKUsxVsg8yPFJtC3FFvYKyovC1/iwX
         wEq15pDuUM1o3uHKp43K+ygQTuIBIp/zDuaiWRlE+twtDrXkATJ/Ln5BIP1HNGGyHsBI
         KPUGGfGK2Yk/bDNOuBu3v2WLnqsOnuW8shrTxZngwE2gFefnS4/btqQh9rnZDPa/sEdx
         Nrhp0eHAf9bWlyLcBO8KUmX/C+W/vY9vLqxJO1XQnkZKLaSzPyt3ffCNXPXO+N8tFXus
         Uv8PlWh+VI1rsS43ONFZjYa3H6vL7t/7wVVsCoRxM2BBQFb8YneUyqCxKd13FFK39wDK
         StdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881607; x=1690486407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAA4YKtARNm97BR+WbnNXBQbQzkaBKgEy0iMdJmOHMA=;
        b=OqpHEHTzUug5SzkHVhURZQbbF9jEi/b8uy4wfovJDPJ1gC5qZIeBhVAu3ne0sbjfD6
         CsPWWfV/XkXksgvPJ2+NdECwax7fiesr9HUdI0A7lli4seqfMbjmxsIveqNXI45WWeAg
         MqxLt8GghvsoLUvQZ8IWxK6l8OF158HKkgNSU8xqLwlRr0mHctE+moL5cExWrxYKTjP0
         ACBkTeu/JcPwGJwfDkOmc12BDdW8W+o7TB/48+3TNyavSZunfxmASFoaoMZryYmgk9y4
         WA5XuEhESUdNBdO9QD0FeCyk2HyU0cnMxKM1YpHr1Srb8q0nm0JHRRGPhmnKBQsW2EoO
         eP8A==
X-Gm-Message-State: ABy/qLagrBGwynns9iAYWKFVRp/XT1sNPahAyCa5Sj3WszW9Zq+m9Gdf
        sylX9uCSckYYV8Nu8g572GBznkFxFTK22mZqBN4Rhw==
X-Google-Smtp-Source: APBJJlFMyJGJYZl1X0Xl3JL/kHOPlmQzTpSeOAF+bjJ5Q+BjRCMdplnyIEg/TI+4GvKZXOIBKpca4PlArXmrwwGkwHk=
X-Received: by 2002:a25:d453:0:b0:c61:8ddc:88db with SMTP id
 m80-20020a25d453000000b00c618ddc88dbmr6321998ybf.6.1689881607489; Thu, 20 Jul
 2023 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
In-Reply-To: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Jul 2023 21:33:15 +0200
Message-ID: <CACRpkdb6P1KjGWNnYWKoG+ZxFCLo7_06zjv_8CGMFoT9S44o1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Add some defensiveness for regulators array
To:     Mark Brown <broonie@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2023 at 7:20=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> The sunxi pinctrl has a fixed size array it uses to store regulators used
> in the driver. There is currently nothing that ensures that the number of
> elements in the array is large enough to map the regulators defined by th=
e
> individual SoCs. While this is currently the case having an explicit chec=
k
> in there will make life easier for anyone debugging memory issues that
> manifest in the driver so let's add one.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Patch applied.

Yours,
Linus Walleij
