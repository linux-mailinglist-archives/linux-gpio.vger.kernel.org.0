Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789E7492254
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 10:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345407AbiARJNb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 04:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345404AbiARJN2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 04:13:28 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3603CC061574
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 01:13:28 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id f21so19439944eds.11
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 01:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFkr916A59/iZYNJ2RnAI4LzW0nraRLeM/wre+Hz2FA=;
        b=RO4R63hT3CaDgTK2ljRqgocZoMGKShjFi1U3mC29a5s3o5RzryF0d4yI4X49VzC+bn
         IK7MYKdrGFYo/vXf1MWPP1dEEabwLIA7RnbAPGrhtjXurJOoSEM78mVCLlTmlqYPWCzA
         4tOA+igSOWpj2chlWBtx+jdWc2Tc0369sgGnJ9u5CcJdSH0YskOkWlU+YITqt7E1bqRm
         IRgQjF39525GMNA3Tg8LJHQjujf56X71+RROo2IMLjXDzuo7Og8YiTF4d44TxAcQ1qA0
         WgNjJwMo/YTK+S6vJIgULdUMy+gVNt3KIp20WOvYkPv01v75j9mIL2dUURyTeARjzBWE
         YGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFkr916A59/iZYNJ2RnAI4LzW0nraRLeM/wre+Hz2FA=;
        b=cQ9YjGSBhlkw6k5iZHFLd2dJ0OIJgvyvfoAIIMhpu6RQ+UsgRf0pm2V8fBkvgkFtQE
         rzC7fU3HOA1MTwV8aBSxqLX5cEiNKhZfKeaf+ieS9j2sQPwLv192w/T9nM7NAetyrxmq
         z/PcM10TqHHJlhWiJ7rF8s7Ab+Q2JRyytlUtDU5l2WcBEIOPoLIIUoHGOISvG7ds/8EH
         QGNy97+Y0XJfTacQHIebs8UbOZUAKBWsBiSE+nc0Fb1KaoihfPd7OB5eVNdkKaEavTGK
         W63QEsxd4JK2ZuMpNeJLX0TBlchXiEqWBKh5j/utUI21Kbq1j7xtOvoP/t6qPxU5aRhd
         sCdw==
X-Gm-Message-State: AOAM5324Tn3u+Fze91X4fSvjUkTlFoOd41P+AzbHK2ue1PLCKzPlUGwS
        fy3iqZPaeucII+P/yTAh87qUvt0+6RNdTigYefI=
X-Google-Smtp-Source: ABdhPJwSXpfWxO5rNfnlyn9cG8YiLgs7bc2QhIETzqUNBu8OCF4uUIL7kwLAPMUCZ0/V6JRYyYcjF07gvGUC42GX0TU=
X-Received: by 2002:a50:c388:: with SMTP id h8mr18801605edf.218.1642497206641;
 Tue, 18 Jan 2022 01:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20210819203952.785132-1-hdegoede@redhat.com> <YR+qHHVgALcpQ6k+@smile.fi.intel.com>
 <ee7274c0-15f1-3ca0-cca3-bcdc37350334@redhat.com> <YeANkfsFivOpulog@smile.fi.intel.com>
 <82f6ccb3-7b15-8a5f-d142-8b4087fe4582@redhat.com> <051a9e42-02e3-4db0-bdbd-f8d7855b5db0@redhat.com>
In-Reply-To: <051a9e42-02e3-4db0-bdbd-f8d7855b5db0@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 Jan 2022 11:12:50 +0200
Message-ID: <CAHp75VdKFWKYCa8N0BbSJu7f1OUEo0_XFWe0Bf+7S4338Z0t1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: baytrail: Pick first supported debounce value
 larger then the requested value
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 15, 2022 at 6:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/13/22 12:56, Hans de Goede wrote:
> > On 1/13/22 12:31, Andy Shevchenko wrote:

...

> > Spoiler: I believe the best thing we can do here is to just
> > never touch the debounce settings at all, see below.

> So one more argument in favor of just disabling support for
> setting the debounce value, while looking at a git log of
> the baytrail pinctrl driver I noticed this:

> So before that (which is not that long ago) we were never doing any
> of the pinctrl stuff at all AFAICT, which to me seems like another
> argument that the best answer to the debounce settings challenges
> is to just not do it ?

Hesitating between enabling this feature and practical applications, I
think you are right. No need to keep the code that never has been
properly enabled on the real products (as I read from your research).

-- 
With Best Regards,
Andy Shevchenko
