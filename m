Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E802E155805
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2020 14:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgBGNAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Feb 2020 08:00:22 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:37951 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGNAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2020 08:00:21 -0500
Received: by mail-qv1-f68.google.com with SMTP id g6so930679qvy.5
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2020 05:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jCQOOK/HSbQcanzgUr5eT2apmL1jwzi4iL/p+0Jvo+Q=;
        b=NA0WoIhLkQ3AgdLOdClwqPwsO4FzfVRLYOPfsJoHifSH8/EJOoYEXlUKEJF8Y9RI3a
         +U28vcegj8qTFFE/K3C4UvHWb7NOX99cWZaP3zJPtluO1u8b8P3mHIOSun8pf7s1SyRD
         ozQlSXULrbR4oMbPWzS0ARqNqCnFr4k6DnMfg03HQX3IdY2m0rJGz/s8QA8RWTXqf+Yc
         Vpu7pjodpG1xmEYOivLouHIhboQ3CF1F0XbpG4QNldFpECo4Eawo+S1VzP62yZXpMyIC
         C4WtK6VkJRzw/dCrIeftILN+J25eX537SvBjHhK8kRnMhi0fy1FOE7mSxg/r8j48jZtN
         7L5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jCQOOK/HSbQcanzgUr5eT2apmL1jwzi4iL/p+0Jvo+Q=;
        b=cNSDGdyerDof3Ki3PJo/4/r3fCcDQCNW+8a3k5fZBf0uzLYyqxLn586apvwxiR5GsJ
         O1cihjBj0sVI/STYY4lS3Y2xN+abeyVA1eabQVmgYqYSCKsi9SpewE1JA4V/hqcWb3W0
         nTCuHJpufh/bewHviyFx28LSCRNHXVs3nbh4udap3pZFM1IsiXLdBfh5OuBzLlg0qjYe
         VUMuPNzUF749zA82VpP2NHnEqsc+XwcTqWFORnH+PTLbjkiaGr7/tsOOU6o4hnqhvjae
         nJwnJmZiOB8ZE/LnD5WRJlIRoROYVnvAK9u2QdXypJBaajAjp1Nf4fJoAFw7r44EmMy7
         zpWg==
X-Gm-Message-State: APjAAAU6/p6k9KOSqn8wh4+S3D96dQvdA2ZpwVieGTIV6tr3IYInh/Vg
        F/anq3bEh+nWIslTuPbTUbpF24wYWo298ttvkdg3hg==
X-Google-Smtp-Source: APXvYqyGXdGWXVTTZFSTBi+5T64yrobG/riz/XMcwfrVRmi2fU8UpPik9e8E+8BjFJHPC9Io8JvUq2TCotWH7vZJMz4=
X-Received: by 2002:ac8:6784:: with SMTP id b4mr6953963qtp.27.1581080421182;
 Fri, 07 Feb 2020 05:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 7 Feb 2020 14:00:10 +0100
Message-ID: <CAMpxmJUHPH+6NRMCFUvtXiDW8nMksOuVrR6pV5LTUFTt_Of9WQ@mail.gmail.com>
Subject: Re: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 6 lut 2020 o 19:14 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> User may ask device helper tool, for example, udev, to create a specific
> symbolic link to a device node. GPIO chip character device node is not
> exceptional. However, libgpiod in the commit d9b1c1f14c6b
> ("core: harden gpiod_chip_open()") went way too far in the hardening devi=
ce
> node check.
>
> Relax that hardening for symbolic link to fix the regression.
>
> Reproducer:
>
>   % gpioinfo /dev/gpiochip5
>   gpiochip5 - 16 lines:
>       line   0:  "MUX33_DIR" "uart1-rx-oe" output active-high [used]
>       ...
>
>   % ln -sf /dev/gpiochip5 /dev/MyGPIO_5
>
>   % gpioinfo /dev/MyGPIO_5
>   gpioinfo: looking up chip /dev/MyGPIO_5: Inappropriate ioctl for device
>
> Link: https://stackoverflow.com/questions/60057494/gpio-issue-with-sym-li=
nk
> Fixes: d9b1c1f14c6b ("core: harden gpiod_chip_open()")
> Cc: Bartosz Golaszewski <bartekgola@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied and backported to v1.4.x and v1.5.x stable branches.

Thanks!
Bartosz
