Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D3312E977
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2020 18:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgABRkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jan 2020 12:40:24 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44015 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbgABRkY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2020 12:40:24 -0500
Received: by mail-qt1-f194.google.com with SMTP id d18so32461526qtj.10
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2020 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+sRNYThXV/qw+oqY2hzFYFQkSAluAiDf3LujstPJXpk=;
        b=Z+Tkx29qHd99z3LbNVNdDV3VtbSq4poPWwpGVSq/8bOwWWJru2Np+4/MO3Eqi0M+/n
         XwsWUu4GiugfaKjmGWy5dcgYknIPmgQ8HSg+BQMFx1AKnQQ98ufVB32z11XFH3JmK67+
         VmTtMu9erNzklKo5sGUNJ2CSRTaec8GjM3gpJuyyYkyESfBBsjtB4iQyHIduJuCnZoDF
         GHKxnjVyXJ8x6LKaFD3ZIn6h9YR0Sj58IUPVoAknxXgWCNKVAnJaoyCwWYMevzDAPSmo
         8XhVUG04wcBsyryZCGDlnYuzweHgr82zQq9b9VbPxYxJOcsCjIX4PfJUpX6QNTqdSz95
         1+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+sRNYThXV/qw+oqY2hzFYFQkSAluAiDf3LujstPJXpk=;
        b=QfmwI9eYI9Ih+de84xg9UovrsHbQ3lNR4ewhWh64fz81HuoP+/hn/kVFt8J+jnOMh6
         JHEfkYAbQ+NZAgJqoQ0Kp9z1Nde8UqFVyi4rmu0g4k/rsv2EN75Ud9CZLtMVHGvgsYyV
         lrl0iAzT/nEx6T+89HGRxYfzHQDplRETV59MPk1byJdk/5Y6WrJFL04mIAE08b3T4Z2y
         OS98DU5Mdnph4i/pNL7mUDI8K/aWBBoNp6LjsgyVdsneCiWeUciR7OlpHI5rhNiB7ZGD
         LaMgAVrVOX7WihHzIAC8tPXJsZjmxf/YdYtdxKeUu0sJk8P9tg9gRSc/LbRoeAsP/W2q
         88mQ==
X-Gm-Message-State: APjAAAUw14ivRTxsRnYBc4ez8D9ff49HtU0npPWfeMwhqdY43hRzk2+3
        HSaTdbHWHi1NFMWPJiypBDoQE87soHFmSQvR154GQQ==
X-Google-Smtp-Source: APXvYqyNeaD4tk9QDs9WLgwv0+DhmaV3KGt2yAfjSv5ZOYVds8cpBjowJz2+eu1ZE3QJmZsgZSV/7gY4BE6Kfe4v6o0=
X-Received: by 2002:ac8:704:: with SMTP id g4mr60782643qth.197.1577986823008;
 Thu, 02 Jan 2020 09:40:23 -0800 (PST)
MIME-Version: 1.0
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com> <1577362338-28744-3-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1577362338-28744-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 2 Jan 2020 18:40:12 +0100
Message-ID: <CAMpxmJUWW6Ku7edG1WWz67sBiAj7Fxf_C=XWA3eNO=B75X7oOw@mail.gmail.com>
Subject: Re: [PATCH 2/8] gpio: zynq: protect direction in/out with a spinlock
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 26 gru 2019 o 13:12 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> From: Glenn Langedock <Glenn.Langedock@barco.com>
>
> Fix race condition when changing the direction (in/out) of the GPIO pin.
> The read-modify-write sequence (as coded in the driver) isn't atomic and
> requires synchronization (spinlock).
>
> Signed-off-by: Glenn Langedock <Glenn.Langedock@barco.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/gpio/gpio-zynq.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 05ba16fffdad..9c8b8a397a26 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -10,6 +10,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/spinlock.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -116,6 +117,7 @@ struct gpio_regs {
>   * @irq:       interrupt for the GPIO device
>   * @p_data:    pointer to platform data
>   * @context:   context registers
> + * @dirlock:   lock used for direction in/out synchronization
>   */
>  struct zynq_gpio {
>         struct gpio_chip chip;
> @@ -124,6 +126,7 @@ struct zynq_gpio {
>         int irq;
>         const struct zynq_platform_data *p_data;
>         struct gpio_regs context;
> +       spinlock_t dirlock; /*lock used for direction in/out synchronizat=
ion */

Maybe just call it 'lock' in case it turns out other operations need
locking as well?

Bart
