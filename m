Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B2F3E441E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 12:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbhHIKqr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 06:46:47 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:40642
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234804AbhHIKqn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 06:46:43 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id B1EC740660
        for <linux-gpio@vger.kernel.org>; Mon,  9 Aug 2021 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628505982;
        bh=yt7czbeHRo3zFzMadQuUQl5b/q3O9yrC7ug3tMqy3VU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=a/HLX2iabH88qmlqrVn0HF0VScNkt1IBKdQPK2bgyhBSdzYcxkR+MFD+rzlmIg5fp
         pgb1+lJfbSqKhZNz2UcZO+86z9TKli8KoQVxjLyLUYNzTS3Cgj3r3hhLRdZICL1W5b
         GIBV9shoE5R2x41VlFvsMAnI2DKP7KzbAQTWsubbFbjmhfKph2v3WHUA5AfA1+hlO7
         BWFQy9nmuoFSzEpvWvnzbLn4xBKP7qeZo7BGPoo0Ru4jUp6HSXaCPcT6W08cXj+Muv
         mlkm9Sxj8sF14JUcb3wkAP4QoltgMlEOjThAjJJkq9KM9c52aX/AbUBKZ7/abvCuBF
         G2XOy/HyXI0Rw==
Received: by mail-ed1-f71.google.com with SMTP id l3-20020aa7c3030000b02903bccf1897f9so8660397edq.19
        for <linux-gpio@vger.kernel.org>; Mon, 09 Aug 2021 03:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yt7czbeHRo3zFzMadQuUQl5b/q3O9yrC7ug3tMqy3VU=;
        b=e5rf5hcr+1k07brjpA9zQMxvlVohv9gbQeumUZU5fdOpSjlrTNErI+sw9x3NDyeH5F
         dSBsKOEWryzOMd9y8pIjOIit/0a7MbWNg0wiVSYB4vmad+DckXlAejXgXvoON/L1AAH8
         fpQSkT1jTap5Nmm2rt+lo35oXKC1W9Dut7zX6ozU4Qxur/eFJHvhDUQfMVm/fd09GIRp
         /S810PC1uRBr4WlLSmukDILrFBFQXJ2Tuk6k6qIV2vlUynXtoqg/sFK1j9RTgDMgE86d
         YxibmDBMUekJ8MdtZFFWyrseA4lWvldsett3w8v8LJdnh+PnEN+XU/rPH78MSHdsKd4A
         A/Kg==
X-Gm-Message-State: AOAM53028u5POKJgB0tvusenwhSRjizbaE0QgSonN6W+H2O+UL4cvfir
        VCtb/ARlV45k/EffOZwXzJCwzTFEadLC8esd+pA/rFv33++8KMK1+mXy8hwtZynqkwwY8u+S41v
        3gE/rvwmTgEkbTQCVNzxnCyJdV2G2lohnn3+kOmg=
X-Received: by 2002:a17:906:4346:: with SMTP id z6mr2946664ejm.403.1628505982426;
        Mon, 09 Aug 2021 03:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwilRElb69ECVZp5XBCmIh/rGOdeWiuwyHyABm9gfRG9GvWksDs334T+DetejTgQ1+PQ9rACw==
X-Received: by 2002:a17:906:4346:: with SMTP id z6mr2946634ejm.403.1628505982295;
        Mon, 09 Aug 2021 03:46:22 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id f5sm5733019ejj.45.2021.08.09.03.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 03:46:21 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] tty: serial: samsung: Add Exynos850 SoC data
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6169e25b-2829-628a-f910-348ddd4b3030@canonical.com>
Date:   Mon, 9 Aug 2021 12:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806152146.16107-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/08/2021 17:21, Sam Protsenko wrote:
> Add serial driver data for Exynos850 SoC. This driver data is basically
> reusing EXYNOS_COMMON_SERIAL_DRV_DATA, which is common for all Exynos
> chips, but also enables USI init, which was added in previous commit:
> "tty: serial: samsung: Init USI to keep clocks running".
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Fixed default fifo sizes
> 
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
