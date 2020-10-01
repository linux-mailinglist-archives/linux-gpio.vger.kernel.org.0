Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B26CB27FAEB
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 09:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgJAH7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 03:59:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33056 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgJAH7n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 03:59:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 7B4B129D23B
Subject: Re: [PATCH v2] pinctrl: mediatek: Free eint data on failure
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Wang <sean.wang@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>, hsinyi@chromium.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
References: <20200821075452.1543610-1-enric.balletbo@collabora.com>
 <99821f85-9a38-7591-f982-872603b6ce8a@collabora.com>
 <CAGp9Lzq-15xjvSVaEJ=2o18o-8ESGWsHf-LNAXXwKfxu4V-0NQ@mail.gmail.com>
 <CACRpkdYPoZX1+rfJb925_+H6YXiwO26cKLpZae=_j=RQKGA0Wg@mail.gmail.com>
 <CAGp9LzqGwvxGF_bhuyGXu1R2516x=twv1j5e0Wx0EQ7GZ4b-yQ@mail.gmail.com>
 <CACRpkdYga6XttmMnQ6r--_7wtfebirY5Z58D6xhBkRRDrf98ZQ@mail.gmail.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6a04c7b7-dd70-10c2-fc69-08b6b6c33d03@collabora.com>
Date:   Thu, 1 Oct 2020 09:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYga6XttmMnQ6r--_7wtfebirY5Z58D6xhBkRRDrf98ZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/10/20 9:58, Linus Walleij wrote:
> On Wed, Sep 30, 2020 at 6:33 PM Sean Wang <sean.wang@kernel.org> wrote:
>> On Wed, Sep 30, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Sun, Sep 27, 2020 at 7:57 PM Sean Wang <sean.wang@kernel.org> wrote:
>>>
>>>> v2 seems the same with v1 or I was missing something.
>>>>
>>>> I just thought we call devm_ioremap_release to explicitly to free
>>>> resource when a certain failure occurs after
>>>> devm_ioremap_resource?
>>>
>>> What is the semantics around mtk_build_eint()?
>>>
>>
>> mtk_build_eint is to add external interrupt function to the
>> corresponding bound pins.
>> mtk pinctrl driver still can work (than means probe() successfully) to
>> keep pinctrl functional even with there is an error in mtk_build_eint.
>> So the patch is used to explicitly free those data on failure in
>> mtk_build_eint to let unused data is being free:ed immediately.
> 
> OK then we need a v3 of this that will call *release
> explicitly, indeed.
> 

Yes, don't really know what happened with v2. I'll send a v3 ASAP.

> Thanks Sean!
> Linus Walleij
> 
