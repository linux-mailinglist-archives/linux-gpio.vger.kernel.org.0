Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632861AA8FB
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636248AbgDONro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:47:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59248 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633569AbgDONrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 09:47:41 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03FDlYxK124407;
        Wed, 15 Apr 2020 08:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586958454;
        bh=NdRFdOU/cwb86uaRtx10JOGN6BVfdSiFhftBr9UxC4E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tLnfNglXa+g1JUdW402MDaH3kWvRwE655mUfecHfADPO2yluhLvRTouokbF9GySDU
         QSruxwE9GD8wdS9I+K8mpStrFRPWMjKcju0TCmyTFezy/HbsmARd9MvEnypRagzlOP
         NIBHLH5Nek+AU5Ge5eszd8NC9Nypmb9/1+d5lkXM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03FDlYFE037207
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Apr 2020 08:47:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Apr 2020 08:47:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Apr 2020 08:47:34 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FDlTrN096605;
        Wed, 15 Apr 2020 08:47:30 -0500
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Robert Nelson <robertcnelson@gmail.com>
CC:     Drew Fustini <drew@pdp7.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Drew Fustini <pdp7pdp7@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1> <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
Date:   Wed, 15 Apr 2020 16:47:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 15/04/2020 16:20, Robert Nelson wrote:
> Hi Grygorii,
> 
> On Wed, Apr 15, 2020 at 8:15 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>>
>> For this platforms the dynamic GPIO muxing/configuration is not supported, and GPIO block by itself
>> does not provide such functions as pullup/pulldown.
> 
> Correct, that's the state today, while Drew is investing time into
> trying to figure out how to properly extend this feature into our
> platform.

Sry, but it's not clear what's the final target (at least from public part of this thread).


-- 
Best regards,
grygorii
