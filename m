Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA6D5F3C6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfGDHbs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:31:48 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42920 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfGDHbs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:31:48 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so5105620lje.9
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sBCczz2TEmo+42ANoao+p6OevVGaZXx51PkYr0uqT5Q=;
        b=wo5q52rDJSW4xleBd8ezZ/XLTvEhFmnf742yDq/2AZrmXHBfLzr/ezU6hUVrSuKYrw
         mv8ShEFqAu9AtbVWRqw+s99s5i294hfo1P1LN1WBv1SEVwuBGX5wmTHdpK8KBm1VPjcM
         qYJl7wFntpoZM3K6L95ilcaOpD6QPSEVu9bHs1dGV55O4G0qITISnNnCkmFbVncTk+iJ
         sVu6RqYrtczbkI0GCambdoH7YljDxSqtICNesUv6LfOpHWrcZmLrm83zeMctin5SmP/F
         zTTf1omIgvaKdvpHCz8xvaPoWVq0ST0N/6KeZS+FIOXcs7H4aKmd+nomCqmGLRMR3ldo
         bB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sBCczz2TEmo+42ANoao+p6OevVGaZXx51PkYr0uqT5Q=;
        b=fxYD+jcFFBfVUaq7PP0yxA5vNnQLSsIHZsSSEicAJKnH93C394CPRYqqaB5JEqkmrc
         i9L9NRA4gDyAg1lm7gwGg07a+64oiggXOGw8RSCi2mmbUNpymW2fuYi5pnBQdrcIz1a3
         tKONIa37T5TteodLOG6PTY4NuH/KmyKQmvh5GqUCG/HgDBg8ycEZDMzgxTsWbUA0QQCj
         SyNo4LJmXdy6REYWMGS2u4pnhQeecDaH+91hMfNAUjV0IAf2u1/OkS1We2l+GrigFY6r
         Qfx6wnvGM1gW5iNqjarT4uIWVyG4qIb4yjImVz/wxn+5vJku8bGB9Ssmocm5VIcluEcz
         mLMQ==
X-Gm-Message-State: APjAAAXw9L3h2bfFlaIS4d8Z2txR3Oc/AhhBWOaf6j26ZOCZyJSoL2M6
        K+s3/A9gIweAjdVUDNcn1/C6/RLeCEQLQ38+JVY+IA==
X-Google-Smtp-Source: APXvYqwjGa/X/sbL44UMhFPDPuDhLdTW7S9Db0bH7XmORR5lfPWfHij3VnDkco4rLP3xxo/0LhSZtxYw+XJa7UKbpiQ=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr2048012ljs.54.1562225505566;
 Thu, 04 Jul 2019 00:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <a262cbb3-845c-3ad1-16cc-375a24b9f7e9@gmail.com> <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
In-Reply-To: <822867d6-4a4d-5f68-9b21-84a20d73c589@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:31:34 +0200
Message-ID: <CACRpkdYdCmT0ErTuewYbv7bPkjoFLrK9KSVuKVMkAXNQYAGV7g@mail.gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 29, 2019 at 5:58 PM Dmitry Osipenko <digetx@gmail.com> wrote:

> Oh, also what about GPIO-pinctrl suspend resume ordering .. is it okay that pinctrl
> will be resumed after GPIO? Shouldn't a proper pin-muxing be selected at first?

Thierry sent some initial patches about this I think. We need to use
device links for this to work properly so he adds support for
linking the pinctrl and GPIO devices through the ranges.

For links between pin control handles and their consumers, see also:
036f394dd77f pinctrl: Enable device link creation for pin control
c6045b4e3cad pinctrl: stmfx: enable links creations
489b64d66325 pinctrl: stm32: Add links to consumers

I am using STM32 as guinea pig for this, consider adding links also
from the Tegra pinctrl. I might simply make these pinctrl consumer
to producer links default because I think it makes a lot sense.

Yours,
Linus Walleij
