Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5CD75E49D
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jul 2023 21:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjGWTuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jul 2023 15:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGWTuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jul 2023 15:50:05 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB1611A
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:50:04 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so3991163276.0
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jul 2023 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690141804; x=1690746604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WjRfkrOZBE+bPp6Lr6v82ClIyq5fzCi+P9/0PDOFxw=;
        b=FdzWlyMyVeJiJ2FYtIxqi+vl2/Zf0e8gZSkb9nFBsXXvc4kJ8iBcmTdtAfwIxspx6P
         Iuf9dQmNMNSM0ntvzPyDtGYVW+E9cfBopf/V87mfZqjM/VRra0tcq9+wGmtyGZ9kOtgk
         bHGfuhHK1N074Xk8zkRitL6usDnOTyQFUDKXd6sEPNRieoBFEhlijuRVrc+jnGf7lOmZ
         Mc2NODtL53zR/5Sio9N+4SSm5spfsoj9jL47ILKvJuCkQMjLsYuWmfJqalK3moy/obrS
         Sykz1TVh2X95CgyAelgXOsnVdOFqjSF5UB36Zrx+pieUsF1ZUCnASBNYtl5x0xsbJzFg
         Z2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690141804; x=1690746604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WjRfkrOZBE+bPp6Lr6v82ClIyq5fzCi+P9/0PDOFxw=;
        b=YuIGId0ishyNNhXc8EEjP0bnJzujy1ck7zPziyr4HxpWQycbm8f8cx9wMKStfj/Xj1
         SGZ8S4O+wcQdcak5m4PY7DBV6g7RSHKo3aT3q/IA2tTiDQBtmAu84IaHaFOBDBdvE1TL
         to5xxs4FEuDSoFfJ1+uMy0JbUcmKKIhLUrEPpb77gfIS22y/IDv19j2jJRF7McomVfnQ
         M9MjGZeDheEnndmdp36ani1ntdgNvXmjMxiL3E60PCnbFZRV+W8AqNfWA/YN56zAJBoV
         P15Z//KErXPwQ9m0OzhxVONdZ+u8SaO4A0LMVCD6mqD9utz52NnE9ccu5txY1J4qHRrC
         ztpw==
X-Gm-Message-State: ABy/qLbdxmHn+1zoIA9fxrQ+KgUUlciZyJMP2fQ1R9pX7KywzYXl0W6A
        2tgL+DOdsBPvdKSmZ8rSE2BqOlmA9bx+VT4QaTFe3w==
X-Google-Smtp-Source: APBJJlHAFyizI2ckEJ9nB0m7g3DAdXb4Zznk/ltdZ+PB2It2UsgAzguNVS+hBnlB/Sq31qEL/qdnwqCcpuMVa7EVWzE=
X-Received: by 2002:a25:1957:0:b0:d09:ff7:79ed with SMTP id
 84-20020a251957000000b00d090ff779edmr2539324ybz.5.1690141803793; Sun, 23 Jul
 2023 12:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 23 Jul 2023 21:49:52 +0200
Message-ID: <CACRpkdYzytbM0sN7Q-Niwq2jUgbeVPpREmwUTbja86eGROOB+w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same
 pinctrl request
To:     Shiji Yang <yangshiji66@outlook.com>
Cc:     linux-gpio@vger.kernel.org,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 18, 2023 at 5:16=E2=80=AFPM Shiji Yang <yangshiji66@outlook.com=
> wrote:

> Sometimes when driver fails to probe a device, the kernel will retry
> it later. However, this will result in duplicate requests for the
> same pinctrl configuration. In this case, we should not throw error
> logs. This patch adds extra check for the pin group function. Now the
> pinctrl driver only prints error log when attempting to configure the
> same group as different functions.
>
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtmips.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/=
mediatek/pinctrl-mtmips.c
> index efd77b6c5..8f5493220 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> @@ -125,8 +125,9 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev=
 *pctrldev,
>
>         /* dont allow double use */
>         if (p->groups[group].enabled) {
> -               dev_err(p->dev, "%s is already enabled\n",
> -                       p->groups[group].name);
> +               if (!p->func[func]->enabled)
> +                       dev_err(p->dev, "%s is already enabled\n",
> +                               p->groups[group].name);

Why is the driver not backing out properly and setting this .enabled back
to false when probing fails for some requesting driver?

Or am I getting something wrong here?

Yours,
Linus Walleij
