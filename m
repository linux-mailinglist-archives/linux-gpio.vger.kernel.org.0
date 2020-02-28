Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC0191741D6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 23:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgB1WNQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 17:13:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45135 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgB1WNQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:13:16 -0500
Received: by mail-lf1-f68.google.com with SMTP id d27so79957lfq.12
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ns84jhjwh80AF+NgTsU5G8wYY3x4+c5K/NhAZhbbc6Q=;
        b=UGTTPcGEoBQyMt2ffSmRLLgjAyPIUt+r0iIa8o1P49YLGdoYVKEbB6QakZAN00mAhm
         zy9v/0hSmLVI9UU5NBqAMSlsMEbwzjXJUYrFOUUGuxdKU48PBR44wBrg3ACsxrb/zaWM
         Or4tdMTMz2yn0WZyUSohIWbPxmV6UCTiz32JYGddmb92FTjXa/6SjWPkUvU+rdOtCmfO
         xQ2M/T2sSSDc2DNlZwW4KMcPv9JPGtOTigyxCycxvrdmkRaiIjVU8c1ZwVNZ6OvQgbcv
         EhDIU4HLC/IeZT9Q78lwgZ26eC8OIKVeUBXJL6rcX9IfF0d5WMo1ny5So2z7fU+ebfXj
         wg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ns84jhjwh80AF+NgTsU5G8wYY3x4+c5K/NhAZhbbc6Q=;
        b=hP5+nZOYJM0Dok7BYRGzcjQCUdOvRJ8V083Rs/lCLHlY99sp8hU6s9dHGTKetX5uz0
         MGeeiGW8nrrv6OaClHW+Nbe9mKaob9FPeI5yBoGAVE803zB/SP4HqQzQgQsmgt+Kuvhw
         vi8OlmAojOH19SYrJd8wfD1Tz1u0Ry1npb4aF2YEHM5Z1C9b7xqK/SiHmTBn9+7Jcb7f
         mxnLrxcqTGBKMzDQZSD5x65FyFYRZw7rcRyJXZuJrHRjdoo025e1Ij3oN0+1Yd+Wx7hS
         G2BKAs7ie2OJ2vZJW0ZobLURLT08dED8lKXb98uhPfeqJQc+S/wFEAnkHsg3FQfPd7Je
         su6g==
X-Gm-Message-State: ANhLgQ0Dg4M2J2UV8Ua+vRq4pvoo8DY8WB5OG8VCNMCHgFHdY/GnIatb
        GZr1eu/DucMzncCnNVmCg4saHuAoL+QiAQ6zX0fxqA==
X-Google-Smtp-Source: ADFU+vscaxQrz5bVMwzo9WHGRN+dd76KhhzlssRfrguQv31+o1oklXkSerfl7hQ6ykL3RwS+CWHsiJVG6jWWAoyAsOA=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr3541720lfm.4.1582927994221;
 Fri, 28 Feb 2020 14:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20200221021002.18795-1-yamada.masahiro@socionext.com> <20200221021002.18795-3-yamada.masahiro@socionext.com>
In-Reply-To: <20200221021002.18795-3-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:13:03 +0100
Message-ID: <CACRpkdbrowXC-Awy_N1gq+LxuEMhgLNf81cCZ=bwZwFdJXLWDA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bingings: pinctrl: Convert UniPhier pin controller
 to json-schema
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 21, 2020 at 3:10 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Convert the UniPhier pin controller binding to DT schema format.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Nice!

> In the original .txt file, there is a description:
> The UniPhier pinctrl should be a subnode of a "syscon" compatible node
>
> I did not figure out how to represent (or check) it in dt-schema.
> I just moved it to a comment line in 'examples'.
> If there is a better way, please let me know.

There is no way to do that AFAICT, we are checking nodes from
one node and downwards, never upwards. The syscon needs to
have its own binding file: if it has another specific compatible
such as compatible = "foo", "syscon"; then for the DT bindings
for foo, make sure to add this subnode as optional/compulsory
if you want to tie up the whole thing.

> -Required properties:
> -- compatible: should be one of the following:
> -    "socionext,uniphier-ld4-pinctrl"  - for LD4 SoC
> -    "socionext,uniphier-pro4-pinctrl" - for Pro4 SoC
> -    "socionext,uniphier-sld8-pinctrl" - for sLD8 SoC
> -    "socionext,uniphier-pro5-pinctrl" - for Pro5 SoC
> -    "socionext,uniphier-pxs2-pinctrl" - for PXs2 SoC
> -    "socionext,uniphier-ld6b-pinctrl" - for LD6b SoC
> -    "socionext,uniphier-ld11-pinctrl" - for LD11 SoC
> -    "socionext,uniphier-ld20-pinctrl" - for LD20 SoC
> -    "socionext,uniphier-pxs3-pinctrl" - for PXs3 SoC

But:

> +    soc-glue@5f800000 {
> +        compatible = "socionext,uniphier-pro4-soc-glue", "simple-mfd", "syscon";
> +        reg = <0x5f800000 0x2000>;
> +
> +        pinctrl: pinctrl {
> +            compatible = "socionext,uniphier-pro4-pinctrl";
> +        };
> +    };

It looks like you want to check also for "simple-mfd" and "syscon"
following after the enum (two consts)

It seems you want to check that reg is there.

It seems the subnode pinctrl is also compulsory.

All of this have examples in example-schema.yaml IIRC.

Yours,
Linus Walleij
