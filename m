Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751C84FBC1D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 14:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346020AbiDKMeO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 08:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234322AbiDKMeN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 08:34:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAC63ED07
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 05:31:59 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i27so30522041ejd.9
        for <linux-gpio@vger.kernel.org>; Mon, 11 Apr 2022 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jBDZOUj40UCKpbLB7bFx1yBWu6QPK94DCYQV33996m4=;
        b=j+A5ccabaUeeM3416rNwxeOecPOSkjCNrxnFAXpzerKo+LUtJ8+0sbgHxV1y1df7th
         4tOgEILYkjiBedfexIvLZ3cgdeJhRbfOeXS2MpyJp1JNMkfSKWiIOK9JpGom6TGPhtBz
         ilgZIqZCvGhSJGw6EwRNmAzDp77wy6FQ38oAI4IAI3cZi064EYq7c5WewoXrXZ5+OFP6
         q1+VyVnGcX4NmukImCPV6WGpEr2P0i3EkAz/AGmBVn6kPjNq8dFeJ+SkDYyNEVgFbfKz
         fJyrbXMc6RgNDrcopLi9sCoLOVeico0nmBL0blW9iUe8PUClcQePHmtnxfDL06wm4DxQ
         EKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jBDZOUj40UCKpbLB7bFx1yBWu6QPK94DCYQV33996m4=;
        b=nm2woa4wBx2Z1tOpx7/rdat6nqRRB9JhpZXAsiZPtw8DWjVgv75gEHKc5xoLe0VqYn
         jniURC+7CiPunIMSEFEhq3tM4ftlkYWl4KQMxbQcp03RFrnie08xoPS0fsSjI/2oZR4J
         7bVmVP/fbsQtNu0XuxmkJLYbUxfpv08UGEwJCsjt1IAtFC3thU/A6CDpdY5ZzJeFTYeL
         C48biQd1ENWOP/hP1rBpjXBUikPbsk3SXOwFrfsMFR/s5VCddclHlVKk24z8dB0t4Zg+
         ChqIkh2yjxBMyRoC/qoRJGyH/qnSb/EFUZJ96ImswQlIas4EMuBWaw3yCpz9iqEfmqi/
         K+ww==
X-Gm-Message-State: AOAM532FYLdHNesMVVrYzMlO3CIenzQ9jtpqk069B4R260nvjcVyJJEi
        v2qQ5e7NEW5JbFacXVpNlFqpGT6ba3P1aXbl53CyEw==
X-Google-Smtp-Source: ABdhPJwNZv8N7FgL9z4krJ3g7caKEsfemJcG4eROygWQm1CPb3gR15iupplZRtc05YRM0cnB2/1iXvgiGp99Aaz/Qmo=
X-Received: by 2002:a17:907:10ce:b0:6e7:116:10d0 with SMTP id
 rv14-20020a17090710ce00b006e7011610d0mr29415404ejb.101.1649680317762; Mon, 11
 Apr 2022 05:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649533972.git.sander@svanheule.net>
In-Reply-To: <cover.1649533972.git.sander@svanheule.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Apr 2022 14:31:46 +0200
Message-ID: <CAMRc=MeRMtm84ZyRgs9nxqWQ-LhkL0kejJA5UqrP1VHogFrccQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Support for RTL930x/RTL931x GPIOs
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 9, 2022 at 9:56 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> This patch series adds support for the GPIO controllers as found on the
> RTL930x and RTL931x SoC families of MIPS CPUs, used in managed NBase-T
> ethernet switches.
>
> The RTL931x's GPIO controller behaves the same as the one in the older
> RTL838x and RTL839x series. This controller is trivially supported.
>
> The RTL930x's controller has a reversed port order, and supports CPU
> affinity settings for individual GPIO line IRQs, thus requiring two
> additional changes to implement these features.
>
> Sander Vanheule (6):
>   dt-bindings: gpio: realtek-otto: Add rtl9300 compatible
>   gpio: realtek-otto: Support reversed port layouts
>   gpio: realtek-otto: Support per-cpu interrupts
>   gpio: realtek-otto: Add RTL930x support
>   dt-bindings: gpio: realtek-otto: Add rtl9310 compatible
>   gpio: realtek-otto: Add RTL931x support
>
>  .../bindings/gpio/realtek,otto-gpio.yaml      |  34 ++++-
>  drivers/gpio/gpio-realtek-otto.c              | 137 +++++++++++++++++-
>  2 files changed, 164 insertions(+), 7 deletions(-)
>
> --
> 2.35.1
>

Queued the entire series, thanks!

Bart
