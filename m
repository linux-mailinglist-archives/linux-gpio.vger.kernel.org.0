Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02DA175A13
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 13:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgCBMK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 07:10:27 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34418 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgCBMK0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 07:10:26 -0500
Received: by mail-lj1-f194.google.com with SMTP id x7so11499367ljc.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2020 04:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=typeblog-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lf5revSpm3qfJv2nXZJRbS1f7fWl78G2borqCkC/EVs=;
        b=AxpP11wTXpvVI79tk/T3EKzaj9yqhaWb1BUaqiCFFAo1t1sWGWC0fA+987M/VI6zSB
         qjuNesM2TgfdnBRH9Y9Vq+q9vp42qWrfRKPLkpfqnPiFqJniV0WFMwEtNJqQzzk5tTsY
         oUzAqfahRkpDxW+YTMgvsufiyvVBIxVeVw/DQ0rTw++oBvx5OLbPtqxPpjgJHddUwzF9
         hV2G0nnLUBXpU+JuEA//RTFVsOfSeg+2BVuJTTjVpW257+nGRtpIgX7qIqKZsoMcRwkS
         gxcmSKqCoKC09KcZAUgRdcCHitAXU4657+it0pmURd3HEg90RT8n2iHxqHI4SoABNOn/
         QENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lf5revSpm3qfJv2nXZJRbS1f7fWl78G2borqCkC/EVs=;
        b=e4aHXvmDjBMjlEk72DAnt/3C7HFxabozwBC4wyR0Su+/SngXzQMCFOkrFzmSU0FzBU
         l2XsDvCTamxp/y8zu6yzEji0PqNMvJ3evgC4UnO/PudBjDNpdH6Ceh10A3G55yr0MNvv
         ntkY0+muUkx5r5NLY76THhRdv5VRgsi8mp2W9eglmLJd/fjY0jMDrjPFW98VYTHuP3Ca
         xaCeSMLKrjoR9qAehCu5vtdD9VW10VJ6NchNrhYwpIzaL0vi9pTqnSMfmHsoD+qYSHfi
         AOgXkjJA7S1YCl/grFptZDc/qKtqMiq8gHxjOy5BVyroEFcDA6INKhGN2RBacQyD4zSn
         ybtw==
X-Gm-Message-State: ANhLgQ3JeeNidWDnJnM9so+nhKDVaLCFmlMvnkbLeyNvoVu06Nt0/JPv
        p2dNnIZTv3JA09EylwF81CDisINtHuCW0gWzP1NqPg==
X-Google-Smtp-Source: ADFU+vsXy4SeIjKrwpbs1vqbQniY8JnehYm6c42utMHH2tPR0dqlr+JpbkMZNot8feBlGkvR3fDWhwBRjY8nV0xQgtA=
X-Received: by 2002:a2e:884c:: with SMTP id z12mr11440314ljj.55.1583151024920;
 Mon, 02 Mar 2020 04:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20190831030916.13172-1-peter@typeblog.net> <20190902124352.12291-1-peter@typeblog.net>
 <20190902124352.12291-2-peter@typeblog.net> <daeec373292e14c6aea179ddf690a5dace6c83f7.camel@hadess.net>
In-Reply-To: <daeec373292e14c6aea179ddf690a5dace6c83f7.camel@hadess.net>
From:   Peter Cai <peter@typeblog.net>
Date:   Mon, 2 Mar 2020 20:10:13 +0800
Message-ID: <CA+Zf_0fBX3YBVsiJbAGdtFp-428uwsRS3oncZCytSvxw8rXO4Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] touchscreen: goodix: define GPIO mapping for GPD
 P2 Max
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 2, 2020 at 7:57 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Mon, 2019-09-02 at 20:43 +0800, Peter Cai wrote:
> > The firmware of GPD P2 Max could not handle panel resets although
> > code
> > is present in DSDT. The kernel needs to take on this job instead, but
> > the DSDT does not provide _DSD, rendering kernel helpless when trying
> > to
> > find the respective GPIO pins.
> >
> > Fortunately, this time GPD has proper DMI vendor / product strings
> > that
> > we could match against. We simply apply an acpi_gpio_mapping table
> > when
> > GPD P2 Max is matched.
> >
> > Additionally, the DSDT definition of the irq pin specifies a wrong
> > polarity. The new quirk introduced in the previous patch
> > (ACPI_GPIO_QUIRK_OVERRIDE_POLARITY) is applied to correct this.
>
> Hans has posted a patchset which reworks GPIO access for ACPI devices.
>
> Could you please check whether you could rebase your patch on top of
> that?
>
> I also think the comment in "Input: goodix - Add support for getting
> IRQ + reset GPIOs on Cherry Trail devices" might also be of use:
>
> +       case irq_pin_access_acpi_gpio:
> +               /*
> +                * The IRQ pin triggers on a falling edge, so its gets
> marked
> +                * as active-low, use output_raw to avoid the value
> inversion.
> +                */
>
> Cheers
>

Sorry I forgot to notify you earlier, but it turned out that the
manufacturer of the device has already applied a fix in their ACPI
table after this patch was submitted and discussed. This patch is no
longer needed.
