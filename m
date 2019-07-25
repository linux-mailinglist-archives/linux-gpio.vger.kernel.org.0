Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4072474C53
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2019 12:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390154AbfGYK7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jul 2019 06:59:14 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40162 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388173AbfGYK7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jul 2019 06:59:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id b17so34226213lff.7;
        Thu, 25 Jul 2019 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=in+uhLNoAVMX7g79xLZTX1hc7a9qUD9IZCQozQ9Y+QM=;
        b=h/fnwdgM/220zVB3iVelIJjx6IfbhzI3JKZGW+HdHH1HXvGy5/6qo+t2togqzGfAcw
         vaRtd6wTOcBONySmiCFIzwY5x4GZ8D4Hd0G164kj11Z1U/NPSfq118CV6YdPvk+JmhD9
         u5/F14d/Go01/WZMsKxpDL3zWLx8gKifY+rUrzD+NBiHATXPEi1rc9Id9GZTjPSrs7Bu
         DNrXATsNkSATg5TzNYX7KkZfpnvL4+5jy2wKYO0f+GyAxNrPlDRgSCcbPesuU7JZ/JZo
         FnZnIUa6WYDEdiy6MPacp0vdv6Ie/r2i7Ek4gxrbU02P9XmGSVvJs4e4x87YK9byli2A
         EkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=in+uhLNoAVMX7g79xLZTX1hc7a9qUD9IZCQozQ9Y+QM=;
        b=ItCU/QpDXcmLJGkUTAaTPTC3af/rdUWv5MiwXzBfuBe+mkK58YxC0bcplV3naUT/aF
         yNawcxxIeHPamZGqDtzCDmNsK7YvAo96wZ5trDKbukRmFoATAfS+dnxhiB3DDGUDtAij
         i30oYWhBSUx8Kaljz0/aHLDOgoCcMURU3tvrBKYszCaFlWUD0DzUHTwEqjw1j+a2x+v1
         0Vlii2cPQSpkfQ917xMB2OVCWxW9hTfMQO8Sx7RqfZMX8E+GBAAtkU0djWz6/v83ngtN
         fFCwsYH0q1aFfdRXcVvShz/kbTp3Uh/g8g+VkSAv2MUePLVQoe74/dc+cv7elgQyBo9J
         XqGw==
X-Gm-Message-State: APjAAAXBxZsdJslqiQQUlFzDA+5P/FFKzHQMezJb8gzFUPecYQNzmSaL
        fIKWmuCeY3evdGYsB1SC50MoBoHO
X-Google-Smtp-Source: APXvYqzTPtFFXfWIzfb8qOb6LwXtn6YVcFl8mbh6BLqKCdfKlz5e8OtxTj+NXVey3Hju5TT7JNKf+g==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr27672447lfn.46.1564052351219;
        Thu, 25 Jul 2019 03:59:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id i17sm7483217lfp.94.2019.07.25.03.59.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 03:59:10 -0700 (PDT)
Subject: Re: [PATCH V6 01/21] irqchip: tegra: Do not disable COP IRQ during
 suspend
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com,
        pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-2-git-send-email-skomatineni@nvidia.com>
 <f6582e43-168e-1b7e-9db8-3d263bc3ba0d@gmail.com>
 <20190725095502.GM12715@pdeschrijver-desktop.Nvidia.com>
 <dd01be5d-bab9-1329-c7ac-c3c893d49dd1@gmail.com>
 <20190725103348.GN12715@pdeschrijver-desktop.Nvidia.com>
 <20190725103813.GO12715@pdeschrijver-desktop.Nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de1723df-8580-32fb-eb9d-e4c02f2b4306@gmail.com>
Date:   Thu, 25 Jul 2019 13:59:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725103813.GO12715@pdeschrijver-desktop.Nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

25.07.2019 13:38, Peter De Schrijver пишет:
> On Thu, Jul 25, 2019 at 01:33:48PM +0300, Peter De Schrijver wrote:
>> On Thu, Jul 25, 2019 at 01:05:13PM +0300, Dmitry Osipenko wrote:
>>> 25.07.2019 12:55, Peter De Schrijver пишет:
>>>> On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
>>>>>
>>>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>>>>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>>>>> better here.
>>>>>
>>>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>>>
>>>>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>>>>> pre-T210 at all, since COP is unused. This looks to me like it was
>>>>> cut-n-pasted from downstream kernel without a good reason and could be
>>>>> simply removed.
>>>>
>>>> I don't think we can rely on the fact that COP is unused. People can
>>>> write their own code to run on COP.
>>>
>>> 1. Not upstream - doesn't matter.
>>>
>>
>> The code is not part of the kernel, so obviously it's not upstream?
>>
>>> 2. That's not very good if something unknown is running on COP and then
>>> kernel suddenly intervenes, don't you think so?
>>
>> Unless the code was written with this in mind.
>>

In that case, please see 1. ;)

> 
> Looking at this again, I don't think we need to enable the IRQ at all.

Could you please clarify? The code only saves/restores COP's interrupts
context across suspend-resume.

Again, that's absolutely useless code for the upstream kernel which
could be removed safely to avoid the confusion, IMHO. I can type a patch
if you're agreeing.
