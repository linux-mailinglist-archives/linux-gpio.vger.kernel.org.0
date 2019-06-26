Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7F56F4D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 19:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFZRGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 13:06:40 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7386 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbfFZRGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 13:06:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d13a61d0002>; Wed, 26 Jun 2019 10:06:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Jun 2019 10:06:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 10:06:39 -0700
Received: from [10.2.169.244] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 17:06:36 +0000
Subject: Re: [PATCH V4 03/18] gpio: tegra: use resume_noirq for tegra gpio
 resume
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <jckuo@nvidia.com>, "Joseph Lo" <josephl@nvidia.com>,
        <talho@nvidia.com>, <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Mikko Perttunen" <mperttunen@nvidia.com>, <spatra@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-4-git-send-email-skomatineni@nvidia.com>
 <CACRpkda0=HeRco8kExdf6TmiLOnCec3Ek06s-MdjNJvVGw3ZNQ@mail.gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <7b97ec08-212e-76fb-ad12-6d1be5ab6149@nvidia.com>
Date:   Wed, 26 Jun 2019 10:06:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkda0=HeRco8kExdf6TmiLOnCec3Ek06s-MdjNJvVGw3ZNQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561568797; bh=zlmsmRF54TEZsHZsCgzpp/eYKMziW5k+1GvPOKK2I8s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=LqeDd8wdUbjIj0U9o9KaU5Athl/vrt0CLSzZZwLZlRAdvUBD9ilPs7FTXha4rPqio
         97IOCU6Qo9mibFQMRF9NiZ9YcVoVHGhUNH1A1nyNn/C1JEmPxe8TpYTbVScGs0ZuM6
         B3W1inZLLyLgEg1Smy2gxG5jm1ZFFGRA6tsRsY4V4Q+gIJvKhu1oNxnKuuwH8CHIdZ
         m7BtRlN8Ic9ql5I86rGuMvWopX/SAhbuWIoQc3aGUSsB46VPKTNtKnsyqxNU3ko8Ay
         /Jawls9cOAe4aqKdjikiLNSVZg54Oziuz1eG3ok9PK+nh2vRxHydo+htGkNHEgN+Z6
         Y1TG3gtDy1TdQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 6/25/19 6:38 AM, Linus Walleij wrote:
> On Mon, Jun 24, 2019 at 5:03 AM Sowjanya Komatineni
> <skomatineni@nvidia.com> wrote:
>
>> During SC7 resume, PARKED bit clear from the pinmux registers may
>> cause a glitch on the GPIO lines.
>>
>> So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
>> to keep the GPIO lines in a known good state prior to clearing PARKED
>> bit.
>>
>> This patch has fix for this by moving Tegra GPIOs restore to happen
>> very early than pinctrl resume.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Can this patch be applied in isolation from the other patches?
>
> WOuld be nice to have at least Thierry's ACK on it before I
> apply it.
>
> Yours,
> Linus Walleij

Just to confirm, Will not include this in V5 as you are planning to 
apply this patch separately.

Thanks

Sowjanya


