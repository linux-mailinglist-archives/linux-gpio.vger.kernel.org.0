Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A452299A8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 16:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbgGVOB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 10:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgGVOB4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 10:01:56 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A01DC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 07:01:56 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id e8so2637295ljb.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SsF66KXJ/Xhhdnt1A6sS+8MfwktzgMpRau4xlT1ndWY=;
        b=e5N/WkDGhkV2DF6qwOjBt9hff1YtxpP53MpOuKERjj1sPSCcUNmCI3UrxwpW74NjFh
         gMAFhKZNf9EIT150707lO3ZwVTjCXWIOPjpCpJVoBgok5zzSTJ0ng2wWIbzoLItFdQjT
         oCEg8WcnQLtYJ+FiQYVPbv+XomlwhePzm1Zwdsl6FYvkMPZnFgqvLeMQFfjZV+9S5K2N
         NX5QjGTapaIObIJSl09HOzmOkw2DxmE9sb02VMXi+pusyR3cIPJcHCmI4ADDRsXQ1uOS
         sS/5w9lNCk9kFjkWy36AgAtC/VJ+HH0mmVboi6v17Caz91VF7AaDmdR3spUPc8NtklAm
         NwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SsF66KXJ/Xhhdnt1A6sS+8MfwktzgMpRau4xlT1ndWY=;
        b=asCQzp12cm/njzYUMZEPp1L2orgYfxgIJQEk7fNCAtBX3mvVvg0HlAYrmdgOzc+XnA
         EaFSbbC171fu1vDxjeWY0ewANAwNveDUvIxTSa9j/OJ5J1g704CxKnWRruVSc4Fwk8T2
         owVyWgmzlbuAQB1sVgtKKKANdYf1UTgIvy98Ql8H8fJQXbp+6X6ct3cz5OzXXmH8medy
         2bX30EqX41dfP4l2pI5gOsxJO7AF4h0tVbvMBNSlz3KOuIF1r7hAv9xAMn/Cp5Szpj2r
         WUmpVNmTO4m1jTU0n9Le6sKhqS/Q69COs2yk/RXKUuTfVGjPcXmjJu8NHc5QH4j+DY87
         0UDw==
X-Gm-Message-State: AOAM531qm+xEkHhpgZEAqxTVzTYz/uqK8Y2TtLdFHFa9eBfnV+HptLWh
        zedJNGBOuk3xKyHfliRSgUclQY2G3VOmuPUas4k6dA==
X-Google-Smtp-Source: ABdhPJwx1kktbn1/qhtKg8ocm3ZbyYWVsLH8HgXNSRIRm9YjeF/hHClTD9sVQGJGrTtDNwAx8YBzoFCFKHugKriU2pY=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr16071280ljj.283.1595426514047;
 Wed, 22 Jul 2020 07:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200722133136.GA45594@black.fi.intel.com>
In-Reply-To: <20200722133136.GA45594@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Jul 2020 16:01:42 +0200
Message-ID: <CACRpkdYfTn7SZUT+AbmvBCdzAMXedRshYnV+KmMRhGsJC+Dyqw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.9-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 3:31 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Bunch of Intel GPIO drivers update (legacy platforms, PMICs) for v5.9. It
> includes for_each_requested_gpio() development as well in a form of immutable
> branch. This is no-op for merging.

Excellent thanks! Pulled into my "devel" branch in the GPIO tree.

Yours,
Linus Walleij
