Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B721550C902
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbiDWKF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Apr 2022 06:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbiDWKFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Apr 2022 06:05:55 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2659C18746E
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 03:02:59 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z99so13143484ede.5
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 03:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VxTbz/61EBkYnAtoeVOTreTiohwdB8m5aatXEPOs56Y=;
        b=wKwr4PjmG2iH3MjybUlBF5EEF1KoicnTRf+lsmPwz/8ptiW4BTVJ8iPtTACg9Qw8cg
         LSxrriHlFZ1JDnPpgSEt0PgdYJfWnW1eW1UMO3dwLrsE+lT5oBNOFQhs1BUd2JNNc8mM
         CwObPksUx0Ydxp+FB+3Ebhos6a2qMrp425q9F17hscPkjCXSbg8jQRjyYjiYJ4ifSwb8
         7qvRLVYuvbPzt96bRxRJgsmNwRJCm5u9Lxl67O4G3s87tzJSaK1R8NW+h1X+upmQDxZx
         xTLUmtnsmOH7eL/URcE1HbqJZYxmyeyBKPNMOrXjlvyFkixMvEZW6eL1FB9mwHq86HKw
         jezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VxTbz/61EBkYnAtoeVOTreTiohwdB8m5aatXEPOs56Y=;
        b=dxJlYfr2iJ6Y5deyKPxUj/BKr7OiZJJtI9B3HtvOFW9IEk5IKEddnX8K8+9ELC3FWa
         fLbEqNPJKIe90TkPUqBgAqfmHDOHZXHupTfsAe+i8TJoO1J6cSvp7CHp8WS4pPZmerCs
         1TsQsS6L2egE7ISWmni97F0m0wELqweGTvKfjkxGtCg56lfFpirEVQ9GPg4tKbJQ0WMT
         PGEGCDRwl6dOOEqwn6XjNJlKeob4QdIjEa4tRP8WYofrZ1TkBuvHKbq9IYwF9J6uMbDr
         fBJixhD1A/Sfn2wSc9HkD8Uuy4Ah7b3G6tKY3FnJtn20FDtH8ODBzdNdYxEyIk4VJB5q
         C6vw==
X-Gm-Message-State: AOAM531tdR+TxglNarhXDOHyHZzZcnJD0aenq63FtZkT/cIYPh6NGuXW
        O1gJ48Gp0L1aJQivitBWOPQKtQ==
X-Google-Smtp-Source: ABdhPJxDW43NqQtrujSc4G0sjErIulv8al4rq9aXoSm0TYEn0LCABwGp2SAZ+HfqhRpD2xKNmOcETw==
X-Received: by 2002:aa7:de93:0:b0:418:d700:662a with SMTP id j19-20020aa7de93000000b00418d700662amr9313643edv.107.1650708177812;
        Sat, 23 Apr 2022 03:02:57 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q15-20020a1709060e4f00b006cdf4535cf2sm1508043eji.67.2022.04.23.03.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 03:02:57 -0700 (PDT)
Message-ID: <1903537b-ff19-d261-aca7-43bc28978521@linaro.org>
Date:   Sat, 23 Apr 2022 12:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCHv1 15/19] dt-bindings: serial: snps-dw-apb-uart: Add
 Rockchip RK3588
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk,
        kernel@collabora.com
References: <20220422170920.401914-1-sebastian.reichel@collabora.com>
 <20220422170920.401914-16-sebastian.reichel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422170920.401914-16-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22/04/2022 19:09, Sebastian Reichel wrote:
> Add a Rockchip RK3588 compatible.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
