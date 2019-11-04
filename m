Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77936EE329
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfKDPJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:09:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42600 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbfKDPI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:08:59 -0500
Received: by mail-lj1-f196.google.com with SMTP id n5so6990348ljc.9
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I2P23QhNE1G8kk0njhmHCH8vsvoeArQ+u/cjyloUhbo=;
        b=E39b8gQ/rCDtgC0Lo2CA7pX7G2ymuCfKBE9+L/7j7v5H6HAn7Qc953ERm2JVf8u8eS
         Fm8MC40kWgQOxOXCmpwUcuoCxgF6RFCSY4fSBSPgC12rwm7hyDf1Ch5F3d+NGpNV39rO
         cmOBlzzznHAs+8gW+WNYNCJn4/+fXSMv+A1lIpJFWUWZFWww/jOXHxHMzSl86kP7dQmR
         tt6jkUZw7CJy47pDzl9Nxrn/MYhvTIRPG6oGYlO3ex2QU8FnaxRjOGU4fo6yYrdd6vrv
         AgO6y5ilkEJMh1fWkwBIXBS6a2WfDtk5cCwaMqv2iRBSvbHJpxpTXz+xBl55HEtrpxSd
         ywqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I2P23QhNE1G8kk0njhmHCH8vsvoeArQ+u/cjyloUhbo=;
        b=ahgXAeBapxwuKRaBpIxw2zoMPSzMK+RYXzQX0dey7HxWdw5PJCHN6DiC9YIaaDRHMg
         7MLGrbRcMy+5+NoSW5iYkH7VM1jDJyKSFHvYVYZD3bZjhKOtRFYr3U2NfNS/Sk1wFjEY
         64Oe8GxolJSILdZzC923SadYgveZu/zcSieL3CLj0VecuxzPmhViBMhyxOC2Qa16Feys
         A7eUgPgRRLzttVsXj5LnyyUNIRNQg7LTMCSWJM258XViE2L935bappnHIMYkcbWgLWda
         8muG2TDEXNeKWoEYZIdiJYpKGW0zlMdc2BeJp017iZul5bh4yHKYIXCwZ1MC+E0Nmi7K
         gOaQ==
X-Gm-Message-State: APjAAAXDqDIgZMEnxacxIIUK7klqaSRl4t6MtgA+1tsHdE40TZImIZ6C
        qzG1iqAr73SqOt6oPFKBS1lX87HRPiW0+6+vQkVu8eVV6Lc=
X-Google-Smtp-Source: APXvYqzxmwYuAuAroyJkpmKO78hW4FYxqRFVQEEbNvIDcXlz2xSm7R02Gy1TIP7ZB+hutosj91/mMPWV1cRoQwEN6gE=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr19479055ljm.77.1572880136626;
 Mon, 04 Nov 2019 07:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20191022151154.5986-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191022151154.5986-1-ben.dooks@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:08:45 +0100
Message-ID: <CACRpkdYQQB6gxuowpm=9kz=s2gMHh3a5buySdptvXuThc2rkzw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: fix __iomem annotation in amd_gpio_irq_handler()
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     linux-kernel@lists.codethink.co.uk,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 5:11 PM Ben Dooks (Codethink)
<ben.dooks@codethink.co.uk> wrote:

> The regs pointer in amd_gpio_irq_handler() should have __iomem
> on it, so add that to fix the following sparse warnings:
>
> drivers/pinctrl/pinctrl-amd.c:555:14: warning: incorrect type in assignment (different address spaces)
> drivers/pinctrl/pinctrl-amd.c:555:14:    expected unsigned int [usertype] *regs
> drivers/pinctrl/pinctrl-amd.c:555:14:    got void [noderef] <asn:2> *base
> drivers/pinctrl/pinctrl-amd.c:563:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/pinctrl-amd.c:563:34:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-amd.c:563:34:    got unsigned int [usertype] *
> drivers/pinctrl/pinctrl-amd.c:580:34: warning: incorrect type in argument 1 (different address spaces)
> drivers/pinctrl/pinctrl-amd.c:580:34:    expected void const volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-amd.c:580:34:    got unsigned int [usertype] *
> drivers/pinctrl/pinctrl-amd.c:587:25: warning: incorrect type in argument 2 (different address spaces)
> drivers/pinctrl/pinctrl-amd.c:587:25:    expected void volatile [noderef] <asn:2> *addr
> drivers/pinctrl/pinctrl-amd.c:587:25:    got unsigned int [usertype] *
>
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
