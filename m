Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D612ECD93
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbhAGKMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbhAGKMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:12:40 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC23C0612F4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 02:12:00 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id v19so4490501pgj.12
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bEhzAFMYoqhWzI2JJKPlqosKUzzYp7XADRpvHasmgU4=;
        b=SY7C1ytJhb45pshCtazGgdjSIPUMAokYiBE1+g95MxABzII3OcE2PQRAi3fLJ8UVWR
         Op0IqoPHRuPoE5y0bgFgMRE87W9TVljJ47xdXuCF3ZEWNUcjtBHfIZIgpl6RC/BLEVQu
         thiElPjFhUqAD9asBR17FEHztCcdiWb8My5jQYRbcKdiME4VYYI86Dv6mjwzKNks/1xJ
         pCMzuf2l9CABMYsTbckV8WTadgjTBtmRGbDU3JZxUKnsTldy/XLC5/B0vIomhaU3eUm7
         DdxTjwGd4/ZR+k5jSqdfm09KA5U8tIpfHxrlGMdfABPYWXVVLxydIyNm0IAptJXEZZG2
         SBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bEhzAFMYoqhWzI2JJKPlqosKUzzYp7XADRpvHasmgU4=;
        b=KzlRyvkcFMJAPTBXzOkgmVxqdWaqZ9WSKZv0hj3dNb6WAohQOwKS3Ao0Kkvliz8uBs
         0m8twBEP7t+77+CqUMo+2+cGt4U2G5yE6RfrvM8itWIBwWVYwMlRrJGSUHMO0YHpy/iO
         p7SthlQC9KVohbLCbQ1lWvErpJItre+7WnExuWaoCyzqaM5k/56oWyT3aA/yJ8i+aVMa
         kposescZfUX9dArYT1MwH48vGfXS+G/nMxSUMhTRLMAhnyc6kCYRxjHBctAPRwQmZtII
         ldbHPkaTYO9ksc+MIh8uHXbUERNTTdYURDMIf+FJOxoqRhiyWlNcrlo8aHQHDhzQVwgN
         K0YQ==
X-Gm-Message-State: AOAM533Y26nZ763evNPIZDxMb6t2Q/9I1hCCbkefIKfKeghCaBz+D9m0
        oek8kUyf2H/TCxG97n5YNohX2XfSDoJj00rVO1I=
X-Google-Smtp-Source: ABdhPJyDmIlKfpQzT70BnngpmSR/RojhxlSosRaQaUFSaT51Y6frl3xdrULkUlDIhXE5mUGV199Z3NNYvWGcOSLjWu8=
X-Received: by 2002:a63:74b:: with SMTP id 72mr1163030pgh.4.1610014320292;
 Thu, 07 Jan 2021 02:12:00 -0800 (PST)
MIME-Version: 1.0
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com> <d04ed4ea7bfe4438947e05c86f031ed4@asem.it>
In-Reply-To: <d04ed4ea7bfe4438947e05c86f031ed4@asem.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 7 Jan 2021 12:12:49 +0200
Message-ID: <CAHp75VdhorVKXxcppuK6t+yUMS0mcLp_0rOWg7bgiWviP2rkbw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Disallow identical line names in the same chip
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2021 at 12:03 PM Flavio Suligoi <f.suligoi@asem.it> wrote:

> > Flavio, perhaps one more rule to the gpio-line-names property has to
> > be added into documentation (Bart, same to DT docs?):
> >  - names inside one chip must be unique
>
> ok, I'll add this rule

Thanks!

Main point for calling you is that you may tell that what you also
assumed when assigned line names in your case(s).

-- 
With Best Regards,
Andy Shevchenko
