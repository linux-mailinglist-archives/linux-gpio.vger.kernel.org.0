Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85D9730F77
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 08:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbjFOGgU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 02:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243758AbjFOGfr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 02:35:47 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5D22D62
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 23:34:59 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f9c1735984so26968061cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 23:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686810899; x=1689402899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Osb3NHaHcbl6NnPMZnsY5uVW1zjRONnhdL0JLfyutQ=;
        b=gij5KXYx6V1YiXKkDtT40nStKeLM8ZaMp66xTuviaYT0jTvUfZAxKDvN+Q3IuVLaZQ
         cGUBons3f8ve8XnCAA4gC3YVbdtn4G8NQT+dAoNpuQ1OxEdk6rkj8a4ENQ4VlzEPnWKF
         yJqvyVbpX7vQbGx4pf76F08AnbS+LkCKdfj4uFwYSb4EChptSrZNb385LXneeAKnh1pC
         vys1hiqghHgWz1XLLVS6bAM5DHxV2COapbslbZBgqiJu3pMEEbfS8NoNVtGlh1fjjCan
         a+mQdAnioCdzgS6+hGeoUR69UHTmzniMM4kkNURXXrE5c8yVdv4mTHrT9GgvtmtdfcVo
         N2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686810899; x=1689402899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Osb3NHaHcbl6NnPMZnsY5uVW1zjRONnhdL0JLfyutQ=;
        b=ij5VYzCVjejRYt2jTkDmTatKU6H3GjLh6zYI5TUUKjXjmDVw7cSzuPjxqdXpAgN+at
         /w9Ejhg645dQhRf0WV5+TbXf3CmnBJ5QqKCs2fdnLieNow2m8uIjp+27ZgiyoBRyEff9
         SsZw3vw0MXY6HXassWnF8YrXiFWwLrpb3E1CXmNsDeLg1SkTbQKR/A7odf/Eus+ydOcS
         DmU3TYHyn+4KFTyungKJ2mr76Pmiml5RrefdB8FLZWdW3JTVjl2Y1lqH5+qsCKZnW9Lt
         7hf4heoV495+4FMrasZKq7ClLmrah4lxhHM62/rrZMHa1ygfrP61tNTlGcywi0JfHKcQ
         jq8g==
X-Gm-Message-State: AC+VfDzvqu8JHp37J497uL75tQW7YtEPM7AYhq2i/u+Um4KQucjs0zhX
        /obaIlkx+e/OCUzh9/yhvX0JmJqisigYmAr7LnZly2bPUlPgmuep
X-Google-Smtp-Source: ACHHUZ5Ep9Fae9D4n4GrZmxZA7yjHbSLwyf9azOApm4uHNJsqlX2RKN8q8jkbu8hCC6kFi6EwWoLnxwifTxyOBBscXw=
X-Received: by 2002:a05:622a:13:b0:3f8:6924:a0b6 with SMTP id
 x19-20020a05622a001300b003f86924a0b6mr5128624qtw.50.1686810899049; Wed, 14
 Jun 2023 23:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230614231446.3687-1-andriy.shevchenko@linux.intel.com> <20230614231446.3687-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230614231446.3687-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jun 2023 08:34:48 +0200
Message-ID: <CACRpkdZ3sEoN2_L+307ReEDGhNQgLknp6HNPpD0aVvzzrbOUiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: aggregator: Remove CONFIG_OF and
 of_match_ptr() protections
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 1:14=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> They stop the driver being used with ACPI PRP0001 and are something
> I want to avoid being cut and paste into new drivers. Also include
> mod_devicetable.h as we struct of_device_id is defined in there.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
