Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38443C6F94
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 13:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbhGMLVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 07:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbhGMLVd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 07:21:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDC7C0613EE;
        Tue, 13 Jul 2021 04:18:42 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 141so12867515ljj.2;
        Tue, 13 Jul 2021 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DmW58CuQRiPy8Sg0c4NVO3FTMCEg7IqqiVpTucaJ3Tw=;
        b=pabDNbwM68BJYigpwysEF85rUs211QosqbU8je6wotBV50cemlTavOMzN1CN6vUAa1
         bxhS3HOMeoZq+xr0xRnedvScLuAX6X1m+gW0lHfl8BWSZdVSQLbdlAV6+RfnmeTEMv+k
         aoyfJchdeYQWBKp/S7L/a5bmQEVNWuSA+8SqUba9qBBBMfeP7XJvxhgm76wW24c/6Ld0
         tY+/ljx9S/G+o5gMEXfmQDLmsoeFK8aVJag0ZxMhb8stDjzZ/ypHL0xZygRGSXPkNBPs
         rk8Rxu3MmsWRdv6UpxdaMIPthQv2rw8I0CiPo22t1s0ihY12hS8Qs0cZSg+PHR6Ndvd/
         uSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DmW58CuQRiPy8Sg0c4NVO3FTMCEg7IqqiVpTucaJ3Tw=;
        b=oU/ukQwy6/eXlxFUUCQ5tBZFtgVAFsWJuPCENWlETtGUV4fHWOqczThvp42DOdLyfx
         OmaK6vIxMEqPjhCls4Olzsvg7HUG1vxEmQUo0FPTgpQjg38VS1AAOJiRyhFgrXrpZnMb
         030EmIRTH4H4W52/TABCx7/5lwuw1BTqlPFeW9ZywNpm2kuRBp9jzeIn0CrHGyUrDNlX
         SnWBsf6axpLKzxdW5X6AwtPjyCnVA6sOO6V1bXr9bCGGFnSixjuFna+NLg40PMTzDQ82
         Zlyl92skHlgwg21s4gaYhZfyzdqRyzb7RI134YKS5lJDtxTibK1kJ+nZA2bTL2zIo3Uz
         eaOA==
X-Gm-Message-State: AOAM531DomxcGhFYUD25sJy08nB1qC/pDAUvpDXYwbqhjD19e4LeQIEI
        HazCqMnMopI3HXpyz3lbSNk=
X-Google-Smtp-Source: ABdhPJyvTGjEOf/NF26HuZzFFaI4eu/hHQhCJ+22spNmcJAWehw9gBPsA+afahpC0rX9Ib53v8by6Q==
X-Received: by 2002:a2e:88ca:: with SMTP id a10mr1850235ljk.361.1626175120561;
        Tue, 13 Jul 2021 04:18:40 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.78.85])
        by smtp.gmail.com with ESMTPSA id k12sm1442939lfv.14.2021.07.13.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jul 2021 04:18:40 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: rzg2l-smarc: Add scif0 pins
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210712194422.12405-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <53e6c8fa-311f-f100-dd06-d806ab593488@gmail.com>
Date:   Tue, 13 Jul 2021 14:18:30 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712194422.12405-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12.07.2021 22:44, Lad Prabhakar wrote:

> Add scif0 pins in pinctrl node and update the scif0 node
> to include pinctrl property.

    Properties? There are a couple... :-)

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> index adcd4f50519e..0987163f25ee 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
[...]
>   	clock-frequency = <24000000>;
>   };
>   
> +&pinctrl {
> +	scif0_pins: scif0 {
> +		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
> +			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
> +	};
> +};
> +
>   &scif0 {
> +	pinctrl-0 = <&scif0_pins>;
> +	pinctrl-names = "default";
>   	status = "okay";
>   };
> 

MBR, Sergei
