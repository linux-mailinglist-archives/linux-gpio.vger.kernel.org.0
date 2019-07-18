Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A396D5CF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 22:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfGRUcd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 16:32:33 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41697 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbfGRUcd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 16:32:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so28635832ljg.8;
        Thu, 18 Jul 2019 13:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HwI/a5Cgs3FeMDik7cEBcTQmX22SU/+HDKO5amu4FvQ=;
        b=YButNhpMmXwgmkALyaBYai1v+KxNU1ZRLqTxWqvCr39JGQfj0vpPwbAGVSUZBjOBb+
         I00rIQBgZvTFcj2VNSWsvMbHIZw8r1zOI7HPEERTgE4kVYGnGt3J0fRpCDTZjZW2/8yx
         ItZMd16jwGiJlWJ5GvpzsxMfGOvAeTQfoojgfriBmsSQNZggnfac+JeVMFToRjjdWR4B
         pYsSNzO0YT7Hbu0u2WzCU5TEkjohFb+nEpECj+bCHUQP14JBs8toLF1fmts0T6h/HoZd
         6G4jTd7xd/N/MfJWnDCjWGLTywiWhXLTIoxyU4D3uZo3OuCIj2rYRpv91ypTCSdzdw0i
         phTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HwI/a5Cgs3FeMDik7cEBcTQmX22SU/+HDKO5amu4FvQ=;
        b=YDZBM3aIAXvXKa1zH50gRcSCGmzBHwsm/shjVEB/g7A+WqejL6XyatFx9Fw+rpuBQ1
         nQ7g71sftMVToclCOF+QWTmK+y7x+vh+I3+1LiHmDyIkutEvZp4maavGb1vs8wuKDN2j
         vh6QwgCfBT3K9CI7pKN9Go22OrK2OmVwLOPKxQrO0YMMqx8pbKPQSjAWIZ8q7YxhdWgV
         jxDav9L0PpP7Sj+R/3fBpSZmWxhapbksdvB+t2lb1QCGuoOz5wgUhn8T3r9UtL5OGYox
         Zg2oLiib0ffV9bgFZGixMU6jKaSzXAzZbGxDFWju3E23CU79bfylS5elIdb1KCa1BDBl
         JPPA==
X-Gm-Message-State: APjAAAU8dJvbuSDrOc6PVlFeJzj4Zdk0slDYzq2NAhbFA/k0dmJryfNz
        sckIwPyJPphITQw/4AELqemwXcCC
X-Google-Smtp-Source: APXvYqxxPcB7tkrFt0uUr6AgTcnUfiv+NEcLpntuupHzrvN91QLVboMtMOHpWZzk5aBQdP8Sk6PX9g==
X-Received: by 2002:a2e:a16c:: with SMTP id u12mr24291144ljl.59.1563481950293;
        Thu, 18 Jul 2019 13:32:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id z23sm4115943lfq.77.2019.07.18.13.32.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 13:32:29 -0700 (PDT)
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     Joseph Lo <josephl@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20190716083701.225f0fd9@dimatab>
 <21266e4f-16b1-4c87-067a-16c07c803b6e@nvidia.com>
 <c5853e1a-d812-2dbd-3bec-0a9b0b0f6f3e@nvidia.com>
 <20190716080610.GE12715@pdeschrijver-desktop.Nvidia.com>
 <d908d3a2-3013-7f92-0852-115f428d1c5f@gmail.com>
 <72b5df8c-8acb-d0d0-ebcf-b406e8404973@nvidia.com>
 <2b701832-5548-7c83-7c17-05cc2f1470c8@nvidia.com>
 <76e341be-6f38-2bc1-048e-1aa6883f9b88@gmail.com>
 <0706576a-ce61-1cf3-bed1-05f54a1e2489@nvidia.com>
 <5b2945c5-fcb2-2ac0-2bf2-df869dc9c713@gmail.com>
 <20190718191820.GG12715@pdeschrijver-desktop.Nvidia.com>
 <2274fccb-59d3-824c-cb97-55c23a4eaa75@nvidia.com>
 <5c6e17ed-bdbd-fa27-87e7-aa95dfa7c591@gmail.com>
Message-ID: <cc358525-eeca-129e-183c-e0627447c9a8@gmail.com>
Date:   Thu, 18 Jul 2019 23:32:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5c6e17ed-bdbd-fa27-87e7-aa95dfa7c591@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

18.07.2019 23:11, Dmitry Osipenko пишет:
> 18.07.2019 22:24, Sowjanya Komatineni пишет:
>>
>> On 7/18/19 12:18 PM, Peter De Schrijver wrote:
>>> On Tue, Jul 16, 2019 at 09:43:16PM +0300, Dmitry Osipenko wrote:
>>>>> CPU parents are PLL_X, PLL_P, and dfll. PLL_X always runs at higher
>>>>> rate
>>>>> so switching to PLL_P during CPUFreq probe prior to dfll clock enable
>>>>> should be safe.
>>>> AFAIK, PLLX could run at ~200MHz. There is also a divided output of PLLP
>>>> which CCLKG supports, the PLLP_OUT4.
>>>>
>>>> Probably, realistically, CPU is always running off a fast PLLX during
>>>> boot, but I'm wondering what may happen on KEXEC. I guess ideally
>>>> CPUFreq driver should also have a 'shutdown' callback to teardown DFLL
>>>> on a reboot, but likely that there are other clock-related problems as
>>>> well that may break KEXEC and thus it is not very important at the
>>>> moment.
>>>>
>>> If you turn off the DFLL, you have to be aware that the voltage margins
>>> for DFLL use are lower than for PLL use. So you either need to be sure
>>> to switch to a frequency below fmax @ Vmin or you program the boot
>>> voltage and then you can use PLLX as setup by the bootloader. For OVR
>>> regulators you can't program a voltage without the DFLL, so you have to
>>> tristate the PWM output which will give you a hardwired boot voltage.
>>>
>>> Peter.
>>
>> Yes, we switch CPU to PLLP and then disable DFLL during suspend.
> 
> I'm wondering what happens to T124 on resume from suspend, given that it
> switches CPU to PLLX [1]. I imagine that CPU voltage could be lower than
> needed if suspend happened on DFLL. I'm also now vaguely recalling that
> CPUFreq driver was disabled for T124 because of some problems.
> 
> Or maybe warmboot code is actually touching the voltage regulators?

Oh wait, warmboot is even irrelevant LP1.

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/mach-tegra/sleep-tegra30.S#n389
> 
> That is also should be a problem for T30 if voltage scaling is happening
> and I have some patches in works that are switching CPU to PLLP instead
> of PLLX on suspend/resume.
> 

