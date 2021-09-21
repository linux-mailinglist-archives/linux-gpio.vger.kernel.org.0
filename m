Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4331412F44
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 09:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhIUHVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 03:21:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36756
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230124AbhIUHVc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 03:21:32 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A8F13402D0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632208802;
        bh=AEgBA3R77w9KryrrVCKS+IcMBHSWWQYQcCPJfI9REUY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=q5I2OKK/BHIgeadXIt4B504ihWDnqoms3PgcGZQGSft7i44IlbxsDlXvkhVjJFIW3
         mzYuofJjMvriDGreAPnbacsXV4600h+II6SoC0/cUriDo8/BwzS1MsBO4ZYx1WoBRY
         Hhiz/tJZjvxtjhGvANGJlRhJ/ZPg4lKfqDYZ6sYHyc267AUtnWybwqolIxF49/bRVf
         lYGazccFPhBDNT5/WgSwoDgG70BJdUuJOV58O8soOlGA4x2ifxfz2Vbb4dVsBor53I
         PeZHGG2I7TKlyOocxsFvmTY7QOZVuO5RA0wJ7vMhnXmk2OGAhpLM5q87yNT9wrvMBU
         JYcuEZT4dxsQQ==
Received: by mail-wr1-f70.google.com with SMTP id e1-20020adfa741000000b0015e424fdd01so7581046wrd.11
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 00:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AEgBA3R77w9KryrrVCKS+IcMBHSWWQYQcCPJfI9REUY=;
        b=u172Hl3o0SFQubyKiFUuMjE00MiPYlUfpoUNaDW0MjnpbPhBsxIF9lsfKdMt7i1fV3
         CpUYgXQrgH7J24+gT7pj1s2KpCWxKrgkYhqjCFl/fRTQl2v6MWKKm1xhXXwftMRxETzU
         7Fw+q2kaN9vCatL600ZpCdalJL33jhzRlsaDLqRA4nhzEFQpggt8NmhEq9Nlz3DqgPqt
         ik4HyU5vQL7KcICIXRqyH1cH49LynquwYgoGkTFRYPSWkA9shLT9xdZxO9wYZgx8QBy9
         D5QwTLeAN3E0XtcKabObH1mzpox3XXky5RA8dPYfUxayrP//OIkQA2vaunDPc4sGpVcx
         gv7w==
X-Gm-Message-State: AOAM532DkLpdJbtdGMvXDxplXMXifYMwYC7JmJbnrIKqUWbo5Ssizbmi
        6T4gnOyYB4n6o0FD6fZYddrYlDgxoo/rQOIpKm9fbfyxIWLvs4HQjlXSZoP+omPUD2XIbhp7kFm
        B/XCmFgLxUvS6ybCexzZk/YUDbZ4aMDaX5s2+doc=
X-Received: by 2002:a7b:c750:: with SMTP id w16mr2977696wmk.128.1632208802084;
        Tue, 21 Sep 2021 00:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO5jz1FEI8gyX7GyxtVi5eDjZZJeMMrwVlptuHEN5O7i5u5mvto6Hcns9xoz5xze1ScI9CPA==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr2977671wmk.128.1632208801861;
        Tue, 21 Sep 2021 00:20:01 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id u5sm3543492wrg.57.2021.09.21.00.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:20:01 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
Date:   Tue, 21 Sep 2021 09:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/09/2021 21:03, Will McVicker wrote:
> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> a handful of drivers without allowing the vendor to override any of the
> default configs. This takes away from the flexibilty of compiling a generic
> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> modularize these drivers out of the core kernel in order to share a generic
> kernel image across multiple devices that require device-specific kernel
> modules.

You do not address the issue in these patches. The problem you describe
is that drivers are not modules and you are not changing them into modules.

> 
> To address this without impacting the existing behavior, this series
> switches the default config logic for the offending configs to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
> verified that these patches do not impact the default aarch64 .config.

Yep, this is what you did but it does not match the described problem.
You are not solving it but doing something else.

> 
> Will McVicker (4):
>   clk: samsung: change COMMON_CLK_SAMSUNG default config logic
>   soc: samsung: change SOC_SAMSUNG default config logic
>   pinctrl: samsung: change PINCTRL_EXYNOS default config logic
>   rtc: change HAVE_S3C_RTC default config logic
> 


I received only two patches from this set. Please resend following
get_maintainers.pl script.


Best regards,
Krzysztof
