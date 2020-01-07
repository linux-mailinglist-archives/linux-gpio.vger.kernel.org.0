Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510A113252E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 12:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgAGLuu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 06:50:50 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39043 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAGLuu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 06:50:50 -0500
Received: by mail-lj1-f196.google.com with SMTP id l2so54393071lja.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 03:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iFsSM6vxEydUs02gD1XbE7gcNfWrUkov42GXmL/B/g4=;
        b=UgZQmucPLWkmL6jVn+2bdRf8+0/tT1LQC8SCfASVMPN3ceCLoNrSJE96uAaxDXt/Zu
         0Hbo5G+pbUeUM6GbbhF1YlxQarR7l4+JqZEmF5905YYykk8rHxtLD58wHt+ShBjRK912
         LJZivrqsEFdbg4bAnOqjO2Q5Dkrwywm8kzc8yTsjFMVi37R8wmbW/DYGysjNHy4SK2V1
         6E88aVpieRgKBp+RpdgjcTtmatxzcC+kMjHuHNsH36cRdiq/F2czCfYVTCL1xfJ+lsG+
         W0ATtxjMQzJWiHW7Ex0twfEwGwjoh2cACHL5CRlSeBOncj4WUca2GyKrhrx05SE6vl80
         dRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iFsSM6vxEydUs02gD1XbE7gcNfWrUkov42GXmL/B/g4=;
        b=KzR1jb+BPrwJbuxGKp3JUW0DEWZynC0RoBuhIUwYWMiISXwoen7Tbdiabu0AhTFm7u
         7WY/S4gvjzYMJ/zvvX9tx127ceQraAtXdxJFLkHAweEkRfuCH+eszwFBeZNslkt2WbBM
         QDQmQzq1cuv3dObNUIJM/qZwXYDcVjlVpsd/ianxdz05nxZsq2WjqV9tcWdkqIG6AmwB
         +9AzugzNz9f2GjcCBv2cBdxx+4taYhb1uGjCqfI3H/92rGIUjk1GpfsRc9EU0ftI7k2z
         5QTfLQ/ngvla95acF0mRZtnWKviWeEXeI/bUwNvJ9ta1wCs4LTKWPSb2HpwRtPNMVwTd
         HGZQ==
X-Gm-Message-State: APjAAAXL8o1mnj+E/lHdt9ynk4gplVeocWm4WDOoKxmZv8pf4Npk25q1
        NYLVOZfzF1UE4K0P4V4xKHA37QFCVUByNFQ9er7+OQ==
X-Google-Smtp-Source: APXvYqzqbaKvZ9Puh8J+kZVQvq2lpgj8PQt1Pkad+wgIKlI0vpiAAtUqurvSdYL9m9Fvp0HSudCVCKDTbQrmH6PpsH8=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr64319128ljm.218.1578397848306;
 Tue, 07 Jan 2020 03:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20200101145243.15912-1-hdegoede@redhat.com>
In-Reply-To: <20200101145243.15912-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 12:50:36 +0100
Message-ID: <CACRpkdbTunsVtgGw5=ksn=cn+ZwYT_F7OhVqucaQjA1-5D8BfQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: baytrail: Replace WARN with dev_info_once
 when setting direct-irq pin to output
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 1, 2020 at 3:52 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Suspending Goodix touchscreens requires changing the interrupt pin to
> output before sending them a power-down command. Followed by wiggling
> the interrupt pin to wake the device up, after which it is put back
> in input mode.
>
> On Cherry Trail device the interrupt pin is listed as a GpioInt ACPI
> resource so we can do this without problems as long as we release the
> irq before changing the pin to output mode.
>
> On Bay Trail devices with a Goodix touchscreen direct-irq mode is used
> in combination with listing the pin as a normal GpioIo resource. This
> works fine, but this triggers the WARN in byt_gpio_set_direction-s output
> path because direct-irq support is enabled on the pin.
>
> This commit replaces the WARN call with a dev_info_once call, fixing a
> bunch of WARN splats in dmesg on each suspend/resume cycle.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Replace WARN with a dev_info_once call, instead of dropping it

Patch applied with Mika's ACK!

Yours,
Linus Walleij
