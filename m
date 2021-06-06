Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CCC39CC88
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jun 2021 05:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhFFDiN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Jun 2021 23:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhFFDiN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Jun 2021 23:38:13 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8591C061766;
        Sat,  5 Jun 2021 20:36:14 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id t28so10516926pfg.10;
        Sat, 05 Jun 2021 20:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nOHkwYNdmBG1Urjy0pkf0c1gAzx1jqpD6R5jPP1abZI=;
        b=gkdIEZ+2pklQ0eoJSg0wvm3WrTCelFXIA2Z558rcwgM7kBqiMLpeSsM1a36W9xQSjN
         gA5p1Z3BUT46HKYWCkmlPBw021K+qInn+fw0VxNk9l5K4GWT4aChwE20lMgv1W/n8n/M
         vV0mgFaBJnm5Huf7BAvSVwK5pxtaw80jhRnI5R61Ebc6vgOoGAYjq6RhtDt0VmdQRXWs
         rFhp3P145yhd8lhF66DZsp/ONiXCHnE8rcRu25JOdLi8ob0xZbyVaLj9xRA1mepxWUrD
         2069MQAZHKWdzJLfTQJGvHl1Q4YPSsDV3KP1xsmN1uKI52Did+C33Pxx4dgGHfrI0XQj
         GheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nOHkwYNdmBG1Urjy0pkf0c1gAzx1jqpD6R5jPP1abZI=;
        b=GmLXEfz9r5yP9MTvS5KFLwu/xZtaaxqwFOdKYI3UV0eo1NzgCs86cnI1rK3O0XYuVG
         zZNkf+8zHD5e6mSGguD0/JcOtAETiL43YMF/H/UwSPqqOAaUV8QmPrGtjlysHsb4iwwl
         2SLLv005NJF2lcINPEwiA8/YnwKKWx9WceuiK72Xqpxx2XCdEgVKdXylpfsIELU7KsH5
         I5ikvLTGy6oKUl+u+EtGlHCINbSIFLnUhAqCUX6d74xh2Szq3amOwj/7KItHMDy+lD2z
         dF6Muwk7GPuy2l+YHc1+3+3VOazhcf9waEkNdp/Xqpp9jpdYN3b/Ig4l+45ACB7xnbwb
         tAXA==
X-Gm-Message-State: AOAM5324BnLbZ22flRhgbAgz099M/aZnljZ2nFBGDPJg0wlKtMHoEOBQ
        exqtoFrwqwA5GgJr6CLN9Ic=
X-Google-Smtp-Source: ABdhPJybjMuq0Kv2ZVtqtcBeoJ78w55qJfilWq78XStjq8IsOM/5oOk126HyFwJD8LHTuGxqjomr3A==
X-Received: by 2002:a63:5511:: with SMTP id j17mr12409104pgb.191.1622950574421;
        Sat, 05 Jun 2021 20:36:14 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u8sm5398273pgg.51.2021.06.05.20.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 20:36:13 -0700 (PDT)
Subject: Re: [PATCH 2/2] pinctrl: bcm: Constify static pinmux_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210605185908.39982-1-rikard.falkeborn@gmail.com>
 <20210605185908.39982-3-rikard.falkeborn@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <47d98677-556f-0f07-7089-b5f95c6739b0@gmail.com>
Date:   Sat, 5 Jun 2021 20:36:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210605185908.39982-3-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/5/2021 11:59 AM, Rikard Falkeborn wrote:
> These are only assigned, either directly or via the bcm63xx_pinctrl_soc
> struct, to the pmxops field in the pinctrl_desc struct and never
> modified, so make them const to allow the compiler to put them in
> read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
