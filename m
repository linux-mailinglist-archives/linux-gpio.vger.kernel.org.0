Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B8932BB52
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 22:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345114AbhCCMWA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Mar 2021 07:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843064AbhCCKZL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Mar 2021 05:25:11 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B01C0698CF
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 01:11:21 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a17so27690289ljq.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pvXRasKDNnUplGKqzHk62n6lD6KnrrKXY+1eJIPLqe0=;
        b=WiFl8QOb5leynrCtKe3zMsV9KlbTPbHg35wYGEgWIxoqyPP0cCLWwEGVii8/y/twcB
         xR1RwxlK5Ohll6CJ6xQDjX73wl4MGPtZsVJrMT6WEVZTUsf6n3loIcl7zfYWiBS/FYyC
         FfvTzQfpQU6W2eZ59V7XtFzQlNcoSsRa1+wTpwAP4J/UV3EH4YU7psNWmHTvall9bZHH
         WLRxgQKcPwQUUe2DSABPa2aSWFOYGh4b1Hjs/YSPAkMMXM4NXlQTyXa5iiDPZtQ87RxJ
         vgcFpekosl3g2vts8OT3rCEYp6yZLhNts8p7pM3oHGR5d37Q8qEVdw/HHTEclmNxjhCx
         NIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pvXRasKDNnUplGKqzHk62n6lD6KnrrKXY+1eJIPLqe0=;
        b=W/Iq56wzVmERsOnE7DZ2JkUV1/EdFR4Hup0/IHqOSlLMcLxaYgHwXBijOjLMRHPGuR
         qEIq5DHfDQQ/j+y4JSS1UWHAVcf21J7dXsd7o77GkTLCJx0dlKtBqdyQRCigTBNV0j4y
         aywu7sW4vuy6v29N7d07oKa5elyUMgsKgHKqtpjQptZFg3wwBCKe26/ZcDn8si3QD4QI
         6U5eZbxoGUdpozCoYo50DP46aDV+UB9KdHXTd0Cf5frVvJzNPjSHfMoqgy1VfRrnYmS/
         IgqdWANipAh8R96QmQ5zHKwsGS7zDvDNenkWmfi8LKSRc9fTsdSgOXiMi3HEE38LmfIa
         Nn0g==
X-Gm-Message-State: AOAM5313QBz580xMWEzFK5+9PaKDan4oARbYrgcwBBWYmnAHTQ2qEC0p
        Xls4qRDX/vw1FT5H4XktKBZ3Ccsrxvgg9DUSUmB+yA==
X-Google-Smtp-Source: ABdhPJwRAdGtZseF4AGCcWugqL080PWu2zQkl7W3itQgLw4vUj76ghMl0LRAP1ir1rNQSyMXtIt2o5cPqOPa3q+AHYs=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr11225796ljg.326.1614762679638;
 Wed, 03 Mar 2021 01:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20210302153451.50593-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210302153451.50593-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Mar 2021 10:11:08 +0100
Message-ID: <CACRpkdZX=kipnYukV6Y5GZmmB_GEB6htM5HP4fJbPOOhiLBtHQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] gpiolib: Unify the checks on fwnode type
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 2, 2021 at 4:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We have (historically) different approaches how we identify the type
> of a given fwnode. Let's standardize them across the library code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks way better like this, with your follow-up fix folded in:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
