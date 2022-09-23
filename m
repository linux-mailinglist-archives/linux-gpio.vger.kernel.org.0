Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B625E8188
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 20:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbiIWSJ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 14:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbiIWSJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 14:09:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3349238A30
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 11:08:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u18so1481900lfo.8
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KZ+EFd4Uequ+4Kg8YiyMpa28NY8WAdiksQzAfDThIwA=;
        b=XHNoV3mJT1N0BANJ7QLqKDqvKZ+yDnRdBgqW5km0/zQejO1TlWy0CRFWye53Tx3PMM
         Pj+UMphOMsZSyzZmYNuHUO2ZNSAFHSLpLrSfHjzPKXbslBv0fUtvIArX51B9659GJwAR
         rj+lMrX751a+bbFM8mLCVP7v5Ok9G61A7oTwstyZgj2333Kr/X8qgDpFoPCAtBIHM7ay
         +VOEOmnNknVgce/O4hFLfwKa2f31JElWwt2u6NrSyaMu847AT7T3QPbgmYi6znfmANHF
         SCOxQlLZUJ618UA2j0H3euIkkXRRL1UoPucSrVamad6r+mEuS0Ge8QsEajSMZ4Y7EbIt
         Jw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KZ+EFd4Uequ+4Kg8YiyMpa28NY8WAdiksQzAfDThIwA=;
        b=v7iNXOXaPP3rwRd2PfVxZVUA95KKpmO5Fc8OSTApQ3Re2DR7WMp5PgeTSmupj56OXf
         WLqyvdVphSK/zKAB47mIi8Dl0wTloSApP4a19fZ78TjQHHVRBZkguf4u7ZIxL3rp6eyb
         TQD1395vveY7gpU5kC4SbNyyzbb0wzHyWLt35k3uzezENBCzL1rXbHJESFpi6zMuY2HT
         JW6y4XwMlC5voQNJDqsW8ZIyN7DrhrFgjZcugKZBb43w1SyVdA617HpiVGEsP90EAGVn
         w5X5EXXKL8T2CH7uMq6YA93uPTBGcU/B8x7HMsxiDHxK49HisZlXA8hlUSJoahs1ViOR
         Eoaw==
X-Gm-Message-State: ACrzQf0tYqsTjv2oh7Q1prF/BJEiKWkt5sb639OXt4H8zwU2HMsQYHam
        +6ndUEsXnXaciLLy70SkkfPQYg==
X-Google-Smtp-Source: AMsMyM6XnQCLZn79Ex6u3TeQ/biX1F1DQcco9bSC+KZdAFtPUu3j54k0CR5KzT17qZ6tRg7dYO3lLg==
X-Received: by 2002:a05:6512:1590:b0:49a:9db4:5a31 with SMTP id bp16-20020a056512159000b0049a9db45a31mr3586377lfb.667.1663956535429;
        Fri, 23 Sep 2022 11:08:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g15-20020a19e04f000000b0048b0099f40fsm1545218lfj.216.2022.09.23.11.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 11:08:55 -0700 (PDT)
Message-ID: <35ba126d-be10-2566-63df-3c474cdc8887@linaro.org>
Date:   Fri, 23 Sep 2022 20:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 net-next 12/14] dt-bindings: net: dsa: ocelot: add
 ocelot-ext documentation
Content-Language: en-US
To:     Colin Foster <colin.foster@in-advantage.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        UNGLinuxDriver@microchip.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
References: <20220922040102.1554459-1-colin.foster@in-advantage.com>
 <20220922040102.1554459-13-colin.foster@in-advantage.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220922040102.1554459-13-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22/09/2022 06:01, Colin Foster wrote:
> The ocelot-ext driver is another sub-device of the Ocelot / Felix driver
> system, which currently supports the four internal copper phys.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v2
>     * New patch
> 
> ---
>  .../bindings/net/dsa/mscc,ocelot.yaml         | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml b/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml
> index 8d93ed9c172c..bed575236261 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mscc,ocelot.yaml
> @@ -54,9 +54,21 @@ description: |
>        - phy-mode = "1000base-x": on ports 0, 1, 2, 3
>        - phy-mode = "2500base-x": on ports 0, 1, 2, 3
>  
> +  VSC7412 (Ocelot-Ext):
> +
> +    The Ocelot family consists of four devices, the VSC7511, VSC7512, VSC7513,
> +    and the VSC7514. The VSC7513 and VSC7514 both have an internal MIPS
> +    processor that natively support Linux. Additionally, all four devices
> +    support control over external interfaces, SPI and PCIe. The Ocelot-Ext
> +    driver is for the external control portion.
> +
> +    The following PHY interface type are currently supported:
> +      - phy-mode = "internal": on ports 0, 1, 2, 3

"Currently supported" by hardware or by some specific, chosen
implementation? If the latter, drop it. If the former, maybe this should
be constrained in allOf:if:then.

Best regards,
Krzysztof

