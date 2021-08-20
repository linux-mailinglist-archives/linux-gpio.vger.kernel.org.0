Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09613F2DA3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 16:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240575AbhHTOFW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 10:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235032AbhHTOFV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 10:05:21 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1711C061575
        for <linux-gpio@vger.kernel.org>; Fri, 20 Aug 2021 07:04:43 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id k19so8700162pfc.11
        for <linux-gpio@vger.kernel.org>; Fri, 20 Aug 2021 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ORtcTc0CRTaK8A8OzSaWw706TFKKXmkFvdNK1C223w=;
        b=hky27sM04qJEFmyuBhbcrap0GGXNeT2WBCsEt2YJlX7fdJ+p90ZKXjHoc4iV4rX7Ki
         WGbZxANZKhhUez4kTPpHJLIceuyjh+9vaAao8M6pXs980B5bWKLizxJYYYr8aprqq52r
         WSSSL6cAOotSlCdQHPyep+CZe5q3ue7zXNox4GC+KA0or6OmZH0EXuvkweKzmS7hkB8z
         L6MbyZ4Qf1SGEdzkW97y7/dtMuBtkrYcSqr2L7nOPUucmQQ5VowSgKK77g86FhHZhs27
         kmAL2yn4zWXeJsqR63D7j/mcsLrH+mCkWspyAjzZDx5ZC+aFwfQpluybK5diBG2xZMBb
         wVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ORtcTc0CRTaK8A8OzSaWw706TFKKXmkFvdNK1C223w=;
        b=J/SW9rnFQwwzqHtJi05k/g9tEPctk0dTFaVRz4eUhVUEVKFzKzKC7ZY3jq3klrj1QB
         yEB9J9jaiDB396BXAGpRA45QyOEX0l+v7v4zIVKSo3KfJHZU35JhgxJRf24RHwMWE9Hf
         e4s9x+kHMIfn2P1NyaIjAznf6FNtc3EAcF0OBecJ+fJC5h3c3BlVDa1DVY1m7GaooFQD
         kRMN7p+IVTrYUFBNVC7d3mJRLpM6GKfh2bAekW312tx12r8g4rxbGMQswO/QWi7yxrzi
         r+DzNb0rQXS4fM88WFpYNc35JKqRpHzBuMId5Lj0mMpn423bt2OCn+PYGqdESXUBKRDa
         wiPQ==
X-Gm-Message-State: AOAM532DfAtgelmVh445hKS1wjY9z04YuGniFAEOcRVH44EkZLlc+I/6
        WyVIS04xYm50iCraXKu+v/OkOLAlR6oR2wEDCVE=
X-Google-Smtp-Source: ABdhPJwleqZxsC5QerlaAgwDdk62cwNNt6ZBRh8YMWwLE86/TGkVwJnFuutxm9prPYhZbYACbAJdNTXPjM/N2KizNjw=
X-Received: by 2002:a65:45c3:: with SMTP id m3mr18932223pgr.203.1629468283221;
 Fri, 20 Aug 2021 07:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
In-Reply-To: <CA+FSg4rJcDPhPoBbEYjsq_UOysLUdp6YnBh+3XeHL7UkH2cfdA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 20 Aug 2021 17:04:03 +0300
Message-ID: <CAHp75Vct=K1Nh+UDS9tZgvgF1ju_c8417wzfHg9YCA2ay0jtCA@mail.gmail.com>
Subject: Re: Regarding export of GPIOs
To:     Riz <mdrizwan827@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 20, 2021 at 6:27 AM Riz <mdrizwan827@gmail.com> wrote:
>
> Hello,
> I have some basic questions around the exporting of a GPIO.
>
> 1. Regarding gpio-hog mechanism:
> The gpio-hog mechanism would help us to initialise a GPIO to either
> high/low & in/out during bootup.
> This is fine.
>
> So my question is, if we hog a GPIO, does it also gets exported to the
> userspace by default?
>
>
> 2. With the older sysfs interface, we would be using "echo x >
> /sys/class/gpio/export" to export the gpiox to userspace.
>
> I wanted to know what would be the right way to do this with the newer
> interface?
>
> 3. To check if a GPIO is being exported or not, we would see the
> /sys/class/gpio with the sysfs interface.
>
> With the newer character device interface, what would be the right way
> to check what GPIOs are exported to userspace?
>
> Looking forward to hearing from you

https://stackoverflow.com/questions/68856801/regarding-gpio-export ?

I think I pretty much answered there.


-- 
With Best Regards,
Andy Shevchenko
