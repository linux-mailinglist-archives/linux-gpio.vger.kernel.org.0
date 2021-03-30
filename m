Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759AC34E3A0
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 10:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhC3I5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 04:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbhC3I5Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 04:57:25 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C1EC061762;
        Tue, 30 Mar 2021 01:57:25 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso7981656wmi.0;
        Tue, 30 Mar 2021 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MVk3x6ly3uTfXv9OyHlmA2lht7ASwMRy2yMGeaAU04s=;
        b=PCZ0Bt4HUBMbaIE4ap2fsbPrFjmMEw7kqtUHhEqR3rh1xtZFns+5FEcLcDsY/ygtMX
         ifwQt0i2MRHu+orfHe/1QEqvxvuWYp6Qo9d1KpHeWUgb/BdeYOt70GbBxnHEBbpd0SRC
         xZiHlF4C3SmeqfGPQs9yctsZ00+HxkoT4UITpjGd9s6Dly0+aDzkZxgqtZbuLCvdqGXe
         72wyvZiFTwK/IuwyQcHEqxurnyKCC8DRmVLm/coYZqgxRMcFbRzfI/c9cmg0/QftRHFv
         /BNTfQC1xzLmak16Zp/7kXBBhhzOEh3xaKBwFB6/r3P8PH2a82l+82Wgz3UXvCH+RSYj
         eLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MVk3x6ly3uTfXv9OyHlmA2lht7ASwMRy2yMGeaAU04s=;
        b=SLQbKFW2F0Uw0PbTzOS2Bi3/bGe/J4l/zRJK2HrNOUe6f8awERkYK4hVFRvPcPzP52
         LuLt9EspBC/vl3WxPj+gOJAq2f5mvm0j9TBfqGcA6TlPJx3JRyQdtAWFMnOgVZ322X69
         r8XA6D3GAmCZ5W6MQy/dPcXEVE8xatuZFDW1Gnpx1NXPoDedMt7dH/SQ409+6iCbsqTN
         Cc+zavJT4STvhPHY0BzrLUvtdG4JoLAt/cugYWzDPcMRY6cOqZoZBVh+Yw/fOek99g9h
         K4AmdttAzDgjt0Hs6zLKvnDflbJUhAnM4vtvpOeBp916RB/KAV1PnblttSBEFc9uiXFM
         wS6g==
X-Gm-Message-State: AOAM530LhpCLzMzERfvBBRM17MiysWfelEKd1tU8xqMc5RG6g3rhWRlU
        m8LdV1PieIIsTHw76KC1mx5oi31HheIRow==
X-Google-Smtp-Source: ABdhPJy+NVavPPoVso7DUmLFx9qjpMJ8wh5HMbnY+yuGrAD54aoYMEamo2kTfTK2ef9pGXb93JGTUA==
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr3051502wmj.28.1617094643995;
        Tue, 30 Mar 2021 01:57:23 -0700 (PDT)
Received: from [192.168.1.10] (176.red-79-148-190.dynamicip.rima-tde.net. [79.148.190.176])
        by smtp.gmail.com with ESMTPSA id w6sm33352228wrl.49.2021.03.30.01.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 01:57:23 -0700 (PDT)
Subject: Re: [PATCH v9 00/22] pinctrl: add BCM63XX pincontrol support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210324081923.20379-1-noltari@gmail.com>
 <CACRpkdZE55ixxSp6H1SKx19trGE_uVGgkLttzAVQuLzw4=Jutw@mail.gmail.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <609f038d-3037-5cda-b489-f0816eb95658@gmail.com>
Date:   Tue, 30 Mar 2021 10:57:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZE55ixxSp6H1SKx19trGE_uVGgkLttzAVQuLzw4=Jutw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

El 29/03/2021 a las 12:19, Linus Walleij escribió:
> On Wed, Mar 24, 2021 at 9:19 AM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
> 
>> This patchset adds appropriate binding documentation and drivers for
>> pin controller cores found in the BCM63XX MIPS SoCs currently supported.
> 
> I have applied and pushed the v9 patch series with all the ACKs
> to the "devel" branch so the build servers can churn at it! Later
> today I will integrate it into linux-next.
> 
> Any remaining issues can certainly be fixed in-tree.
> 
> Thanks for your perseverance in cleaning up these SoCs!!

Many thanks for your support! :D

> 
> Now, what about a patch set for the IRQ support? :)

If you could give me some guidance on that matter it would be much 
appreciated, because your comments [1] are now outdated since I switched 
to GPIO_REGMAP
[1] 
http://patchwork.ozlabs.org/project/linux-gpio/patch/20210225164216.21124-3-noltari@gmail.com/

> 
> Yours,
> Linus Walleij
> 

Best regards,
Álvaro.
