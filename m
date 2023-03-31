Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0B96D1E3A
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 12:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjCaKky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 06:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjCaKkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 06:40:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FB48A6B
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 03:40:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id h25so28297024lfv.6
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680259246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTk8mOSPIzlRbno9iYVmCDgeJNwZ89A6l+2S2wacpJ0=;
        b=f5FmFtlTwBRJaVcS9/mD5K2de5No7QPEv6fWl5zcMfqYkuSzJiA5XKhh9aQZhYArdT
         OCwEuf8F2xHiRJwnIVyOPJmF8gxrm+IGhwj6hJv06mxBXqD7SjRW3QraimrpqKoAd4FW
         vORc2OGA2zIQ9AGq/Et3KU3nGl5fPCf2iZeZU+Fxz/DdnxkWhanwCv4p2UcJF/Ta0RuH
         vsM+0Sjk3BHQmyE5oYPnSkmNFRDHjQSB8DmAh2C50RWeTNBHphwPmemsT5Ndj6o1Iyu2
         Ay0FYglXSXBrZRKRqXnHvxYDRLQuW6nGT1d52HtCu5C4Lm+A0AlyOnqld9KSJIA6V9lX
         pNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTk8mOSPIzlRbno9iYVmCDgeJNwZ89A6l+2S2wacpJ0=;
        b=zQKXoxdQ90D8BWN8c4Skzyk1lbp6lLkmWPUCGi3+RUZyHDmhFyfO/4LwXNW2SvJMlC
         P5BsZbzSqml9gmyJs9+6EnO+ywCj4TAARejvQTyI2814Rfws7YE+Eus4X7Jd0xo7I1fB
         XLyyb/Ij5tN16CFknz+Q86B1XWtF8AQEa0rYVekCMxxcEjzb1ybOChDBVzK7HfWiDMQV
         FsRafXwhTjYSXUrEabEvxT6PGBOWRFEfySx87Nx7zjIhoIaFFVwjQestl5LxeQsa8cnZ
         jQZ0D8W/a0L32Y/FUHNutNVX6Oa+Y0TqyTqhvFgomlU9T2mFbwk070ZQWk/QJGomR2kC
         kN7g==
X-Gm-Message-State: AAQBX9e0YZe69YGUP452pikaQlGTAAxujmm2mztQN0FaaEZhQZ0ymI1s
        NrtZfA9Gmdw7K3eQD46jKCfSpg==
X-Google-Smtp-Source: AKy350YjgNmKudNSIJxtNOnKZbr1gPCOLjUBUP6WCFdx2ZzwuD+amSfMa3xd3BwO4z6X//vHGXLinA==
X-Received: by 2002:a05:6512:143:b0:4e8:5627:e527 with SMTP id m3-20020a056512014300b004e85627e527mr7499506lfo.3.1680259246524;
        Fri, 31 Mar 2023 03:40:46 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x16-20020ac24890000000b004eaf9ef5e7asm326857lfc.226.2023.03.31.03.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:40:46 -0700 (PDT)
Message-ID: <6d6fc652-6eb7-eb95-0ddd-0295a16c1373@linaro.org>
Date:   Fri, 31 Mar 2023 12:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: gpio: fsl-imx-gpio: add i.MX8QM compatible
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linus.walleij@linaro.org,
        brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, stefan@agner.ch,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
References: <20230328061257.1984972-1-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328061257.1984972-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/03/2023 08:12, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8QM compatible, same as i.MX8QXP.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

