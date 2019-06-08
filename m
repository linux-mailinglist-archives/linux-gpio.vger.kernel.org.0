Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B204039A7D
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 05:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730797AbfFHDw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 23:52:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52588 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731745AbfFHDw3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 23:52:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x583pFqT086258;
        Fri, 7 Jun 2019 22:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559965875;
        bh=k9uAGfNmCZMx2i8iIVnU8ifAQs1wiMos3XiiVhnmPYw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ErIZp655yzFoXvDbdTJOcOZPNLWiwxb0qoGtdpmVxzvg7IcSmJvq+vL9r8fihdBQv
         gfAFZw9uEil4PR/iwutbUeNI8HmmO9By+TOmH6TSDjxaxR+7nc37XcqF3ZWRpLzY7j
         mKZ9hheB2lRtpE4gPk9UnTbRUR3VFz1l9sBD2r9k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x583pFo4130929
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 22:51:15 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 22:51:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 22:51:15 -0500
Received: from [172.22.216.123] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x583pANr058884;
        Fri, 7 Jun 2019 22:51:11 -0500
Subject: Re: [RFC RESEND PATCH v2 1/4] dt-bindings: gpio: davinci: Add k3
 am654 compatible
To:     Linus Walleij <linus.walleij@linaro.org>,
        Tero Kristo <t-kristo@ti.com>
CC:     ext Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20190606095620.6211-1-j-keerthy@ti.com>
 <20190606095620.6211-2-j-keerthy@ti.com>
 <CACRpkdY-yK3+uZvq1Xk7qJ2Nd7mgRkQ9C22AYO4AiZP5Cs719w@mail.gmail.com>
From:   keerthy <j-keerthy@ti.com>
Message-ID: <bcaf05c2-e4a2-8fe6-50f8-9df603d65a21@ti.com>
Date:   Sat, 8 Jun 2019 09:21:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdY-yK3+uZvq1Xk7qJ2Nd7mgRkQ9C22AYO4AiZP5Cs719w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 6/8/2019 4:09 AM, Linus Walleij wrote:
> On Thu, Jun 6, 2019 at 11:55 AM Keerthy <j-keerthy@ti.com> wrote:
> 
>> The patch adds k3 am654 compatible, specific properties and
>> an example.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
> 
> Patch applied with the three others, so now all
> GPIO changes are in tree.
> 
> Please funnel all the DTS changes through ARM SoC.

Thank you Linus!

Tero,

Could you pull the dts changes on top of intr dts patches.

Regards,
Keerthy
> 
> Yours,
> Linus Walleij
> 
