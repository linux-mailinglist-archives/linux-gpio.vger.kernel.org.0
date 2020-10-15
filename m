Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6E728EF5B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Oct 2020 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbgJOJ07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Oct 2020 05:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbgJOJ07 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2020 05:26:59 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A980C061755
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 02:26:58 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id j8so3350022ilk.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2020 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uz3gOeb5eGMDViDueVgk06A02yCq5xnmVUGlDH4lxJA=;
        b=lxAooTZW9ljreh2JZEYT5qq4C0AWCC7PktuJeZT5IEhOHCC28v7i7i+01qkHrxLm25
         9ugvzNLYT9Nu/6Rfwqv+n5P27BSux6xRwbjX3kgTry8ZFEhMLJC1JW4YMmt8hNt1lbao
         pbVhteB8r16ELjeNoIesvyj/MG+Hix++Q/YFtSjquYuAsUBTS9vVJE2HzamzC/K5DkJt
         l8xuhtaTHAz3cQe8QmlJ6tYHqiKq9grVKVLk+8C4xHsOhGKYJAdbYVZfx/PN294aYzlm
         QO18D+m7B+D7i+Tr8J0k5h/JO6vobSUzt9boDtpthmI743xoFjLj18d4yKpu6C9UtNJS
         9jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uz3gOeb5eGMDViDueVgk06A02yCq5xnmVUGlDH4lxJA=;
        b=bdot6bNnRJsKwBL3uO2b9ZYY6LnQ1huc6R/1Hcg6lMdVKEEk2RWtThGQa8nN6pCGfq
         r5HHo/hBGHMLUavCVI3B0XjXWKqc62FSy4QRoA9B4Lr8sGlmGeFm94sNIH86eFDEgDoE
         CmKSIibFPyQOgTml2g/M1YcOeK2XSefeZZp+RwQv+7fVhQM2qgd+ImxLWJ7OPeWRGlPQ
         V5hoOQ9E2A0k6/geeWXWhBxp+Fv9Sb3KGvtlgQXfKkrZf3udSjiep72N9SceDgKjOJev
         9keLXuVj94cUML3N8OpkifXq6rtItBmFapVnzqgyevVoImhE9FsGnFLEiptbbcLvYYns
         rGvA==
X-Gm-Message-State: AOAM532SFTPL1lK27JR1g2CIdoI2+X+aMfw9Bp0YIaNXHzaFFpHRzSHc
        3mfdslI9xe/h7gwwdSYiY/eVHhEludF14gSC8QlI8A==
X-Google-Smtp-Source: ABdhPJx47/M4AdmpoXXsOwxD2EZ5rfscRi3AIliAmhzEZLn3MGNm92FUceN0wqVpTzGRo3r7OrQnpCRX+nyVTpkwuc0=
X-Received: by 2002:a92:bb58:: with SMTP id w85mr2518154ili.40.1602754018073;
 Thu, 15 Oct 2020 02:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev>
In-Reply-To: <20201015083805.GA10354@laureti-dev>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Oct 2020 11:26:47 +0200
Message-ID: <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Helmut Grohne <helmut.grohne@intenta.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 15, 2020 at 10:44 AM Helmut Grohne <helmut.grohne@intenta.de> wrote:
>
> Hi,
>
> I was trying to use the C++ bindings of libgpiod and wondered about
> this.
>
> | struct line_event {
> |       ...
> |       ::std::chrono::nanoseconds timestamp;
> |       ...
> | };
>
> std::chrono::nanoseconds is a duration, an interval of time. The member
> is called timestamp. It is documented as an estimate of the time point
> when the event actually happened. It seems to me that conceptually
> std::chrono::time_point would have type of choice here. What was the
> reason for not using it?
>
> Helmut

Hi Helmut!

I probably just didn't know any better. :) I'm a kernel developer and
writing these bindings was basically me learning C++.

Thanks for the suggestion - it's a good moment to make it, because
we're in the process of changing the API to accommodate the new uAPI
that will be released in v5.10 so I'll definitely make sure to change
it too.

Are you by any chance well versed in C++ and would like to help out by
giving me some advice? I want to fix the way GPIO line objects
reference their owning chips but I'm not sure how to.

Best Regards,
Bartosz Golaszewski
