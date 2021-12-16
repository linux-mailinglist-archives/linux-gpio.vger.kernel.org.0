Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00C94768AF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 04:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhLPD2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 22:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhLPD2d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 22:28:33 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCB0C061574;
        Wed, 15 Dec 2021 19:28:33 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id gn2so17019pjb.5;
        Wed, 15 Dec 2021 19:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CKQhwB0xZQMzbkkdXn/TW7cYqm4Mbp02B/Y5pPkWODk=;
        b=R+4s/8F0tY/sCV695ByxgQApQUu3ZqEZxDE/cRjPIz0ABsFiZFMyuH4jfyUhJop/Mq
         Fp104rvVo8EqSS8flIZOt9FbQbzmGRRCYQFI20/278ReW7CFH0Ab2mojHia0uGvjeexs
         3vDi1tbUOQnE5SFWg2QcCt9d4uQ+PTFjvHG1kIVyJ6YYv1g14ie1jFF0d+aNK6rK0Z28
         yBnUWWUU4xGLIxtt3tH/5EkSnI4vc+izJ5hs4GlYzhFedgU2pHs2ImrrxEYVZVU3iTpE
         7z3xZDbussxl6Kaey5Ruf2uv6uB4o9P4JOnxVDauaw+/trJRQW4p5xGy8iO7AXjQ+Exv
         OgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CKQhwB0xZQMzbkkdXn/TW7cYqm4Mbp02B/Y5pPkWODk=;
        b=hChofYKnD7isfrxTNoZV6EAgl7bnW3exYsmUc610roy59M50Ridi/AoQO/aGwkpbxi
         3ZrF5sqwyIo2maFzC0MNzdj4x0XDDWcH0dUPQyw6640Tn1kK54pBwzmhM0lodQB1KNrn
         ApBwz8xfusreKM2fEj9SMKqeGeCautD3b0OPKm1r25/tbS/Mn6XfDPOZpvSH2ogNIKBh
         nizcYb9fHkJ+lb7ZnKb3gxIEgRhQHRzYw5ghJlu4z45Nud+annfZCtYG61p/ylAIaFDR
         qo7I+y54dZqnaNTHvUJkT803Rtt+qKvSDZAyF4ydISlL/KBAGDnv7J4GL5rU4PX/UJ+b
         AD0w==
X-Gm-Message-State: AOAM5315Z3MPCHIOQ0zSvZtOpuY/bdALU+HeBOr0SI861sirWkXrKjdn
        g/AuOTDoJR2/WscQG+2f748=
X-Google-Smtp-Source: ABdhPJytmtDjd4EJoUSDXVR3ylIZCCZjUj2nqgfebPrVjupzV7o0BZb1fBGwvENLcLPcR5m3Dh32uA==
X-Received: by 2002:a17:902:d2cf:b0:141:b347:df9d with SMTP id n15-20020a170902d2cf00b00141b347df9dmr14705246plc.37.1639625313120;
        Wed, 15 Dec 2021 19:28:33 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id z22sm4162717pfe.108.2021.12.15.19.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 19:28:32 -0800 (PST)
Message-ID: <e6ba2ec6-6de4-687c-5d50-e3e6ac11ba44@gmail.com>
Date:   Wed, 15 Dec 2021 19:28:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     nicolas saenz julienne <nsaenz@kernel.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com>
 <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
 <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
 <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
 <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com>
 <83bda801c9be665086f94acce46d44da5d24ba9c.camel@kernel.org>
 <45fa0de1-c2be-84dd-782e-184ab608895f@gmail.com>
 <CACRpkdbyi4QrHXpPaZvPaZZhuO0-iMwTi=UmVHy5XagSFqJnzQ@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CACRpkdbyi4QrHXpPaZvPaZZhuO0-iMwTi=UmVHy5XagSFqJnzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12/15/2021 7:27 PM, Linus Walleij wrote:
> On Wed, Dec 15, 2021 at 6:14 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 12/15/21 1:02 AM, nicolas saenz julienne wrote:
> 
>>> As for channeling the path, would it make sense for linusw to take it alonside
>>> GPIO fix?
>>
>> That would definitively work, Linus, are you comfortable with doing
>> that? I will reply to the patch with an Acked-by if that helps.
> 
> Do you want me to merge this patch (2/2) into the pinctrl tree,
> where patch (1/2) is already merged?

Yes please merge patch 2 into the pinctrl tree where patch 1 is already 
applied. Thanks!
-- 
Florian
