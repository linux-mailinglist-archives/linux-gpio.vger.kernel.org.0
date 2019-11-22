Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2BC4105EBB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 03:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfKVCxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 21:53:16 -0500
Received: from mga07.intel.com ([134.134.136.100]:64450 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbfKVCxQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 21:53:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Nov 2019 18:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,228,1571727600"; 
   d="scan'208";a="358006930"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga004.jf.intel.com with ESMTP; 21 Nov 2019 18:53:15 -0800
Received: from [10.226.38.71] (unknown [10.226.38.71])
        by linux.intel.com (Postfix) with ESMTP id 332DA5802E4;
        Thu, 21 Nov 2019 18:53:12 -0800 (PST)
Subject: Re: [PATCH v8 2/2] dt-bindings: pinctrl: intel: Add for new SoC
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
 <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
 <CACRpkdYZi-0LRjih8+2cgWZ6u-eFN5+3sW1eV2ujYRd0UBoEKQ@mail.gmail.com>
 <bf8396af-3ace-7463-0fef-890b2f5cc487@linux.intel.com>
Message-ID: <8804e672-423e-a754-a68e-4b4a0d2d0881@linux.intel.com>
Date:   Fri, 22 Nov 2019 10:53:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bf8396af-3ace-7463-0fef-890b2f5cc487@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/11/2019 10:24 AM, Tanwar, Rahul wrote:
> Hi Linus,
>
> On 21/11/2019 9:53 PM, Linus Walleij wrote:
>> On Fri, Nov 15, 2019 at 10:25 AM Rahul Tanwar
>> <rahul.tanwar@linux.intel.com> wrote:
>>
>>> Add dt bindings document for pinmux & GPIO controller driver of
>>> Intel Lightning Mountain SoC.
>>>
>>> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
>> Patch applied, you worked hard to get these bindings done in the
>> right YAML format and all.
>>
>> I have some generic bindings from Rob merged simultaneously
>> so it'd be great if you could investigate whether it is possible
>> to follow up with a patch to switch over from some of the local
>> grammar and toward including pinmux-node.yaml and
>> pincfg-node.yaml into these bindings.
>>
>> The method for inclusion of external generic files can be seen
>> in e.g. the display panel bindings, like how
>> panel-common.yaml is included into other bindings under
>> display/panel/*.yaml.
>>
>> Tell us if you have any problems with this!
> Thanks. Yes, i have gone through Rob's generic pinctrl bindings patch
> series and i was double minded if *i should still proceed with this
> patch or wait for generic bindings patch to get merged.
>
> I will take it up to revise this patch to include external generic
> files from Rob as soon as kernel 5.5 is released.

*Fix typo above.

> Regards,
> Rahul

