Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34B84428F3
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 08:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhKBH6K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 03:58:10 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56026
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230511AbhKBH6J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 03:58:09 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 839103F1B1
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635839734;
        bh=TL9ujWaRC5QrK/omsBGAzgL+mAn1UaLwIFZhjmwNN9I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ExQCg3V+trrItHD3VZ6u7EPN285MG1j7302uaICCX+DirvLS8Qcnxusodz+LCKh/3
         euVrH+Scp5HK1zKc7hwRgOYoaID9vpyA0zW6poT8k5pNuoSDS8FFJj0WM5BMUAFVHq
         vlL90A6KAd9wKzQlyccLkbCtN0efyGwuPWhK+4zIeEVvMpNx/B+MenjIWetoBoMFyp
         Y3SdVfmM4ANZyz4K1+6aNJQMzbqX4ad+n/9XzRaC2mgpfjpOL4Iil+BOcsj81dh69h
         wNs//havHbZeS3ODg5DDVvdy8BcYzIJsrudZD3WCpKpwV0rmr/rZ3IMWlTKUiPuMsk
         qDgA4Lz+KYjkA==
Received: by mail-lj1-f198.google.com with SMTP id v23-20020a2e87d7000000b0021768392240so73907ljj.23
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 00:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TL9ujWaRC5QrK/omsBGAzgL+mAn1UaLwIFZhjmwNN9I=;
        b=BmiJnzOa5ZgIeIzRf7yjAQTP9kYQ1ucN5pMvKfhA/VvDWkkoX9Pe6m2rcYar22rvGZ
         v7c/to70mSu60KYTXz+zeKUA0AOYNEs0BPyyDAC7izcVBXsO4+McAc1cRPVuH/Lgr9QR
         2FwlAFrrWJUXJmel33SZtfCRDdWbkcM4QhNZIQRsv+wiGpVygoNzcnLP0mSR0wQ6OVq9
         x+buKWwllRltoXJ2QOFG9w0e8Dl6gizCQc9847M8Kq4hMJlXEuHQ7b7+7Eq7CGNN4r6Y
         R0UAwyuopjjXGR4pAlhViq/vgP4bmFHiRTmldxUXIs1DjM6XU1RmVr6a+ex8cxdvoGmQ
         /ISw==
X-Gm-Message-State: AOAM5303gDbVWdFM2K8GpQkHE7lPlx1I/rTFanUECAaNSXVxzLzVMapm
        u2Z5GCF8QRyhQ0osZp8TS2sSEgLyYDo5i4KkxFH/Tn5+y3hUvPJDRmSSihHJtXx5Xjn02ijpjse
        Cy/1Wxha/kikmslZq+OhQM366col5yjiR76o/nCg=
X-Received: by 2002:a05:6512:b83:: with SMTP id b3mr32712051lfv.654.1635839733927;
        Tue, 02 Nov 2021 00:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWfHYARD0cMK/UpHT4OBoPI1WgrZQDQUCrOlg/dE4Y6zJh9PI9MVX5Aw/N+Qh4RKsTqWkJwA==
X-Received: by 2002:a05:6512:b83:: with SMTP id b3mr32712035lfv.654.1635839733798;
        Tue, 02 Nov 2021 00:55:33 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s1sm111943lfi.124.2021.11.02.00.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 00:55:33 -0700 (PDT)
Message-ID: <a7697cc9-1872-d466-0fb7-683df9c46af9@canonical.com>
Date:   Tue, 2 Nov 2021 08:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211031231511.46856-1-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031231511.46856-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/11/2021 00:15, David Virag wrote:
> Document compatible string for Exynos7885 SoC.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - (none)
> 

Both patches look good, I'll take them after the merge window.


Best regards,
Krzysztof
