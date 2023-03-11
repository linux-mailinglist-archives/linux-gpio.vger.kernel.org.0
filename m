Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52B16B612E
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Mar 2023 22:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjCKVt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Mar 2023 16:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjCKVt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Mar 2023 16:49:57 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1163E48E14
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:49:34 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5416698e889so48297667b3.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Mar 2023 13:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdmQqssz5Had8oKQ72+apTinz2h275pm1ruvmQEjspY=;
        b=gciPTBzc5QeQj5KkAuxfF0sr1ewqzJhakiSPDo1gsE2A9ZXhCZQ/hG3a1t4iRAPLfP
         +Aq1XLuuOZ7AFqgJg18C8Vseq0+EnNzJGT+gM3mdSjeVH6p6d9z7+juyFi6i2IDuJcIv
         +0vTAd//fng+HqncXPI12NlxScniKk0OjN3SS3nfTrW9PUFOc0oy+e8HOl7mEiqT369q
         BaK3O5gh3pce+h1asTlYvdww/3ov658708qg68yHf2XNiMhNKlqaqcb6ltmApDhPB0WP
         lYkO6k9AuEYVUVgQLTh3Osg/S5H71A5yTqz+W4DSmr24BcmU8J6l2J9basel3DzvBeS8
         fC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdmQqssz5Had8oKQ72+apTinz2h275pm1ruvmQEjspY=;
        b=FQaOxb5RDvpL+homB7rU8QgcIvhLgQp8RPKoh3+UuDsrQg600E1p7aGpzQkNFy5Owu
         2CUNlI4jPaOQ2XINrioV1KeaOIIQjYjzijvV5QuOU0KPJAAntn/zP8NKx31O5w/RRoYA
         WO48TwFEJKl0qXKzEA330stZ3YkG1b4VtQVy0NpvBY72rpqDI6KueR/c60sofBL9qYKW
         ouncpecL577r/BgESgvxnDxt+F1OnX2OTqUqF6srTT6tCY3BP0E8KyEy/a0n5K2ksGf+
         incEZNoxqID9kZLlCxgmuhl4BKhExNhTMIm6boM5BEkSikfI4cf21uJVypqx/0XKAqmF
         UfzA==
X-Gm-Message-State: AO0yUKXaXoBcKF/IsA6B7SA8KUT69+eM6jWrc3FPZReDMTBXmf3fxU4J
        ci21OIykR2czd2cJWh0Uf463D9j9kBvTrTxvAT+/wA==
X-Google-Smtp-Source: AK7set9h5X62z/8PFc5WjUF7Ll5771AgCuJ/tNffuI9FWePIEX3T7EXV62ldi2qaq2E3cBiPjBF6dCcp1OVBnvB+Tg0=
X-Received: by 2002:a81:b665:0:b0:541:8285:b25 with SMTP id
 h37-20020a81b665000000b0054182850b25mr905504ywk.10.1678571373151; Sat, 11 Mar
 2023 13:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-7-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Mar 2023 22:49:21 +0100
Message-ID: <CACRpkdbmDh=45ZpXCUkL=f2h=LzxdHJmiCCOtkmCB9c=A9Q6fw@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: xra1403: mark OF related data as maybe unused
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
>   drivers/gpio/gpio-xra1403.c:198:34: error: =E2=80=98xra1403_spi_of_matc=
h=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
