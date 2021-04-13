Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B00335DA79
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 10:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243897AbhDMIzg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 04:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243886AbhDMIzf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 04:55:35 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA212C061574;
        Tue, 13 Apr 2021 01:55:15 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id v6so23384101ejo.6;
        Tue, 13 Apr 2021 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ewtIu5p3Y0Xu99ur8olSmUgiErVcImHe/VcmOukwaEs=;
        b=Cv1TjM96wPkaSAIumPZnOxI7YBMHUTN1xUGcSlLDNjw8cLkyu2Fm0FnxnJMd+SEdHm
         OQmPnMf8N5ec8Plz/9sSPs10Stcq6t1XD3/eOlqcIXPJ7FilxfIs5Efc5lm17wvAT+9T
         DbCdnpwuv/Us7hs9jtH4Tjvz8MuJUzRkP7NQPm2CYAML1ulEiJA7jkMbBMXy+UWs9W3I
         v/WKoBe3h0vcfszKWB3NG7noUJjGDKZDhySuE6MbOHb9+XMCYUEadvA/9jT2WXY3rtXW
         IwlflKhAQUIIUQWyoqKQj4c8Rck7lkW+PxMXcXLubbWdPhDA7a3Lk7xacbQRD1o5CJ3L
         3/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ewtIu5p3Y0Xu99ur8olSmUgiErVcImHe/VcmOukwaEs=;
        b=ZwIERYTfW24skGe+UkvW9F4NHVPxlzbABZWo1baRQZypltXSGhl18+sImusA5FBjdT
         yjn7/O+zifQuObUk6zxzH3L8K4FZd4wzwsWtiy/+VtHNMhUbeYkaeVfq/pyw+SgvLt3X
         RjU6PLS2HKiDcB0cjuekzR3wEhto37XuHWj0wazBu2YJBzKTFWBUGlqzOW7FZGbKqcQr
         hV7BPojwORdGss5ypVvct4Xg9umvSSnNsMvhXk64s11jVCHigUBprC3kD95LkYjmGY3X
         cECX21hH8s73fkGcBxmGzbtU2MHUFUvhWewvJcok/wqwceXLP4JwN42Ol4NuaKBIdZKJ
         sfbQ==
X-Gm-Message-State: AOAM533JN9HO8v7aKSycsMmKTXLDq8QPGzEqR0teBOU61TBhCOY/uPDe
        oixwgkDuLQnqk19xSMRYEHGed1c3v5IRGUre
X-Google-Smtp-Source: ABdhPJz1+mFBiqlZivwu2ed0Bl8pELKvAdWOAjzLRzW7jC7p4OylH7FXt/JSJFA++n+ak3UZqLcBXA==
X-Received: by 2002:a17:906:5fce:: with SMTP id k14mr16144197ejv.9.1618304114660;
        Tue, 13 Apr 2021 01:55:14 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e5sm8763675edr.64.2021.04.13.01.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:55:14 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: change gpio nodenames
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel@vger.kernel.org
References: <20210412223617.8634-1-jbx6244@gmail.com>
 <20210412223617.8634-3-jbx6244@gmail.com>
 <CAMdYzYqTS-qEOaVsnWMSABpj5Z55An_GLCUoOZZg-fjMp9qi8w@mail.gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <9fa62a53-e4f2-5032-cf1b-267e470af1c9@gmail.com>
Date:   Tue, 13 Apr 2021 10:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYqTS-qEOaVsnWMSABpj5Z55An_GLCUoOZZg-fjMp9qi8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/13/21 1:22 AM, Peter Geis wrote:
> On Mon, Apr 12, 2021 at 6:38 PM Johan Jonker <jbx6244@gmail.com> wrote:
>>
>> Currently all gpio nodenames are sort of identical to there label.
>> Nodenames should be of a generic type, so change them all.
> 
> Currently the rockchip pinctrl driver checks np->name against the
> bank->name and if they do not match it does not set the gpio-bank as
> valid.
> The new GPIO driver appears to follow a similar method.
> This will break the driver without a correction.

Given Rob's comment in version 1 maybe combine this serie with yours?
With Heiko's blessing maybe add support both for legacy and for the new
format?

Johan

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pinctrl/pinctrl-rockchip.c?h=next-20210412#n3836
> 
>>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
