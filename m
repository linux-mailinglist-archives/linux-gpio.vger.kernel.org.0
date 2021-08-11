Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CAE3E925A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 15:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhHKNPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 09:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhHKNPf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 09:15:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6CDC0613D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:15:11 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u13so4509088lje.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QnPec/eU3m5mrGi8LuznMYLQZYcf94FA0C0JW0LKAsE=;
        b=Z4BGEDcFQm40VEQZa5db/CsHBKubqcnothoCk6vr63Kwm23e7kpfoTtbP9DkxWfq/k
         OBwPNlz/60Okj2o50QasFWalTeAD/fPzCn4fyX4SPIdcwFBFKcSX01jhHr1Mt+jf8ohx
         KM1+id+XqrMN2DDKx51q7KnlSRDnN14Bfd7nnw4ulJTXzQyPBb8/epwSZUb17GURgoe5
         zI+jLan16F1BAo3FKdCbX5cc8vVIXN5f0/oPkS4wC9tkyNTQdsopFxXJBOAwdsH2G/3D
         5JcwGmw0v/q7CuKUqxvWgxym/CKP2Iz2f+jC3YcCINT+ogwGHQqR/uHlOgjJeUvwDweN
         nbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QnPec/eU3m5mrGi8LuznMYLQZYcf94FA0C0JW0LKAsE=;
        b=f2hw7WfUcHEUpouxyTRQsmVXRs1MeL6+0R7Ie7wfeQJUM4M8o+gjZyoaedQlo3AtPv
         F06bRPrBfFr22sJNdqKGm7mzuAOmNZlvnklm3MCgCiCIFPvAn1bd1zLq/UHdRIGdMs/z
         d07DIpCQutAGKaHCRkgJYZis2XI2O8QwbRW1lgxOGT2aO+pe4qmzqbGLed1zbTXQUL9T
         zbezHwoOfRY3Vnn4FE/az01+sztDzYg2ZTxvpW87UKSXBPZqJZUWYBucynzlVKCUWiop
         vQNWwobqbT9ZT6HWbI3cCYOlv2qO5bHgDizI1wRCL58lwbhf04G1h+KIM3JQHCNtGiF+
         MRKg==
X-Gm-Message-State: AOAM531Zl7JDDoS9u1zAtdPxE7y1E7XzCrmpSeRJLSDV0nea43pxypb8
        PwvOTzxsaXllQmSO3XpMy9TZrjwCNogoAG4J2hm6fw==
X-Google-Smtp-Source: ABdhPJzQ49y/p7eQbXtrGCUwcwb6bOnAuZY/TiJOLyqHA715bqGHS/zInWLNhWv/fFJqtrPHcKCUiQBx2ORHGgB2UZw=
X-Received: by 2002:a2e:a231:: with SMTP id i17mr12773519ljm.467.1628687709990;
 Wed, 11 Aug 2021 06:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210806143711.37553-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210806143711.37553-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 15:14:59 +0200
Message-ID: <CACRpkda+t4ZhL1bP1a6Cwnh9rYH9Hj59_7VLg45KV+Va5iBR9w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] x86/platform: Increase maximum GPIO number for X86_64
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 4:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> By default the 512 GPIOs is a maximum on any x86 platform.
> With, for example, Intel Tiger Lake-H the SoC based controller
> occupies up to 480 pins. This leaves only 32 available for
> GPIO expanders or other drivers, like PMIC. Hence, bump the
> maximum GPIO number to 1024 for X86_64 and leave 512 for X86_32.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks reasonable to me.
The goal with the whole descriptor refactoring is to get this
completely dynamic but it turns out to take forever. It is as it
is.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
