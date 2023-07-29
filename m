Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE294767FB9
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 15:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjG2NvS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 09:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjG2NvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 09:51:17 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1831F185
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 06:51:17 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44504b2141bso1155809137.2
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690638676; x=1691243476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMNLUfpZqoDexDPllLPnk4uUqUNtiZ0vTNU2n1jKZX8=;
        b=fG5rmuqb4wscMQ6ZZRU/koMEGPRVOVF69vGWRmQTiAMB5I/OTHNgvN7CQnWfbZ6tWV
         hbloZHILAMKXvCS0jZMBfEC0+HOvby1jgtykDYQizM14X5IVvfqzr1Ri2PfE77guu7n9
         AQqSzskdRDFXmPJYooB5iNhHoSF6dRL2w/z/BaSH7ml4w/o4Lj54uAcq0Z2uvGKT3h7l
         wqR4KgkunZxWbYZW6UGVefaKq7Oa1oKzqw1oVpw0wSnT7VytfRb6sp1QGrbLubjdySDn
         WWsE6Qg356QGSogawab2F3lTSr4tMB0n3iIfFE0u30zK2hJP9lykPgTh1yDT1X7OZssm
         vlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690638676; x=1691243476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMNLUfpZqoDexDPllLPnk4uUqUNtiZ0vTNU2n1jKZX8=;
        b=KV3sY6VyJk8Ogr0Ihw2y3aaCvkjdcwV3sCu7TK8C9RpC13V6IZeOClhMNEjnGOaX6K
         oh1KcM2GdoCGGnQ7FZodDDhQWZ5fcG1aqIC0ExL2A+XtU3iVnZHEJK6TNFyqolykNkAr
         rRtjtsBEtFQfLGQM6Cs3rZ8MXsx+hPk43LiYXtZ4I6NH+SiqpDdrXPaG6jxKAGl5qT/X
         sQ81cft1fKpgMMebBxBYyNOLg0rinBQmosWU8K/YjCpJZDu1zwuP9tCUVh2q7xPziv2b
         0aQC4llT3Ud/fhZ9xV3YjAJYNyWnTCt1dwIf92QFKSm6ixO+qRpWLxNfj9H3mDMp6rc5
         +Bkg==
X-Gm-Message-State: ABy/qLYcQIVn0HL9k2FsoVlLlHikbfB7E3Wzo5qNbyZDsdKQ11TM2IBP
        7eGalzhSV85xOZr5RH3w8lVmK3n2YtRQTg0wXGJFcw==
X-Google-Smtp-Source: APBJJlFiKvyURAlxhHJrT2uslgauOKKxfrwaDb6shL8iDM+gSjpfh1DG6gEV1onr92MCAPpOepW/tqMIkMIQG4k1T58=
X-Received: by 2002:a05:6102:7cb:b0:440:de70:6c10 with SMTP id
 y11-20020a05610207cb00b00440de706c10mr3071236vsg.14.1690638676157; Sat, 29
 Jul 2023 06:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230727124043.2751747-1-ruanjinjie@huawei.com>
In-Reply-To: <20230727124043.2751747-1-ruanjinjie@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 15:51:05 +0200
Message-ID: <CAMRc=MdYwzrK68+9eMq8_1unP=VR5Nv-bLoEJu1UARHHLkt2uw@mail.gmail.com>
Subject: Re: [PATCH -next v3] gpio: omap: Remove redundant dev_err_probe() and
 zero value handle code
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
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

On Thu, Jul 27, 2023 at 2:41=E2=80=AFPM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:
>
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq() function =
as
> it is going to display an appropriate error message in case of a failure.
>
> And the code to handle bank->irq =3D 0 is redundant because
> platform_get_irq() do not return 0.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---

Applied, thanks!

Bart
