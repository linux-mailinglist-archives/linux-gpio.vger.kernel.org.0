Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F3710737F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 14:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfKVNkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 08:40:45 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35895 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfKVNkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 08:40:45 -0500
Received: by mail-io1-f65.google.com with SMTP id s3so8052191ioe.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 05:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IsAtXk5DQPP+ZhAPgokeLw1c6cBcVVKsfkuAYfe0bRY=;
        b=nhGX5vErYbaUzTjXwBO6EjfDLMLK/sDckXfC5aHcO59LcRfC5zOWaW3YO3YzFFF0de
         7AA43BEfw0ybuKwIVg7aX4+t+tUbod9hbboLRqmCjaIUupjfhdpz8tq5FgNo+yTVuVI3
         g5FAStjG7/D4qP7L8gP4vvaXXrXLbA1EVIdWQomnw91cWpPKmMVQSQnQX6E7X8NmkWNv
         01ZoqQIsRdhftSDHUmlxQ1dkg2EZAi7T2E9NJSywS1YVUezabT04mbaUQUrr5AqQigmw
         xolNCd5nSEOXlsUiv+5pqSkxb3hF9mjPkakc6rgY3+8i2HJw8EsdIRnZj9An8aVydMd9
         f9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IsAtXk5DQPP+ZhAPgokeLw1c6cBcVVKsfkuAYfe0bRY=;
        b=pJZVX/shO+8/Wj1NsHBdCOcFeHDBZ1AKd1s1f4kgYFcvv/QJH0pDSgewIBBx7Wujr9
         YFvbiHy24W3yzAMS4YKbdK3SEqhgQr8bA4Pv6GteRFl1mVz7hMjPENwVgALAsWigndGe
         fAJja+Gz9msy4UK+FAHTp5+4XMmjNpTQDHosYZjhB5FU7ph/SPNzieB+7CCjiKMSP6E5
         6tsNbBFlCOYAkxzdaV/wUwtLadV3AMcP8UpBA5K9UuXGyKD6ntfczwDIslSwa96fAmNg
         G7UAxSsjtrkGYWGrjuwU+QHoxtw0qW3+0qspxJWxGAqGzHSh5kUHTsgM0ebte5V3sQow
         jk0g==
X-Gm-Message-State: APjAAAWsVnuBJuCt5tRXgtmXdJajbaOeJGsswOm2Qh5kILSOH0ns4hZW
        EQJOxHcJI1FoA2uCqF/FNkBtUZeKOrhQIs7ZeFivlw==
X-Google-Smtp-Source: APXvYqyY4bZpz1ppDZQpi76b5ZhqomRr+9Yr3sqPW2JTxl22AlaXqS4Sjpos3dBztcASYQWEB3T5pZdY7I3SbA/GVFw=
X-Received: by 2002:a6b:b458:: with SMTP id d85mr13038011iof.287.1574430044363;
 Fri, 22 Nov 2019 05:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20191122132738.8857-1-linus.walleij@linaro.org>
In-Reply-To: <20191122132738.8857-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 22 Nov 2019 14:40:33 +0100
Message-ID: <CAMRc=McSUDufYmm3Q-udWg3i_fCmdFGEAhBqXG93n79w6Fp5UQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: Add TODO item for regmap helper
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 22 lis 2019 o 14:27 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> Add a TODO item for a generic MMIO regmap helper.
>
> Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/TODO | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index 9c048f10c9ad..76f8c7ff18ff 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -80,6 +80,10 @@ Work items:
>  - Look over and identify any remaining easily converted drivers and
>    dry-code conversions to MMIO GPIO for maintainers to test
>
> +- Expand the MMIO GPIO or write a new library for regmap-based I/O
> +  helpers for GPIO drivers on regmap that simply use offsets
> +  0..n in some register to drive GPIO lines
> +
>  - Expand the MMIO GPIO or write a new library for port-mapped I/O
>    helpers (x86 inb()/outb()) and convert port-mapped I/O drivers to use
>    this with dry-coding and sending to maintainers to test
> --
> 2.23.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
