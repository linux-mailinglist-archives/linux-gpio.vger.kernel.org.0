Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0887532C4F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 May 2022 16:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237245AbiEXOfD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 May 2022 10:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236719AbiEXOfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 May 2022 10:35:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AA78CCFF
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 07:35:01 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id i27so35737424ejd.9
        for <linux-gpio@vger.kernel.org>; Tue, 24 May 2022 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UUInpDxVHV7PYloxMBybR9/4n9DphIetdqHzlAIU/M0=;
        b=qK2XMsJPnlGWExqp6w3ahfoaTY4GCqlLNDmVmYAilH5cItfF7h31eHQ6qmj2qTGZWv
         mu6uudN+g6HL7MQYyAk7HawQupVPgKo9FodSbBKuU7pYonzGnpVka+40GHWK7XTmNkrl
         izkK7bAePBRPtwMxa+uPyCz8wDqwL49qgEsalX6v1p5JiwN9xddzmJjdwjExuvccDbBP
         w/SQryv6QU3daaB2rtXsq/XF65m83Sb1dbCvQw29mTkx2NmacxkpeA8dDw09mHFWPl4U
         HRiPAZd567jEEICwLP4kgDUMIB9lmHoeNMTi5SYELmewK3/RCBwIH/bus1BpK0QHY43g
         vpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UUInpDxVHV7PYloxMBybR9/4n9DphIetdqHzlAIU/M0=;
        b=u29TLTMyhuS94lkS9Z2njBo0A8oW23D7NEVGl3olMT2DROgyUt+eVWFV/0Eitn2Q8k
         dRCo0kRP6FkXYvEEnj+gw+9Z1bwcTZ0Yy20cxH06+u03vj1BUJ4Bl0C02Wl7YLTh5p6Q
         hGKBmkLd27wrESrs/Mx/IQzVcBsZAwB5u2zBtdT7mVdN/nD/mcz9PDvDwXPDMiNlpder
         Tes47lMc8ZGS76FyYGeLqPK3E0b9i0cipLCLYUIlUuc06wldIARM1GwsIY5tpu5loqJE
         xszWs3zvlXvnZKKQaHFnJI9x5bXEEGNLcyzO9aQtEDr3lnzQp7BdR8jCt29pw6AhFAFI
         uJTw==
X-Gm-Message-State: AOAM5309VjD44bsezTVo8Wo6JR+jpPO9aLUlsIBrUjNAH0tQ7dkX5bmP
        FKERBz0DVRTs6nfaha76sYoad83//HuE6uVbVB8J84IzVE0=
X-Google-Smtp-Source: ABdhPJwszwDvVwB9r3CiAxmnWpUpZRWveeypVuCkUWTyKYXaKgFCRTyNSo6O7/+970wjLynFtnPrxqtJbNOWqQ56hwM=
X-Received: by 2002:a17:907:6e1a:b0:6fe:f357:3837 with SMTP id
 sd26-20020a1709076e1a00b006fef3573837mr7679760ejc.44.1653402899496; Tue, 24
 May 2022 07:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220524074007.2792445-1-Basavaraj.Natikar@amd.com> <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
In-Reply-To: <20220524074007.2792445-2-Basavaraj.Natikar@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 May 2022 16:34:23 +0200
Message-ID: <CAHp75Vd1kmy2K8J-P38MN9x42QBJswJ5Y+mnrbMej-YDgb6CPw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: amd: Define and use PINCTRL_GRP
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 24, 2022 at 10:13 AM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:
>
> AMD pingroup can be extended to support multi-function pins.
> Hence define and use PINCTRL_GRP to manage and represent
> larger number of pingroups inline.
>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/pinctrl/pinctrl-amd.h | 39 ++++++++---------------------------
>  1 file changed, 9 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
> index 1d4317073654..de2bc9dddc9c 100644
> --- a/drivers/pinctrl/pinctrl-amd.h
> +++ b/drivers/pinctrl/pinctrl-amd.h
> @@ -296,37 +296,16 @@ static const unsigned i2c3_pins[] = {19, 20};
>  static const unsigned uart0_pins[] = {135, 136, 137, 138, 139};
>  static const unsigned uart1_pins[] = {140, 141, 142, 143, 144};
>
> +#define PINCTRL_GRP(_name, _pins, _npins) \
> +       { .name = _name, .pins = _pins, .npins = _npins}
> +
>  static const struct amd_pingroup kerncz_groups[] = {
> -       {
> -               .name = "i2c0",
> -               .pins = i2c0_pins,
> -               .npins = 2,
> -       },
> -       {
> -               .name = "i2c1",
> -               .pins = i2c1_pins,
> -               .npins = 2,
> -       },
> -       {
> -               .name = "i2c2",
> -               .pins = i2c2_pins,
> -               .npins = 2,
> -       },
> -       {
> -               .name = "i2c3",
> -               .pins = i2c3_pins,
> -               .npins = 2,
> -       },
> -       {
> -               .name = "uart0",
> -               .pins = uart0_pins,
> -               .npins = 5,
> -       },
> -       {
> -               .name = "uart1",
> -               .pins = uart1_pins,
> -               .npins = 5,
> -       },
> +       PINCTRL_GRP("i2c0", i2c0_pins, 2),
> +       PINCTRL_GRP("i2c1", i2c1_pins, 2),
> +       PINCTRL_GRP("i2c2", i2c2_pins, 2),
> +       PINCTRL_GRP("i2c3", i2c3_pins, 2),
> +       PINCTRL_GRP("uart0", uart0_pins, 5),
> +       PINCTRL_GRP("uart1", uart1_pins, 5),
>  };
>
>  #endif
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
