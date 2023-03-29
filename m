Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6BF6CEEE9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 18:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjC2QMh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 12:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjC2QMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 12:12:33 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2516A5FE4
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 09:12:14 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id z17so7138280vsf.4
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680106332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3hznV3F+Z/Oyhu924h7j62VKcfyOxZY+2JiLJNTYKE=;
        b=vlexXMgtpAYNIBPSFDHJdgzpmElgNH7qxEeVWlpSgML7bkvS8X1EgyYnvrBvBXyWhu
         xHfeXoSnUvfBvdBZtQzchG/okzUv3Oed4zXjR/E9pZkSqJmMdD/Zm67KW4PcFBncA/CB
         P5q7aofrAme4NX/vGxgIajfjNi0QxzVNZ4rAcN+25zNEPa85D8YqzJujdvyVB/NQWumW
         kiWUX56fRZYjXtzY7xwjRsJsmDUbTDzmpsigvSZBAQx8IMbCBr+SnRtbbrb80ymW5EKO
         pPk/b0bPqfBdNaL9+5Gst3WNHMf3WOxhqmxBUoRYIe5U9mYDhQqrCFK4rcXlKbUPDw7L
         37CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680106332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3hznV3F+Z/Oyhu924h7j62VKcfyOxZY+2JiLJNTYKE=;
        b=xtUJWqiVIli49r7Etpy1LBZ9zp2CpLNmdo/z6mKVloxbGvumnpRIhSnX9ixvHx+Lg8
         B3VcAvDddD/YzQbmYb/by+rQNAJ4COBxSHbA8ypErQwURZdTlU4s8BY39UxXzuNWe+Is
         t5xAWUUY/gnZPEixZZwIRrengzsWCno38l6WNZTliNfDh2vkx9OlfeMcOs8XwGR9z/WO
         FvaGxKKflCsRR/Pebi71mrzZ5Qx+0aDOTeaMl8qYKAnDaAlZgg4nb9zpDqTZabnO5oXX
         gjGrpxbgE4zj4LK8M3T6A3HSS5Duytxq2aPXNVrciHsqMhLiG7oLqG6xa37NLcv6zV+G
         8bLA==
X-Gm-Message-State: AAQBX9f3rvosMHcXPqNfn94uq27bqmf/DNImiLCeWIjgzd+mqDG5OqWP
        h6IzQf+xLmB5ySR40vTOCz3CA69GjTmrHc8KsWPGRw==
X-Google-Smtp-Source: AKy350ZuxCPl4qrAw7EqVAwABL+9VqG4J+iSLum8tav51bRG0OaYNbDlJBN4wNa33KqZTFj+eoMrbrht6ZubJgjfkVo=
X-Received: by 2002:a67:d88c:0:b0:426:7730:1e6e with SMTP id
 f12-20020a67d88c000000b0042677301e6emr10530335vsj.0.1680106332468; Wed, 29
 Mar 2023 09:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230321135412.73240-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230321135412.73240-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 29 Mar 2023 18:12:01 +0200
Message-ID: <CAMRc=MeEs+FJeUoG89Uce3XnP-Z90f+9oowgB5Xi1NVF7NiRSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Replace open coded krealloc()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 21, 2023 at 2:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> gpiod_get_array() does a new allocation in some cases, followed
> by copying previously allocated placeholder for the descriptors.
>
> Replace that with krealloc(__GFP_ZERO), since it was kzalloc()
> originally.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Series applied, thanks!

Bart
