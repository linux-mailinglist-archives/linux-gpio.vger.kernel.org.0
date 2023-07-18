Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B71758460
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jul 2023 20:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjGRSSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jul 2023 14:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGRSSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jul 2023 14:18:44 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E6FDA
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2023 11:18:42 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-440ad406bc8so1515692137.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2023 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689704322; x=1692296322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHoshmM+VxwXRx5Tjz92hKdcnwt2Qr7T9UogtdInLdU=;
        b=r6hSi27sXLci817+wmdk010XKYb6lADLAiz5gjiw7F4GKBOeEosr05r9bA4R3tYJn3
         upXcyy0CqBhobmzzximzdpDGtFCdKEI6xKIMrNgz7D31KHmo+C8XyrbY2fms+1RmMQLK
         Jpa22+iIVdtueJtpBFu9SauiRRmvbZaniJ4t5tBRo2q2YUA/yKhrVfN9UFQeEOqt73Em
         n9ZMdv3DmQ1Qk3DMXVLZO3Asqm8TrU4SCrGL/WhrR1fJ46cx0/+msmUrX4Niac5q/+BQ
         d0k1+ILpBga5s2SIeT1Eyy2oHgvNMeUb54LZo68PkgQRClzm3n7maYtK7N63f42EyyN+
         IG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689704322; x=1692296322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHoshmM+VxwXRx5Tjz92hKdcnwt2Qr7T9UogtdInLdU=;
        b=h6jP5wL74eZZZZQV5UhLXYaT341ZptoKaZxSJAi3/APrMmhPr5bsX9r7X+MjyYty2U
         iEOft11D87V6buXFZ/622NasoHPJlCAbmH6ZkUpy73bAmxXpCY2DIhMoVExRRK3jvl8G
         lcnMYLcTh2G0dFYdfBIyej6YHEngpn5rqsrUmUMgYEfDGDrY2/QJboHPNhdfxomTdWUW
         eOmXYdmTdMF5mdniJbWf2J1o+TGQXhQ9jCIlQ8r+OJVXlB0GjSJ8obGtY3UfLy0NtLlW
         SSOK37iqarcxktXR5akvp1z8SOOaY2nW5tHVT/VncHfCTNvkOTUd42NRb3LTru9jM3Xf
         X4RQ==
X-Gm-Message-State: ABy/qLbuG9FJ2czp8XIbdTtpgC3BheLFTwhaeNV4ia6MF/+QHXIMZH66
        jE2HHqISUBUs/TuVLHx+JKIQSMczJK5Z7I8IOp6QLg==
X-Google-Smtp-Source: APBJJlEFcZwWpI5991S17pN2BFMGAdIMXwv0ZI2aBEIs2fp1IYt7vFS0+oEZhC4PLuD7vIFYznRDT4ZFlExXma7Sr6M=
X-Received: by 2002:a67:fac5:0:b0:445:bd5:5293 with SMTP id
 g5-20020a67fac5000000b004450bd55293mr71566vsq.30.1689704321912; Tue, 18 Jul
 2023 11:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230710214910.31892-1-asmaa@nvidia.com>
In-Reply-To: <20230710214910.31892-1-asmaa@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 18 Jul 2023 20:18:31 +0200
Message-ID: <CAMRc=MeQBSJ8Y92VfOfiaDjDyW44RunYt-D1aFraNaR_dTRVOQ@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: mmio: handle "ngpios" properly in bgpio_init()
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, davthompson@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 10, 2023 at 11:49=E2=80=AFPM Asmaa Mnebhi <asmaa@nvidia.com> wr=
ote:
>
> bgpio_init() uses "sz" argument to populate ngpio, which is not
> accurate. Instead, read the "ngpios" property from the DT and if it
> doesn't exist, use the "sz" argument. With this change, drivers no
> longer need to overwrite the ngpio variable after calling bgpio_init().
>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Applied, thanks!

Bart
