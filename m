Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD49947D18E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 13:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhLVMPe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 07:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233608AbhLVMPd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 07:15:33 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47914C061574;
        Wed, 22 Dec 2021 04:15:33 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id x15so7963342edv.1;
        Wed, 22 Dec 2021 04:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9IerMGqtN5be64kf8wADSLOjUe6he7YS9cUk1ym59g0=;
        b=OcXdFzlPLnytxFZQZAG32cJ2Ra8fBwnDOzVP5tN91cLrC34i+j09d5eKg0zoN+yPxY
         Zu/vTnotS3F0r6Tu84lElA95sioN6QhTn3xKX4WnUrQX1YUa+N0XeptOJTrELVES71lX
         FW5ZlfOT3pkLkA9E+vT5fMv+YXM/Nk7CPxUv9ImqGkD4iXiM4FsxB1mEKXK2ifa32l3+
         pftlIX0B5boFZt6s6pPyYUkf6/o2+h65F2+dNHoT6gQYKs+1CPWKylq3Msqkk/pemXPG
         n3dIUAPkENr2qvWVFQbG0AfwiUa1hSSAI848E02SGZUqocv6TD7JmEndOpTugl6j8AbO
         xitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9IerMGqtN5be64kf8wADSLOjUe6he7YS9cUk1ym59g0=;
        b=IHbKejy2zSWQIPneWX1c+kPcrRhJgG4MDo0gbRbIYHLhA3HILFgxzZMrlnEysHc9NQ
         1qSImKlAACAVTYCJEN2Zj2UnflbQCIXtT0fQaXYBYfF0VaOJeQYrzO+VOAW0Xhk7YEYN
         GljdoYEYGyyrufM6OR8TBv0bCdVIkIO1op3bdaMJBe1MCOjLN2h8mB1uc7U/Wt7pXFk9
         fXAGQYgYyvk8Zo5z7YajVOtSLT+OaUE2SR7P/S1j8ukcOGxaG8RhVyQOpPphq0W1CQ6+
         vTGXJl8juB04Q+WJcYCf8+XYfXligsLa0TiUEACuKlZEPaWcaaDwOs6z6zZIpsSP4l5n
         2spg==
X-Gm-Message-State: AOAM532ikhDn5cemDLU/Sk7rytNLfgWjKsrvoahSqqghMS0FzY4l/AY9
        X2c07jNURc0RtMsJpNGbc2dKNdLFFqH2ZiZdsAjnTIFk9ho=
X-Google-Smtp-Source: ABdhPJzJBfy8iqeYV12qdYSYKNfYJkwyi8x4vcl9KXg1KO49EVFxUipTxdodS4KXZtRxXR+9sqzvzheFnLv1UOlmKKw=
X-Received: by 2002:aa7:cd75:: with SMTP id ca21mr2588798edb.242.1640175331865;
 Wed, 22 Dec 2021 04:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20211222111108.13260-1-zajec5@gmail.com> <20211222111108.13260-2-zajec5@gmail.com>
In-Reply-To: <20211222111108.13260-2-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 14:13:33 +0200
Message-ID: <CAHp75VcdXR=vZ3=UX+GKbA1hMvQ=4rKJyPkg+BQskepL9SCSyw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] pinctrl: bcm: add driver for BCM4908 pinmux
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 22, 2021 at 1:11 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> BCM4908 has its own pins layout so it needs a custom binding and a Linux
> driver.

...

> V2: Formatting fixes
>     Kconfig fix
>     Cleanup of #include-s
>     Use devm_kasprintf_strarray()

Thanks, but it seems there are unsettled down points as per v1.
Can you comment on them there?

--=20
With Best Regards,
Andy Shevchenko
