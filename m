Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194FE6BC624
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Mar 2023 07:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCPGgN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Mar 2023 02:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCPGgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Mar 2023 02:36:11 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC44AB0B7
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 23:36:08 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z21so3503062edb.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 23:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678948567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fovyIQAjFmbxZjHrRNqlRgLVptlFZhMPqR9qekHWsJg=;
        b=O/O6Xeye8p4jA9+skOZPgQ9oY/7XkY3bTEEBwWtZWGRorC1oiSGkpyle/ycSCRM7lI
         8izECdvRQ9w5+PoaVJKJc/y0f2HJ7GH8WJB95EEKdi3kNCzXFBJJw5o9RyScfnz8mleU
         aXr7koiwvgq0ARhr++0G2+jcQSvx6eiCKju7mvwiAVcnE5h0q/0HU/KQH0wfmCVcsz6O
         vDlIJCXJCiyvFrH6/lJ6QK+8Dc/acZudEqODEfRkdXPNYaRKwKsLrSQTz9cvYJvuO8uh
         dZrhlL4nZlYVjPyLXPYnIKkYLDreZ20rljM4APGtnfi5EzDB77av0pNMmcKEx+VE/NpA
         5fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678948567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fovyIQAjFmbxZjHrRNqlRgLVptlFZhMPqR9qekHWsJg=;
        b=2UAm0XhlLpMZ8eLDM4a2X7MDoDad6oEqVT2x71UF7+SIHam+y3tYh1DNvGaPrQ9nW/
         2Q55FzYEWhfwah+I/JcPPbZPiFPlY7QRizfmxPcWOh8RgeOKT/7PTznW/eM46z3NZ2Ml
         inC2gycCpLGl2IGV+bj+0cHWwrhWkURdUaeZGTeylgZTJZeEKNqDYnD96Wz9szyCyhx6
         9pNZgidyRIqbd22SABaRpHn6OX2fmHtksbbTRijGxT5EhvVlLg55c2gGt0tNJLB2gS3C
         7rPK8VMRf3zKCmsXpGBOkDONmUDlYtLNldLq6zFVb3sV1WWFGWsmc0XZHdnpYkR4ep2y
         rTug==
X-Gm-Message-State: AO0yUKX2JHQIu3yFSElL2NY9rfPJIZdFpK+Y9GURGHgK0ss25QYeD2SZ
        jx5D9Qaijz5Psj8FVvJtb6V14Q==
X-Google-Smtp-Source: AK7set+z25Iv9a+H5iw4e/zFhuh98gKh8sTZxrAFPzyJTLf5GgKWIR8yViwOIldZlCXPQ1uTzgXeqg==
X-Received: by 2002:a05:6402:444:b0:4fd:22a4:e88c with SMTP id p4-20020a056402044400b004fd22a4e88cmr4577999edw.39.1678948567003;
        Wed, 15 Mar 2023 23:36:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id e12-20020a50a68c000000b004ac54d4da22sm3344864edc.71.2023.03.15.23.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 23:36:06 -0700 (PDT)
Message-ID: <eecb70bd-2738-eb28-21de-f936620769cd@linaro.org>
Date:   Thu, 16 Mar 2023 07:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 2/3] arm64: dts: ti: Use local header for pinctrl
 register values
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20230315155228.1566883-1-nm@ti.com>
 <20230315155228.1566883-3-nm@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315155228.1566883-3-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/03/2023 16:52, Nishanth Menon wrote:
> The DTS uses hardware register values directly in pin controller pin
> configuration and not an abstraction of any form.
> 
> These definitions were previously put in the bindings header to avoid
> code duplication and to provide some context meaning (name), but they
> do not fit the purpose of bindings.
> 
> Store the constants in a header next to DTS and use them instead of
> bindings.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/all/c4d53e9c-dac0-8ccc-dc86-faada324beba@linaro.org/
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

