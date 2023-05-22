Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9F970B9AD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 12:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjEVKMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 06:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbjEVKMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 06:12:31 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69379CD
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 03:12:30 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-528dd896165so4040345a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684750350; x=1687342350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2CMMjuOZ7SheZ6hHLAdcPHZAVyD3xyIbZ0CaxKgzAY=;
        b=VuNDaACWnAvGjRieYahMmrmoiiUE1U6Ja2bRKayUFHkIir4Tw9DE2DjaSIVyMgbFIN
         fsH5F0b8LzFpd6RQtMFv2OothigodzTgGrlbNeg2Uw429Hoje63XHqQcItKXN4jkXtu3
         ouoF41nx5UDe14lN4EM/qKD2ykG2aKOxvI6VYD6pm8EJPby8dGGsxYb+GP4D4Bqci0Zs
         rDQwCCS3kP9/lxEE26fWGtOsyNukTvSZllfOZ2OK1rxZ2eMJqZh9Z+ETtBwh0t20CqHZ
         zb7W3doxaRE20nl31S5RhcFfzkpf5+lqe1kwgYx4/FRiLIDXROAjT0C++tjFoyGL5gQM
         islw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750350; x=1687342350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2CMMjuOZ7SheZ6hHLAdcPHZAVyD3xyIbZ0CaxKgzAY=;
        b=MT5OY7F0Kg8Ba69WhNZkD24aPtQVPFmaUZRj4cChJYYAi8q6rj3HCbEx0nbnGBus+a
         aT4wKenPEFwaGB/iqLup9iv7mbi29czmein1+z6U7Np3uNRUvSRRAcfxJrGVFkXHFx/i
         Z5iVsyXQxEdrDBA9myDX1j6GTBLdbdiCmE850k9zj+86CoP+CbaygsUMj+Vasq6F4Xb8
         nrnR/7bjsF6sjrWUqPkaOrq5J126q4I3GD/M39pv4wbKKRIFMb3+fOPwtI1gxgB/JIEb
         bAnFFVs+/f4sRWrhSwOHItEL3azoHXYfw2JqsY2x2OF1XR6tTKlKKcdW9Lo923ihCDyG
         v+5A==
X-Gm-Message-State: AC+VfDzpgkVhu7Qi//2ePDnahTgdseqALj31pGA527q6XJiCGhrCXlAG
        PKhfDgx6tXbGGsSEg9AYJjO7i8CAODqh5DvfKI3tx1UL
X-Google-Smtp-Source: ACHHUZ4S+dG1rgCv1W5f2wtFCG0rsBPEYk+1b0OziLqm7EJ84Tk5xC9hxfd8iCR2bmu/J32ABfzXE27zbch5+c9tT+E=
X-Received: by 2002:a17:90b:1050:b0:24e:507:7408 with SMTP id
 gq16-20020a17090b105000b0024e05077408mr9402753pjb.37.1684750349569; Mon, 22
 May 2023 03:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <c58e0499-ecc8-4383-b607-a168db53ecdf@kili.mountain>
In-Reply-To: <c58e0499-ecc8-4383-b607-a168db53ecdf@kili.mountain>
From:   =?UTF-8?B?5ZGC6Iqz6aiw?= <wellslutw@gmail.com>
Date:   Mon, 22 May 2023 18:12:18 +0800
Message-ID: <CAFnkrsk34aopsMHm3g9SGZ0-Wq4HTU3eJvLmp7i8oa-AzLyW7A@mail.gmail.com>
Subject: Re: [bug report] pinctrl: Add driver for Sunplus SP7021
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dan Carpenter,

Thanks for inform me the issue. I'll send to patch to fix this issue.

Best Regards,
Wells Lu

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2023=E5=B9=B45=E6=9C=882=
2=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:49=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Hello Wells Lu,
>
> The patch aa74c44be19c: "pinctrl: Add driver for Sunplus SP7021" from
> Jan 16, 2022, leads to the following Smatch static checker warning:
>
> drivers/pinctrl/sunplus/sppctl.c:886 sppctl_dt_node_to_map() error: poten=
tial null dereference 'configs'.  (kmalloc returns null)
> drivers/pinctrl/sunplus/sppctl.c:899 sppctl_dt_node_to_map() error: poten=
tial null dereference 'configs'.  (kmalloc returns null)
>
> drivers/pinctrl/sunplus/sppctl.c
>     820 static int sppctl_dt_node_to_map(struct pinctrl_dev *pctldev, str=
uct device_node *np_config,
>     821                                  struct pinctrl_map **map, unsign=
ed int *num_maps)
>     822 {
>     823         struct sppctl_pdata *pctl =3D pinctrl_dev_get_drvdata(pct=
ldev);
>     824         int nmG =3D of_property_count_strings(np_config, "groups"=
);
>     825         const struct sppctl_func *f =3D NULL;
>     826         u8 pin_num, pin_type, pin_func;
>     827         struct device_node *parent;
>     828         unsigned long *configs;
>     829         struct property *prop;
>     830         const char *s_f, *s_g;
>     831
>     832         const __be32 *list;
>     833         u32 dt_pin, dt_fun;
>     834         int i, size =3D 0;
>     835
>     836         list =3D of_get_property(np_config, "sunplus,pins", &size=
);
>     837
>     838         if (nmG <=3D 0)
>     839                 nmG =3D 0;
>     840
>     841         parent =3D of_get_parent(np_config);
>     842         *num_maps =3D size / sizeof(*list);
>     843
>     844         /*
>     845          * Process property:
>     846          *     sunplus,pins =3D < u32 u32 u32 ... >;
>     847          *
>     848          * Each 32-bit integer defines a individual pin in which:
>     849          *
>     850          *   Bit 32~24: defines GPIO pin number. Its range is 0 ~=
 98.
>     851          *   Bit 23~16: defines types: (1) fully-pinmux pins
>     852          *                             (2) IO processor pins
>     853          *                             (3) digital GPIO pins
>     854          *   Bit 15~8:  defines pins of peripherals (which are de=
fined in
>     855          *              'include/dt-binging/pinctrl/sppctl.h').
>     856          *   Bit 7~0:   defines types or initial-state of digital=
 GPIO pins.
>     857          */
>     858         for (i =3D 0; i < (*num_maps); i++) {
>     859                 dt_pin =3D be32_to_cpu(list[i]);
>     860                 pin_num =3D FIELD_GET(GENMASK(31, 24), dt_pin);
>     861
>     862                 if (pin_num >=3D sppctl_pins_all_sz) {
>     863                         dev_err(pctldev->dev, "Invalid pin proper=
ty at index %d (0x%08x)\n",
>     864                                 i, dt_pin);
>     865                         return -EINVAL;
>     866                 }
>     867         }
>     868
>     869         *map =3D kcalloc(*num_maps + nmG, sizeof(**map), GFP_KERN=
EL);
>     870         if (*map =3D=3D NULL)
>     871                 return -ENOMEM;
>     872
>     873         for (i =3D 0; i < (*num_maps); i++) {
>     874                 dt_pin =3D be32_to_cpu(list[i]);
>     875                 pin_num =3D FIELD_GET(GENMASK(31, 24), dt_pin);
>     876                 pin_type =3D FIELD_GET(GENMASK(23, 16), dt_pin);
>     877                 pin_func =3D FIELD_GET(GENMASK(15, 8), dt_pin);
>     878                 (*map)[i].name =3D parent->name;
>     879
>     880                 if (pin_type =3D=3D SPPCTL_PCTL_G_GPIO) {
>     881                         /* A digital GPIO pin */
>     882                         (*map)[i].type =3D PIN_MAP_TYPE_CONFIGS_P=
IN;
>     883                         (*map)[i].data.configs.num_configs =3D 1;
>     884                         (*map)[i].data.configs.group_or_pin =3D p=
in_get_name(pctldev, pin_num);
>     885                         configs =3D kmalloc(sizeof(*configs), GFP=
_KERNEL);
>                                 ^^^^^^^^^^^^^^^^^^
> Static checkers like for kmalloc to be checked.
>
> --> 886                         *configs =3D FIELD_GET(GENMASK(7, 0), dt_=
pin);
>     887                         (*map)[i].data.configs.configs =3D config=
s;
>     888
>     889                         dev_dbg(pctldev->dev, "%s: GPIO (%s)\n",
>     890                                 (*map)[i].data.configs.group_or_p=
in,
>     891                                 (*configs & (SPPCTL_PCTL_L_OUT | =
SPPCTL_PCTL_L_OU1)) ?
>     892                                 "OUT" : "IN");
>     893                 } else if (pin_type =3D=3D SPPCTL_PCTL_G_IOPP) {
>     894                         /* A IO Processor (IOP) pin */
>     895                         (*map)[i].type =3D PIN_MAP_TYPE_CONFIGS_P=
IN;
>     896                         (*map)[i].data.configs.num_configs =3D 1;
>     897                         (*map)[i].data.configs.group_or_pin =3D p=
in_get_name(pctldev, pin_num);
>     898                         configs =3D kmalloc(sizeof(*configs), GFP=
_KERNEL);
>                                 ^^^^^^^^^^^^^^^^^^
> Here too.
>
>     899                         *configs =3D SPPCTL_IOP_CONFIGS;
>     900                         (*map)[i].data.configs.configs =3D config=
s;
>     901
>     902                         dev_dbg(pctldev->dev, "%s: IOP\n",
>     903                                 (*map)[i].data.configs.group_or_p=
in);
>     904                 } else {
>     905                         /* A fully-pinmux pin */
>
> regards,
> dan carpenter
