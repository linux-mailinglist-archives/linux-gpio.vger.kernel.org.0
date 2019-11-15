Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A57EFD5A9
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 07:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKOGBo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 01:01:44 -0500
Received: from mga09.intel.com ([134.134.136.24]:20451 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfKOGBn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Nov 2019 01:01:43 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Nov 2019 22:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,307,1569308400"; 
   d="scan'208";a="405232266"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga005.fm.intel.com with ESMTP; 14 Nov 2019 22:01:42 -0800
Received: from [10.226.38.118] (rtanwar-mobl.gar.corp.intel.com [10.226.38.118])
        by linux.intel.com (Postfix) with ESMTP id 47A875802B1;
        Thu, 14 Nov 2019 22:01:40 -0800 (PST)
Subject: Re: [PATCH v6 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin zhu <yixin.zhu@linux.intel.com>,
        cheol.yong.kim@intel.com
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
 <CACRpkdYhy1KLyZd4MNSODpy0Q59_SAcc+wkofrZr4b4N+rYDxw@mail.gmail.com>
 <1d3be294-5f12-462c-855c-e53ecb9190b7@linux.intel.com>
 <CAL_Jsq+okgZgqdbosrOHhL1m0BW4E718Kb4tmyuexEfPwAZLmg@mail.gmail.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <0136c596-202c-ec43-8d79-66c3b8c03fe5@linux.intel.com>
Date:   Fri, 15 Nov 2019 14:01:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+okgZgqdbosrOHhL1m0BW4E718Kb4tmyuexEfPwAZLmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 15/11/2019 1:39 AM, Rob Herring wrote:
> On Wed, Nov 13, 2019 at 9:27 PM Tanwar, Rahul
> <rahul.tanwar@linux.intel.com> wrote:
>>
>> Hi Linus,
>>
>> On 13/11/2019 10:46 PM, Linus Walleij wrote:
>>> On Mon, Nov 11, 2019 at 11:11 AM Rahul Tanwar
>>> <rahul.tanwar@linux.intel.com> wrote:
>>>
>>>> Add dt bindings document for pinmux & GPIO controller driver of
>>>> Intel Lightning Mountain SoC.
>>>>
>>>> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
>>> (...)
>>>
>>>> +properties:
>>>> +  compatible:
>>>> +    const: intel,lgm-pinctrl
>>> Just noted from another review where Rob noted that this name should
>>> match the internal name in the datasheet for this hardware block. Is it
>>> really called "lgm-pinctrl" inside Intel?
>>>
>>> intel,lightning-mountain-io and similar are perfectly fine if that is the
>>> name it has in your documentation.
>> Our documentation does not have any specific names for these hardware
>> blocks. It names it in a very generic/standard manner like GPIO, pinmux..
>>
>> To make the name explicit & self explanatory, i should probably change
>> the name as you suggested i.e. intel,lightning-mountain-io.
> You should also be consistent with 'lgm' vs. 'lightning-mountain' use
> across bindings some of which I think have already been accepted.
>

Yes, other accepted drivers/bindings use 'lgm'. I will rename it to
'intel,lgm-io'to be consistent.Thanks.

Regards,
Rahul

