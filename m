Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A031D71A2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 09:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgERHSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 03:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbgERHSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 03:18:13 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7626DC061A0C
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:18:12 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 82so7110387lfh.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oWVcktWaJtd0MCaPkCSQN+j0nvJMyQkpqX8UMijLaOM=;
        b=mNZObYfp1fhi9LDIrOyM0SF0xXLACV6xZUSfZSzMmutx7FqWJQre1VBT9qJ7rRUnec
         45bmrZtdhRrXc2l0VWT4n1wTFqmiNu43emuESgv9rkn8x0fS6Cd8pE+6hVMihj7/F2xR
         NqHUGbQ1hTIO61+yQRA6LtHMP8w9HLv+r1eN0854T22IjndjfZ3kw9pUvmdYMaP87lK0
         T1CFwtSrkP7sx+KzQ6c3Ijkkhuh0KT6w9DrreBqovwZkzzisati9ec0ygKXUnsJGB3KA
         0uGDFriUBb1VCSIU0k3vlFAZjONKX4auZ/ZF0UlYv0unHcQRvScdqIOAURnXyPppMjfQ
         nRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oWVcktWaJtd0MCaPkCSQN+j0nvJMyQkpqX8UMijLaOM=;
        b=WzBXxNQ6SQjuVpi24gYvODheOMzTSTjtrbxrR/2DjuBNCeRapDvJBWiJ5YRdUi+YW6
         QjnawvcaXWGjTEVU60DFt4MkkgCU/oqFc9yY20+4nguoWbYqKnnm4OA/ZhorIoh7X+yA
         0ea0+4NAuxeM47SdAkfUxndWKHwfXmhTiVz4S3WqAaVVj2FeySlidFbE/wEZct2/ul6F
         8dOHXspTKMa9rgX+0CR66Ebmz5MCf9t/4C++pUtZTkfuhKWSY3vQ4ilOaLZIKWjLLKzL
         umMWCJ3VuV7vaXzY22Uh112NBo/a580Cy6ti9E8nHuU+XtKZMYiEeUxzPRP7HkGLdHxD
         A0Rw==
X-Gm-Message-State: AOAM531tj1paBqoFcWEkkST2+umnwepngjzyfCIbeLjkBeZae5I9JbDl
        eiSMUaC+UR3zROQm8wTnFCXd6aYpaGwNcgzADn2vDR3s
X-Google-Smtp-Source: ABdhPJyvYCxSfP4Wubrba2LuTqI2PAa/FsmpYWNvp8Pjnxbvi7pmJEFXGIOdaWh58fMwJMVLi4M/OGY3jjox4vA2FV0=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr10356359lfg.217.1589786291005;
 Mon, 18 May 2020 00:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200512182721.55127-1-andriy.shevchenko@linux.intel.com> <20200512182721.55127-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200512182721.55127-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:18:00 +0200
Message-ID: <CACRpkda06VaUSROeRMtDF1vP=dYEq=MtsewPE1suYG3W3fr2pQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: xgene-sb: Drop extra check to call acpi_gpiochip_request_interrupts()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 8:27 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is no need to have an additional check to call
> acpi_gpiochip_request_interrupts(). Even without any interrupts available
> the registered ACPI Event handlers can be useful for debugging purposes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
