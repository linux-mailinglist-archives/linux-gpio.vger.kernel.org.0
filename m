Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B5B645050
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 01:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiLGA0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 19:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiLGA0J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 19:26:09 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A7E222
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 16:26:08 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id o127so20736697yba.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2022 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYj9KCsb8kRQIFxK0aVemzvvzUafcIYmATwlKu599UI=;
        b=vzW5c5uBK0GIU+Kn5Akt75iCuWqL7qzVV16OvHY3HFk6bfH64Dg6xNAodpJo/Gqjy8
         00K2VO5AMXtc1mRtQmDL/m0HJ9hAFet8B6dlRUQg+IX6tCLPGfO4zaTaIxNtJMBK80VA
         C48vLuQM6fBLZ59iFd8YcLWgJowE2ohV44bTYZ442kbox5ckrQ1B2mMMUnbrcIAvbvEy
         SnLoGhHNgp65X0Cq9oxqmjbxQCspZWkDGyV/i/WMsaSErDmJBq0pgJPPFJUhpy8MKfIS
         4tTaeb5ktk3YHynGzY+VAVJGWjsjYmhVamtsVIF5DeUn/QOMcPhZE4iWT7gIzo5i+kVj
         Glcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYj9KCsb8kRQIFxK0aVemzvvzUafcIYmATwlKu599UI=;
        b=p2DlbhWfZI9h05+B3ZMFFB7qixUT9w+rnN3fGFvYsdBzfT4ew/BlPtezohy+ISfUZl
         QHlT5gtE4OJUnSLG5yzUISBh+kJRzw8Kng4d+xknlIcW/eeXuNAS+ETKYIsAzDU/lmlJ
         wgIZ4G+9JpCRJTEZ6d/b4VoDFi38b2uTxqObv/oxBh0W8QIP1sMr2HECEPDxgleFZLeZ
         z45B7kWzg7Y2DtEPT7ekyz1uMw5aZPilo4fLF7A+G3eu9OgwTvz6bMqpxJj29m7+DEvn
         afWgeUS+7LX4bnd/sb7W4qCpUcTjr92kTnjJVuHubAWsd69bx33bxadHU40PupQ+KKN8
         ePqw==
X-Gm-Message-State: ANoB5pmu0OZ7YthE6K4z0pSako2sUv543QhNGxwree7isWmnMxA7cEdw
        UQCNPMkNZM6cV+TkSh+cfP8LH2S52BBwQvomLWgJMw==
X-Google-Smtp-Source: AA0mqf4AKQSwpp270vZpFCotxEx/+sVHte0YmayepwqKp3xynAgiNgkXkHQo92XzCDGjBno+PuM+OCP+QO4nnKgXabU=
X-Received: by 2002:a25:bc8a:0:b0:6ee:e865:c2e2 with SMTP id
 e10-20020a25bc8a000000b006eee865c2e2mr22311303ybk.206.1670372767866; Tue, 06
 Dec 2022 16:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com> <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
 <f79b9397-64af-894a-411c-5595fa136008@redhat.com> <e04eaaa0-1a5d-7f8f-9cd9-4a2117f83aab@redhat.com>
In-Reply-To: <e04eaaa0-1a5d-7f8f-9cd9-4a2117f83aab@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Dec 2022 01:25:56 +0100
Message-ID: <CACRpkdZZ01gTeWaU5GybiafDM3EnyEhyuEMTenusfV2s1NdfXQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 5, 2022 at 4:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> An alternative approach, would be to add support for LED
> lookup tables to the LED class code (like we already have
> for GPIOs) and use this to allow tying a LED classdev to
> a struct device on non devicetree platforms.
>
> Given the problems with the swnode approach from above
> I believe that this would actually be better then
> the swnode approach.
>
> Lookup tables like this use device-names, so we don't need
> to have swnode-s ready for both the provider and the consumer
> at the time of adding the lookup table entry. Instead all
> that is necessary is to know the device-names of both
> the provider and the consumer which are both known in
> advance.

I think this looks like a good idea.

We attach other resources such as clocks, regulators,
DMA channels, GPIOs exactly this way. So why not LEDs?

As GPIO maintainer I every now and then get a suggestion
like this to "just let this pass as a GPIO because it makes
my life so much easier", but it is the same curse as the
input subsystem has: it is versatile and well engineered so
it starts to look like a golden hammer (everything start to
look like nails).

But we are two GPIO maintainers and right now Bartosz
does the majority of the work, and if he thinks it's the best
idea ever I will certainly reconsider.

Yours,
Linus Walleij
