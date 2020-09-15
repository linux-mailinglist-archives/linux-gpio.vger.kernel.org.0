Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2070F26B209
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 00:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgIOWjc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 18:39:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727496AbgIOQKm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 15 Sep 2020 12:10:42 -0400
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AF0921D80;
        Tue, 15 Sep 2020 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600185552;
        bh=2jQ4s4F4QEiwRjM0mbpCYbO2wY6wQM3kiZYdWmUZGgs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NrvzdtqNKrd7h2kvQlM7juzGJY60IM/7ocqtDKVIAjFhGe9MTEue3ijSRtOKnHvW8
         EkYBPe2VQNjsXJtw9NX9WvZgkLHYnDOWUCmLHi8/8v/RrDtgtyCYsS9OAYs5QK46r5
         DWo7hUliLNxPAP1ybuhvYNr+1RUPUFp6Jg2h4GIc=
Received: by mail-ej1-f51.google.com with SMTP id lo4so5809806ejb.8;
        Tue, 15 Sep 2020 08:59:12 -0700 (PDT)
X-Gm-Message-State: AOAM530k+LakJhEFeMA0Y3dx5T7c5dMTfIF9h3RoH74/7VUrEnRIBnJx
        3uawPzaTCAles44tFKC80gnDdgY6Mmw+KK6FhxE=
X-Google-Smtp-Source: ABdhPJxUsTJbszqS0w20H7C5PBz2xD+CG8Bh7JeVyG0et+HyPpNHT7YwNIkugyJ9mpI9IZKxd+adCG38XUIu9fJB+r4=
X-Received: by 2002:a17:906:4046:: with SMTP id y6mr21768003ejj.148.1600185550958;
 Tue, 15 Sep 2020 08:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <1600054147-29997-1-git-send-email-Anson.Huang@nxp.com> <1600054147-29997-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1600054147-29997-2-git-send-email-Anson.Huang@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 15 Sep 2020 17:58:59 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfuz=vf9tCn8ZJ9dz2iAG_p61VvPWc9P=kp7nMy7tb6xw@mail.gmail.com>
Message-ID: <CAJKOXPfuz=vf9tCn8ZJ9dz2iAG_p61VvPWc9P=kp7nMy7tb6xw@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 2/4] arm64: defconfig: Build in CONFIG_GPIO_MXC
 by default
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, oleksandr.suvorov@toradex.com,
        peng.fan@nxp.com, andreas@kemnade.info, hverkuil-cisco@xs4all.nl,
        olof@lixom.net, geert+renesas@glider.be,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aisheng.dong@nxp.com,
        lkundrak@v3.sk, joel@jms.id.au, bjorn.andersson@linaro.org,
        leoyang.li@nxp.com, vkoul@kernel.org, michael@walle.cc,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-gpio@vger.kernel.org, Linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Sep 2020 at 05:36, Anson Huang <Anson.Huang@nxp.com> wrote:
>
> i.MX GPIO is NOT default enabled now, so select CONFIG_GPIO_MXC
> as built-in manually.

Maybe it should stay not enabled? Please explain in commit msg why it
should be enabled.

Best regards,
Krzysztof
