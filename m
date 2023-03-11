Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C3A6B6130
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 22:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCKVuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 16:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjCKVuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 16:50:11 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EC34DBD0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:49:52 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-54184571389so20221867b3.4
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqNxoqG+lZ6oxesXMP4M9SwCu/22j7feF4x6heHwhek=;
        b=zeNdXMivIRquGUcJj0m5PLawOYA3UBvnBq+haPzTIA8zsJCogWC/b3TGY5fFD8qFGu
         kFJG/uEMB+nme3nCu4INlEbwdAfHt8kAY67t0xnFV/oDy3EddeCvh3l/U+LUWcC4T/Jd
         MwqP1jx6Hd/VtdY8XDy1Ms80eTyE/Rt32/DJ6KUbRV/9LbM5GunG9h9dOkGNreXPIo0i
         qj5u/pDZWDf6crKH502d3nwnY96PAyAek9VkwkyHW7WYJTZg2n3e0qP8iBccZ2kfyk5w
         ONsgA+oKdmKmrZ8bgrEBMFXV298D2VpeSNLBw8tiJ3O/czDVy4J0ZqLLoBaxaFIYWIe5
         IHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqNxoqG+lZ6oxesXMP4M9SwCu/22j7feF4x6heHwhek=;
        b=Viz+fpYwElEXkEB5JyGb52DKUU88f+7kLB0GEFY9v2SLYg2UJUXD29OoR/8kdKpzq6
         Ih5eTdlYCFEQ3nOg05AlcRm7gIXkx8Tz3D6Z1Cg5oHxAwr+jywgVS3Iipy6e+WhWn5vV
         8t757Sfnl4aC7NgGSaVTLBR+keoWZRFu3UlgIdD01hXzTPtadJwLWdnTCyE9fsVWR3q6
         G5eBRanACQ/vYNwrwAmVMO9gROQHP9U8pTsv5NqRRe6ZNud+k+goxfwf4hkm8A19QIqB
         7n7kMexpDj9gmSN1z4XGIhudVmIQxA7mJdajiOzwqOfdGXiOSircT85GF6oGupr937+f
         Go+A==
X-Gm-Message-State: AO0yUKVkbGvW0S45JJJb3pFmEJCloHQ8U6MRelmHoRVzso2bOFMsOvcF
        cnCo+ia5GT1hf4fgvPvB8OYLkBp/iuxbwqdT4xG9UQ==
X-Google-Smtp-Source: AK7set9q4t0wVmeyByvkjybAxdRp4Q1NPAg7CDNjCXq8sbQysHoXIGebF7m7NGtkwbo3qp32nNJ3Te+zjQEcOjXmNLk=
X-Received: by 2002:a81:ac51:0:b0:540:b6c9:66cd with SMTP id
 z17-20020a81ac51000000b00540b6c966cdmr2722485ywj.10.1678571391838; Sat, 11
 Mar 2023 13:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Mar 2023 22:49:40 +0100
Message-ID: <CACRpkdbqbrEZfX7S93ueN7S_ywwvE7ZWS-L7r7h9QcGXNRWnXQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpio: raspberrypi-exp: mark OF related data as maybe unused
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Nandor Han <nandor.han@ge.com>,
        Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 11, 2023 at 12:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>
>   drivers/gpio/gpio-raspberrypi-exp.c:237:34: error: =E2=80=98rpi_exp_gpi=
o_ids=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
