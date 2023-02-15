Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05270697F0C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 16:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjBOPC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 10:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjBOPCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 10:02:55 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5096EB6
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 07:02:53 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id v81so9818634vkv.5
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 07:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1676473373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M7hd4U2ofjGk96iav3XLY03QqIBY+w0lGe4zEy9ew+Y=;
        b=oSvpP7LiXH5/t+/HfGic78Ra2+9sf2NZCCZGpPj7YMqrDid+hCESMakmGck2Y8G2cm
         bLrVnueXWC2k8nWjr667D85bwvViPUNxZ0cCEJW8PjRMmNqDV0eyP0IL3XvDZNf6jdSx
         kHtExI+8Qe0Keddz+xGN5rftMbMwn1623jSAU9YMoMwbGvLRtwDteW7DkZCMqxE8yUhz
         pBrdo7TJWsium4gGzqcc/Ji3LIBN9hGlGfz7slyDEfi6eJMKT240IZ/B+C/yJeiacdEw
         /wLFAonWzQnXNlcRzFWmKDo6ilOLstJ2uE2/zVTm4FCOLeeU1a2aHTf94s2XctRAoBht
         hXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676473373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7hd4U2ofjGk96iav3XLY03QqIBY+w0lGe4zEy9ew+Y=;
        b=MLXxWo6GDTlkFMG7THQ9pUJzs03Doq0qdviSbKtHZyjbt5MW7OVFShs2A6tYB2zfG3
         5U4K9Xh/WJ1naG6EtQelI/lZrsQ/t5GrYDahfLjO2mttDhi9Fee4ezKhVinPhpzG0ZmV
         A3g0PcsKhsrhWuDjAcQhQY3as9UVAbItkq7tukpdtueiLvcNM5V0oWa0P4CCHtcAGQc/
         lHRO/cf1G3Bu/hzrG3v2SkdqTcOwa2Gz9iur8V3vTS91Dp6zlgkKXE6uYODQHwWM46oI
         BYIEu0xkckyAvZC67m8taudc6w1QEuQ674YMKno3lAI4hDNj8fRYtf2/eCKFda3WFL+L
         aOTA==
X-Gm-Message-State: AO0yUKVRlprxrwF5L0yEt2cefbE39626qf8KjLxHlGvr4/lUmu1vBiQj
        dNMOyuaSPIPsOz2WblWXpvNPIXnmNY4vlvy0tM9D7A==
X-Google-Smtp-Source: AK7set/q1okhI51WZK1/r5p2g0WPqKECkT2DwWZhoOSsnHFlc0UhCRfSj/7yXDPFE76jmkl4J1YO2/z2kky9CxMgd2Q=
X-Received: by 2002:a1f:2896:0:b0:401:5477:5c2c with SMTP id
 o144-20020a1f2896000000b0040154775c2cmr342082vko.10.1676473372884; Wed, 15
 Feb 2023 07:02:52 -0800 (PST)
MIME-Version: 1.0
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
 <CACRpkdbmXri1vtRShm7a3N0sRA7Qg_ni5FpAtiEv+72a6g9Wng@mail.gmail.com>
 <CAMRc=MeKdb=xmidwXQiNxtJpb1xii1D-43m1z6cNtF1VxFwogg@mail.gmail.com> <e0bf4347-ec24-a4e2-0851-d5cdf850cc28@linaro.org>
In-Reply-To: <e0bf4347-ec24-a4e2-0851-d5cdf850cc28@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Feb 2023 16:02:42 +0100
Message-ID: <CAMRc=MdZOmxSTvtKaPo7cnx6q+dg8ANQYuM8PeuN+KQ7fqV61g@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: gpio: rockchip,gpio-bank: add
 compatible string per SoC
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 12, 2023 at 5:14 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/02/2023 21:03, Bartosz Golaszewski wrote:
> > On Wed, Feb 8, 2023 at 12:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >>
> >> On Sat, Jan 21, 2023 at 12:06 PM Johan Jonker <jbx6244@gmail.com> wrote:
> >>
> >>> Currently all Rockchip gpio nodes have the same compatible.
> >>> Compatible strings should be SoC related.
> >>>
> >>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >>
> >> Bartosz can you merge this one patch and keep the rest back
> >> so we get a more defined DT binding baseline?
> >>
> >> Yours,
> >> Linus Walleij
> >
> > Krzysztof, you left your ack but seem to also have pointed out an
> > issue - do you want me to fix it up somehow before applying? Drop the
> > oneOf and turn it back into an enum?
>
>
> Sure, you can apply with my comment fixed but then just please check
> with `make dt_binding_check DT_SCHEMA_FILES="xxx.yaml"`, that
> indentation is not mixed up.
>
> Best regards,
> Krzysztof
>

I prefer to get your ack on the final version really.

Johan, please address the enum issue and resend just this patch.

Bart
