Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD87632CEA7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbhCDImF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:42:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236282AbhCDIl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:41:58 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD797C06175F
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:41:17 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d3so41805981lfg.10
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Okv32JXF1LMpLYOCEvzIN6ZERj01qsUHCNfZJbYyz2A=;
        b=K2shqvyzmTW+cLGDnhOmTYnLGZyLbMMHz5JymrPCVIvwQtTzT8Ad6ncnH+IiNBjcsr
         P3pAWxUIMZXRDAqQEsctzuA63QuxX8l3KHdMWpm6lwGlhI5RYXINWFlW15KjKc6cxTOx
         1luYDrXN/257vAhXxO/mkzjztS2Ao/j3mOf7aitXvKDcvySHnDKzyKKr3OYTP5RSCnby
         s3eBJMmx4WAs0xr6aSUO3pKhnpd6FPqk0ed39pOtG0uH7egdc/s/0456xXFocagkunpg
         Uzuy/ZntHwfnzqCLkHP3JrKiqdO3WWe9V/g2R8gxNppPO7bfQ+urer2iFOW+USmiarcm
         qhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Okv32JXF1LMpLYOCEvzIN6ZERj01qsUHCNfZJbYyz2A=;
        b=Kqq/0CStPxvdlXKnHLn4uMj45VmehqDe2AGPtUaSxV3Dyk+U569m14n6EzynfiuoYl
         l27ZcxTS0iduO9qJsIKmzUkKI3uTwiz+xiNXEfkCxjAm2qmRzwVD15ZANqGpzO8OI/86
         ebaIUFeLYV3o4JEpc4+4ZHv91ssik1MJATjo+Jq5uWtHq53u4EqmbgF2PVFektShmHqV
         mwpYQHBcTkjb+AxTa8wafkmVce1nswbd4UZb2mh85Xxob7PvGnofgdqhW1UYaGdmjdoU
         iEB4M+VUfpo6N6mkV3654/JFhweBSDsBvZNtB8lI73ZYKjO412ygUGn7L6RJUaWdzhpV
         847w==
X-Gm-Message-State: AOAM530kffonPN6/IuQ7bYkH6pJI5z87f9W9KXCxzOmDfWZaUDCRBVDL
        vZhHQtJF6bI00uxTAm3stpME9mHdhMcfDONTDBfrmN7DTscQeA==
X-Google-Smtp-Source: ABdhPJzFNOWIPzQOlLTgpY27J/Js+axbe02741mFnHIctJ1aRf0jQYagS8DAb+7ZJ85hQttej8JHI/gsBlcJ4it1CtE=
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr1579805lfg.649.1614847276334;
 Thu, 04 Mar 2021 00:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20210303131858.3976-1-shawn.guo@linaro.org> <YD+iWuLS/9knWLFb@builder.lan>
In-Reply-To: <YD+iWuLS/9knWLFb@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:41:05 +0100
Message-ID: <CACRpkdbZNJR5XaNaEWxwKdxED2mXnN_bN+mLjfPRMxyxVP3TVw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 3, 2021 at 3:51 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> I like the fact that this solves your gpio configuration issue, but I'm
> uncertain if just adding support for configuring pins (in addition to
> groups) in the driver is the right solution.
>
> @Linus, to summarize, the Qualcomm TLMM configures pingroups, but all
> gpios are defined as a single pin. pinctrl_gpio_set_config() is invoked
> based on the configuration provided in the ACPI tables, so Shawn's
> proposal is to just implement "config by pin" as well.
> Would this not be a problem shared with all pinctrl drivers that
> configure gpios in groups?

It is done as Shawn does it in e.g. the Intel drivers.

This is a side effect of ACPI: ACPI thinks about the world mostly
in term of GPIO pins, there was a pin ctrl draft at one point but I don't
think it ever got off the ground. The standards committe just has not
been able to think about the world in terms of pin control. Or they
think the pin control abstraction is just wrong. Could be either.

This means that on ACPI systems pin config will be done with
this mechanism but on DT systems it will be done another way.
The mechanisms are essentially orthogonal usecase-wise, it should
work as long as there is some proper testing and concern
for both cases.

Yours,
Linus Walleij
