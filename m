Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEFAA68EE75
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 13:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjBHMGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 07:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjBHMGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 07:06:11 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072DA49039
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 04:06:05 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so1266818wmb.4
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 04:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvc70662qT1tudUaeHKF9NVD5XdghLVQqXJv6WZUq7k=;
        b=zw836VyF/IQ1nIWPBHEaWD1KMAcRZejV5TNNTTZYK5bl6pFq91nb87/AcrOb0DknRE
         eEVf71lXrwYh5XSJpTY6pLmJ8DJnHNs/vc377cKY3bEzafdVuuR2Rlz2lhZb7FZ3/BlV
         0ETVP3jqYfx/Aq7XONWb5SxmSM2B73Z13syqHqNlHvus7gXwTHNSUb/WUBxTImPLW+bB
         gMcJ1n/V189TYSUdA+Y2aGq52apqnon+Klx75Vm8Ph20UVVt3RM3DmrU+JKT5c232Iz4
         13efSas+RcuLHwNU6LISRU3WjBN/+EE6t3wRWryK0JRMxG/GXi3/XLFkH0tq3C5+W55a
         1TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvc70662qT1tudUaeHKF9NVD5XdghLVQqXJv6WZUq7k=;
        b=HM3LAtst0cFf3yaCMNVOa7aEbAAJgXNKZlBeW/QcQRTGjGDmwlUQC25xt26NURrnEX
         hDD3Qk+hK//npgkqMCKPhKNbtcWSlZetIzN7QSfwZLX5U2IGp1OCoupOdPRg/QWx/UK1
         7yXnK312xGkSR8iJVvlaM2MKwdHv6TDpBYfAaQRj1jMQb3xeLjbUaZjDhKbQNq9Zx++N
         tkiBGmNRVhZub72VFLOKHQ2iy8b44W+GZfcKMFZSNsccltsRZ3Hb7AhZ2PDy2UL3eHX4
         fVti5Kiac9gcdVdhsGAZiYvUvVlOfTeWuq/X+qMcq8Yo3qNXLWW8yWImy+dFDmMNh4vw
         Yu0w==
X-Gm-Message-State: AO0yUKUy2hPNtjJNCSV6w5wC2g4+zr2Hz36vxtEdfPm+sPYrOb+WzZFA
        Y6ReBOewvnMxTVCL9NUU9TYrKYtSfMZ5C1Ri
X-Google-Smtp-Source: AK7set/qHwGkIgf/BP+Zq/H3KlrxtCkwAw9/fP+bS3H788mDQqiZKzJlKhYFJKZ9/5o1O+XgwQvo6A==
X-Received: by 2002:a05:600c:1609:b0:3dc:53a2:2690 with SMTP id m9-20020a05600c160900b003dc53a22690mr6250444wmn.7.1675857963621;
        Wed, 08 Feb 2023 04:06:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm1718825wmc.10.2023.02.08.04.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 04:06:03 -0800 (PST)
Message-ID: <1dc0589b-2434-47c5-a1d2-d253b06d3a67@linaro.org>
Date:   Wed, 8 Feb 2023 13:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] arm64: tegra: Add Tegra234 pinmux device
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>, jonathanh@nvidia.com,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        smangipudi@nvidia.com
References: <20230207115617.12088-1-pshete@nvidia.com>
 <20230207115617.12088-3-pshete@nvidia.com>
 <f0d58e5b-74df-26cf-592e-302a00d08eee@linaro.org> <Y+OAthBgds9InvKp@orome>
 <7bb3e201-954d-c8eb-9430-19626c43fe75@linaro.org>
In-Reply-To: <7bb3e201-954d-c8eb-9430-19626c43fe75@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/02/2023 13:01, Krzysztof Kozlowski wrote:
>> I wonder if there's a good way to detect these. We'd have to run checks
>> on the DT source files, so that's a bit difficult. I do have an
>> experimental script that tries to capture some common pitfalls on
>> sources but it's quite ugly and slow, but I guess I could add something
>> like this. But perhaps there are better ways?
> 
> One way to easy spot them is to override always by label, thus every
> node defined like above is a new node. However I think we talked about
> this and you do not follow this practice, thus there is no way to tell -
> is the status reasonable or not.
> 
> Automated tools could help here as well - run fdtdump on DTB and look
> for status=okay.

Eh, obviously it won't work - every node which was disabled in DTSI and
enabled in DTS will have the status=okay...

Best regards,
Krzysztof

