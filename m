Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898AE10FA32
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 09:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbfLCIve (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 03:51:34 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:63297 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfLCIve (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 03:51:34 -0500
IronPort-SDR: dsSR1wFM82w41QEe91uCLCS3a93jGz8SCMS1FIQofYoPqq9j2vabdlMnkkUnO85HGlOE3JlEWx
 hxZzpZh/lfzIdFDWw1Li1pvIT8RCb1JqeuWvpdSjEtjz06NWapo6dAdKmHkbsCB09eUqGJrEEW
 5dDpCEyM5CAwO8OxKNrGBjQGqSC2WDdqJPOVcL1IwxvsYX7a9svPcg0UwfrgXWpCB6LFjHu6fZ
 HEHTIKV5Mabg+/ydxLFir7TdQp1aPxfB5g6X0OGItiVvdrVchRx3M1Nq5MB0RwkDJWk4BCtyVp
 7+w=
X-IronPort-AV: E=Sophos;i="5.69,272,1571731200"; 
   d="scan'208";a="45593533"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 03 Dec 2019 00:51:33 -0800
IronPort-SDR: V31aPAlTL4Jd77N/4vFkI/ULg0cF5PBYkzlUKlSwB5TqW2oengXeZXGIIUezjAPeS45uGXetRj
 k8fdcbh6lAth0z2rEc/o8A8Yjx1Gs9FJcj8ClHn/v7e9trEbTEqyktunDgxc+NGMNzDE3uUt+H
 tVPkPMHeGKWmqIn4OYYFVSQrHux/WyXhsdu22AjmEmoi5aXIBAP1OBiJIM2OD+5+c39ZCXjbpa
 5nlSWx1IxowCPCDsJce0jzoNxMJv4XdCFGcMxbpF2S+x4ddCnnoky/Je4mZZIOCotBY7rKE4oJ
 6+w=
Subject: Re: [PATCH v3 5/7] gpio: Add GPIO Aggregator/Repeater driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-6-geert+renesas@glider.be>
 <585c4ad9-31fc-e87e-07c4-b8d6aa09c7e4@mentor.com>
 <CAMuHMdW-n8ao7t7156WYxRg7v8+ojXsRgHGUOax=9nBo2F5xOw@mail.gmail.com>
From:   Harish Jenny K N <harish_kandiga@mentor.com>
Message-ID: <d44598a5-184e-078c-1d6c-a99b522f7e26@mentor.com>
Date:   Tue, 3 Dec 2019 14:21:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW-n8ao7t7156WYxRg7v8+ojXsRgHGUOax=9nBo2F5xOw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 03/12/19 1:47 PM, Geert Uytterhoeven wrote:
> Hi Harish,
>
> On Tue, Dec 3, 2019 at 6:42 AM Harish Jenny K N
> <harish_kandiga@mentor.com> wrote:
>>> +static int gpio_aggregator_probe(struct platform_device *pdev)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct gpio_desc **descs;
>>> +     struct gpiochip_fwd *fwd;
>>> +     int i, n;
>>> +
>>> +     n = gpiod_count(dev, NULL);
>>> +     if (n < 0)
>>> +             return n;
>>> +
>>> +     descs = devm_kmalloc_array(dev, n, sizeof(*descs), GFP_KERNEL);
>>> +     if (!descs)
>>> +             return -ENOMEM;
>>> +
>>> +     for (i = 0; i < n; i++) {
>>> +             descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
>> can you please add this check as well as we need to return EPROBE_DEFER.
>>
>> if (desc[i] == ERR_PTR(-ENOENT))
>> <                 return -EPROBE_DEFER;
> So gpiod_get_index() nevers return -EPROBE_DEFER, but returns -ENOENT
> instead?
> How can a driver distinguish between "GPIO not found" and "gpiochip driver
> not yet initialized"?
> Worse, so the *_optional() variants will return NULL in both cases, too, so
> the caller will always fall back to optional GPIO not present?
>
> Or am I missing something?
>
> Gr{oetje,eeting}s,
>
>                         Geert


We had earlier tested our changes on 4.14 kernel and the explicit return of -EPROBE_DEFER was needed in the inverter driver.

probably the commit 6662ae6af82df10259a70c7569b4c12ea7f3ba93 ( gpiolib: Keep returning EPROBE_DEFER when we should)

has fixed the issue and now it returns -EPROBE_DEFER.  you can ignore this comment as of now. I will test and let you know if needed.


Thanks,

Harish

