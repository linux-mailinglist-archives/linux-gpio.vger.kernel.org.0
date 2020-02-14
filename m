Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B465F15D60F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgBNKvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:51:12 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33723 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgBNKvM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:51:12 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so6485692lfl.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CR6bHnHZoiHbW3grDbPXu+tcCdPNxFUy7DMGVKDxrdU=;
        b=ZB/WaJEEHKN4vlxH4Q77+OOPAi+yH8uvWMar/Wo92sc05nEqDy1nHiHv81sCC4R5HR
         zTc4dktstCFOctS7NkFCXjG+Ipo/IDcXN9dbAhdXA+B2L199AvWrW6QOtw8hJOD90GWm
         F1Q/Jj6J4kTXfQoaifWXQg25FyCdxlrApHVxhQ+t3RBpoNRuL8PfBf7DEe1OUc/5qAi9
         Ah5TKSHu2uHQjeQJyaw1GaOiOWzQ3ogpcfBf4wBNsZG/Wfe0llzLv5cMm0evS8OofkAo
         ud43w92m7GJDNyF7Lhn70lpUJLD4Gd11c5o0rSba9R9yAHy/hlq9rFPX7p4Zfnzd7K8o
         EhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CR6bHnHZoiHbW3grDbPXu+tcCdPNxFUy7DMGVKDxrdU=;
        b=R4aMnOELd+hWORoMlMZY09NdHN5eWIOP6NTJQLmokASL0o7zEbzYF55tlE36pXS7L9
         g3F27EMlrUcE47fZwz+3LQpwPrg5twYgzaekq/SCK+D6YuYaWT9JgxAc48EKdKmOkHw/
         srUf3Wk6kkye7aMZPq+rlo963bo5q4sUaIp2s91mUGjDk5DrA3BBSWPWNTPYmnv3muyF
         CNph7uuvLpc/ZWlwJb42dFZW9eFJtOKMx0dg3o5sapblsLN3jVsuS+SisqT4snNosjFy
         PxhaP04XWw4CPKiaHIO3SHocbscV2REFUGilJjYX0ph/HRFHsORZDM2T3Iwq3jfYS6+b
         7bQw==
X-Gm-Message-State: APjAAAWxeXDdlY8atvxxK4opkr9h7Eh1DOnUrZOm4C7k33AbftjVQlqs
        XIMIRqLk/x0pw7qLClJAEufvkVN0A+ZPR4bIS/LM5Q==
X-Google-Smtp-Source: APXvYqxkkMaDIwfsdOgCTxqXpmc37h41kvnDJyCa02wuDmWXS8mAwsvAa4bQZ7hGMY56bSP/KNt/TUd5+tIUbXiS0ig=
X-Received: by 2002:a19:dc14:: with SMTP id t20mr1374192lfg.47.1581677469885;
 Fri, 14 Feb 2020 02:51:09 -0800 (PST)
MIME-Version: 1.0
References: <1581166975-22949-1-git-send-email-stefan.wahren@i2se.com> <1581166975-22949-5-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1581166975-22949-5-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:50:59 +0100
Message-ID: <CACRpkda1M_B9VXjsTPmcR3zG=xS0uVQMPPYJ5H-BAj3=fQk4eA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: bcm2711-rpi-4-b: Add SoC GPIO labels
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 8, 2020 at 2:03 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> This adds the labels for all the SoC GPIOs on the Raspberry Pi 4.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this through the ARM SoC tree.

Yours,
Linus Walleij
