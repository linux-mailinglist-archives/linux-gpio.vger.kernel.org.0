Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D072081C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 15:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfEPN1y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 09:27:54 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39113 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfEPN1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 09:27:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id f1so2645445lfl.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 06:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7WxjQCsvVCJYqyumRz+jnewVmeYA5zYY9VNykeSLVi4=;
        b=cYaJwB40usbpVQi7JB725NH1c2aJJGSyxQSvdM2jZIHDEJrHsmOgi20KVuuo5unVIL
         5CCZ/gPl95YUInsupxVWgVV6iT+QF+Kw5zttZAATHls+0an8Cunb/+ukCDTaLAQYdgOw
         +upnD5HLCdC4d+PBExK6UwEPtRltfx4Q5Xrvgusq2WumgfPk4qwaP9UT5X9HjSmF859a
         KO8fejjCw/x147mbgm50wo6y+jIbj0H/CF9Wa4kALrUwKiwT96T1FDObrDwfRJHH9WOV
         o6UcWtt1zmQcHhJCRG8iP+08LE77Cx2n4+nvD6HCkR8KKGWxjHY6OPihuGTPs+yp10Ue
         4PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7WxjQCsvVCJYqyumRz+jnewVmeYA5zYY9VNykeSLVi4=;
        b=QO9maN+JYTeDHfsGpbfLizJcxLDkwIw+4LpTP4Yftz3ExEHgjx5bW50DH5UwPGva/H
         Os9ioPpDT9PxVWDDHInzB7i8u9IUfnfICIOcwQUavvgFBEGgl3zUCyse+M+zOkkqjN8w
         ls3sfWsJKEcbie6/5U83nJZ1fjvuu0PBJ63ublVcAJhGD8MI/L8cKqpQk61A+vxPNsba
         0K16dmDXcTqABx2EGMUaWNld9f+wHyIXuC5OaG7rT+eACYOgWA7xSVdDNkUp1SNHmZy8
         6HueJaXEHfKTTIKc3uOtcEe0/xunX6DFqhyuqOJNFS5I4NFHiJWTPnJZC/LY8mKTj0y6
         y06A==
X-Gm-Message-State: APjAAAVYIDN19RiMJZtzkb/JfCjdzThlEJ3kNr2iQRzUQGVEC9to+wjy
        wl3f9rMfXXVLHsH2qcqODWoGuUaD5FoY8BC9y/fSOA==
X-Google-Smtp-Source: APXvYqzKRSRZrOSzb8j47r4z5gkvvcvXMc+KXeXLn3AMVGqrIIudEn/2TzBR5TN3TJK02fLAdgUvNPBy8HDUhhbEpdY=
X-Received: by 2002:ac2:482a:: with SMTP id 10mr10554822lft.51.1558013271860;
 Thu, 16 May 2019 06:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190509205955.27842-1-f.fainelli@gmail.com> <20190509205955.27842-4-f.fainelli@gmail.com>
In-Reply-To: <20190509205955.27842-4-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 15:27:40 +0200
Message-ID: <CACRpkdY3-yARtO9KQnUUMNefygzLC_c2RRn+ROZUdYfBJkRASQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm2835: bcm7211: Add support for 7211
 pull-up functionality
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Al Cooper <alcooperx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Doug Berger <opendmb@gmail.com>,
        Matheus Castello <matheus@castello.eng.br>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Lukas Wunner <lukas@wunner.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 9, 2019 at 11:01 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> From: Al Cooper <alcooperx@gmail.com>
>
> The 7211 has a new way of selecting the pull-up/pull-down setting
> for a GPIO pin. The registers used for the bcm2837, GP_PUD and
> GP_PUDCLKn0, are no longer connected. A new set of registers,
> GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
> a new compatible string "brcm,bcm7211-gpio" and the kernel
> driver will use it to select which method is used to select
> pull-up/pull-down.
>
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Following the discussion with Stefan it appears this patch
needs more work, but you will only need to resend this
one patch.

Yours,
Linus Walleij
