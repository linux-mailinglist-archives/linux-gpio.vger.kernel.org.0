Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C85211A6A4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfLKJU2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:20:28 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36789 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfLKJU1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:20:27 -0500
Received: by mail-qk1-f195.google.com with SMTP id a203so8939177qkc.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tTqZx6lPzQK+W7fDP5SXU3RAGAUD5pGrRcSk4fUllbw=;
        b=UURKjMWeDo/W0V8/ni5NfVhcU+tuWmf/muofVPTRWJS/YMfbZ4r6927kAtx86XzAsm
         5Pc42L+ZYIm5f5Dm3zHL1lj4WJwSLQnkqxUK29KWKJbZK/hqEuauEiXPFaFCPf8gqacS
         QBR4QMvCvQDGS+drT/cO9Dh29P9OsmaCpmM8UcsGwYBQ4Rj0VgdD0uQDvguKKUrB/qaF
         QTtM2IN2gEwDeKOW8Dr2gKMYZapWWocLT1ExnDd3y65Z/c4YWjLdbrHLvIQvdPafP8Qv
         swtUdKJd8jPErsjY5kyH3aki1X+QwYX6GYe0ofhGwm6P7vQkLFMDBBiT5iBlKw7qkOjS
         PbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tTqZx6lPzQK+W7fDP5SXU3RAGAUD5pGrRcSk4fUllbw=;
        b=oj11BvRwFCkmvDsCbOl8EMr89Jypa3TrAFx00ZpOrrKJ2wxaw2dE8IFInxQnUDletz
         aeX4LN2NNj22o+ALuFnOpxrcJ5vD2gobkuBJm5rg1eel6eqh1rLsn3H2eCbzR6Bw78TH
         WDytPwYAZXJcf3jFet+1zbY5iZY3L1/Iiww890Vzfkv2aBaRROXVLN3Xe0p/nMGJy972
         fJ7/0zmbm7TaHIoWIavQsllSqbNGJa5zVZXQBnMOI7mobN3M1sVHkzFU/7vLKxnYyvHV
         m8KRjbqedT7fV2TTiiEZF3lyuT5Di7AV5ofEmgsPh7tnlS9UwscI5RJ9zYd7g143Sqyv
         mjkw==
X-Gm-Message-State: APjAAAWypqAMI6dg+v3skXwibPDYz4Xpo3MWPtLfy8sxZ1qkGm2OtplK
        9oG0td5090CGhKU4PYm/F69NfFu1wfJZ9+Xc8fjRhQ==
X-Google-Smtp-Source: APXvYqxxmZobLcwTJPaZNqoh5bM3YxZLu8CRT5nt9bqz/sPYgKxcU7UKElWtBG76Oa7oobkDd/D9t7fwTmB8vCnJ+jU=
X-Received: by 2002:a37:6fc4:: with SMTP id k187mr1844152qkc.21.1576056026921;
 Wed, 11 Dec 2019 01:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20191204123135.81630-1-andriy.shevchenko@linux.intel.com> <20191209155342.GV2665@lahna.fi.intel.com>
In-Reply-To: <20191209155342.GV2665@lahna.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:20:16 +0100
Message-ID: <CAMpxmJV_BbT9MbUK+SZSeEm8Tt1BfYDqMcoLhgbifseTU6S4KA@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Append missed file to the database
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 9 gru 2019 o 16:53 Mika Westerberg
<mika.westerberg@linux.intel.com> napisa=C5=82(a):
>
> On Wed, Dec 04, 2019 at 02:31:35PM +0200, Andy Shevchenko wrote:
> > When gpiolib.h internal header had been split to few, the commit 77cb90=
7abe6c
> > ("gpiolib: acpi: Split ACPI stuff to gpiolib-acpi.h") in particular mis=
sed
> > the MAINTAINERS database update. Do it here.
> >
> > Fixes: 77cb907abe6c ("gpiolib: acpi: Split ACPI stuff to gpiolib-acpi.h=
")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied for fixes.

Bart
