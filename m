Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7157193484
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Mar 2020 00:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgCYXWD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 19:22:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44614 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgCYXWD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 19:22:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id j188so3258951lfj.11
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 16:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qhW5FhFJPma8Wb0feZ8bxaFJGrNMO5hA78xe1tAN9Y=;
        b=r/bZnUDSBXeeA7cyJ0mOWHRGA8PId3tHoaqgDDecr3umjCy9j8txnJ4/2qLdrb0OnF
         /fo8CifFAUrmHEwXb9qYlkhDQTljWago73w6R82FrYXJAzZXV43L0XJqjSk8s3Xn02Zx
         Es5SEStLIIj9mM4aF0YOt3s8KXgFpCpT5GM455tSpr/1zEl8Dm/Ks5xtXEQIZwW1cOMr
         e4nioru98dXVkqpzdswA96LUSt4ffeM2yGuJ4uj38T4Ri0vgLtwRC2BfV6omPE4ZtsNn
         II7HJJO/R9ZOSmxYpPWim1cbYbLVqJmASsjBiuawMK5fMUkMuTbvXVdNep+gr6X3ZnkS
         Izhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qhW5FhFJPma8Wb0feZ8bxaFJGrNMO5hA78xe1tAN9Y=;
        b=PwqyNs/h1lYQ4XcWL3WLIAxoY7CG1bkh3STsCzTnMDtft4UVEGsQ7+xu1VCfxzAuAC
         jrCdL/CnbXPHVfzb0pr5VBCjSyVrmvs4Nrr3QHzkk6+vTN25t96rtTGbM5stvpxicTTF
         KEhSqWp+nr8xEQ2h0kxEmVFnD2vC/oHqWMfdgfMy6nDnQug1cx89iP/VJK5AKt8mmX8a
         WmqBD32prRUa5VmDYmqxXh+ULXTcbHEyhqA5WMCspXwmNsDhWzysxxkiUGMz2kbqXDRv
         0hMHjeNAullih9CFxd9Eo8XV6tjMR/djl7FgmA2JbieCTAxugiNu8PGXB9YVOih01BtL
         BjJQ==
X-Gm-Message-State: ANhLgQ1l8ReiZZuExg9QFKsEFY+3C6hjrOsCsFEnQ5BYnHiQrO+sUqnB
        /ZRHje3lK+bP9SBXWLMk2ucM1GMTH/iZAAUiZgUo1Or9aIA=
X-Google-Smtp-Source: ADFU+vsTI1xQYolABerKaZz3l4jmbcwoSR4cORPOZ8xU11ntWWl3udutgZo5AbBj3N2EGz89+iBoJW921Vz6yOGw2UI=
X-Received: by 2002:a19:6502:: with SMTP id z2mr3676524lfb.47.1585178521143;
 Wed, 25 Mar 2020 16:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200322094156.0ab534c1@nic.cz>
In-Reply-To: <20200322094156.0ab534c1@nic.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 00:21:49 +0100
Message-ID: <CACRpkdbsYAUppb4=EiWXuE6Lq6tAk4fNfMhz9hHf6VvEfS1O=A@mail.gmail.com>
Subject: Re: REGRESSION pinctrl armada-37xx
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 22, 2020 at 9:42 AM Marek Behun <marek.behun@nic.cz> wrote:

> Hello,
> I am encountering a regression caused by commit
> 06e26b75f5e6 ("pinctrl: mvebu: armada-37xx: use use platform api").
>
> The pinctrl driver won't load with error
> [    2.374219] armada-37xx-pinctrl d0013800.pinctrl: invalid or no IRQ
> [    2.381309] armada-37xx-pinctrl d0018800.pinctrl: invalid or no IRQ
>
> I just spent several hours finding this, because it caused some weird
> bugs for devices using gpio as irq source.
>
> Either platform_irq_count should get fixed or we should revert this
> commit.

I reverted it now.

Yours,
Linus Walleij
