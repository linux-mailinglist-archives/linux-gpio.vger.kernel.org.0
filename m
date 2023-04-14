Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6FCF6E1D51
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Apr 2023 09:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjDNHgl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Apr 2023 03:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjDNHgj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Apr 2023 03:36:39 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA76B7D8A
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 00:36:18 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id j17so33789260ejs.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Apr 2023 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681457776; x=1684049776;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BIZm7OVoNPgP6hAJjegDQgkQsNI+ED4GT7hk/PWCTI=;
        b=KLRG03aT3upNVPSBhBy9mK+wVYK0Rg+7gOcMpROGPKro/27CtNuIHLDXg0n/BZo+cx
         n1krkAKd10ib4EXHQ/9eKJKZWDylSuNY/OwMo0kvsaFT1o4WSAUJ56FUILTJBBm5Tm9m
         eW7gEFThJZ9ZsOp3TsxQRBvT9TOT/hbGgW+R9H3uNxgkeJypfJSv4QzqCFJS1hCk9n/a
         aYfb0fz4CfhE7SHunCg/qCYgYUXB6D1j5qykim9mzN4uaIMT4wKi8hg3fp7HM5JHcmEF
         lCZy5tsEHnECWiUWdov0ES0MDacOf0aY+/Rm/rdJn0W68Gtwdj5U2jwRVaKiFWMxEcST
         vcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681457776; x=1684049776;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BIZm7OVoNPgP6hAJjegDQgkQsNI+ED4GT7hk/PWCTI=;
        b=hv3/MTRamSHrLyxeUkw1nNxEiIPhZhSh7YogpVdTck9HFUn2889UxY1eCfLJvMI0iy
         GxAfzPTLZl00FC8NCztO7QoDjiOvsqbzfo3qlIYUydZymitNGHJIK6+B1xw1EW0NqMvk
         3MPJhKI0ZoIh6R+z4n035ToeLYC1XoARmf4Fof4PNa20Rs7Gl3cJlJT6cBOxhp6b5nkR
         JJGJlWeMqY+cSgRwNH7Od6FcNY91nlKtbL/TfH2InvD86BKoP8SA5qcfb+CMBomL4Lmq
         S2pRONnreNM7/Lme7CD/GAnj25lySxup8boZ4tUV2EDXZbrh+fqeRsH8Ls807zcTpIfR
         t6bQ==
X-Gm-Message-State: AAQBX9cP9NVmMYVChbDinCNpHRjeO/CY3PVoNjKw0HsAzwCoZ0d1c8em
        LURwJIhuqxA4Gx7v4Au4wGBcFXYHVDAm8f1Cdcw=
X-Google-Smtp-Source: AKy350ataZ2VxRZLVqcOMSGN9yHYPp2N5iuran36ny+AQ/gi+UjSIj45G6llauYBbyVOYStGbZPi3w==
X-Received: by 2002:a17:906:2788:b0:94a:90e5:b2b6 with SMTP id j8-20020a170906278800b0094a90e5b2b6mr4995448ejc.58.1681457776525;
        Fri, 14 Apr 2023 00:36:16 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id j25-20020a170906095900b0094a70a89bffsm2018786ejd.205.2023.04.14.00.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 00:36:16 -0700 (PDT)
Message-ID: <373eacb8-be3f-6b95-3e08-f0ff36f79891@linaro.org>
Date:   Fri, 14 Apr 2023 09:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [V6 0/9] Add Tegra234 HTE support
Content-Language: en-US
To:     Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
References: <20230414004455.19275-1-dipenp@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414004455.19275-1-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/04/2023 02:44, Dipen Patel wrote:
> This patch series mainly adds support for the Tegra234 HTE provider. In
> addition, it addresses dt binding comments which prompted code
> changes in the existing HTE provider driver without breaking the
> Tegra194 provider. The comments raised concern how existing code
> retrieves gpio controller node
> (the node is used to help namespace conversion between HTE and GPIOLIB).
> To help simplify that process, new DT property is suggested which adds
> gpio controller node in the HTE provider binding as phandle property. To
> conlude this patch series:
> - adds Tegra234 HTE provider
> - modifies existing provider code to address new dt binding for Tegra234
> without breaking it for the Tegra194 chip.
> 
> The V1 patch series:
> - Adds tegra Tegra234 HTE(timestamp) provider supports.
> - Updates MAINTAINERS file for git tree, mail list fields.
> - Updates devicetree and API documentations.
> - Enables HTE subsystem, Tegra194 and Tegra234 HTE providers
> by default in arm64 defconfig and dts files.

All your emails miss PATCH prefix. Use `git format-patch` to generate
proper versioned patch. Stripping important part messes up with our
filters. We have quite a lot of emails, so proper filtering is important.

Best regards,
Krzysztof

