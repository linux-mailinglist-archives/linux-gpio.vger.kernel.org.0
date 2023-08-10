Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CCD7772E1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbjHJI2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjHJI1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:27:53 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AEBDC
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:27:52 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-584243f84eeso8578007b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691656072; x=1692260872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5CdkAgc0fdEPUHj9O82k/kTQ6xmErn6XcPLACwJvd4=;
        b=mmI5rBV7acGNfMX6damE4Hc4jPx7mptZ5eZ8BGglfS1X1ka42HS87UoWx9srEaNoGB
         e9po/52U3cUphRowfFlI8/YN01DNCqQ6h7JZUXPTmB/N/H7lp9X9Z58o+xmccQKdKp68
         wELs5YiObeLXvwGHohzfT4SxFVBuFigbj4dc/oOUwntm5pyi965C5j1STdSZBb0oqWsl
         odkoFYbpX0AspgsAwNQ2Gx/z2Eh7jQBrApkByPf5j2OefI1FN4GkYZK7KLjlXHkClTrb
         Q467PZrDkk6OYv8eiENREdRNzHxYPdQfDoKMrfOU+YU4A7uM3XKBp9Xtsk2L02TZR1HR
         qcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691656072; x=1692260872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5CdkAgc0fdEPUHj9O82k/kTQ6xmErn6XcPLACwJvd4=;
        b=DhGdLTpo8Tk28ZGW7+ounOJdIBmxFa7FA3IfuCZdq8s8WQIZYw0L/Uh2zZza90h00/
         6RA1zAqztjtO1TJC0pAgkcKegKQhYmJS9YepMi2GU/d0np+NpAsedxhhlG2toB+3BV+N
         97dQMG5WObfNn7w46EKzgdM8ajPW0iwNnbdKN4GsTKdEwi5txQDYIWo/0SvWqWh1aMe1
         4yuqogbnJ0mzi0oAo0Mfq0oi/Xm/2uVnKYz5Yri9zA/kVvwIphr93b0WalGe4RuHfrbz
         SksKm0k6cpbFlAwXZ7qMvQsL0bxDPoMnC9Hj5lJIQW8WMXOciu4qsGQNFVslPE4+QHmX
         s5bQ==
X-Gm-Message-State: AOJu0Yx9vptayXmzeqVISGTKWNkZuXOksyXRfTdNuddvItZ4RXjF5Ubz
        GhaBEJxVI+cpe2Ukjyq/frqhS5sWCoOfwG2OpWhm5A==
X-Google-Smtp-Source: AGHT+IGb9UJIoov1f30J/u3KKnaNNAQbNHH+aUmb7Z0YBojux5Quco+Ug31NqtZsglrRU6A7eGu0x1R8NPq+CXS8ZWE=
X-Received: by 2002:a0d:d4d0:0:b0:589:8b55:f8cf with SMTP id
 w199-20020a0dd4d0000000b005898b55f8cfmr1680900ywd.50.1691656072168; Thu, 10
 Aug 2023 01:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230807074043.31288-1-zhuyinbo@loongson.cn> <20230807074043.31288-3-zhuyinbo@loongson.cn>
In-Reply-To: <20230807074043.31288-3-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:27:41 +0200
Message-ID: <CACRpkdZfx8BGHxj4OyS7HG9=mq5DrVHzHKhehxV1nfKwyMHpwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: loongson: add firmware offset parse support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Yinbo,

thanks for your patch!

On Mon, Aug 7, 2023 at 9:41=E2=80=AFAM Yinbo Zhu <zhuyinbo@loongson.cn> wro=
te:

> Loongson GPIO controllers come in multiple variants that are compatible
> except for certain register offset values.  Add support for device
> properties allowing to specify them in ACPI or DT.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

(...)
> @@ -26,6 +26,7 @@ struct loongson_gpio_chip_data {
>         unsigned int            conf_offset;
>         unsigned int            out_offset;
>         unsigned int            in_offset;
> +       unsigned int            inten_offset;

Consider just changing all of these from unsigned int to u32.

(...)
> +       if (device_property_read_u32(dev, "loongson,gpio-conf-offset", (u=
32 *)&d->conf_offset)
> +           || device_property_read_u32(dev, "loongson,gpio-in-offset", (=
u32 *)&d->in_offset)
> +           || device_property_read_u32(dev, "loongson,gpio-out-offset", =
(u32 *)&d->out_offset)
> +           || device_property_read_u32(dev, "loongson,gpio-ctrl-mode", (=
u32 *)&d->mode))

Because then you can get rid of this annoying forest of cast.

I'm fine with doing this change in this patch without a need for a separate
refactoring, as it's just a contained driver and clearly just about typing.

Yours,
Linus Walleij
