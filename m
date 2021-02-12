Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C59319CF8
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 12:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBLLAo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 06:00:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:58138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231189AbhBLLA0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 06:00:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D633C64E74;
        Fri, 12 Feb 2021 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613127586;
        bh=dOd1zYO5Nn3XjGlskgniasDG7qC1K106t/ncttY1SFA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KlAVFzmQf3dRDjZ2VsKc44xbxM2HVM/xXANy9/mH1Lc0Q7gaHr+sbt4eB6rFecAXi
         U/SK+fCbHjCaJXw7fANSRhSs+VlTWmg0PBjla2sPFNocvgPAPOHo3kEKrjH5AZsbcf
         H+BmHbGqD6N0E/SALcfMDaJRtcZF7T7OFe/uKbDmX33B5SLdsASL+o63Y0QWSaOhR/
         I6FzmTGjkv/NpdA8GGFSl6MflzsyNONm4VsPvJMIMMLGdt1hEQpWO6i/vsa7F1ZaKO
         FsfrjUKnOgx5unHMmNsvvREV4y8LjLSVaZhB6Q0vTWt/665XD3dJoTa/1Eh9bWTWOV
         BXI+p/GofGp9w==
Received: by mail-ot1-f48.google.com with SMTP id d7so7995803otq.6;
        Fri, 12 Feb 2021 02:59:45 -0800 (PST)
X-Gm-Message-State: AOAM533fT7KiO2JbsVB3GUbxHK58lRu67zKrlcWCTsdLiVOAM5ukRmCn
        8Y0T5fGUXIQJrXfouELNyb4yFDUOlLWWZPuIUes=
X-Google-Smtp-Source: ABdhPJxoCU52cPa6mMNIYZ4rlHNGHt0GAr1YboH3ddJ/xg8j+7AlHTLAAdZ5/goMW//JHfda63J+obB+1jMAxrX89dw=
X-Received: by 2002:a9d:6c11:: with SMTP id f17mr1599122otq.210.1613127585105;
 Fri, 12 Feb 2021 02:59:45 -0800 (PST)
MIME-Version: 1.0
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com> <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com> <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com> <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
In-Reply-To: <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 12 Feb 2021 11:59:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0aNfF5D+y--5-reBYO2svykCJFxpZ=1dJoK5JDGHPqKw@mail.gmail.com>
Message-ID: <CAK8P3a0aNfF5D+y--5-reBYO2svykCJFxpZ=1dJoK5JDGHPqKw@mail.gmail.com>
Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 11:42 AM Song Bao Hua (Barry Song)
<song.bao.hua@hisilicon.com> wrote:
>
> Ok, second thought. irqsave before generic_handle_irq() won't defeat
> the purpose of preemption too much as the dispatched irq handlers by
> gpiochip will run in their own threads but not in the thread of
> gpiochip's handler.
>
> so looks like this patch can improve by:
> * move other raw_spin_lock_irqsave to raw_spin_lock;
> * keep the raw_spin_lock_irqsave before generic_handle_irq() to mute
> the warning in genirq.

It seems that the other drivers just call handle_nested_irq() instead
of generic_handle_irq().

       Arnd
