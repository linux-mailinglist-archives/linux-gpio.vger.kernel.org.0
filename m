Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F17F42729F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 22:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243042AbhJHUyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 16:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242932AbhJHUyJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 16:54:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F49CC061570;
        Fri,  8 Oct 2021 13:52:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m3so44307687lfu.2;
        Fri, 08 Oct 2021 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7g6gDjHhhS40IiOHUGFSZlIOtiIZlGNrVMwrxorSJ3c=;
        b=Cav3L043ILftm3k08p/PdGpS70S2KFmvJ5pKFzpulXASOqgDqL9t/gu5uAy22bI/S8
         eGVos0YANGmNwaSrJNHD5GfV0cN+hyTGyoDtNQyI9eZRq2cc/37MEoZvSHD8ofR1UV5Z
         uT96V/z4+eTXlhvJZvU2/9cY8pYHa6HBluRXNp62kS5NdeLbU5l6KLUfdDRcjRgEN/sA
         PSirpp9zOTsiUlBO+H93Ib47hgaJqgl/vEU2vji13RvcHdXo00WqdG70OX37ZhofXn3x
         2npOSdX74Ej0k1XLfaBrB8CDHlpniIpCSUisNyvr12FW5LA8+xbqocHOnzWAPR4Qp1wk
         opoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7g6gDjHhhS40IiOHUGFSZlIOtiIZlGNrVMwrxorSJ3c=;
        b=TLKL3RFT3y9eMJa+rZKFWxjakcp8BIVakYOx72/kyNs111/oROmJ4SjA4mC7OcsSu0
         sJLVss17TjZGpLEAUNKXBld9wVo9dmwNdF2MuuFBdDvgXd95Fs1pOJClCupmDeueMZNz
         iXE0HPFRTDJEOs78ry8ROqoQ/vgUcCeZfe9OGKCtQTzhScaxA3drQFzVgRpxLrzEp2aJ
         bC4pJS9URsrH+NjnDJRCDVTJk7z8B2A4+HPc5LZC0CcXqvldfndW8qC+19TbQ7b4c8OL
         5w7v37zo/Pil6o9eRLQAepYoq458HdvHuk1GIgSMS752MArhpZosFwO+XfQKtns/dFHN
         hawA==
X-Gm-Message-State: AOAM531ppxaaizS55AK/U7r+CJw8m6MNZO73zUXkNtz0ft8zOJS9K7yW
        QHi44a/NkYSI0BYTRRg1n7o=
X-Google-Smtp-Source: ABdhPJzPyIYpdlFYtK1n40u91+MFmdeJxJmDCe22SOvBkCZ0qHoy/qpiARoRQG4w7vQeJhTdN0bcwg==
X-Received: by 2002:a05:6512:2301:: with SMTP id o1mr11961418lfu.333.1633726331801;
        Fri, 08 Oct 2021 13:52:11 -0700 (PDT)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id bj40sm28460ljb.106.2021.10.08.13.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 13:52:11 -0700 (PDT)
Subject: Re: [PATCH V2 linux-pinctrl 1/2] Revert "dt-bindings: pinctrl:
 bcm4708-pinmux: rework binding to use syscon"
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Scott Branden <sbranden@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211008153939.19685-1-zajec5@gmail.com>
 <1633722536.868012.3211952.nullmailer@robh.at.kernel.org>
 <cf2ca705-d6d7-d69a-3c66-59f7c997f6b8@gmail.com>
 <YWCuwlWlHcAxsKm/@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <25e875ff-ec4d-0872-4e56-2cd528ad3ee8@gmail.com>
Date:   Fri, 8 Oct 2021 22:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YWCuwlWlHcAxsKm/@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.10.2021 22:49, Rob Herring wrote:
> On Fri, Oct 08, 2021 at 10:08:46PM +0200, Rafał Miłecki wrote:
>> On 08.10.2021 21:48, Rob Herring wrote:
>>> On Fri, 08 Oct 2021 17:39:38 +0200, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.
>>>>
>>>> My rework was unneeded & wrong. It replaced a clear & correct "reg"
>>>> property usage with a custom "offset" one.
>>>>
>>>> Back then I didn't understand how to properly handle CRU block binding.
>>>> I heard / read about syscon and tried to use it in a totally invalid
>>>> way. That change also missed Rob's review (obviously).
>>>>
>>>> Northstar's pin controller is a simple consistent hardware block that
>>>> can be cleanly mapped using a 0x24 long reg space.
>>>>
>>>> Since the rework commit there wasn't any follow up modifying in-kernel
>>>> DTS files to use the new binding. Broadcom also isn't known to use that
>>>> bugged binding. There is close to zero chance this revert may actually
>>>> cause problems / regressions.
>>>>
>>>> This commit is a simple revert. Example binding may (should) be updated
>>>> / cleaned up but that can be handled separately.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>> V2: Update brcm,cru.yaml to avoid new yamllint warnings/errors
>>>> ---
>>>>    .../devicetree/bindings/mfd/brcm,cru.yaml     | 11 +++++----
>>>>    .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
>>>>    2 files changed, 19 insertions(+), 15 deletions(-)
>>>>
>>>
>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml: cru@1800c100: $nodename:0: 'cru@1800c100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
>>> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/simple-bus.yaml
>>
>> It's warning we already have and not something introduced by this
>> revert.
> 
> We don't allow warnings, so you're saying this one was warning before?

Yes.


>> As a revert this commit should introduce as little non-revert changes
>> as possible. I'm planning to improve that example later in a separated
>> commit.
> 
> You have to fix the warning as part of this series.

OK


>> Can you take a look at this commit despite your bot warning, please?
> 
> If 'CRU' is a hardware block, then I don't think most of the revert is
> right to use 'simple-bus'.
> 
> If you want to just replace 'offset' with 'reg', then I'd be happy to
> see that. I've been pushing child nodes of syscons in that direction.

Well, it's a revert, not a fix, it goes from totally wrong to semi-wrong
;) Let me send V3.
