Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1364CC5A0
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfJDWJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:09:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33885 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJDWJB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:09:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id j19so7983341lja.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tAj7MQdx50kEc0+X5+2MwUaKPLSTG2cEZ8HO6UD6NTA=;
        b=LaunXps7setgfv12bPb7u/522sS3EJu9brrGYaLjqwldvoXOVfObovRiNdeBdEgaNP
         AvsOMHx9vRaCxnCUDgzEAN5UY0/+rPrZGGOR8NiTgVRP7bK2EEYH4pJujE96lQqZyPsH
         62lonu4kE1U4aaWX2Kw4JTjrx7irr+8prYZLlbBPHlcu8ONjiBppsL3gKx43niRRbFu+
         WY02NrIybPPrL9ejBQArZP3Clb9rpC3HPuzIWrgEKrB2OTw+SFEccjlMUPuaqkvm7vY3
         ES/EIy5SU+gsV+cab4vuey8Y+DAQyJvsX+xT17IS2+HTSw4/2oIrN+z3KzTWDmoJCR7E
         N1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAj7MQdx50kEc0+X5+2MwUaKPLSTG2cEZ8HO6UD6NTA=;
        b=oY+ESv9ThlymB/a+pA/gQTJyQuyAvQP7poViHhMtcwK1BkLGmlV+Rd6dy2N57JA0Qr
         PHabsg/mER7SPWDeRBeYcizYexLNMjhUzQ6y/OkaLQ3Qy5KIM9AUx4bcAOk0r4Le+Gw6
         UtpX3gVotL2aIXGoCcPAWyri8OVlWcaE9O056jUvxaBvzNRDKeaRE5xSqOc/mno2P/BQ
         U/7q/JB8LCm67iX2sfbhAJ4h+Pv6k8yQpKQBYGYdC4PxZsB0ELtR1wGZh0KhwFUcx2Gb
         K3kcKhwL6Vx2KNJwDqSL3RCeUJvjvPHefW0xTtWaTiuzu8yBG+it3j9ciJ2cbZNI7qUV
         TNbA==
X-Gm-Message-State: APjAAAVpGM7A7RBk9fL0xpuExrTjEyudAuCgIL9FOpOWJyliqPZZ9+Ww
        txlpW8jURk3Gi2y8znvpb7wlpqpV7fJw0py8tm/h1Q==
X-Google-Smtp-Source: APXvYqwuOIeC2PgF+bigEG3Yfy2MUgdFFb0LjdLL0D9GpGW9ZmSNG41JoqWGUAlylgVxu39NTQVfs+64EBHMxiQoL4g=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr11203574ljg.35.1570226939521;
 Fri, 04 Oct 2019 15:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191002144502.156393-1-thierry.reding@gmail.com> <20191002144502.156393-2-thierry.reding@gmail.com>
In-Reply-To: <20191002144502.156393-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Oct 2019 00:08:47 +0200
Message-ID: <CACRpkdaiEJCPBnyAZf0VqbkxsvUoYHLgkEZ7HM71tr2ZoPHa=Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: tegra186: Implement wake event support
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 2, 2019 at 4:45 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The GPIO controller doesn't have any controls to enable the system to
> wake up from low power states based on activity on GPIO pins. An extra
> hardware block that is part of the power management controller (PMC)
> contains these controls. In order for the GPIO controller to be able
> to cooperate with the PMC, obtain a reference to the PMC's IRQ domain
> and make it a parent to the GPIO controller's IRQ domain. This way the
> PMC gets an opportunity to program the additional registers required
> to enable wakeup sources on suspend.
>
> Based on additional work by Bitan Biswas <bbiswas@nvidia.com>.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - rebase on top of new hierarchical IRQ domain support

Patch applied!

Also a special thanks for standing out to my sometimes flimsy
and handwavy engineering, and I'm happy we landed this the
way I imagined it. Sort of.

Yours,
Linus Walleij
