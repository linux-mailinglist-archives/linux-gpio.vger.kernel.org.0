Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07803120010
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfLPImu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:42:50 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40790 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbfLPImu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:42:50 -0500
Received: by mail-vk1-f194.google.com with SMTP id c129so615074vkh.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eQNp7WdEHGDcdwZTBmF8OW1IvH+A0vnK1qvS4gy4RD8=;
        b=JsX0EOCFQpEiBIgwEhl/g4zVsVoSKPn8iLymWZehHBj7Uh/VTJ/d9CbE4uZaVzuYTB
         w5IiJHE7A7gYMo/g4KF7Pdd0ps1VbhopQDceyQtlWz658JV3DoUwazIGmaalqKBeClks
         9eKbYBBWTK8ErCl1JUdJj0lXntSt0KYr6uM/E1GQEmBdOrZyB8OLDsSZwSaMk6jZUA7T
         Qq6LGIoXPlVOucLZRwpQbssKV9UwV6WlIVCsBIo4qxsR//2Yb0pICA8AcZ+5hzO1Dl5p
         m9d/UZs6y2o4WkL1RbA+eC+xLVvCJm1l0Sij8v+CmIBUf9C0wbpKckaU6IK2A3Bl221L
         m5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQNp7WdEHGDcdwZTBmF8OW1IvH+A0vnK1qvS4gy4RD8=;
        b=Oxlu9AgBZlvztXVdycbhKc9QLpPfAS1SKpJ+9ySY652uajjXnoAYvVKlAjOZrdyj/B
         IlbVPS+beHjPuqwDXi5UYWAQhAIvxy41bKZqbbTrviCrE8Y6CPXFO42DdKU2On30W0Ze
         KaVGkOZ5V0YcCIcMpipyA/YBYYBvhMn3C67KOH6cvUT3D5b5+Tb6fhdZXWYHkyFeOBQe
         lwc9sENDqGqoNFa1oANyhhL3ipmoKeRKEdGRgDaTyqnhrcl0KVuirQR6dWc+oKNS179l
         2skYL/JyafvzXPDUIYOm2A7wn5TB0QQhVQEFMHC8FbBzDFzpZ0yn6qpuKO9rWpDHZKhf
         /osQ==
X-Gm-Message-State: APjAAAUAnwU0QnHx9MAnrHCj6kyPrNMvbS2ZJtL0GpncfKLHhz3UL8qC
        OiSp6LaB0N1Y1J0WkpRE5jenoTMS/9OJpbbySTIgPw==
X-Google-Smtp-Source: APXvYqxSMRUWCpLigSnJ2HhQ+kJiuwNEHl9riiOJPkbXcQ7uYPMpwtCI2iqMkQSBGgcfiIQqPNPOPnCHfjFza9NDkFk=
X-Received: by 2002:a1f:fe4e:: with SMTP id l75mr23648218vki.18.1576485768974;
 Mon, 16 Dec 2019 00:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com> <20191211192742.95699-2-brendanhiggins@google.com>
In-Reply-To: <20191211192742.95699-2-brendanhiggins@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:42:37 +0100
Message-ID: <CACRpkdarwQT=6iSvjaTufSF9O7KcSkFxBwcvmchQ67xRddLs2g@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] pinctrl: equilibrium: add unspecified HAS_IOMEM dependency
To:     Brendan Higgins <brendanhiggins@google.com>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     jdike@addtoit.com, Richard Weinberger <richard@nod.at>,
        anton.ivanov@cambridgegreys.com, linux-um@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        davidgow@google.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 8:28 PM Brendan Higgins
<brendanhiggins@google.com> wrote:

> Currently CONFIG_PINCTRL_EQUILIBRIUM=y implicitly depends on
> CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
> the following build error:
>
> ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `eqbr_pinctrl_probe':
> drivers/pinctrl/pinctrl-equilibrium.c:908: undefined reference to `devm_platform_ioremap_resource'
> ld: drivers/pinctrl/pinctrl-equilibrium.c:223: undefined reference to `devm_ioremap_resource'
>
> Fix the build error by adding the CONFIG_HAS_IOMEM=y dependency.
>
> Reported-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

We recently fixed a compile error by adding
depends on OF
and I think OF implies HAS_IOMEM so this should be fixed
now.

Can you confirm?

Yours,
Linus Walleij
