Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1E53DBBF3
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 17:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239566AbhG3PSy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 11:18:54 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47034
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239595AbhG3PSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 11:18:53 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id C8A0F3F226
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627658327;
        bh=uQz9tULPCu5UgY3Ykcp4Ot2UDuSXdhe8Cf5AChsFwuk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=mb57DjVKjxhrQYfkFVnEIyls2x/+m9z37s1TIdeqHtqkORBoP5Z1XmyhkGYZBXw3y
         x84dvfvopa4nsaWVZnF3N92FNeL6pt5hCvnqEA9pjO/U3+biW6yZQDF6US4MjrlIZL
         Wq75+oJq/UIObmPJyMQffRot0+8xqPPJsY/vc29G/csXKHbcsw0Cst9pUeEN3/KCy/
         wvcZ1Fz1rrFTvauPuz5lCnurSvHhul7RLbzCJZf6NblpLqNT7iCGe3kciXDNkkCmrK
         pjAtWgEKT7CS1Z70gbOSwRoQ9LvbrYKp/17RejLzNLp5QXFVinB5MCT1elpZoYMwPc
         vZrVi6w9sinVA==
Received: by mail-ed1-f69.google.com with SMTP id h16-20020aa7de100000b02903a6620f87feso4789015edv.18
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 08:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uQz9tULPCu5UgY3Ykcp4Ot2UDuSXdhe8Cf5AChsFwuk=;
        b=oNkNEsxUExqBywUKiK46MzqcWhgddOf9BijQLep49l/R/P7Lh/JJSYN48HV5FyeOqB
         hkSqaTC5qJ1bWHfE9CgSckfRCXl6a2zr0KrzRESVbSJ7dejsVWUv5wilynrIlWosuIcE
         aYrwoYoP43CcniNjzbSiFPnllruf7rHzjU7lYByfTjxSiGHK8Cjj6Yf42RIe1szejOqL
         YhReNfRsRkpJdSrTD10edTo3vPx+JY8dtuTPwuZM8JAohGcu4Rss3NilBWbjo1wI3/LJ
         r1lTpgvq/Kq9/5MrUxNOikzTlQfoRxjdGEalInnCL+5WiI1D9+z7M7+Pe2qb2DvkMJVw
         7REA==
X-Gm-Message-State: AOAM530lBctA8bSUw0ENyRX5my/HSVzl1WyciT0zMJh5nCJuwEgBKgC6
        7/GTyVtNy2gK5iULawsWu7Ded5DpI8AK8uovto9TNJmy2MawkftUyZkAcZNXS9gi1yEQjBFAyUo
        ZAUuExfujwpcahp+CEGp9oh3pPUynm9RPPy64wdo=
X-Received: by 2002:a05:6402:3192:: with SMTP id di18mr3654270edb.186.1627658326389;
        Fri, 30 Jul 2021 08:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSu7DW5+j3BhrkN5cwojsD8uD94ncil0rrItmiexSqoVvOVwhkjvCksZc4ftgx6K7DzkIA9A==
X-Received: by 2002:a05:6402:3192:: with SMTP id di18mr3654233edb.186.1627658326270;
        Fri, 30 Jul 2021 08:18:46 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id f15sm824270edd.54.2021.07.30.08.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 08:18:45 -0700 (PDT)
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Date:   Fri, 30 Jul 2021 17:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> This patch series adds initial platform support for Samsung Exynos850
> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
> rootfs as a RAM disk. More advanced platform support (like MMC driver
> additions) will be added later. The idea is to keep the first submission
> minimal to ease the review, and then build up on top of that.
> 
> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
> 

Great work!

What's the SoC revision number (should be accessible via
/sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
might bring confusion...


Best regards,
Krzysztof
