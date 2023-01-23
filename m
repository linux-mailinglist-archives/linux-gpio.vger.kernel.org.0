Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB28E6780BE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 17:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjAWQC4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 11:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbjAWQCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 11:02:55 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722D5EFBB
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:02:54 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-15085b8a2f7so14455815fac.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sbuQ2eAJkHwKWpK2Z21TvfvZZsWUOmsMIR9vvLknpYs=;
        b=WQmjabEAtB9BEkpn55XmcV9lxKiEMGiQ+erS4aRFrM/SvbEcUDMMvtLfa8JNjKhq/j
         pAu0hnQtQSxV77MQTroBJpAM9Y+91ykFFaiXqzt4CXi/ulQIQJzKiYdMxm+AeACmyUhj
         baNW0OfSe+Btw2l9eujUITCmMxR4YswB66UkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbuQ2eAJkHwKWpK2Z21TvfvZZsWUOmsMIR9vvLknpYs=;
        b=IawhvmS7iRK4vHl5eTsBgilue+NTgwh8V5eRoAzn2XU8mrIFxK+JP6qx5i1+TVUQhO
         ptMZOAnijDSLXEQNWS359GjsExyIcIWIM836enZzLhnNbjXFF20XKA4DTUG0/S7l1fNx
         RFcTAleKA7ble/ro5S2y8bebgULtRNDTs5up4o54E8w/cSa6oXkusO/GbWVw4s+q8QhT
         ThNLa3aWqK8LF9ACvNDCFPVj4jDPJcPQZVxgbhF4CrT0aUdkhJbaGd3R1CbZynPYj7gQ
         4Dz2s7qYdaVHoYF5HsKroUOi/eSA3R5vmsBK/42UMz5iBrpU8uZ4lriXANlk6alBZKEn
         LLEg==
X-Gm-Message-State: AFqh2kpt51/CAQPO/e2POhftJkIzEekyZ5MpQK7hzazMYaEzdHeGd5jr
        hs7S6km6xFvM94e8vyIHV/mAiyvelAEA6wh1
X-Google-Smtp-Source: AMrXdXtKhBLcvS6ihxbn/e4SqK106ZwcbJ+AXfyp4/qaftOvBolSIZVHj1TlLdcdaoJDJ5PxYbPApg==
X-Received: by 2002:a05:6870:4b90:b0:15f:5509:9a04 with SMTP id lx16-20020a0568704b9000b0015f55099a04mr12574591oab.59.1674489773147;
        Mon, 23 Jan 2023 08:02:53 -0800 (PST)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id b35-20020a056870472300b001576d0c1196sm2198802oaq.51.2023.01.23.08.02.52
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:02:52 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id o66so10746494oia.6
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 08:02:52 -0800 (PST)
X-Received: by 2002:a17:90a:1:b0:225:cb85:673d with SMTP id
 1-20020a17090a000100b00225cb85673dmr2482344pja.184.1674489315288; Mon, 23 Jan
 2023 07:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20230121134812.16637-1-mario.limonciello@amd.com>
 <20230121134812.16637-3-mario.limonciello@amd.com> <CAMRc=Meeiix1BuPi81Ad08yePvd7U5S-AVNwU+vYUHv2VcDiEQ@mail.gmail.com>
In-Reply-To: <CAMRc=Meeiix1BuPi81Ad08yePvd7U5S-AVNwU+vYUHv2VcDiEQ@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 23 Jan 2023 08:55:02 -0700
X-Gmail-Original-Message-ID: <CAHQZ30Dgs=ScuQ2MkNkuHyZNC1wwaBDkMhcvh9dt3oAppTKBbw@mail.gmail.com>
Message-ID: <CAHQZ30Dgs=ScuQ2MkNkuHyZNC1wwaBDkMhcvh9dt3oAppTKBbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib-acpi: Don't set GPIOs for wakeup in S3 mode
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Nathan Smythe <ncsmythe@scruboak.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Hasemeyer <markhas@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2023 at 8:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Sat, Jan 21, 2023 at 2:48 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> >
> > commit 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
> > adjusted the policy to enable wakeup by default if the ACPI tables
> > indicated that a device was wake capable.
> >
> > It was reported however that this broke suspend on at least two System76
> > systems in S3 mode and two Lenovo Gen2a systems, but only with S3.
> > When the machines are set to s2idle, wakeup behaves properly.
> >
> > Configuring the GPIOs for wakeup with S3 doesn't work properly, so only
> > set it when the system supports low power idle.
> >
> > Fixes: 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
> > Fixes: b38f2d5d9615c ("i2c: acpi: Use ACPI wake capability bit to set wake_irq")
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2357
> > Link: https://bugzilla.redhat.com/show_bug.cgi?id=2162013
> > Reported-by: Nathan Smythe <ncsmythe@scruboak.org>
> > Tested-by: Nathan Smythe <ncsmythe@scruboak.org>
> > Suggested-by: Raul Rangel <rrangel@chromium.org>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> >  drivers/gpio/gpiolib-acpi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > index 9ef0f5641b521..17c53f484280f 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -1104,7 +1104,8 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name, in
> >                                 dev_dbg(&adev->dev, "IRQ %d already in use\n", irq);
> >                         }
> >
> > -                       if (wake_capable)
> > +                       /* avoid suspend issues with GPIOs when systems are using S3 */
> > +                       if (wake_capable && acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0)
> >                                 *wake_capable = info.wake_capable;
> >
> >                         return irq;
> > --
> > 2.34.1
> >
>
> Applied, thanks!
>
> Bart


We still need to figure out a proper fix for this. If you read my post
here: https://gitlab.freedesktop.org/drm/amd/-/issues/2357#note_1732372
I think we misinterpreted what the SharedAndWake bit is used for. To
me it sounds like it's only valid for HW Reduced ACPI platforms, and
S0ix. My changes made it so we call `dev_pm_set_wake_irq` when the
Wake bit is set. Does anyone have any additional context on the Wake
bit? I think we either need to make `dev_pm_set_wake_irq` (or a
variant) only enable the wake on S0i3, or we can teach the ACPI
subsystem to manage arming the IRQ's wake bit. Kind of like we already
manage the GPE events for the device.
