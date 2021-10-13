Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02AA42B1D2
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 03:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbhJMBLU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 21:11:20 -0400
Received: from mx.socionext.com ([202.248.49.38]:28122 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234233AbhJMBLT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Oct 2021 21:11:19 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Oct 2021 10:09:16 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 57F2F2058B40;
        Wed, 13 Oct 2021 10:09:16 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Wed, 13 Oct 2021 10:09:16 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by iyokan2.css.socionext.com (Postfix) with ESMTP id C642BC1881;
        Wed, 13 Oct 2021 10:09:15 +0900 (JST)
Received: from [10.212.181.128] (unknown [10.212.181.128])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 5320AB62B3;
        Wed, 13 Oct 2021 10:09:15 +0900 (JST)
Subject: Re: [PATCH v2 0/3] pinctrl: uniphier: Introduce some features and NX1
 support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <1633518606-8298-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CACRpkdZuJDPTi8dL-PpkTVe9VHVjvHGO_f_x5CbBCoTjN_wwBQ@mail.gmail.com>
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <21cf42ea-54cc-08a3-8d92-6d3969a048aa@socionext.com>
Date:   Wed, 13 Oct 2021 10:09:14 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZuJDPTi8dL-PpkTVe9VHVjvHGO_f_x5CbBCoTjN_wwBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2021/10/13 9:14, Linus Walleij wrote:
> On Wed, Oct 6, 2021 at 1:10 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> 
>> This series includes the patches to add audio pinmux settings for
>> LD11/LD20/PXs3
>> SoCs and basic pinmux settings for new UniPhier NX1 SoC. NX1 SoC also has
>> the same kinds of pinmux settings as the other UniPhier SoCs.
>>
>> ---
>> Change since v1:
>> - Remove non-existent groups "usb2" and "usb3" in NX1 patch
> 
> This v2 patch set applied.

Thank you.

> Rob's checker is complaining on patch 2 but that patch just adds
> a compatible so the warnings must be old? Please look into them
> anyways.

Yes, the warnings are old. I think that there are some descriptions
in devicetree that do not fit the dt-bindings pattern.
I'll investigate and fix them.

Thank you,

---
Best Regards
Kunihiko Hayashi
