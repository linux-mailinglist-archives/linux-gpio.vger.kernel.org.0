Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4983692792
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 21:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjBJUDl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Feb 2023 15:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjBJUDk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2023 15:03:40 -0500
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D9E765E4
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 12:03:39 -0800 (PST)
Received: by mail-vk1-xa30.google.com with SMTP id v5so3203946vkc.10
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 12:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UE3ll5JZwjVLRnVM34rbSidyuGAYqN9NN6QDtGBKWgM=;
        b=5FE7spKl/uH6LtHUdRAT8qESaaYluENmDQi9fiHlsjuhrz5429ACChfN5SjL24VUH9
         39L5kpNKk/okISA1NBuynohJEOve0Ywk++x8QBAYflc6jYP/9Edv/7px65Gob6EXp/8u
         ftCJqS9t/0QSrHMB2qX7b4tcyod004T9Nr0i+NDjPqgR5m7crttnrBC6UAuss/+7NKIb
         bFXKjU779489tjyAxoYCCgmNhQWLKwmzyBMPUgtHc1JS38RF3VeuOdul0UtX0lVU2zc/
         NaXGB0w9A/79MZcVrGgxcbOUCXZz57gOaqLykzcmp/LvfV2fAte6idPOtpcNJcWz2Hzb
         du2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE3ll5JZwjVLRnVM34rbSidyuGAYqN9NN6QDtGBKWgM=;
        b=jpSutLwzYN1l3V49ciHT39qVInmCe5+k6PbQ7lMWLdUuDkVuzGGf8b9dN5G9zEUI24
         SV24LcbEy8i1zo0TqbOX4xY3n1NWhSVxhCRnpPJqsKa1NCR2bo60+wcgyg80BAjvvyAS
         juSF/WKWYMQoJDOOuHhdBI+b6FvVOjAn3Te3X+Cc7y9ZIA8f5zGgoUxP3oWmhv4q+TN1
         RYwCiByVWj3yZ/8lJHRCrusSLAEv4NrcBx333B65O5xfeJIK4JU4Pio38uhvTdb8AGoD
         bQjOo/FzDb/JO7AMn7kBp1z498uOaN7IgaStHWrMVR3T2vGOWTR+4BIXQtyHp3MFp+uZ
         arOw==
X-Gm-Message-State: AO0yUKU6ZOqzlr+wudmXDxvs6lqKu0UBiFZAoE7lR9L1M8tWiZ1oIcMQ
        xzhnIaQJ3FGCkP2t9tH7KJwApCqySCopkgtUfw08zYzw4aji6Q==
X-Google-Smtp-Source: AK7set8iKVPpIW80jN5qXfYELUdIvwOQnS83LQN/njN0oFcDPgxfXeBcMbMBVB/yxw9jdkbOuS0Gq8f0uA/FjvEPcm4=
X-Received: by 2002:a1f:9493:0:b0:3ea:7394:e9ef with SMTP id
 w141-20020a1f9493000000b003ea7394e9efmr2973055vkd.11.1676059418517; Fri, 10
 Feb 2023 12:03:38 -0800 (PST)
MIME-Version: 1.0
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com> <CACRpkdbmXri1vtRShm7a3N0sRA7Qg_ni5FpAtiEv+72a6g9Wng@mail.gmail.com>
In-Reply-To: <CACRpkdbmXri1vtRShm7a3N0sRA7Qg_ni5FpAtiEv+72a6g9Wng@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Feb 2023 21:03:27 +0100
Message-ID: <CAMRc=MeKdb=xmidwXQiNxtJpb1xii1D-43m1z6cNtF1VxFwogg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: gpio: rockchip,gpio-bank: add
 compatible string per SoC
To:     Linus Walleij <linus.walleij@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     Johan Jonker <jbx6244@gmail.com>, robh+dt@kernel.org,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 8, 2023 at 12:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Jan 21, 2023 at 12:06 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> > Currently all Rockchip gpio nodes have the same compatible.
> > Compatible strings should be SoC related.
> >
> > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>
> Bartosz can you merge this one patch and keep the rest back
> so we get a more defined DT binding baseline?
>
> Yours,
> Linus Walleij

Krzysztof, you left your ack but seem to also have pointed out an
issue - do you want me to fix it up somehow before applying? Drop the
oneOf and turn it back into an enum?

Bart
