Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092027FFB9
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 19:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405426AbfHBRfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 13:35:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37246 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405108AbfHBRfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 13:35:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id c9so53435169lfh.4;
        Fri, 02 Aug 2019 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m01E/00kIIUrZ+us6qTkntaWmvfO8MGjTN9DZjqTTM4=;
        b=LAdAuboHztw2JZLafdgtT4UzeS6mncq1WKhvo7JyiSvSF0vyS3isLkwFQqzG0jKKpk
         ZghWSAlT/5CZGGwhFgXqGtPeZ/LfjQlgTx3E5AghaB5qUdQ2WllUyvxX/dowJBtNzVUF
         LFPJAZox16R/ZWpDSEC7NHXsBN6PZ/GKBTdLJho0tEIWT25IPgejuqKDLabN5Oduz5W9
         J+NyLp1voKwSQg7PL832WiDwrty7Ea7e/JIL8zXVZi8+0azrxZ/SaJl3NnRYEOqC0Q2T
         kitin+A76BSUfE/SmIkMmNN7vsk/R+p/oEvwqRn0PS1Bmn7/FfSWmtkm6jj996+GQ/vO
         Znpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m01E/00kIIUrZ+us6qTkntaWmvfO8MGjTN9DZjqTTM4=;
        b=MdsEwqFyq51tlP5dAb9bd6aO14lQA7WrbHVNkEdb9KpM3Kqvk8Ji1wmnE0sX/0Wc5V
         ubWvNluJinZ2R/wtgfps+nH0t/pCU0OZwjVQjcnSiuIDKR+FEDgwyOXymcNy1A+bIckQ
         +iXhkue4Eg5JsqOyViuLyeh5sjKlDtL141tWwQbQKCuJszwtPS5+idZm88jgvsEbA1XK
         Lbd7J1HJrDzzIzm0VPM6HmcVpjCwR+ZswuVCBh0PV4A/21LoGFz022ElmxyuwiSc+IqH
         h4HbknOCSyMzhMUHYd0kFmKNKypiEHX/Aw23Qtzdk5yIJ95YhYfiJSkMyqy2XzyI7RC2
         +OGA==
X-Gm-Message-State: APjAAAVV3jzPiImSAD0Em0NK8btqk/mNmHp2+sPUuvlDbPo31w5NNdb4
        0AZFczMrLA5E2OAUmZpIvtvSPwN2
X-Google-Smtp-Source: APXvYqzEH57oEFNxugmY7hPZFcpHs6jb6KCEOBcB2f3QbbxjctMfhdkQqcRF4ctLUWfk5cCLSA/tLg==
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr62216920lfm.104.1564767327937;
        Fri, 02 Aug 2019 10:35:27 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id k12sm12901127lfc.8.2019.08.02.10.35.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 10:35:26 -0700 (PDT)
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
 <de1723df-8580-32fb-eb9d-e4c02f2b4306@gmail.com>
 <20190802130537.GB3883@pdeschrijver-desktop.Nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ba3924fe-d632-7bcb-5353-bc7668957661@gmail.com>
Date:   Fri, 2 Aug 2019 20:35:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190802130537.GB3883@pdeschrijver-desktop.Nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

02.08.2019 16:05, Peter De Schrijver пишет:
> On Thu, Jul 25, 2019 at 01:59:09PM +0300, Dmitry Osipenko wrote:
>> 25.07.2019 13:38, Peter De Schrijver пишет:
>>> On Thu, Jul 25, 2019 at 01:33:48PM +0300, Peter De Schrijver wrote:
>>>> On Thu, Jul 25, 2019 at 01:05:13PM +0300, Dmitry Osipenko wrote:
>>>>> 25.07.2019 12:55, Peter De Schrijver пишет:
>>>>>> On Mon, Jul 22, 2019 at 12:54:51PM +0300, Dmitry Osipenko wrote:
>>>>>>>
>>>>>>> All Tegra SoCs support SC7, hence the 'supports_sc7' and the comment
>>>>>>> doesn't sound correct to me. Something like 'firmware_sc7' should suit
>>>>>>> better here.
>>>>>>>
>>>>>>>> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
>>>>>>>
>>>>>>> Secondly, I'm also not sure why COP interrupts need to be disabled for
>>>>>>> pre-T210 at all, since COP is unused. This looks to me like it was
>>>>>>> cut-n-pasted from downstream kernel without a good reason and could be
>>>>>>> simply removed.
>>>>>>
>>>>>> I don't think we can rely on the fact that COP is unused. People can
>>>>>> write their own code to run on COP.
>>>>>
>>>>> 1. Not upstream - doesn't matter.
>>>>>
>>>>
>>>> The code is not part of the kernel, so obviously it's not upstream?
>>>>
>>>>> 2. That's not very good if something unknown is running on COP and then
>>>>> kernel suddenly intervenes, don't you think so?
>>>>
>>>> Unless the code was written with this in mind.
>>>>
>>
>> In that case, please see 1. ;)
>>
> 
> In general the kernel should not touch the COP interrupts I think.
> 
>>>
>>> Looking at this again, I don't think we need to enable the IRQ at all.
>>
>> Could you please clarify? The code only saves/restores COP's interrupts
>> context across suspend-resume.
> 
> The sc7 entry firmware doesn't use interrupts.

Okay, it shouldn't hurt to clean up the LIC's code a tad by removing the
COP's bits, will make a patch.
