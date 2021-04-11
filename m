Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0766735B664
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 19:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbhDKRwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 13:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233822AbhDKRwN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 13:52:13 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D3BC061574;
        Sun, 11 Apr 2021 10:51:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u21so16456100ejo.13;
        Sun, 11 Apr 2021 10:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oNOTBqeY9jtjLSAON3lVQ6MLW31wXxn5D9F9gYPVVu4=;
        b=XHkxF3IQa/hR8xLpG2YUvfZc8NOXCs1YKaI9qeXyRLrQbwabZW+AeoRcZzMeik7Uha
         b1xoSzpM9bRFnRsVfEIV1wRWBZBzOyQ7rpX1tjdmfiNFFe9ikeB60lQfxD7I0UBopWRJ
         3hRC5dN1aNZOZ+Jn1jP+r5h5fRIzgarYNn7TAccS7d/ELSZBr+zUZfYYxq0vmrUV2DKh
         k8sU4l1KATHkG6wI9BU9djA5cVd5LpW2dxYG60z8XUcdchTzbhzniF2dDh2akL8+clAB
         w2PtuyxrDPNUI2yTXo3cBcT/r2smPtVC4R/QcE6tIlZ+gGiFxxmM/gl2FZ5IXcJiwLEL
         xPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oNOTBqeY9jtjLSAON3lVQ6MLW31wXxn5D9F9gYPVVu4=;
        b=nLHINOwsJK+ohPlXl7/skNv49KqIl0JNbugEsc9mnfbfXOVITMp/cVr5qBGbMUIwFs
         +4YLG3zBOmocpIdDn7jY7pPZuE9vsc4V0XoHYoNtyH1KAA8vVfNkIwKeeUzwvcunYoZf
         x/9IBPpQS6axldH1w2B+3wQGB8RESdtrMOWZgP8/eM9GVLFbC2VByEeU52GffaZx5s/f
         qYkUuroH0eymgaYvmpoDgSDLSxe6MpL1VH/ViIM3DW/d30oLzF+JmeAemROsQqGQbiml
         cKC+LR7pS955MDCP9UUuOElLkEuuxFfFEZ5fsD+E+PxDaEOle8z6qTD4mrAZhYqN1gg9
         vZ6g==
X-Gm-Message-State: AOAM531itKqTVBAu2pFoB5p2IFkxPBgarlYIQSYyCM9+oKatUJq7Cn/X
        o1HuPRifIWwODyTe7RbZrZGt11nEKFRvtA==
X-Google-Smtp-Source: ABdhPJz+72LDgeAexpDAcDks/cfETt22UrJuQG/bU2n3vf+A/D03Pw3IZkiQ5GXMql63ZZZJyuHLDQ==
X-Received: by 2002:a17:906:4407:: with SMTP id x7mr23873759ejo.546.1618163515532;
        Sun, 11 Apr 2021 10:51:55 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n5sm4351187ejj.73.2021.04.11.10.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Apr 2021 10:51:55 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] gpio: separate gpio driver from pinctrl-rockchip
 driver
To:     Peter Geis <pgwipeout@gmail.com>,
        Jianqun Xu <jay.xu@rock-chips.com>, huangtao@rock-chips.com,
        kever.yang@rock-chips.com, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210411133030.1663936-1-pgwipeout@gmail.com>
 <20210411133030.1663936-4-pgwipeout@gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <5308a59c-29e9-75a4-2c9a-4aeb3d37bf6e@gmail.com>
Date:   Sun, 11 Apr 2021 19:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210411133030.1663936-4-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

When I check "rockchip,gpio-bank" with YAML it turns out that
rk3288-veyron-XXX has 'gpio-line-names' as 'extra' property.
It is not defined in the "rockchip,pinctrl.txt" document, but in
~/.local/lib/python3.5/site-packages/dtschema/schemas/gpio/gpio.yaml

Where is that in use?
In this driver or external?
Can it be removed from mainline dts?

Johan

/arch/arm/boot/dts/rk3288-veyron-fievel.dt.yaml: gpio7@ff7e0000:
'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema:
/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml

On 4/11/21 3:30 PM, Peter Geis wrote:
> From: Jianqun Xu <jay.xu@rock-chips.com>
> 
> Separate the gpio driver from the pinctrl driver.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
