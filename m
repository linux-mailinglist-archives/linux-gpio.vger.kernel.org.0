Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82BA43779D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 14:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhJVNAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhJVNAj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:00:39 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB18C061764;
        Fri, 22 Oct 2021 05:58:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id ec8so1411791edb.6;
        Fri, 22 Oct 2021 05:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdVW3UDZwK61lxuEJ1bpro4jif3jQr2QR2HEc/tjWM8=;
        b=EZ1t7Sxrf/AR2RQHe2Io3nofGIoyEMedxRDuXeZW3sRr0uYWY5LV8l75w5jLWDeeKI
         6cUd6LvLAlhmgM6SdSDEu+jnanWNTQ1UKnOA7Z7OBVoa7OrePjcAZ+ZIm4hxzruOvBMe
         Bgipn3FntDMtxHTqyfnE/3t2hoUimKKlB+6H3j5lzwTzgdrLDxMUhugew1Cls+CVSHrW
         xd4RzkeB7gxreJVvZ/HFxgntg9KTtbiWQCe9zSKPFpTdVANPWLtXqHEF+24sU+sKad7m
         JID86uGa09Ja5zlrFg4HV4wpUTxzUyqDxaGiV6VS8Ffl1G9RpXD6aWm9rTTztVTsHuTF
         hAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdVW3UDZwK61lxuEJ1bpro4jif3jQr2QR2HEc/tjWM8=;
        b=AI0umt+GwqeecYT0Ykq6yEuRytl/odbH691eb8nVdCqWdBQqm8uOK9dmCet5EFZN+D
         UaH0zCF1FK8RrcEgiULZOeKY7bU6lheGbh89S3ScsSBCMjVFs3G8Tiu8jP0Ur9NnYA9f
         fe7czaqeXEyPqAQRm1g1ae2RW03xdtOX77vJQQNIWNMRHXkHxqx6YSuedREjWPKx2JwC
         StMh3dQxfWa4QV3uU1uX+BszbdFw2VxmDFYu5jVj83B2uboLP+8JaS7rEbxFBejRbGdD
         ZvXZxOnyLO/xLblhVwQx+vreAb3BbR+FUJQiiUkonxtqwPcFPEEaESzGe3y86F/MrgBv
         RBjA==
X-Gm-Message-State: AOAM531ZtcZdcP/f2wJhOtVIvXkQeaGYY7pMXtRX20JYHbLK1lB1FnCU
        Pll2KJboVF2VAq3BDQz3BTmKkTg2cgkHk/0clO4=
X-Google-Smtp-Source: ABdhPJzI6SPafEiE4F549hcNejQttJOvb88iWUSJhYHI9dOlN/rKwPp3nG//aadx/SQnubpgY46qi3WPu+hgYtvYUpk=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr14112090ejb.356.1634907500360;
 Fri, 22 Oct 2021 05:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211019160401.8296-1-mario.limonciello@amd.com>
In-Reply-To: <20211019160401.8296-1-mario.limonciello@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 15:57:24 +0300
Message-ID: <CAHp75VcoKYvbMpAmyDjkBtt1bL96RwSD0DYcb96hRO6n3aXe9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ACPI: Add stubs for wakeup handler functions
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 19, 2021 at 7:05 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:

Thanks! My comments below.

> commit ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")

The commit

> added new functions for drivers to use during the s2idle wakeup path, but
> didn't add stubs for when CONFIG_ACPI wasn't set.
>
> Add those stubs in for other drivers to be able to use.

...

> +static inline int acpi_register_wakeup_handler(
> +       int wake_irq, bool (*wakeup)(void *context), void *context)

A bit of a strange indentation. Can wake_irq be on the previous line?

-- 
With Best Regards,
Andy Shevchenko
