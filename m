Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3D36EFBD8
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Apr 2023 22:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239440AbjDZUsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Apr 2023 16:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbjDZUse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2023 16:48:34 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AEF1A7
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2023 13:48:33 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-552a6357d02so91272457b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2023 13:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682542112; x=1685134112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdi2f9tDcSB3djwB4V/VPNjZwmjPBfuLoSA5AYqKL9M=;
        b=De+4paIaOaWUHgJo5qTgZBNmMmNRF984piBG4ngJC9wZTlZ+2itBTzdIJtUwXqCBMi
         iCt6+MgVbqPPcB1X9p9rzouHjm3Q6lZ2yUlVkPwUZIKSDX4JTBh/ZKcyHvDcqNZEq45C
         m1yTI3cWr47skGO8aRVpfQ6w1Y2UQNSYA2BmnQJAiXx1x6Ki5Jq3p/WG8RVfZ7dBEpil
         FMYig/xdzfp215jroaxhsTtHcxaMm7jI1isFNYCV3+G53agI5qO65CPhmf6Ob99RPye5
         bOJmz2vZdEIDkfjpmnazYuVxsWCgaZJBFVqG2HfFEn6NUClLsjuB3JmGZ9n2+85tn2fI
         2wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682542112; x=1685134112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdi2f9tDcSB3djwB4V/VPNjZwmjPBfuLoSA5AYqKL9M=;
        b=GFQia1JgneuOGhPHBK22dTCgJfMeCsMjnsrFCtBrmq8ML7dRHdI079FRxjQTiApXE2
         K/Vo4J5O1kFOhaJVBiWs2TBb6D1H47gN3YcRqkL9kvo3r4gG7SUmTLwVaSVU8Vw2eBux
         CNbn06Ob3CgdQehGDbhtN5jP6NASiU+srhaJ7/uCAkYSrkcoaHNOEDU2SuREBMlAUSVs
         vomGwRdZ1HoLOTk4Ap5E7iJL5d2TCbDfLadiWk+olk0CkoUrHnrzkWcc54mwR2YL9oFS
         FxL9ZtuhOT/He3smOe1Mq6vAUqtk2Xtqdek3i6jblYs6llCxklDehcy/yfVRjbekAxAs
         QoCA==
X-Gm-Message-State: AAQBX9flfVFAPHx/AWfqPUR4Tqcqe0aUsyYM0UFe00kvyWFLHupVFezH
        wbLQPMSc/l39Hh3ElzcgZu4WIhXz7hE+Wj3Pv/6FFg==
X-Google-Smtp-Source: AKy350ZGPBAqkhcjC/oZOR2o49L/Kd+QBwzpHurXSr42uoYO/GZxkR482tzqaNa7u+xXYdbhMGrb+GW3NzTlNXeD9fw=
X-Received: by 2002:a81:5404:0:b0:54f:bb49:c3a2 with SMTP id
 i4-20020a815404000000b0054fbb49c3a2mr13402352ywb.28.1682542112275; Wed, 26
 Apr 2023 13:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230424123522.18302-33-nikita.shubin@maquefel.me> <20230424163203.GK2701399-robh@kernel.org>
In-Reply-To: <20230424163203.GK2701399-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Apr 2023 22:48:20 +0200
Message-ID: <CACRpkdY_1-4QPzuQs0aqX4M=RDzT3y9m7FTA_Dq71vEn22A8qw@mail.gmail.com>
Subject: Re: [PATCH 32/43] dt-bindings: gpio: Add DT bindings ep93xx gpio
To:     Rob Herring <robh@kernel.org>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 24, 2023 at 6:32=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Mon, Apr 24, 2023 at 03:34:48PM +0300, Nikita Shubin wrote:

> > Add YAML bindings for ep93xx SoC.
> >
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
(...)
> > +  chip-label:
> > +    maxItems: 1
> > +    description: human readable name.
>
> Why do you need this? It's not standard and I don't see other GPIO
> controllers needing it.

Caught my eye too, Nikita can you live without this and just use dev_name()
or something to name the chip in Linux?

If it is to conform to EP93xx documentation naming I guess it should be
cirrus,ep93xx-gpio-chip-name =3D "..."; ?

Yours,
Linus Walleij
