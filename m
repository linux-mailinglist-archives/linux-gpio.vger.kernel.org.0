Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C202D4B7584
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 21:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236674AbiBORSE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Feb 2022 12:18:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbiBORSD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 12:18:03 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC47642A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 09:17:52 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id i10so5973876plr.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Feb 2022 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F/ovDD2nNid8qfyI2rVDvUYuFjmu4jUArtmWrfO+8l8=;
        b=K4XvVrBFRqO02wmCIDGYRd5wBoJUPvv9cApbmddy93h6gcOu8hmL7/SyCFj/2ohFP9
         tU1Afs8AuGy6hH7IbH8HodRO8l7etWiPrCd7Y0M0hf28Cc4PVnCG62JQUkjeh/qcggDQ
         x0Qu4Pew6yk3GxgRw+VvCZ/qfg4RYxl0rCajNDypOeWZGWzFhrQsZi/a9l6hD6Jmyg6J
         sFOuNsYYP5masZqZc0j5X45qGbIXPGcY3+M+UzIl8xro15JvNCBNrvEe31wpkOJ0NKQN
         lpBLbvypWNIbajkrOqMXD2hsYBo5zciRINSO+Igx5p2sg5yu1pM4rRhUOMmQ1RklWJo6
         xm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F/ovDD2nNid8qfyI2rVDvUYuFjmu4jUArtmWrfO+8l8=;
        b=f+OzR5Fp+aJgivt0XDSGnra4boliP6Dg2oofVEHe1Sfb0IqHoqjO7Zqky1zZqKbu5/
         ekuOdwXZk/tH9jcRLW4clFgFyxNR83jDVSUGq+dt8y7MRuC7knJCaz0NfT6KKCm5xGs6
         wq+uja3EHn7xP+d1oyAzmIgc9BUOp7pFBclDKN4F4+iSJCwqT2UZDYEUWUSvrwWb+jmo
         O7cJzOTjjbaIA0wF+yI26/KNsVXTW2xmc+0hmBT1P9oL4sv//oJvVry4jo5A8+KiX79A
         3DQulNs6+VTlHbWXQvmvmiOThGqwmQy5jo5rXlcC04JXz3hYCkDQD/y/VeBzj9oiRwwd
         wPVQ==
X-Gm-Message-State: AOAM533NLZGcWBW0BH5Q3BvJR4vqKifDi18gwngpx6thtpUNL+os5guL
        c2iD7fyMDgKDJHyICWXOLKs=
X-Google-Smtp-Source: ABdhPJzW1oQVTsTXHa+KUvVNaUfJVWqWh+tVDhj9uTwLJiDIfj2+aR2kf3RmsLapKG6eKsqnZdyxnQ==
X-Received: by 2002:a17:903:244a:: with SMTP id l10mr27625pls.0.1644945472369;
        Tue, 15 Feb 2022 09:17:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m20sm41908589pfk.215.2022.02.15.09.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 09:17:51 -0800 (PST)
Subject: Re: [PATCH] pinctrl: bcm2835: Use bcm2835 gpio_chip label for bcm2711
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Lukas Wunner <lukas@wunner.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        linux-rpi-kernel@lists.infradead.org
References: <c399da9deab3ede9b0c4d4680d8ac508707aa8c3.1644903104.git.lukas@wunner.de>
 <c1e31ad4-3a65-9370-3a5c-ffde723a04aa@i2se.com>
 <20220215144409.GA12830@wunner.de>
 <09a5a501-40d7-4dae-56c9-a3796fc95c4b@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2a5aad11-0ac6-943f-158a-585648b396be@gmail.com>
Date:   Tue, 15 Feb 2022 09:17:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <09a5a501-40d7-4dae-56c9-a3796fc95c4b@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/15/22 8:56 AM, Stefan Wahren wrote:
> Hi,
> 
> Am 15.02.22 um 15:44 schrieb Lukas Wunner:
> 
>> On Tue, Feb 15, 2022 at 01:00:47PM +0100, Stefan Wahren wrote:
>>> Am 15.02.22 um 06:52 schrieb Lukas Wunner:
>>>> Commit b1d84a3d0a26 ("pinctrl: bcm2835: Add support for all GPIOs on
>>>> BCM2711") used a different label for the bcm2711 gpio_chip vis-à-vis
>>>> the bcm2835.
>>>>
>>>> That breaks compatibility for GPIO_LOOKUP_IDX() and GPIO_HOG() clauses
>>>> when porting from older Raspberry Pi Compute Modules to the CM4 or CM4S.
>>> could you explain the breakage more in detail, is it kernel or user space?
>> This kernel module (which is sought to be upstreamed mid-term)
>> requests GPIOs at runtime for a chardev:
>>
>> https://github.com/RevolutionPi/piControl/blob/master/revpi_core.c#L50
>>
>> That fails on BCM2711 because a different label name was used,
>> even though the pin-controller is otherwise compatible to BCM2835.
> 
> sorry, but you cannot blame the mainline kernel for assumptions in out
> of tree drivers. What happens if another driver relies on the existing
> labeling?
> 
> How about detecting the platform via devicetree functions in your driver?
> 
>>
>>
>>> A little bit off topic, but what is this CM4S? Is it special version of
>>> the CM4? Can you provide a link or something?
>> BCM2711 in a CM1/CM3-compatible form factor.  There is no public
>> documentation at this point besides the device-tree overlay and
>> what's being discussed in the forums and on GitHub:
>>
>> https://github.com/raspberrypi/linux/blob/rpi-5.15.y/arch/arm/boot/dts/bcm2711-rpi-cm4s.dts
>> https://forums.raspberrypi.com/viewtopic.php?t=325975
>> https://github.com/search?q=cm4s&type=commits
> Thanks a lot.
>>
>>>> The name change seems unwarranted given it's essentially the same
>>>> hardware, so use the old name instead.
>>> I disagree at this point. The pinctrl of bcm2835 and bcm2711 are
>>> different. For example the bcm2835 has only 54 GPIOs while the bcm2711
>>> has 58.
>> Four additional GPIOs don't justify a different label name given the
>> pin-controller otherwise behaves the same.  We also had minimal
>> differences in pin assignment on BCM2835/6/7 and that didn't
>> justify a different label name either.
> 
> No, the GPIO pins of BCM2835/6/7 SoC are always identical from driver
> point of view, because they use the same devicetree compatible. It's the
> Raspberry Pi board which connect the GPIOs differently, that was one of
> the reasons for introduction of GPIO line names via devicetree.
> 
> I understand your pain, but i cannot give an Ack to this change.

I agree with Stefan here, besides changing the driver name now would
mean potentially breaking user-space since the driver name is visible in
a variety of places. Seems to me like this is too late, we should have
caught this during the introduction of 2711.
--
Florian
