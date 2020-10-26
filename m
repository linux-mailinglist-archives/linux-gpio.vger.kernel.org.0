Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19FFB298FC4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781928AbgJZOpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:45:51 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39228 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781926AbgJZOpv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:45:51 -0400
Received: by mail-pj1-f65.google.com with SMTP id m3so3210046pjf.4;
        Mon, 26 Oct 2020 07:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAbD5pPtU3ThLzaI4nC9N49Q4nZl815/lE7BJtV5/80=;
        b=SGiqEhsprkLFhCW42iwff1fo8jDOeHE++peyz8Jn/LHdybqgaipsfSb2QEEAfj+2C3
         TWOZnaFTSGBj3lUwt8ld0nkmZZmCTtcrG6s/BrxBjS9M4AtNB/+on47QGayljDCGmCAM
         Ic/tH9oXeg/Zu0d6HS7KIqdQd9tUzZHuGE9CL8Teo4zyBpYHqS92KWru3fy77x5IP5g3
         XnzNUSHSxppP4S2ABYWv0H5DLoE7c3l8JIReagM0RQhHlAN3AQO6pmjZtW/Ul5J0fn0G
         n82CKfmOuwNfd8nxg+SAfVdSpHfD3XbMR/Aklh615a1QCMbQ1PGyvBaudlaSwnYNg2V6
         6Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAbD5pPtU3ThLzaI4nC9N49Q4nZl815/lE7BJtV5/80=;
        b=V3FVWi/P+P+1EjynGBovy6EBN7X7drjkoW4r/9i3eFjkz0yHQtZiMk/COoEqpRDilh
         P4k5fT2tMXbuSzDgM9s3QS/OHKazTT7dA4mvE73ZIpI+A9EfJeOpcE2Pxc64cWA7ES9A
         Y+OQE1tHTvYqcy4ebwdJLJn00Q3qME2yJHg1t54DXpxa+qBcnAYVBvuvh8Z+dviX9cEb
         GuCb+SGPEzqsRL2FhM2sshF+Q7YsZ6QOC/+JEUB5Ivh6llRJxtv4VogRUtUurCdf9hVK
         Pi6dHZ6KaJutBwZCTc6BXsPlaPE59zW0aYGm4kX6rqjeEhKH3im8rgn/KVwsfbtIDyTf
         tsEQ==
X-Gm-Message-State: AOAM530rWB5UuqPRU5zhnVFZYbcIwq2aiCUAFS74VLYI9HhUoD25WiO8
        Ebgobw9HaAs2BHlP8DMb+puj/T9l5GCHJ8jeJmcaJMNVe5Y=
X-Google-Smtp-Source: ABdhPJzhQC8fKyt4wwBORn7QhDdA+TldreARroO5Vs8lmgLb4WkRsq7pOc4NPX+KUKoWafcy85byeXI8fgYJ0Tyft10=
X-Received: by 2002:a17:902:101:b029:d5:bb23:b731 with SMTP id
 1-20020a1709020101b02900d5bb23b731mr12329264plb.82.1603723550691; Mon, 26 Oct
 2020 07:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl>
In-Reply-To: <20201026141839.28536-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 16:46:39 +0200
Message-ID: <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: exar: refactor the driver
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I just wanted to convert the driver to using simpler IDA API but ended up
> quickly converting it to using regmap. Unfortunately I don't have the HW
> to test it so marking the patches that introduce functional change as RFT
> and Cc'ing the original author.

+Cc: Jan, AFAIR their devices are using Exar UART.

> Bartosz Golaszewski (7):
>   gpio: exar: add a newline after the copyright notice
>   gpio: exar: include idr.h
>   gpio: exar: switch to a simpler IDA interface
>   gpio: exar: use a helper variable for &pdev->dev
>   gpio: exar: unduplicate address and offset computation
>   gpio: exar: switch to using regmap
>   gpio: exar: use devm action for freeing the IDA and drop remove()
>
>  drivers/gpio/Kconfig     |   1 +
>  drivers/gpio/gpio-exar.c | 155 +++++++++++++++++++--------------------
>  2 files changed, 77 insertions(+), 79 deletions(-)
>
> --
> 2.29.1
>


-- 
With Best Regards,
Andy Shevchenko
