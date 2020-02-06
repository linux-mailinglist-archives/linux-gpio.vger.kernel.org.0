Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE5F153ED8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 07:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgBFGps (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 01:45:48 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43350 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgBFGps (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Feb 2020 01:45:48 -0500
Received: by mail-qt1-f196.google.com with SMTP id d18so3683854qtj.10;
        Wed, 05 Feb 2020 22:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EVIjHgWrOpnpthbeHK3KwPNytdJutxDfwFaEAYC1gU=;
        b=kPxNNb1gcQ6fkdKVzTu5wRf8dMBIvy78gz+ZmakHsUODJyPFAI9Cxs9Aerh6dtn8ue
         9S3HPYp07C/wCW8bZC0OA1mtnLl8+OkfKuxFq+k5IDzYmqxDYBc+ieFAoNEiOnWFfUZ8
         mFtR5H8qOqrJxBmw1ANT4V4HWd69qwfomQRWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EVIjHgWrOpnpthbeHK3KwPNytdJutxDfwFaEAYC1gU=;
        b=F5IHTgb3Gs8+B9Ni6BOf2bJGpC9vT7RKGaeWSCD/u4vxODh6v5eDBId/EjioeZ08IP
         oF2vspVyIejRKi1wRHz7SlA8aDFJClTVd4TpU8PT3IeuRjpUvR0WUm0e4d5HhcVL7mHI
         Y77VnTMPZtlRfGGSZiN5Z25Lpg0806hj1ecRKteRgesGhuMoqcXJsmOk7DG4wLzPCNq0
         EGGKzKqQZ2neKGLIveehyTz7ai9Q0MgFA+PUy+9YMPECrJdpYSosdnR1i7GSPZMv2ubG
         jtEfBMYdnwvpuE4GPBxyv8t0pSZWR+Ly7hnImzHflfOrVcjAdYvDyl3jIIh7OiqLOHnF
         RxPg==
X-Gm-Message-State: APjAAAWMo3u0Hzj8YPpfJJecrAl1cVEM4bCYOgxFEje8vDJC+YoYhz3r
        ylpbSfqTekBVBgdBysbr6ppx/aHY/+kn+fRJ4Vo=
X-Google-Smtp-Source: APXvYqyGXHiEc83j2FSMVVBuD58V9HxdxZyJTom9oCVKE6Ua2SjX6fetXzWVhlF65eXiKXP/Ck/X9d5riSepkdRtgIg=
X-Received: by 2002:ac8:7396:: with SMTP id t22mr1332817qtp.269.1580971547324;
 Wed, 05 Feb 2020 22:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20200205215511.80333-1-geissonator@gmail.com>
In-Reply-To: <20200205215511.80333-1-geissonator@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 6 Feb 2020 06:45:33 +0000
Message-ID: <CACPK8XcGJ61mgCL+vZQEzTmcwu+jZ0hpKrnOz7B7K14y79cvFQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v2] ARM: dts: aspeed: witherspoon: Add gpio
 line names
To:     Andrew Geissler <geissonator@gmail.com>
Cc:     OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Geissler <geissonator@yahoo.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 5 Feb 2020 at 21:55, Andrew Geissler <geissonator@gmail.com> wrote:
>
> From: Andrew Geissler <geissonator@yahoo.com>
>
> Name the gpios so libgiod will work with them

Perhaps: "Name the GPIOs to help userspace work with them."

You could also mention that the names are describe the functionality
that the lines provide, and not a net or ball name.

A heads up: when you send patches upstream to the kernel mailing list,
we don't include the "linux dev-X.y" stuff in the subject.

> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
> ---
> v2: added upstream to patch
>     prepended fsi- on fsi related gpios
>     prepended led- on led related gpios
>     prepended presence on presence related gpios
>     dropped pin_gpio_a1 definition
> ---
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 515f0f208ee6..2519722928a4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -193,6 +193,42 @@
>
>  };
>
> +&gpio {
> +    status = "okay";

The status=okay is harmless but redundant, as this node is already enabled.

> +       gpio-line-names =
> +       /*A0-A7*/       "","cfam-reset","","","","","fsi-mux","",
> +       /*B0-B7*/       "","","","","","air-water","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "fsi-enable","","","","","","","",
> +       /*E0-E7*/       "fsi-data","","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","checkstop","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "presence-ps1","","led-rear-fault","led-rear-power",
> +                       "led-rear-id","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","presence-ps0",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","fsi-trans","","","power-button","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "","","","","","","","",
> +       /*AA0-AA7*/     "fsi-clock","","","","","","","",
> +       /*AB0-AB7*/     "","","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +

Cean up the line of whitespace here.

> +};
> +
>  &fmc {
>         status = "okay";
>
> --
> 2.21.0 (Apple Git-122)
>
