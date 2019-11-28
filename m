Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0D2910C995
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 14:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfK1Nfm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 08:35:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43606 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfK1Nfm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 08:35:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id l14so20059745lfh.10
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jvu9OZfemBYDKg0MnhgqQk6YdpE94ksYWMXeOTcKvqI=;
        b=rZpffZGhAtCrVfEJ0STTAMBuizBQYAW52mwdkSePWuUDC6OQ0zz8Z9UVdUnR6H2hrY
         K8Zvn9LxDwzAlWTeJB7Ldx3bCWiqA26Hw3n9v/gp2fQF0eKMGpFlNmWAhySJS3XNTdas
         UUYv0H6vIgRTCERz1VJr2aOhsjB4FMCFbAux9lo6Cj8a+zIJaKjQ2RPLedJmZmMefZkO
         2hd68TxsA4uugErhZ0gKWJvLLL3X1uaEi7ucIqoM58qk7UPERby7BEqxbpuqpWVJFpK0
         FvtarJybUCicf7nDe5WUj+gFj10VYyPHsGggZmdyoMKuoCbUs3mvy/kEGkC9/BW9M5mK
         RBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jvu9OZfemBYDKg0MnhgqQk6YdpE94ksYWMXeOTcKvqI=;
        b=PKVriIOK7X40KHrp8EjupIyAoIILB14Ps1gpSnWZQKg/EAIwlPxWHfl7o7giBEbrx8
         misdO2r/hrgWNWyJ04WssIVFWJoGigFrHoC7nTctPaC07s2dp95JiAEyTdEla4Fy2+zm
         oD7FhOApYvba3YwiKstoRgHGKSGP3JLrfR2QsYtxgG4KeOwKpvzFfpoZizw88t8IP/QQ
         vCpihzUsTEVKN1LKsFYi9AwpqUByL4uqe24jeBY98ZQbFDqmbyIE9YuA2ATYJJQbdzZk
         8TWfuasUjods6TEwE3ZPiwpKebVQx2cskMwp2b8C6FL69B0QF9ktIH4HMz5mWIa+pbTM
         evYg==
X-Gm-Message-State: APjAAAU50WNscFxE+lXEX/1MvYfEo1AFRj4Jt3Lz2M2zhPKj2Y164lsp
        rKCqYt32NR0vb20xhZZWiCbTCY5A8s5YXQjQPkv8Vg==
X-Google-Smtp-Source: APXvYqzK0FbZzikTAfGQ/Uf5e40RCuK+895pCTYy155zY+oNBupV1A0B056rLvdFg3jVNLYSLcvbRBi8zlZyV8ONdPA=
X-Received: by 2002:a19:645b:: with SMTP id b27mr22047811lfj.117.1574948139781;
 Thu, 28 Nov 2019 05:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20191127104509.10196-1-hdegoede@redhat.com>
In-Reply-To: <20191127104509.10196-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 14:35:28 +0100
Message-ID: <CACRpkdZVPJyagQT4UwZDUHBvg0erFCwQumNKX9U3=AcHi=ZQGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpiolib: acpi: Turn dmi_system_id table into a
 generic quirk table
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 11:45 AM Hans de Goede <hdegoede@redhat.com> wrote:

> Turn the existing run_edge_events_on_boot_blacklist dmi_system_id table
> into a generic quirk table, storing the quirks in the driver_data ptr.
>
> This is a preparation patch for adding other types of (DMI based) quirks.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This patch does not apply to my "devel" branch, which I am about
to send to Torvalds, so it will very soon be the mainline.

Could you rebase it and I will queue it up for fixes.

Also: should these two be tagged for stable? (I.e. a non-v5.5
problem.) I suppose that requires backporting for -stable
though.

Yours,
Linus Walleij
