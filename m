Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3A52E6BC7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Dec 2020 00:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbgL1Wzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 17:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729440AbgL1Umk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 15:42:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE59C0613D6
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 12:42:00 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o13so26533325lfr.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 12:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g4AwaZljJajwZpxLBOrWsNrXSZnM6PPh3AF/enMC7UM=;
        b=QkUjVoQkI+gATzDLGq8Rpy0+y2Pwp2yCimxuEnMgY/X2ZuKzIEjydn1AwgjgqPi1Q9
         LvCbNqdrGEs1Tolf2u59B4Pq8seibuhCO8vV3yHRhNHmDwVYmFkGxMp2JFhVdJ5t26sw
         71br0igoPW3GTDyZLUQZ6O4G5e9Vl/CgjgGzvRd52CldxYAq0dfr/c4DsGjuQG+MS11p
         rHOkSdG/jPD6QNxfF8J5oewUOQ6lM4RKNYF/FzvM3Hhs531lzSTq9T549hA7EozEvdq1
         lGbDxZk3dnPt3LpSiGdDUradwKLVISk85wUeiWBEGCJo949NfxuqbJ/z1eoYLf/4qtmb
         /Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g4AwaZljJajwZpxLBOrWsNrXSZnM6PPh3AF/enMC7UM=;
        b=cksNOIRg/W3UZvBEjvo6dTHZQCLlt9QAxfkt9P+RhBXc5ksnnchh5k0H/dWo6v3Bec
         A9M1Ux1HjxaAfR0C6v57YdyQ7MP4gHkTtH+8Q0gAMWR3z8/LB9+HCW2/osmR3niN7QXu
         WDktQIMj4V5osv7v6dF8tg4UOWgJ+1eOKoI1lNPEcIH6Hc89qF9qpiTHdRZBha62bn2g
         jJbAOV3Jv5Ejp4VEQcwgO/4L0BXURUcwya0RneTYrcrx+nYZZtTIkfcvf+NJMXkPMaKt
         YcQ5xblQGODPaylHvD8EJhiM2y1h5TLRzU2myPCfp/CzZXVJvEziF205EWmwSeEzHupw
         Zlrg==
X-Gm-Message-State: AOAM532vQ/fcO+4hNlNlIdCkLvlqu+05o9zaBlJI0jarGUMsXR0NB8N1
        GcV4zF3rtcNHo5LoqY30tlIpxLwJxzdJysQsldmUow==
X-Google-Smtp-Source: ABdhPJzMvmz9xDTj2R+mc2KmglBKtZx5MtPfLE/0wbemEcqJCIANlfPDvJJ/8pBMddTE5ARiEnAaoD03uXxvHdDNNm0=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr13727087lfg.649.1609188118632;
 Mon, 28 Dec 2020 12:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
 <CACRpkdZ=QBGZ9G97+2xPRk4PTTSHGHL64bTLZGbz5kFsg-NqWg@mail.gmail.com> <115071609167990@mail.yandex.ru>
In-Reply-To: <115071609167990@mail.yandex.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 28 Dec 2020 21:41:47 +0100
Message-ID: <CACRpkdagGSLm8TVVj0Ox8EE+iqS=knS2AgKz2sycMWtOtBN4Nw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: ep93xx: convert to multi irqchips
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 28, 2020 at 4:14 PM <nikita.shubin@maquefel.me> wrote:

> I had such a thought, but I was stopped by the delusion that no one is using this
> hardware anymore.

It is definately *used* a lot. It is dubious if it is used with the
latest kernel.
Hartley was/is using it on engraving machinery and using the latest
kernel, I think his setup is pretty large.

The number of deployed machines using EP93xx is likely large, but
more importantly, as with MOXA Art it is likely to be internet connected
and managing vital control systems.

In short: nobody may be upgrading these kernels, but the definately
*should* be upgrading them. For security reasons.

So as a community hat I have concluded it would be socially unacceptable
to delete it and not offer an upgrade path for these systems the
day they realize "oh s.... that is an internet connected pressure boiler".

So if possible it should be modernized.

> Not promising anything right now - but such a job sounds like a real fun.

I would be grateful.

Yours,
Linus Walleij
