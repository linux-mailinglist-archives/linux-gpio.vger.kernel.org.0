Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C1A77C9E9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 11:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbjHOJB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 05:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235896AbjHOJA0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 05:00:26 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313B42122
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 02:00:03 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-586a3159588so73262867b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692090002; x=1692694802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEXvWpz1Ti3WddZiehf4bMtrsV0/Lyv9JePsyhGV0js=;
        b=kPBYQmCGwBL78lqjbqrQzlQx8uIpN57DWxkq4sdWf7AGwHh0C6RWjwLCiSE+zNmVX9
         nCvj25dxqlgOo8YGkVmIogYSjXlUY4KFHA3/8crfzGypfE9dbqLpjodUaUVKgu6oqxld
         pxt3/7mqQL5dbC+XdKhJXKbXV5TvttH66Uwhxo2zjkGpeOMzwNnRrf5aHvJ0x/NwE5hG
         Y7GikTxj4tt9HNfFFkuchFsiPjI9Y91nfaA8E8IXuaMrRH/p8MDyhsNdcSB057vIZL6U
         TcWkUtn/Wp/LGrsGcPPNQk771jCGRrf6jwlir87V5Y65Wb7AkmMKHRPrNyVqwLiis3Di
         AkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090002; x=1692694802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEXvWpz1Ti3WddZiehf4bMtrsV0/Lyv9JePsyhGV0js=;
        b=JdYF4rdBy+IuDKIrtNdi2cmO/pG+jDuk+BHwD8zPy/FF1vSB2oOUl9ciyRDyDJ0We9
         uYkPNxJ3yvnKz0HatYl51o+6oEKoxeZF+wfVNf9FVNGm2vdflLgpajTgQWT/NBSsvZcf
         3q4F7ojvr6a5d1wizp7JfZIS0Cl6nBUJ+AFQG3V3nrXCHnuoD8kiznDjOQX6kj8//LqA
         C+Cn/toqcOixHtPA20MDql07RObum7aZLu5OgYNEn8NxwynTIeiXB+E/X8CKMKX3bRdj
         ohuKqjEV0Sufw3Pe8sHiDyG/0nEX900o2V0BeP8mJGDyvRxIkECAHTzI+ayCFGQaRmiV
         DSfA==
X-Gm-Message-State: AOJu0YwV6cIgn+uPcLHvKIHJs79j0XqbOgu08XO5uoVBDa0rseDQ7RaF
        fFBPxSrvA99UiKmeI7xwwg2RyT9PFApDcDLcxmp/nA==
X-Google-Smtp-Source: AGHT+IH1k/Zc4/6x+5Qgabmeij3DXoCWWxtMA2ktD3S6hLypmy/89je1LNRw0jXVyyZJtALES4RQLzS0ImyxXgEKxjI=
X-Received: by 2002:a0d:e644:0:b0:589:ad2e:7293 with SMTP id
 p65-20020a0de644000000b00589ad2e7293mr1309621ywe.5.1692090002452; Tue, 15 Aug
 2023 02:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230807074043.31288-1-zhuyinbo@loongson.cn> <20230807074043.31288-2-zhuyinbo@loongson.cn>
 <20230808-amount-urban-9a6eb09852ca@spud> <536a9062-65b2-5518-5c50-1a61e23870ee@loongson.cn>
 <20230809-circus-photo-6911d2e18f96@spud> <d4e16768-bed0-beda-42c3-f0a01b7e96cc@loongson.cn>
 <CAMRc=Mc00yy6DxdEos_w7HAkAwH7j0HBvkbQbaQiA_wTXiwFUg@mail.gmail.com> <80325b72-e7b3-08cc-f726-513de75de94c@loongson.cn>
In-Reply-To: <80325b72-e7b3-08cc-f726-513de75de94c@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 10:59:50 +0200
Message-ID: <CACRpkdam7zxSSj3Lirha8tWdeM_WhZpD4xO7MbTK4hVumU0a8w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: dt-bindings: add parsing of loongson gpio offset
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 14, 2023 at 5:39=E2=80=AFAM Yinbo Zhu <zhuyinbo@loongson.cn> wr=
ote:

> > Why do you want to put it into device-tree so badly? This is not the
> > first driver that would have of_match_data for different variants
> > where you can have a structure that would keep offsets for different
> > models. It's not like you will have hundreds of "compatible" chips
> > anyway, most likely just a few?
>
> Using this ways that put offset property into device-tree that can be
> compatible with future GPIO chips without the need to modify drivers,
> such as more 2K chips in the future, but use of_match_data and data
> field of_device_id, which every time a new SoC is released, the GPIO
> driver needs to be modified once, which is not friendly to us.

The purpose of device tree is to describe the hardware and
to configure it for a target system.

The purpose of device tree is not to make driver writing easy
or convenient. It often does, but that is not the purpose.

These offsets are not relevant to the people that need to
author and maintain device trees to support and tailor their
system. They are only relevant to driver authors and SoC
manufacturers.

What about just writing these offsets into the driver and use
the compatible match to look them up.

Yours,
Linus Walleij
