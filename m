Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB7C3B3C90
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 08:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbhFYGUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 02:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233181AbhFYGUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 02:20:18 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0ADFC061574;
        Thu, 24 Jun 2021 23:17:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h17so11863000edw.11;
        Thu, 24 Jun 2021 23:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OXD1nFT9T+bpMKYpL0JBavvAN5ulnBIHUSuyvaKQlW4=;
        b=vaba2H5cgu7Xx1X891XBNDFnQvnWJYGck060oiXxaYazK/YHpzqwgP1LYoCTfCAeNw
         7UtONnqYBEINag7wsvSxStQv5m1ddN4HGe6bb8YWxmqGyBdOrucxwklcqvBssiz6nivm
         fK3Tk6HHiP7IN9uTggiXVmCasW0kz+8jk8U7RZBUKxWuG72ugNB+dZNQ4ecVVsV4+LvE
         p7cMco9vtZ8brMozZ1B8u7/ms1uxmQAdDI/kqw8QvR4WnjjcJ7ZRPKGgm87YYBKoiTgL
         HyCtkUJC1Fq/7d09yNBirSGTzaV8HWb1Dpjh9YePoDj/OEWjFO88rWYkLeQXZPjUtOra
         hCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OXD1nFT9T+bpMKYpL0JBavvAN5ulnBIHUSuyvaKQlW4=;
        b=YHEDEnfV3JFOr3kPMY2upzIXQrIyFlek89vmHHLWyG5vygmtwv/BZUM/nd1HIXg65Q
         XWTa0uaH+NbX1f2oYRiAC7wANj8gPLcXNQEgolaRt1N8Flv65hg0nyE19tr5E3TIbDNF
         vtXyMUcCT5kNJgjpJdpdSfcnEFnsRaWb+QIAS6vaqfKAZJourEc7/ruN1+5oVoQnwT99
         9g1VIERPn85MDczUclmnMezbuY9C+sEwISlQF56eSDX87QdHWFppMOsYyLjG6zfZVRN0
         AIEI1JDFmYgD8UtfczWenrUracWaTbypTJUhKuYxN4DaYpEUvrLclJwHeHBgw52uuYUy
         jtQA==
X-Gm-Message-State: AOAM5325IqGi/VnQYDQrBwN/S3iubRfNCQtGiWPzQ2AEeCZg59s4thbU
        S7COyNGrEOeRQGCBSJCoYsI=
X-Google-Smtp-Source: ABdhPJyfn1or367EG02dA6X/MR5ebjFu64dBDvYaOl9nk6hXypF6iHMOvw6uA2AR/FOJOPIFHMFBwQ==
X-Received: by 2002:a05:6402:2210:: with SMTP id cq16mr12295912edb.261.1624601876248;
        Thu, 24 Jun 2021 23:17:56 -0700 (PDT)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id hy5sm2259429ejc.72.2021.06.24.23.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 23:17:55 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Add Pinctrl for SM4250 and SM6115
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20210625051138.2997854-1-iskren.chernev@gmail.com>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <e1e447f5-b0a2-e8a1-5d84-28dc29c50824@gmail.com>
Date:   Fri, 25 Jun 2021 09:17:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625051138.2997854-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Please discard this version, there is v3 addressing all points from Rob and Bjorn.

On 6/25/21 8:11 AM, Iskren Chernev wrote:
> This patch adds support for the TLMM block on QCom SM4250 and SM6115, codename
> bengal. The code is taken from OnePlus repo [1], and the keyword bengal
> corresponds to sm4250 and sm6115, so I'm adding both compat strings.
> 
> [1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250
> 
> v1: https://lkml.org/lkml/2021/6/22/1163
> 
> Changes from v1:
> - fix binding example
> - fix cover letter text
> 
> Iskren Chernev (2):
>   dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
>   drivers: qcom: pinctrl: Add pinctrl driver for sm6115
> 
>  .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml |  172 ++
>  drivers/pinctrl/qcom/Kconfig                  |    9 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-sm6115.c         | 1482 +++++++++++++++++
>  4 files changed, 1664 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c
> 
> 
> base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
> --
> 2.32.0
> 
