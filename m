Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9515721FB5
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 09:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjFEHha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 03:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjFEHha (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 03:37:30 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1223AD
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 00:37:28 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-45d59140bbdso1375875e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 00:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685950648; x=1688542648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLlv5F9PbP429U6eYshsTx78m78vhx/Ni3+OMaDrDuk=;
        b=REkHffHSXoVYKHNpcr655dKQDxSFAIT620s2L+deY+q7nt0470LuLeKxnOfBexH5c3
         pVlNLw4k1NSZtRo4hSYvcNqwxY1qX+Y/MY3zaRXilvwR+3e8GsqM+E05pb2jENLgv9lE
         lk/01M7/h9Viq4RxlglN/vfGnkfmQhLvSCK44eqXHCvWl/UUdFvL7lvWNAyaEM8isy47
         yt1U5ESY9KJ7iLt1PwLXaHkFoHsr+oTbMzqUn9rR16y5KO7DUVwSuh/UzWjBJ3CqmxMj
         GgJy2pQGqr7TxnMIBEI2YztODahJ45Evys0vVq7PzRZAjG+nrihXioI5aFf4ZsfCiBF9
         dLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685950648; x=1688542648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLlv5F9PbP429U6eYshsTx78m78vhx/Ni3+OMaDrDuk=;
        b=ecSqYVKu07dyKr0sJeowY0nxL1NlPA5BQ32vgKtIO0Qd08raaqlCPm8GJef+hap8Lw
         6sY/yutjojUsgrqBg3VG35QlQpWCFj0sUojjdNveKCGtlsJv9AZjhmmE83eggu0E/EPr
         0nR/OB93cKOVqXPE0dDTQtwnE9lyQWyySpDGpHlm7CdqZH4aJLQ7b6akpqHmOT/5v4L6
         1X+rJgJEHDqc9VrUjhmyN9Kp/NgDiJColbwKBCZmlI6Kwf7lqygtt8YgG209RmkRJfpP
         pNd+F+l4aBqpWJl46jzFxbl9sVgZyNY1nc3Mq4I1uLaRviQ4oQFbDprqUILY+SxMmYDU
         u07A==
X-Gm-Message-State: AC+VfDzNP31/P5G71H7ZiEeagic0xNMgoQ0oKFmUs5/U1FMdgHqM0ecF
        CdytyqZZ1h06JNedoo5vLTb57/qem1RuZDXTFQn2Vrl0gKqazUy1
X-Google-Smtp-Source: ACHHUZ7ZubEyARGwHdK96qaOxrsiyj3Mv6QWhjS4pvPnK42f4OvbQdz/XiwAWoai/EIQ6MJYtCFW/UEYIbwyBzvQ/lA=
X-Received: by 2002:a1f:5404:0:b0:44f:eb0a:77db with SMTP id
 i4-20020a1f5404000000b0044feb0a77dbmr5060931vkb.11.1685950647819; Mon, 05 Jun
 2023 00:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230605072518.256568-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230605072518.256568-1-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Jun 2023 09:37:16 +0200
Message-ID: <CAMRc=MeWy=zp1fU0hraX7cEegAEzNOOxv5jYCWC8ZcNDmOTOYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: Fix dependency for gpio-delay
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
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

On Mon, Jun 5, 2023 at 9:25=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This driver relies on OF_GPIO features, add a dependency to Kconfig.
>
> Fixes: cf5dec80c4e2 ("gpio: Add gpio delay driver")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This was undetected on my machine as CONFIG_OF_GPIO was already enabled.
>
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a1dac1345f60f..006abaedcae82 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1735,6 +1735,7 @@ config GPIO_AGGREGATOR
>
>  config GPIO_DELAY
>         tristate "GPIO delay"
> +       depends on OF_GPIO
>         help
>           Say yes here to enable the GPIO delay, which provides a way to
>           configure platform specific delays for GPIO ramp-up or ramp-dow=
n
> --
> 2.34.1
>

Thanks, applied, just noticed the regression report too.

Bart
