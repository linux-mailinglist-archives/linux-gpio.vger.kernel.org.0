Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE96167FE0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 15:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgBUOPN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 09:15:13 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38471 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgBUOPN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:15:13 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so1597370lfm.5
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AkDE61A38BuP/ygTbozBgf5MHpH9Vo95SRLvSWO439k=;
        b=t6Dtm2xouaekc2EYrWLEiRUk9zuzsx/ycSUdwto1vsa8hH21/0n0fsS5EpTujeRKQY
         8cObip8/t43obcYamNuVdIlHszzzCp5VGj6iyMSEieDfy/vR/lx5E6LccTtYZ83AOfyP
         oZECnvFBM1fTQI9Hc933Gn3ZkAOWB0Exf7IQsnk3yy+tySMBmH1NCFPCdUsmF7AiPWXH
         VKMqvJr6BsuzUCZxCOut1irILOrmr8G6HWBoZcUMvtJbz6e6OPfpV0CUqlZO9WuoScWy
         Nt4NTixxcAszC3FBbeBToY0zMqja6JoruuxoS5PaAyrp82LcAs4KNPi7QOHqHXoKyOdB
         Ap/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AkDE61A38BuP/ygTbozBgf5MHpH9Vo95SRLvSWO439k=;
        b=M6RfuVTUQ3iIoLah3vf3v4QTqI7IICV1BGg0e7jzCESYt2gMogKI921SoD2bAGKMv1
         4zku8r1VKpQSKINgDhx9qAuCU6Jq3OwWO3P9XLLWGsxy+nyP3Vjh3L6A5E+EDKSTIcDB
         /PF8uCRUXAgR+93r828k9uk/ci1iQznlUyAr4wX1TBA2ODknWWgFlMUpqSDFV0unsLhm
         uOHShZj0qm52+yRjm5/Jekdh0yBEkwZGdWyP7k+krrWIG4J8aANP/0Mgat6UsN+7hrSz
         seIOm3o8esrwG+4L623pu791uvpffwCfiGOrvv1VlGbDhZNR8mmubuSeDIWwNea0+hEO
         8kvg==
X-Gm-Message-State: APjAAAVIGUgA89PziSaiP0BiH1eJ/DZuJhDKMjsA+D/luZ2615CBAr+w
        evrlWoKiK3+cZ5aU0nR061IWaSZVmzrsmE/6NvZmyw==
X-Google-Smtp-Source: APXvYqzecyE8QpYi6cdaz/TQalK+k7VYi+YdD5LPqzgQdo1IqXlfsRa0zlv4Hf96qBf+2V4EYlojhnrFM8/XTBOXs04=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr20122200lfb.21.1582294511956;
 Fri, 21 Feb 2020 06:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20200117213340.47714-1-samuel@sholland.org>
In-Reply-To: <20200117213340.47714-1-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:15:01 +0100
Message-ID: <CACRpkdYtmRWai8X4yAxNt57zT2eUyLdkDaYCmB=0BU62zAa81g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Forward calls to irq_set_irq_wake
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 17, 2020 at 10:33 PM Samuel Holland <samuel@sholland.org> wrote:

> The pinctrl irqchip may be connected to an irqchip that implements the
> .irq_set_wake callback, such as the R_INTC on A31 and newer sunxi SoCs.
> In order for GPIOs to be able to trigger wakeup, the IRQ from the
> pinctrl to the upper irqchip must also be enabled for wakeup. Since the
> kernel's IRQ core already manages the "wake_depth" of each IRQ, no
> additional accounting is needed in the pinctrl driver.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
