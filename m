Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5FD216CD2
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 14:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgGGM2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 08:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGM2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 08:28:31 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A82C061755
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2020 05:28:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id j11so916897ljo.7
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2020 05:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8ylDfquIzHzjf8zeGZfpuGrTUxJ8mwOYuZzWoFiX+Dg=;
        b=qun6ri7QIewOLqcwE2kFPRiAYkcHYnx4t87TyU29aDXMclTcx2EZYhD87gk91EdeDR
         ncCEzpcckDxXIshsSx9T8ulJbI4VSPM8c5xYkt64FNBfDdesVr86WgcPmLq7bspmMEe2
         RLaqJg6Gjmn7yT+VnagdYWPUUa3VPs/tVDFEUQN91/QnCFHprpZSgGyQoy53ZBtasgUp
         OVG+xsjNTATXB2KGf4XApEuI7tFH0u6wnHNbblKQ0ayAqKPxIEv+xqAcbGHXcS0gybSw
         V7NamKF+91VtrZ7oA3ZkPD2AwP/Tl28qSAEUh1jQLqgSgl7wuYwy1Oh+DUDGKiFB+F8/
         bHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8ylDfquIzHzjf8zeGZfpuGrTUxJ8mwOYuZzWoFiX+Dg=;
        b=lRU72pl9TtshsfvjkBANmAJJ/6hzZiwmQLgMS19o5X2o2vf3oxmCfl0veGY6YoeAUP
         hAJ2yHtfVYZ4pnZdjILQyUmQp+jRSa7T8qr8xuz5oYvqaPck/1Pt4KbpIjh/CMWG6833
         5bRK0FHwQdbE7nmkeAt2/1yMAsSyZxL1wsGckTYjo77YNJh4McoCorLn4gKf2qqelpi+
         PSBVKV/QXTH2U3C0E2aQTBH9PLQiQnI/Wq6+kkj2xDl0bBlCKNQuAw6L5NLI3K63dcYh
         ENZ6amKFdfCDXAOgHTdvtRwCMTzwtFC41qjId73hLXYKuBzLCrneX1sUqmmixvA3P1Yp
         D1gA==
X-Gm-Message-State: AOAM531md38GccIAJv/R7NhAMYr4DaE4J5N2xayu/U14mB1s9QnXWBxE
        Pdjv65Bbk3an8HEdT4v5QsiPELrBZuscG9Ll72I0/ZT88X8=
X-Google-Smtp-Source: ABdhPJxfamrMV0hz0YsD3aFwN6FXjD1DthNRrfGGFIEYrrPQQxEFLz2uspNuRFBRx+hjR7R6GWrkgB8L77Qfvx4rIKU=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr24404404ljg.144.1594124909277;
 Tue, 07 Jul 2020 05:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <8cffce08-ed84-4242-8dcd-72de693f0f71@cesnet.cz>
 <20200610080327.GA1805015@ulmo> <7e4a427c-a6bb-4036-ba8d-0f290a17852c@cesnet.cz>
 <30fdc2f7-47f9-486d-8987-3c3d8b157fe6@cesnet.cz>
In-Reply-To: <30fdc2f7-47f9-486d-8987-3c3d8b157fe6@cesnet.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:28:18 +0200
Message-ID: <CACRpkdZope0J3QVWAdgy6oRRBehZSLFcTcynjJSi5kHiiMYOww@mail.gmail.com>
Subject: Re: GPIO regression on mvebu and/or max310x since 2ab73c6d8323
To:     =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
Cc:     Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Vidya Sagar <vidyas@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 11:11 PM Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> w=
rote:

> > Unfortunately I'm largely ignorant of the relation between
> > gpio, pinctrl and pinmux, so I'm afraid I cannot dig much
> > further. Should I try to blindly add the "gpio-ranges" into the
> > DTS, for example?
>
> Hi Thierry, Linus,
> can you help me with this, please? As it is now, my GPIO-based I2C no
> longer works since 2ab73c6d8323 on this Solidrun Clearfog Base. I suspect
> that this is because of no gpio-ranges property in the DTS files, but I
> don't know how the mvebu gpio/pinctrl/pinmux drivers work internally to
> debug this.

I have as little clue as you, who maintains this driver? Who wrote it?

Can you just send a patch to the Armada DTS file adding these ranges?

Yours,
Linus Walleij
