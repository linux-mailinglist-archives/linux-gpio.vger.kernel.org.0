Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A31678554
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 19:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbjAWSxI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 13:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbjAWSxC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 13:53:02 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7BE31E35
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 10:53:00 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so11327852wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 10:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lr5MPaX+CPbj+uvLPSPuq0twot1PyuqJGLrkh8HJM0I=;
        b=xBqRe6fEn+YI8ZmpAsJ+mDYVaEfFQmDshTw9/SjuAUTRT+O5TmYv12ERKaxeqsO8PQ
         gkAmIjYGjk9UFYHwzHx7cJScZbISnCINuUppUbX9dpx+bWL6KNfbSxDtge00SKu7P0Mf
         38xeqLn7nAaBGxSitBCxrhN/DiaA1WJW4yPi1DkmgG0gCtlShBuxLdiYIpWvv4mtHkci
         6Enmd8efhtrU/63NgFCq8OKyzjasErOyl5Zw2GT/Kz4I9vW6rgmUJpsePZH45GfDTEbv
         1FYjz1zOtaqMEK6BUz1AaFaiMvgs33Q039xxvOZEDI9gMmpwlnwcko6t3xwtbAit6zT+
         4TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lr5MPaX+CPbj+uvLPSPuq0twot1PyuqJGLrkh8HJM0I=;
        b=kCtLNssIHfeHko0ynypgecIzPlIbWZgux2GDpIOI3CgfuUvt/qU4mpO9JSaeAmcRoK
         Rf4GjwUtnXD3JtPy2Hr+BLsVDx7kZa3ql5FCFcEhd11LIeWCnwAsq/Bt2fxE6XvVlkhX
         S+ETGz1uNbIdYl0gfJULXY6OxoV2GByHjsH7Iv8o3WLGQEZKKikXD+Y5ZkBi3/WP8J33
         aZdr5GK91VNhKvqLIFW/Q3ChIWES1v0mRKiRet0T8NRuRu+o2hL8oDakg+o+lTPS8jTS
         nJ8a/0Xvd5kPB2VGBXkNqGX5e/rwt7cJKahjOzOQcQQehrWrGBimHlpqAgBDGSGc7UIO
         G2xQ==
X-Gm-Message-State: AFqh2kpBsRT7j5t2T1/ZsH7EZms5BibyBygn3ZyiLZYtGJ0rRxWTGbUn
        cn1JSPGRZlWDvALFMg2Gz3WdVQ==
X-Google-Smtp-Source: AMrXdXuHygLwV0w4vccurHokoLTMYfXYMC3RwpOQYEmkkxITUtYbU06E92YaCyZXbM0xv/VucMgR4g==
X-Received: by 2002:a05:600c:1e1f:b0:3db:2063:425d with SMTP id ay31-20020a05600c1e1f00b003db2063425dmr17101085wmb.2.1674499979190;
        Mon, 23 Jan 2023 10:52:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003d1e1f421bfsm12568074wmq.10.2023.01.23.10.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:52:58 -0800 (PST)
Message-ID: <e75e5e1b-e7aa-e62d-1f12-f1543b6dbc25@linaro.org>
Date:   Mon, 23 Jan 2023 19:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 8/9] dt-bindings: serial: mediatek,uart: add MT8365 SoC
 bindings
Content-Language: en-US
To:     =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, gregkh@linuxfoundation.org,
        daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        andrew@lunn.ch, gtk3@inbox.ru, sean.wang@mediatek.com,
        zhiyong.tao@mediatek.com
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-9-bero@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123163833.1007181-9-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/01/2023 17:38, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-uart

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

