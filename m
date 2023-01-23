Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA966783B0
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 18:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbjAWRyp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 12:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232721AbjAWRyo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 12:54:44 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E97A2B63F
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 09:54:43 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id g23so12166200plq.12
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfn2VKc5tb13Bmz2zLJ8hWQgh2Rqf4hF3vv12c+wU7M=;
        b=jOub7jZTow1wn8ew5Y8TSGPzf32gf0xc/HOcWVvtPFrlL1PNxXlIpqj4gyrwGvFnlu
         lTcOtGkZvEcd/PogWFZn9IftEqohazgbExLcjV+a0Ielu+ZxGUbNyFVQOBRmtFK6hvaV
         fsqZ6CaIu8KRAk0yuNdOanfSdGgAobHkVoh4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfn2VKc5tb13Bmz2zLJ8hWQgh2Rqf4hF3vv12c+wU7M=;
        b=Ib1oQXf/34YxcK3u4sabcZ3KuB/2Iax63WuMH1QDN8raUPd7NdrCe6Gw5kjMC5ZS7a
         QjwwgvL+djdzpo3yMt13mIjFXvte+Ys+bz/Gl2Xt/uq5/1OtWr5Sd4pJBlPcdn4zxWu0
         yc8nZfOlAvcqQrCkzSYjoisfKETZ5bdoNWLUIPepdRvGgWjB6YHP8u2/lWURDNk97HGV
         B3xArZgTfkl5E8V51ezR7PTws9HLvSHNhynpYarnQnCDiAxAQmFLhEwuydSpUHbsxfps
         dROAqDlDc26WOd67ZK7i9LPAh2iQuUlPwjTOQ5sxmUQKMhZgTiDfyWYOg7zmiM7iKyGf
         m7VA==
X-Gm-Message-State: AFqh2kpYBw8TxPjfQm9//mD7UdTtbz9egWo03dH0/pDxgdFeahXHybka
        Yz0rZLPsm+/jndWrreshyZ1nPMPEob5QtfJg
X-Google-Smtp-Source: AMrXdXt8P/15bfByJTj4gF7UI4C9RZu2P1gU5o8lVf/LWgoWPZ4w9tpU4y8ygDBlFtel6gCQfOIohg==
X-Received: by 2002:a17:902:ea0a:b0:191:24a:63e3 with SMTP id s10-20020a170902ea0a00b00191024a63e3mr32483792plg.50.1674496482787;
        Mon, 23 Jan 2023 09:54:42 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id je19-20020a170903265300b00195f0fb0c18sm3943plb.31.2023.01.23.09.54.41
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:54:42 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id 20so9402710pfu.13
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 09:54:41 -0800 (PST)
X-Received: by 2002:a63:4c54:0:b0:4cf:ad0f:7387 with SMTP id
 m20-20020a634c54000000b004cfad0f7387mr2371573pgl.208.1674496481336; Mon, 23
 Jan 2023 09:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20230121134812.16637-1-mario.limonciello@amd.com>
 <20230121134812.16637-3-mario.limonciello@amd.com> <CAMRc=Meeiix1BuPi81Ad08yePvd7U5S-AVNwU+vYUHv2VcDiEQ@mail.gmail.com>
 <CAHQZ30Dgs=ScuQ2MkNkuHyZNC1wwaBDkMhcvh9dt3oAppTKBbw@mail.gmail.com> <Y87ERbaTEhKIK1nq@smile.fi.intel.com>
In-Reply-To: <Y87ERbaTEhKIK1nq@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 23 Jan 2023 10:54:29 -0700
X-Gmail-Original-Message-ID: <CAHQZ30Aj-S1kRiYhh4sFzZYH8MLKY=sdqYRDqZtqOGGMn1Bang@mail.gmail.com>
Message-ID: <CAHQZ30Aj-S1kRiYhh4sFzZYH8MLKY=sdqYRDqZtqOGGMn1Bang@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib-acpi: Don't set GPIOs for wakeup in S3 mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Nathan Smythe <ncsmythe@scruboak.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Hasemeyer <markhas@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2023 at 10:30 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jan 23, 2023 at 08:55:02AM -0700, Raul Rangel wrote:
> > On Mon, Jan 23, 2023 at 8:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > >
> > > On Sat, Jan 21, 2023 at 2:48 PM Mario Limonciello
> > > <mario.limonciello@amd.com> wrote:
> > > >
> > > > commit 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capab=
le")
> > > > adjusted the policy to enable wakeup by default if the ACPI tables
> > > > indicated that a device was wake capable.
> > > >
> > > > It was reported however that this broke suspend on at least two Sys=
tem76
> > > > systems in S3 mode and two Lenovo Gen2a systems, but only with S3.
> > > > When the machines are set to s2idle, wakeup behaves properly.
> > > >
> > > > Configuring the GPIOs for wakeup with S3 doesn't work properly, so =
only
> > > > set it when the system supports low power idle.
> > > >
> > > > Fixes: 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capab=
le")
> > > > Fixes: b38f2d5d9615c ("i2c: acpi: Use ACPI wake capability bit to s=
et wake_irq")
> > > > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2357
> > > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2162013
> > > > Reported-by: Nathan Smythe <ncsmythe@scruboak.org>
> > > > Tested-by: Nathan Smythe <ncsmythe@scruboak.org>
> > > > Suggested-by: Raul Rangel <rrangel@chromium.org>
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > ---
> > > >  drivers/gpio/gpiolib-acpi.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acp=
i.c
> > > > index 9ef0f5641b521..17c53f484280f 100644
> > > > --- a/drivers/gpio/gpiolib-acpi.c
> > > > +++ b/drivers/gpio/gpiolib-acpi.c
> > > > @@ -1104,7 +1104,8 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi=
_device *adev, const char *name, in
> > > >                                 dev_dbg(&adev->dev, "IRQ %d already=
 in use\n", irq);
> > > >                         }
> > > >
> > > > -                       if (wake_capable)
> > > > +                       /* avoid suspend issues with GPIOs when sys=
tems are using S3 */
> > > > +                       if (wake_capable && acpi_gbl_FADT.flags & A=
CPI_FADT_LOW_POWER_S0)
> > > >                                 *wake_capable =3D info.wake_capable=
;
> > > >
> > > >                         return irq;
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > Applied, thanks!
> > >
> > > Bart
> >
> >
> > We still need to figure out a proper fix for this. If you read my post
> > here: https://gitlab.freedesktop.org/drm/amd/-/issues/2357#note_1732372
> > I think we misinterpreted what the SharedAndWake bit is used for. To
> > me it sounds like it's only valid for HW Reduced ACPI platforms, and
> > S0ix. My changes made it so we call `dev_pm_set_wake_irq` when the
> > Wake bit is set. Does anyone have any additional context on the Wake
> > bit? I think we either need to make `dev_pm_set_wake_irq` (or a
> > variant) only enable the wake on S0i3, or we can teach the ACPI
> > subsystem to manage arming the IRQ's wake bit. Kind of like we already
> > manage the GPE events for the device.
>
> From the spec:
>
> Shared is an optional argument and can be one of Shared, Exclusive,
> SharedAndWake or ExclusiveAndWake. If not specified, Exclusive is assumed=
.
> The =E2=80=9CWake=E2=80=9D designation indicates that the interrupt is ca=
pable of waking
> the system from a low-power idle state or a system sleep state. The bit
> field name _SHR is automatically created to refer to this portion of
> the resource descriptor.
>
>
> Note: "...a low-power idle state or a system sleep state.". I believe it
> applies to both.

Without the _PRW, how do we determine the valid system sleep states
the device can wake the system from?

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
