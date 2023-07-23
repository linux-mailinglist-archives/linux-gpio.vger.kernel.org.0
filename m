Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F342375E47D
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jul 2023 21:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjGWTYV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jul 2023 15:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjGWTYV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jul 2023 15:24:21 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF1E1BE
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:24:20 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so4061082276.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690140258; x=1690745058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAG8curcXxIe67r63NSNDmtyHfYk/6+uaC4W2xqV//M=;
        b=Ev7xVYwHjSWdhn6rRSoGo5howvOJoeNhnE2KY48cG8mA8cA+wbVU0GBX4StOoGAgrA
         vXW88fZAYMKewV6edX0hIek5idMGKqXJUW8TuF+SOUMYwrsCwaRHe17q0EcltNSZ2seR
         glPNFGlED48MoHPkaAiVVLFIXBo6zNozT8dD14JDtIjvn75q6i/HUoXrqz47RFk5+Xlx
         m8AMJv7xIqBBDAiuHEVuielX8WqhBk3R53hwjjCr+LYqumXWS/4Yi8ZALHuDOVt5BAJK
         9BUGda2VF72dZ4Aqz3Qlc0sD2Lf0p1LZRUHbryD4xxFWopmjoV3XJpOeJHKOAtHcUznI
         pGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690140258; x=1690745058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAG8curcXxIe67r63NSNDmtyHfYk/6+uaC4W2xqV//M=;
        b=h9u/JdkQW96Bz9VtpYTWby4BkzcVpUQBZDdeTICvt+B0Dk+uIRj156ZoEcSPbnYmmK
         hdo0u6F63E6JdFKVMLNN5vKH6LauJ5lopsbPAxDzIMQ1mebd0RVcChpe6Rec8Ams5Mj1
         9S7O/IH2y3i3tSzxuN45TIcBcg2ciJPGTiCxuTuoHn3XMPimVAzya3+HGVZE6dIWNTNy
         q28CIereMb9DO5BiBK2v5/WC3y0NR/P1GPsTT8mx0gACWUX17rBS0znpkebU5QMFHT6B
         j+8TZFaNG5LcaCEaN6S5IX9bVF/O4rG0IkrCe1QIpX8oHboRoamahsS4fdJ+d68i3+vp
         QKGQ==
X-Gm-Message-State: ABy/qLbJCwfWZILcq4fEZevX/obACbubxB6QV0x7NaHpY6NWcuqhQJW4
        1v60xP4pMzQDjeFQLTslf4DV9E0Tj0dO5Ld71VVxng==
X-Google-Smtp-Source: APBJJlGoasXGfe5hFr70DcARWayE4fKQCzefyqvO314rjOOL1v2XYXRNlYBTZsNWTDPa9JwN5dqmukHiXsaEhGyz3+4=
X-Received: by 2002:a25:2106:0:b0:ced:497e:df3d with SMTP id
 h6-20020a252106000000b00ced497edf3dmr5257589ybh.37.1690140258456; Sun, 23 Jul
 2023 12:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com> <20230714122441.3098337-2-huqiang.qin@amlogic.com>
In-Reply-To: <20230714122441.3098337-2-huqiang.qin@amlogic.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 23 Jul 2023 21:24:07 +0200
Message-ID: <CACRpkdap8057An+wcieB0UR9V5AicvGnPgnjLE_fhQonQmvDDg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: Add compatibles for Amlogic
 C3 SoCs
To:     Huqiang Qin <huqiang.qin@amlogic.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 14, 2023 at 2:25=E2=80=AFPM Huqiang Qin <huqiang.qin@amlogic.co=
m> wrote:

> Add a new compatible name for Amlogic C3 pin controller, and add
> a new dt-binding header file which document the detail pin names.
>
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Patch applied!

Yours,
Linus Walleij
