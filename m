Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02347719484
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 09:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjFAHmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 03:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232115AbjFAHkh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 03:40:37 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058BBE5E
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 00:37:41 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-456d0287ec1so52692e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685605060; x=1688197060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW3h3cvH4As2Xf0M957U4Ip9ETClZtNMuBXhWPDYrJU=;
        b=FrUyHEHyEgPCiCO1GL4j5baTkXitWNVh6ELjh//mfP5Hx93PrvJJ5YHq+fjgstpA/Q
         jaDvggWlMXUCKAPzcCq0ZnoK7KNdPvNjTt+Qs+WR/CmPkwVw+U69npmRIg4V1WERuvnf
         qPyeeFvmmKrRuSpH0FZnmrbq80ZZ6yEUUqzr8d6yhjKyd3E4uY0jdG2OeNEhN9pL3i4a
         D5SdDH9bdb45Jt855EYs8KYmO2nKurF4q35GtJjiS4Fw/wiNrX4NmFeCH4fW4qmm8mNg
         nw/hBCe6PFOJlKFb8ZpEZZ3cD9glc1uE55qGIrHFc+z+PiYyOi+yoVxl08cYfb9lS3HT
         tBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605060; x=1688197060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW3h3cvH4As2Xf0M957U4Ip9ETClZtNMuBXhWPDYrJU=;
        b=ZFbm79UlCqInO3hvG0/0r9ju1KvjxZxl7jfH4XjHdGQaCBYTDNDUvSm9zDz3McPfpb
         t/k46Pg6+WEcypOJIUhnmRl90jtu4L1XL8nOxH7NgdFk6SGRY6isRksXtGmZtcLG3XUD
         SSl15EOgAmYpxMdc98ojXLLzNlCcTSrkUI+fbvcaAiAfwqGmTr/uLRWhWZCmG1FyET7Z
         TH1EZadCKUMaV9fioP1EhUg+y8mJ1J7cB2A92uiwKwLk1xpyTQxj3etpvWq9yYEPEmPL
         R1oqEdbtuvj9BWpSbH0VySVzeCZVaKmJU+vrPSRJKEuLUlfbzVXRN3Lmd/n8BDk8zHP6
         MIUQ==
X-Gm-Message-State: AC+VfDx53GyMpTo5MwOSPcAB4wCtMx5mc/CPUWc+VqsVvMf7VivWC3i8
        +e9ZjpkJOwgClpnRtQIw3k8ipUHD6Obdo7QxKHm1GJQcX/v03bPn
X-Google-Smtp-Source: ACHHUZ5oOZoNmYvyh8Pt4uoNg4tgsXs0XOqSn8kGzW3jTVjhSnGY9BUbJBScQWthsZ+0lKzOycVkUkwK3Uz96wgahaQ=
X-Received: by 2002:a1f:4b45:0:b0:443:6db9:24e with SMTP id
 y66-20020a1f4b45000000b004436db9024emr340028vka.15.1685605060121; Thu, 01 Jun
 2023 00:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230531204139.10570-1-msmulski2@gmail.com>
In-Reply-To: <20230531204139.10570-1-msmulski2@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Jun 2023 09:37:29 +0200
Message-ID: <CAMRc=Me5aSam-10kMzsHE3mCV0XxUgjm5z9auv++nBGMe3BQ-Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mpc8xxx: latch GPIOs state on module load when
 configured as output
To:     msmulski2@gmail.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        Michal Smulski <michal.smulski@ooma.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 31, 2023 at 10:41=E2=80=AFPM <msmulski2@gmail.com> wrote:
>
> From: Michal Smulski <michal.smulski@ooma.com>
>
> Qoriq and related devices allow reading out state of GPIO set as output.
> However, currently on driver's init, all outputs are configured as driven
> low. So, any changes to GPIO confiuration will drive all pins (configured
> as output) as output-low.
> This patch latches state of output GPIOs before any GPIO configuration
> takes place. This preserves any output settings done prior to loading
> the driver (for example, by u-boot).
>
> Signed-off-by: Michal Smulski <michal.smulski@ooma.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 3eb08cd1fdc0..6340e738c912 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -375,8 +375,12 @@ static int mpc8xxx_probe(struct platform_device *pde=
v)
>         if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
>             of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
>             of_device_is_compatible(np, "fsl,ls1088a-gpio") ||
> -           is_acpi_node(fwnode))
> +           is_acpi_node(fwnode)) {
>                 gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
> +               /* Also, latch state of GPIOs configured as output by boo=
tloader. */
> +               gc->bgpio_data =3D gc->read_reg(mpc8xxx_gc->regs + GPIO_D=
AT) &
> +                       gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
> +       }
>
>         ret =3D devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
>         if (ret) {
> --
> 2.34.1
>

When sending a new version, please list the changes since the last submissi=
on.

Bart
