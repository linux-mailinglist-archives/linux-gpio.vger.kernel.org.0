Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C6877724E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 10:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjHJIK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 04:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjHJIKz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 04:10:55 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455282691
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:10:37 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-58688a0adbbso8540897b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655036; x=1692259836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XObqrpO05Q8Ko4rompdgPMyaawV+qZCAi4T7+P4OILw=;
        b=OPqFbb2njhbgDrSTNOOS4DGvSVMFZTvCrUVQ0uMHQiFYMAeNUfdiYXZBl6YwUuiTUa
         empuNdI1qK7wP8OvPwTEtEM76tPm3ZPjF8Y7oMq/3E2xxtJZs/5i0CpDy4ediBfWuWkg
         rxwooDeF5iIXkRs5eGICM1HJNVXfu8E1VXZh8lPYiInNk3miJRDOKBxIqKWQxQaPwUTw
         LUPVno321WbMgWxjFJAFKZnthpLTQ5VtybG9GFCK1em0MfcbP4iRIc85MKNBRXlz3+YQ
         /ht3wlAVmyTiiI7AboQJq8lPGLBf26S7V0+Wwlf/rncbox7+QiuTZ4v4MP0tSdt40Qp0
         aHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655036; x=1692259836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XObqrpO05Q8Ko4rompdgPMyaawV+qZCAi4T7+P4OILw=;
        b=DIInTU3mDEDOVoROR2p96BXgnHtEPQictRjyWB2TUGBK/bX2f+/3I1gmq05HbdPhWz
         rId3PmPSHo/c2AFPTbI5i2t9yedn1xC26sgCDQQ5Y3D8z9/WhhXfw6iglx9+JiuiJPAU
         DpLK4y4X668Ugk6CRYimuLXA2EueVg7t9akz9Zsyvpud7dI8xxS7JMa2HnqnaYDmE8qz
         kdiaZiF3xMwySpoHkLiCzJH1Rnaulx3jCCesByS6nBcDmavI0zS8Pbuit75quH6kQeeH
         mcmLdxd/tBdnnM17olNfs9AYVu+8dt3eNoBVq5Gqu/jixpVF3oa5Gb1yILAIac1gKtIJ
         Cggw==
X-Gm-Message-State: AOJu0YxBPauEyAwNXJwWA6mvByQjdJvSXDof7xWDquz9gCNX6Co9X5cN
        zteSKZuMAa21a5DtuUZM3sMCQ1F6Ii8+iJ7UO+gfCQ==
X-Google-Smtp-Source: AGHT+IF9R1hxhHlgicDJY1+gUfZnbv7fd1p319oPXKnFx1wDjJfkGw5lLtfKOpWV8DyDT0rKepsNlwy0C3g+YEvqkYE=
X-Received: by 2002:a25:6948:0:b0:d3b:e659:5329 with SMTP id
 e69-20020a256948000000b00d3be6595329mr307678ybc.9.1691655036142; Thu, 10 Aug
 2023 01:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <4ab2f59f-45c1-76a2-94da-3331e8ec4e35@omp.ru>
In-Reply-To: <4ab2f59f-45c1-76a2-94da-3331e8ec4e35@omp.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Aug 2023 10:10:25 +0200
Message-ID: <CACRpkdZfWbsV+O8ZOjr=oh+-y4TDWyq5Zuupi_LCJ9bS3izAFg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: drop useless check in atmel_conf_pin_config_dbg_show()
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2023 at 10:47=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru>=
 wrote:

> In atmel_conf_pin_config_dbg_show(), checking atmel_pioctrl->pins[pin_id]
> against being NULL doesn't make any sense as it gets derefenced first and
> the driver's probe() method immediately returns -ENOMEM when devm_kzalloc=
()
> returns NULL for any atmel_pioctrl->pins[] element anyway, thus failing t=
o
> register the device...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Patch applied!

Yours,
Linus Walleij
