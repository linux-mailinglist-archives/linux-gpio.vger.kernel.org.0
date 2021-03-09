Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA03332C32
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 17:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhCIQfn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 11:35:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhCIQfM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 11:35:12 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B33C061761
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 08:35:12 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id m11so21427937lji.10
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MPh3fYrpynT8qqoQI9nObnRXX03m69XX0kkoxFbQtug=;
        b=GN41IGu42t9gXi3ED2C8ne+gWDPFIl3Cz+zhDgMErK/I8nl0dGuUEVs/SOVXHoc9Oe
         ilKTLAhuugELeyAiW1l7FwDwfoafn8RPjAlAQhZ2l6o/ZwZsSBLL7iOi20PgRZRw16rn
         zKT7aEBeaKpc5NwhEGaXJHg9+xQe2yJ3WMLdeKBKjNY0ecbISMGm4+UsVsBtN+9zbyAC
         1GTmuw3QVL1jWa8r409pZCvBeVAeiPTmtIhmdtVk0hhFgyMIrpnQ824GfENt38eoogfl
         QBtR1A3uCoHEQkvKOGVKhz3FGPwmdcvg0irrgkrAXnE7tQ0LRRfabW5cEhPNALjc1guq
         RSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MPh3fYrpynT8qqoQI9nObnRXX03m69XX0kkoxFbQtug=;
        b=ifJnf6uif1MVSBtf1fGqrGR2RnPim5dj5SuwH14aQH/uhs6pbRqDvikrcAxRjPcLiU
         yp3BQd5Trvcxr9snavUMPwACNW5THKc3dsy/PqsGmPR4POv9BjVPuilHMouLaQYbpBq4
         oy3x2ZgcKhY4eFVvSZulb+I9MhV715sT0KXT2m9Ei4nPZkdoDT0GDyHnv52DE2KFs6yR
         M0cvVDpgbE65i0BOUkyNNMrPOAGpIz6OagZAZQSuHnlKmEVcmbRED9bMFHRxW8MJT0x/
         TmaDb+17VISGuyJKzXtj92JaANF9NnsJSRP65Rx2v6LqZsnebLBWM//YOeBn6J3AVjKA
         GHvQ==
X-Gm-Message-State: AOAM530EbCBjFo9lB2oTG07R7TUEFw+dIbNzIwdlsiDWBLpyc4fWSBt8
        fBYPr72HpZ5WE0ou6jvsGajnNOuZLFsv6WzBCdAVkQ==
X-Google-Smtp-Source: ABdhPJwx+vgRcYzzK5JGSjQMsz6ywP+zUvsGmW7juH6Hhh85o5Hv3QjRB3wk0V6V/HIy9NeuR+ZZD90xGrXYfnhHYpA=
X-Received: by 2002:a05:651c:103a:: with SMTP id w26mr14919558ljm.273.1615307710918;
 Tue, 09 Mar 2021 08:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20210308194535.66394-1-andriy.shevchenko@linux.intel.com> <20210308194535.66394-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210308194535.66394-6-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 17:34:59 +0100
Message-ID: <CACRpkdZmE2wCfhJsdCaVaaJbVDtvgReogVgx9_fpG=0YRS-U+Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] gpiolib: Reuse device's fwnode to create IRQ domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 8:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When IRQ domain is created for an ACPI case, the name of it becomes unknown-%d
> since for now it utilizes of_node member only and doesn't consider fwnode case.
> Convert IRQ domain creation code to utilize fwnode instead.
>
> Before/After the change on Intel Galileo Gen 2 with two GPIO (IRQ) controllers:
>
>   unknown-1     ==>     \_SB.PCI0.GIP0.GPO
>   unknown-2     ==>     \_SB.NIO3
>
> Due to the nature of this change we may also deduplicate the WARN():s
> because in either case (DT or ACPI) the fwnode will be set correctly
> and %pfw is an equivalent to what the current code prints as a prefix.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
