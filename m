Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7906841C539
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 15:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344052AbhI2NLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 09:11:06 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53676
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344038AbhI2NLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Sep 2021 09:11:05 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6FB974060A
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632920963;
        bh=KsbVur2/qli+4fCqIZBdqDED21IaMcFYxs808+TH5nI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=mpYcIE9MAMDMvArCyDVt6zal1SjxSyX8EldFAkgzHx8d/XrbExhRjfJEHyDh+JcWY
         9oSARNIk5TM1FvFfmgKqPcZ51GiE+bjvBIh5pKGpv+Uwqi/iYb4FAIl2A9w8bsaElh
         Hf1y5z6yhZD1u/1gu86/Uumdbtalc00YlFGqVvcbZsWvmejbHGnQQHCXzioLtMxcwI
         3LzaQKlCIf744Ad4SAaEl+hJk2JiHkfZ5aEUMggU/ZsFT+aQMEIDImyS2T6/6KuOl2
         x5af2w3eQMwsnhUypc+N6KRm7+NarBlwSaytxpyehiRcwTuUXdw269ZF9Xxc1G4dTO
         vtIFL3hD7nGVg==
Received: by mail-lf1-f72.google.com with SMTP id c6-20020a05651200c600b003fc6d39efa4so2329840lfp.12
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KsbVur2/qli+4fCqIZBdqDED21IaMcFYxs808+TH5nI=;
        b=A0bkQDlc8AqUDJY6pNDDYD4H27/vIGiH/FP+AXgp/6iQNSm8ypGQWOyTiRIoMhw/qb
         yzm6VhUo4TauDxSvoH2aj+9Priqfe4W9BpnK0/oJ1Y2wbwN9gEeZAfaeylPg2zZ+/Tkk
         uAd5ojycRPBqkk9DEkSz+LrKKz5kGG/wQedGB4dYUbVOs+2SH6QinjjPryVM3y4hNP1V
         Xy5sTm0NM+3DuKaxSW9e0eDN13iSaXDK2hiqJNhPJoOucvlorx/efBHRJPz8d4zhC+KS
         T9RGg4Aqn8AtGp+wCCqEACgmE5J5B+2U2TQuzCEMqg8g9HL3CeJJQPy0Dv8bG9c+6k/e
         FQ8g==
X-Gm-Message-State: AOAM532rp7ihmVW2d3WCue7gObIYYpx+yrDfQ5tA5XFPWhPC8v1w7V6i
        zhyrGECHViw8CqKQlZ3q48rPLn1ZsXf/PAgLPSGzuEGezjHWux4r3Ghg1m3g2UPbhvU/3EXfVCn
        wFxul3Tr+y+oQcQDAx2sbAoQCwXOjmgttFBsHlCc=
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr11996695lfn.662.1632920962449;
        Wed, 29 Sep 2021 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKrXQMmrpXBJdFGfniYnh95CJW4r5XX/GOWAswOXl0aBJ33mQHCMYimiRr8Trj3H0MHLM7Ow==
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr11996657lfn.662.1632920962259;
        Wed, 29 Sep 2021 06:09:22 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id b22sm241800lfs.27.2021.09.29.06.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:09:21 -0700 (PDT)
Subject: Re: [PATCH v2 07/12] clk: samsung: set exynos arm64 clk driver as
 tristate
To:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-8-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com>
Date:   Wed, 29 Sep 2021 15:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-8-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> This sets the COMMON_CLK_SAMSUNG and EXYNOS_ARM64_COMMON_CLK drivers as
> tristate so that we can compile them as modules.

This is not the only thing you are doing. You are removing the enforced
built-in and this must be here explained and tested. The policy so far
was that all S3C, S5P and Exynos supported platforms select (enforce)
necessary drivers. Please explain in commit msg reasoning why this is
being changed and what's the impact (whether it actually works).

What is more, it seems you entirely ignored Geert's comments. I pointed
attention to it last time and you just said you will send v2 instead of
joining discussion.

It's a NAK for this reason - ignoring what Geert brought: you just broke
distro configs for Exynos.

Best regards,
Krzysztof
