Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC208146CBF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 16:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgAWP0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 10:26:25 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43014 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbgAWP0Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 10:26:24 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so3872543ljm.10
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JixvNa3T/Sm8CzR3MAMKQQKV9fkYDtItlBYnPybWoa4=;
        b=Zc2zmdqVVcMyTbKJk/OfPLvHkbDHUuyhXy1GzDGIH+DWyi7nlu+TzXS047DhqM4iYL
         k6DlWXmVECAGHakWQb6g4YBiX/aDLjp7jzYVfdCBTpYIClBMko+/vU8CyzRnbvn/+CkD
         A9Din0hPMTKhHDbByOcZGCXnF/wWejyE7BPZoVm+ev0SZMMmc4krnSBxYkZOzuyKdqP2
         c3pRw/8my1rLDkUyZuNSPhXOi4Xp8B+Mglx0qvtoYt8850IMiDGtB1vUjirnqk99mFGW
         vT1hBGvsTrwOWGUixxHPnxQxw1ztDctwT5yflrguwXwwv8D6cMdSAqP1vsQ+hLQ1vk9K
         LCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JixvNa3T/Sm8CzR3MAMKQQKV9fkYDtItlBYnPybWoa4=;
        b=abnJb/3YTDeSwCV/7edPzwNFdjyhKj6iPI05qL29RMoWDkWZaJOTob/cUgYuXyzXo6
         mr/hnFN7UpLgkzdurJOPnNptspMtNUg2ep2zyu9m4EglwfIyYFy3W1Zi9iD9uR7kcTcg
         eKc4wecDipUxtvmnF9pC3usUBV50zVNaTLzyVNm9h2uYgnbKsAxrduc99vs7e7L0xWQF
         rFuqDGeptOOmW3DYaZ+KY96TRMoVmem3fN1lgrLmI36VjgeBtODMBSpV8ukDBFcoB6j5
         qTMjgA+n4IW9OyjIS9/XdGXF7dhUJoVWi9ap5CDfpd3zUC2es/2SRnFSR2mQuw1qh7mi
         Ustw==
X-Gm-Message-State: APjAAAUyvgbzVPo8Sz5Utfm4bcSBGNG1X6Hxyxt7QWPVWPsgqE9YwlUa
        ECDhgDtbmSjCB+8BYwsYYDqInz5Yr9O/W2zHAnuSgtSUAxY=
X-Google-Smtp-Source: APXvYqxCD/64PYoNS7bPDfDqCy95gkiLu2aKyXaqySoWYyeZZbHp2gAVXZpYdev9k0/srjWcnvPk0rqLcDqsBw9H4qs=
X-Received: by 2002:a2e:960f:: with SMTP id v15mr23760075ljh.265.1579793182804;
 Thu, 23 Jan 2020 07:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20200121001216.15964-1-dan.callaghan@opengear.com>
In-Reply-To: <20200121001216.15964-1-dan.callaghan@opengear.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:26:11 +0100
Message-ID: <CACRpkdYGED-YU8PGUFwK-Arrs0Vp1=Oc-Nx=MvjuygLJvzQPkg@mail.gmail.com>
Subject: Re: [PATCH RESEND] gpiolib: hold gpio devices lock until ->descs
 array is initialised
To:     Dan Callaghan <dan.callaghan@opengear.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 21, 2020 at 1:13 AM Dan Callaghan
<dan.callaghan@opengear.com> wrote:

> If a driver consuming the GPIO chip is being probed at the same time as
> the GPIO driver is registering the chip, it is possible for the
> consuming driver to see the ->descs array in an uninitialised state.
> For example, the gpio-keys-polled driver can fail like this:
>
>     kernel: gpiod_request: invalid GPIO (no device)
>     kernel: gpio-keys-polled PRP0001:07: failed to get gpio: -22
>     kernel: gpio-keys-polled: probe of PRP0001:07 failed with error -22
>
> This patch makes gpiochip_add() hold the lock protecting gpio_devices
> until it has finished setting desc->gdev on the newly inserted list
> entry.
>
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
> Resending this one because I failed to cc the maintainers on the
> original posting, sorry about that.

This makes a lot of sense, I'm impressed that you managed to
provoke this error!

Patch applied.

Yours,
Linus Walleij
