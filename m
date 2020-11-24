Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4512C2101
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 10:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbgKXJSS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 04:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731084AbgKXJSR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 04:18:17 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D82CC0613D6;
        Tue, 24 Nov 2020 01:18:17 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so3070325pgi.11;
        Tue, 24 Nov 2020 01:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TX0s0mIR0wt/HcYW5SNqzmfoKqx6TwmdMniIzsTXvlM=;
        b=i4p6UDUsRImUT3ewIRw7Z/DjFfF7FfVS5iLPZTjK78SzqdWSYMl4rsf3hEglOjh7Hz
         LWU9XegimSQVcxPK1IRcdDM68+VgKn3nuJbf1vRoS3winwElp/CqCjr4Bhn9QKCv0t5z
         2gX+mUfERAuzIUaGA4HbvivhfSZGg3/a7PZPcqkL4QudhDVLFhwkeftkPJXvPQGZ9mK1
         rzGekuLYI/tj2VIZWFqrOsF2/Ipc7AwLoJPedOB/pxKkuI9PfW3knSthvb/Ne6sEbMRn
         c1YKIueYsacinbH716qHdAoLHMuAzZJl+t9btA4ckBft/agLCJlZ2p1OPtSkammjWtGp
         StrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TX0s0mIR0wt/HcYW5SNqzmfoKqx6TwmdMniIzsTXvlM=;
        b=Q2WFYUPb1TujX9cqLMvaV6lrOSbC5epiDqZLw2gndlf0+X9nQYlhEgziy6A87Rr7IT
         b0lTSmF6pQAAtfHJbvgqLHh4sYxOzey/IYQSGndkL7NQcyoNXbNMpPllB5WyBglQAA+l
         7Ooe1HzHNcpoVu88arA2nCKK0HiZzFngnKmrZX8LXukV0JjQYw0inntb1FH16zg8nXH9
         9oKF/GcKpkjN61JZ9+u8/she3W3MnLTZG3vxyM6EwxqBfrnO2F7E1hWMZsL8C4bHEAnr
         /PlPk3gXdz5QzdwD1KJ08EKotx31DTWeXOrfQnX0sESaPe0fBxYIp7mL8II0Mk078moS
         hXWA==
X-Gm-Message-State: AOAM531lZIWM96am4XoeHt/nn35tdbkk/qOC5RG+7EEYKI7b7fpfyRaD
        dqvUpfEDTBrbkojN/jC907RPFyTqwHXBrZwcxAs=
X-Google-Smtp-Source: ABdhPJyOhS0omFAjIgJdkshqp0eVPfkhnPJIGLR2zFPBNOyY8wO2ECdElnB5crvqZ5axanNabYwDxjgyaZeqZvkhj4c=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr3941316pjh.228.1606209496608;
 Tue, 24 Nov 2020 01:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20201124061720.86766-1-aik@ozlabs.ru> <20201124061720.86766-3-aik@ozlabs.ru>
In-Reply-To: <20201124061720.86766-3-aik@ozlabs.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 Nov 2020 11:19:05 +0200
Message-ID: <CAHp75VfV4mG23C9Ep1vNLk2oBjB=LTQGyU=fhWPhw4PX-Ci-7A@mail.gmail.com>
Subject: Re: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ allocation
To:     Alexey Kardashevskiy <aik@ozlabs.ru>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        "Oliver O'Halloran" <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" 
        <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 8:20 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
> passes realloc==true. There is no obvious reason for handling this
> specific case in the generic code.
>
> This splits out __irq_domain_alloc_irqs_data() to make it clear what
> IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.
>
> This should cause no behavioral change.

> +       ret = __irq_domain_alloc_irqs_data(domain, virq, nr_irqs, node, arg, affinity);
> +       if (ret <= 0)
>                 goto out_free_desc;

Was or wasn't 0 considered as error code previously?

>         return virq;

>  out_free_desc:
>         irq_free_descs(virq, nr_irqs);
>         return ret;

-- 
With Best Regards,
Andy Shevchenko
