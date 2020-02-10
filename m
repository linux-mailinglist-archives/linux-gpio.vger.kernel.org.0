Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E39156D99
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 03:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgBJC3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Feb 2020 21:29:32 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37687 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbgBJC3c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Feb 2020 21:29:32 -0500
Received: by mail-qt1-f195.google.com with SMTP id w47so4078604qtk.4;
        Sun, 09 Feb 2020 18:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ra0rpldUyx5dQ3cALlEVBxf6hudJtV4wQ0FpwYENXlc=;
        b=Vot3Gk5rrSJb99S4ur/g2DWtP16aRkPxY1kmM1/eWqxjFECGCtYqTEfCzE71cF8MJG
         Y8LpDwico/I/Z9X30DRHGnLWHSQ3F0DIY8zQzeXMy96PomCYJbtqiwlt7ayxu3I2sfqA
         Kz21kD/8LnuRhDY+yWY+iYnwPcnR++Pbyz6k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ra0rpldUyx5dQ3cALlEVBxf6hudJtV4wQ0FpwYENXlc=;
        b=BxyfwYYmBNNQxcPNcscB6BAmXXW+w9INLo0juQYnTlCmknnsbR7TT/k2XgPx/6/Rbp
         EF+0ztuo08lfw29dkCYuWMnk+pyAYSJyhk51VZErMSuXtzivcdvRYkaY4Yk1C72ycWbm
         4BuOMs9D/3CkTRPnyPop90nvYNO+AHCOaTVJ9WWACKPzut5ngEoqwycQ2M/AL2PNkyGU
         DM++y6Q9QTNh1xlWS1xuwSWha8Q0cdlBiwc0GIWRAI9U4nfdBdP8WXShvIhSW/iMIW/J
         zzcPKJZuUCD9f3bAEIbDwq7I2usMsT/d1a4jJ8iaurgxTrvfMsvioLz+5ORWP5vL765j
         lcPg==
X-Gm-Message-State: APjAAAWQGaVVfmF2To6jC+DG5BG5vfdm71H6dctcwoK8N5142jPpB1ZQ
        x8Mg9o5t6gtmaSOOwK1Obv5JpF7MPXb6ROec8y8=
X-Google-Smtp-Source: APXvYqzcGvgfoldOPlRF0oV/3hA3tC1aE/eu4yDH5GYf9atHD8eepmRE6qo+l9/K1/ie+5Ux+ddb5DSELZ856Ev5PVU=
X-Received: by 2002:ac8:6b53:: with SMTP id x19mr2941384qts.220.1581301770229;
 Sun, 09 Feb 2020 18:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20200206170234.84288-1-geissonator@gmail.com>
In-Reply-To: <20200206170234.84288-1-geissonator@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 10 Feb 2020 02:29:19 +0000
Message-ID: <CACPK8Xdg0ocBzDqtkoo8cSCpUq+QjHQ1PKrsVZd8NPUvPFeFCw@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: aspeed: witherspoon: Add gpio line names
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

On Thu, 6 Feb 2020 at 17:03, Andrew Geissler <geissonator@gmail.com> wrote:
>
> From: Andrew Geissler <geissonator@yahoo.com>
>
> Name the GPIOs to help userspace work with them. The names describe the
> functionality the lines provide, not the net or ball name. This makes it
> easier to share userspace code across different systems and makes the
> use of the lines more obvious.
>
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will wait for  Andrew before merging, but this looks good to me.


> ---
> v3: added more detail to commit message
>     removed linux dev-5.4 from PATCH header
>     removed redundant status from gpio
>     removed blank line
> v2: added upstream to patch
>     prepended fsi- on fsi related gpios
>     prepended led- on led related gpios
>     prepended presence on presence related gpios
>     dropped pin_gpio_a1 definition
> ---
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 515f0f208ee6..2269c73b8987 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -193,6 +193,40 @@
>
>  };
>
> +&gpio {
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
> +};
> +
>  &fmc {
>         status = "okay";
>
> --
> 2.21.0 (Apple Git-122)
>
