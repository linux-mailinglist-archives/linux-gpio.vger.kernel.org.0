Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB3E0526BEC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 22:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377862AbiEMUxX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 16:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245722AbiEMUxW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 16:53:22 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80128140FF
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:53:21 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2f7bb893309so102041797b3.12
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BpKCW0mAZxesf8MD9gQhcGX4ZUphV6PxZU1r5+tMQ4=;
        b=aIMWf1OMDIoIe5YoZsrtM/JaUfXehGm5I0Rlj+NfC7dRIpV/fhFhqt90I7aA7z1DU7
         7/hda/0xHror5lqtewr82JP49Lp6JaC6rFVNI0c04hYxER/fkSIfC8PvPemTJMehmxiI
         EzTNmPrDt/xFkwf62psgBsqN/T06UEucWqGtG3g64zUMMJwUpwwTOSWUnrZgVeQheoCI
         EoyBdAXfWgIKZqBx+3IXftTc3Li97z92rd7T+PV5ZNEvdSaHDMBgTgizMcSU/3YrxexX
         WFWnY9kSAVT+pXA7/yEGBcxWzf/uw2NLOIjbEI3ZHpt5uVo9/s/YZPRuHn4phrU1zZLc
         sUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BpKCW0mAZxesf8MD9gQhcGX4ZUphV6PxZU1r5+tMQ4=;
        b=boLO4YZRoJBbaxC7IKYxtvFgjofFu8QcrDknZ8noPMVsX6BDEdArxiUq58LI7FyJyO
         xO0GrxBqAGIBayYJPtV3y+EsvAleVEAT2+xmqbKBSwqju0QID56wOhM5RFmZu05mKnsZ
         rVnQw6wCt7l77k71WL9AR7ZEX4C5c5vS0yOxoAe/u02xxaLMaSFVt0scSSvZgLbZsrLR
         dxBelW1vGSBsA/dBXaKJTxkwj3DXRqXsOvAacLUBAVeSFHghMRwyHcEgQG62b0ScUh4R
         JZlanZwEMkVtdVHKMZrzxOBc0kWswS5OBfJ0eAZkV1Ja1wweFxvKQPNnfI9H5YR894oW
         lklg==
X-Gm-Message-State: AOAM533BGlTOJA4Uh7w0GGks36UqTzoYBw19+so2w5CW6eZ05CZJabum
        lsZoHhAHr246B51oZwKFb8+IGPJ3O6PBECqGeta5Lw==
X-Google-Smtp-Source: ABdhPJx8jJTCH0VbcuwkjIDXFcnDsNCGoInF6vmx6ON7UezZsqZwhVZDJdl1W8RgHgFMJdz+mbzq1pICnkcFspGn4A0=
X-Received: by 2002:a0d:e612:0:b0:2fb:103f:4067 with SMTP id
 p18-20020a0de612000000b002fb103f4067mr8029998ywe.151.1652475200755; Fri, 13
 May 2022 13:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220512173921.8210-1-andriy.shevchenko@linux.intel.com> <20220512173921.8210-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220512173921.8210-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:53:09 +0200
Message-ID: <CACRpkdbg14fdyQmdapeAFgWmSDJ5zSWWkvSjKiLJfxKUfF6_Mg@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] Documentation: gpio: Advertise irqd_to_hwirq()
 helper in the examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 12, 2022 at 7:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of direct dereferencing the IRQ data in order to get HW IRQ number
> use the irqd_to_hwirq() helper.
>
> Fixes: 5644b66a9c63 ("Documentation: Update the recommended pattern for GPIO irqchips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good idea.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
