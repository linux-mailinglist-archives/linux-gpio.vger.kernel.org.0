Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F0746C2EA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Dec 2021 19:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240505AbhLGSgR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Dec 2021 13:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240160AbhLGSgN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Dec 2021 13:36:13 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297AFC061574;
        Tue,  7 Dec 2021 10:32:43 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso137952pjl.3;
        Tue, 07 Dec 2021 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Fz79Zw1XUWo4TTtZ+lJkjDQ8HIjg7qXcQ0lK5kRZaeA=;
        b=mJSqawCWPruWg4AuJdubaQzSzgcWk0jFx1jXZwPy7c9ijnkoN3KWOYaQ9J2aKjbihR
         xl7QwFj61Gz4AJzYyxSQcyJ94CpCjVA+BJk/DCmQ/GXskDvY58UPD7UXCj1fV99JptUa
         fEfdmsvDyXQg43DjAiv9E4WoK0cVebMMeRTPRkZLb8PYKbdbMnSZtaYI+9MdyydXeIoQ
         dG41nhPBxdBJFwVjtqF5Naga2gWfENwnAw3acQ3mTjR6IQRPw9BGmOlufvDBWEb/ecty
         p3Q4dey/UkX0Q46hoXAUJgh63sTmG7zJQ8xvOpbptYVvyw4owB1G1GCFEGdWRxOUOVU2
         FW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fz79Zw1XUWo4TTtZ+lJkjDQ8HIjg7qXcQ0lK5kRZaeA=;
        b=ZDEfTEihRcq5jtgSWr1MYPRQuudqRM0g36WvwXMPKlFj5RrYVMdWOCPpHhvvbYu+Ks
         taVqgEDB320Q+61FItddUweFpQpgPGQeTDQTKkpPvJzgbf/uCS8k4DV3T0IVpKOz+8w8
         ijKKVN3UTd7uvtCfx7dNpxtXUSlMvGSU0o43F4F3Mj8hXQKiFitItWjBphvNFTC4dOZD
         AMDRkY6JnSzQ2i/3yt3F6lmfCYMXHxPohFnIjoQoM4fyIJUmCjpRNVg1V7vZgnBz2VuE
         8U/Nx9p9RiR4GpYiLgDniFXeGpNEq98lrQYGXlNx/YC4hntyk+lmVIwLL3ytsCui5utT
         IsBw==
X-Gm-Message-State: AOAM533ZLYKrJ1mM5b/7xy6TBnJvavewor4RapZD9FwhDN+72ex5olm+
        Y7DsEku04ypy7N1iSl4nSwa3bQ1XnVs=
X-Google-Smtp-Source: ABdhPJxTV8FMDebVvQYswEOqZMuSpm8yBtEkdHHC8sJFhOkyQ2i4CR3xSIwSXxYsgwJy3KjTjQzt+g==
X-Received: by 2002:a17:902:e74e:b0:142:fa5:49f1 with SMTP id p14-20020a170902e74e00b001420fa549f1mr53122970plf.84.1638901962165;
        Tue, 07 Dec 2021 10:32:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id a3sm221845pgj.2.2021.12.07.10.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 10:32:41 -0800 (PST)
Subject: Re: [PATCH v2 1/2] pinctrl: bcm2835: Change init order for gpio hogs
To:     Phil Elwell <phil@raspberrypi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-2-phil@raspberrypi.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2a799587-9e58-4907-e41d-05920509f55d@gmail.com>
Date:   Tue, 7 Dec 2021 10:32:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206092237.4105895-2-phil@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/6/21 1:22 AM, Phil Elwell wrote:
> ...and gpio-ranges
> 
> pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
> side is registered first, but this breaks gpio hogs (which are
> configured during gpiochip_add_data). Part of the hog initialisation
> is a call to pinctrl_gpio_request, and since the pinctrl driver hasn't
> yet been registered this results in an -EPROBE_DEFER from which it can
> never recover.
> 
> Change the initialisation sequence to register the pinctrl driver
> first.
> 
> This also solves a similar problem with the gpio-ranges property, which
> is required in order for released pins to be returned to inputs.
> 
> Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding gpiochip")
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
