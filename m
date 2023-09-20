Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7ADF7A83F3
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Sep 2023 15:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbjITNyr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Sep 2023 09:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbjITNyp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2023 09:54:45 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B2AB9
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 06:54:38 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso2724389276.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2023 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695218078; x=1695822878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYSun0Wdmv2UxSSLu5pfbVvQMooLrR2EKUP0Tr60xow=;
        b=ea+IVKz9zJZdF95klQvVuDM3C0WLFlv/nbqT2c3NS6yyU7AtfON77YulBVAM9Ez9zl
         7p1nWqUsvqpWlNmfgCz2zeBa4kIamt9UYxQbtz/kc0DCpwBdeSlbF1Sik/JfIn3Qb/ZA
         aB0ytQ0ppOhsPWHUeS4XMnBn1QciwrCQZKQyduIth8tFcq5OJxppTY0eyltcwraXLgZI
         oqSqasQCLFO8gyKDBLPULSor579KPfCN7AUzDYFy3n/zlHagwNqIvas30qifqIs9n4wZ
         nyL/2uyaSRYNZrVmmdQ+CqY4qKBPolSJWzk8bcOOjQFTU2MyWEcde3lsDD+B55YXb720
         Opcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695218078; x=1695822878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYSun0Wdmv2UxSSLu5pfbVvQMooLrR2EKUP0Tr60xow=;
        b=wdkY6ZDvlY0sC218fsZhEpTkHp5akaw3vYnmGxvIDFeuGj7JBkHKr+Zx8Qo1GpIDY7
         pKfxBZ0aYyRK1eg99ETXR1BLH+kAAPU8e8IwOPUhJcdmbaAJezxlrYkT+gBhulw6z1sT
         rPef/tzzKaIpScuSYox3OACsi3b5E6QiaPgFxbzbpxtDj1mhTp5Hl14G7MEu27g+FuB3
         9CQ1jXl4bpfzVUXMDpAeHe/jy+G/8f44kZWSks3V/A25BYAoJFhCmi3yOjVIOu7TJ6L0
         XlQauchsNVNb1lSy0hDM08vu68IoMO+ugCnsR6Az8gS5R9Ifxl9/5Ut5Qi3+I6lpAOGH
         VOFw==
X-Gm-Message-State: AOJu0Yxkh89Wmi08PxqbsyGyB2rN5KuUPwqy82Gf2FCrqA5O/T6PE6Z/
        qUKeNeMm2XM96vP+auKtTD8tNaxLu3nwKh1JJwXzqg==
X-Google-Smtp-Source: AGHT+IGFGAKCcwstzXpUX0QWqQdz4xwL43xZgTH8JleZVL+Potm/mUTnmvrUwC6OfeP4HqgEYKbLvshd0Iv3xs/pHq0=
X-Received: by 2002:a25:25c3:0:b0:d78:1b39:fd03 with SMTP id
 l186-20020a2525c3000000b00d781b39fd03mr2546447ybl.64.1695218077919; Wed, 20
 Sep 2023 06:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230918123355.262115-1-biju.das.jz@bp.renesas.com>
 <20230918123355.262115-3-biju.das.jz@bp.renesas.com> <CACRpkdYYKAFLvpKH0ih5qZVbv7L3auny5WWx+qKa_HD1o-vsog@mail.gmail.com>
 <OS0PR01MB5922A256D2C57963ADEBCEDB86F9A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922A256D2C57963ADEBCEDB86F9A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Sep 2023 15:54:25 +0200
Message-ID: <CACRpkdbM+XNjvxBZQFzZCsU+3V7PucBhbi_WjVtnGpakFQasAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzg2l: Enable noise filter for GPIO
 interrupt input
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Biju Das <biju.das.au@gmail.com>
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

On Wed, Sep 20, 2023 at 2:37=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:

> 2) Digital Noise Filter Clock Selection Register (FILCLKSEL):
>
> The FILCLKSEL register selects the divided clock to be input to digital n=
oise filters.
>
> 00b: Not divided (initial value)
> 01b: Divided by 9000 (41.666 ns x 9000 =3D 375,000 ns)
> 10b: Divided by 18000 (41.666 ns x 18000 =3D 750,000 ns)
> 11b: Divided by 36000 (41.666 ns x 36000 =3D 1,500,000 ns)
> Note: This value is the value when the external clock is 24MHz.
>
> Q1) What is the recommended way to associate the above values with
>     PIN_CONFIG_INPUT_DEBOUNCE?
>
> Eg: I need to configure filter on, 8 stage filter , a divisor of 18000 fo=
r a mechanical button bounce noise.

As per the generic pin config and DT bindings:

 * @PIN_CONFIG_INPUT_DEBOUNCE: this will configure the pin to debounce mode=
,
 *      which means it will wait for signals to settle when reading inputs.=
 The
 *      argument gives the debounce time in usecs. Setting the
 *      argument to zero turns debouncing off.

  input-debounce:
    $ref: /schemas/types.yaml#/definitions/uint32
    description: Takes the debounce time in usec as argument or 0 to disabl=
e
      debouncing

The recommended way is to pass the desired clock cycle in microseconds as t=
he
argument to the pin config.

Yours,
Linus Walleij
