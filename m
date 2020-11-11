Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A27DB2AE492
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 01:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732043AbgKKAEq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 19:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732029AbgKKAEq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 19:04:46 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B080C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 16:04:40 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id p12so2296026ljc.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 16:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JzWWY6NuciTI33aQq96X3WiN1h2jDKoGrOwhs2Ifrxc=;
        b=DSw+pVH6EQmIKgMM49DrSxbYR8Ia08GpFokAgc4lncdWrInFkSMUP0k/INRLZEBshA
         H2s4OgDrG9h5nRuZF9VelAC2M2CMq1b94qV7D7IyW3sgxYCmDNn3qsfFlcskaARrnfZ4
         ap7L10qrulUSlTgUG7ZnTO4n1N/I+WLuiUtjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JzWWY6NuciTI33aQq96X3WiN1h2jDKoGrOwhs2Ifrxc=;
        b=fgkpGxGR56p1b+X/MfKA3IKG6eVhyezxLtb1zs+x+48m746SXBXcYPEXY9SlmKjQWL
         cAVE5WH58eu28zLVuxMIaYtAb7YDH0ny3P1e+kI2DWLQSXv3kIN28g9rXA/s7q/jzY0x
         f0+DnD8YEuK/ewYhrOxe9aho2Cka366Jav74OzAt59uG3G3Mp/0af2kJZohM+vkfa2j0
         C4ov+Atkl0nz5DQAVQCIeQgwQ7NpMOkApxRJ0371Mzw/VEjnIrckqKYmh21XDtb/Cd1z
         84Ik/b0WXiz/VHWg7eWZBpDGRYv9zHSjwEKQPA2c61/QxAS0TPGtIkrHRt+QJsBA+0DU
         O3Hg==
X-Gm-Message-State: AOAM530WO2lmQ4M+Dx7TJft+WuyuVJ8+MSIkCSTyzui7WVR3T+bhbLxA
        1yOOk8jo9tyMscaMozDX7CkV4pEvVgHzUw==
X-Google-Smtp-Source: ABdhPJzedm0tngZe5TXWoBTxspwJT5vY+lZkdPGl6JgkkPmsjIbn3E5awH0F5FuKgmTMCvGiZKrNog==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr3878476ljc.447.1605053075686;
        Tue, 10 Nov 2020 16:04:35 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q15sm42461lfb.163.2020.11.10.16.04.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 16:04:35 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 74so699662lfo.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 16:04:34 -0800 (PST)
X-Received: by 2002:a19:408b:: with SMTP id n133mr8002533lfa.564.1605053074001;
 Tue, 10 Nov 2020 16:04:34 -0800 (PST)
MIME-Version: 1.0
References: <20201110144932.1.I54a30ec0a7eb1f1b791dc9d08d5e8416a1e8e1ef@changeid>
 <CAHp75VcfmJ6-cqCsZ6BjbghGDt+w-AbxGxLoWG61VVF2Knor-Q@mail.gmail.com>
In-Reply-To: <CAHp75VcfmJ6-cqCsZ6BjbghGDt+w-AbxGxLoWG61VVF2Knor-Q@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 10 Nov 2020 16:03:57 -0800
X-Gmail-Original-Message-ID: <CAE=gft4vdBytT2=tCbv2aE3RRoDut5CiHdBODjXJamGM5yB3Bw@mail.gmail.com>
Message-ID: <CAE=gft4vdBytT2=tCbv2aE3RRoDut5CiHdBODjXJamGM5yB3Bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Fix Jasperlake hostown offset
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 3:48 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
>
>
> On Wednesday, November 11, 2020, Evan Green <evgreen@chromium.org> wrote:
>>
>> GPIOs that attempt to use interrupts get thwarted with a message like:
>> "pin 161 cannot be used as IRQ" (for instance with SD_CD). This is becau=
se
>> the JSL_HOSTSW_OWN offset is incorrect, so every GPIO looks like it's
>> owned by ACPI.
>
>
> Funny, I have created a similar patch few hours ago. Are you sure this is=
 enough? In mine I have also padcfglock updated. But I have to confirm that=
, that=E2=80=99s why I didn=E2=80=99t send it out.

Oh weird! I didn't check padcfglock since it didn't happen to be
involved in the bug I was tracking down. I was trying to clean out
some skeletons in my kernel closet [1] and debugged it down to this.

If you want to smash the two patches together I'm fine with that. Let
me know, and CC me if you do post something.
-Evan

[1] https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/=
master/overlay-dedede/sys-kernel/chromeos-kernel-5_4/files/0001-CHROMIUM-pi=
nctrl-intel-Allow-pin-as-IRQ-even-in-ACPI.patch
