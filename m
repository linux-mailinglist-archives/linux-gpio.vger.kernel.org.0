Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D75BACE7
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 05:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406018AbfIWDh3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Sep 2019 23:37:29 -0400
Received: from mga03.intel.com ([134.134.136.65]:6060 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404054AbfIWDh3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 22 Sep 2019 23:37:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Sep 2019 20:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,538,1559545200"; 
   d="scan'208";a="188937516"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2019 20:37:27 -0700
Received: from [10.226.38.65] (unknown [10.226.38.65])
        by linux.intel.com (Postfix) with ESMTP id 290A9580379;
        Sun, 22 Sep 2019 20:37:22 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
 <20190913081807.GB27291@lahna.fi.intel.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <639ea457-5c40-92ac-9696-14d615b3f43c@linux.intel.com>
Date:   Mon, 23 Sep 2019 11:37:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913081807.GB27291@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Mika,

On 13/9/2019 4:18 PM, Mika Westerberg wrote:
> On Thu, Sep 12, 2019 at 11:11:32AM +0100, Linus Walleij wrote:
>> Hi Rahul,
>>
>> thanks for your patches!
>>
>> On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
>> <rahul.tanwar@linux.intel.com> wrote:
>>
>>> This series is to add pinctrl & GPIO controller driver for a new SoC.
>>> Patch 1 adds pinmux & GPIO controller driver.
>>> Patch 2 adds the dt bindings document & include file.
>>>
>>> Patches are against Linux 5.3-rc5 at below Git tree:
>>> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>> OK nice, I think you need to include Mika Westerberg on this review
>> as well, because I think he likes to stay on top of all things intel
>> in pin control. (Also included two other Intel folks in Finland who usually
>> take an interest in these things.)
> Thanks Linus for looping me in.
>
> Even if this is not directly based on the stuff we have under
> drivers/pinctrl/intel/*, I have a couple of comments. I don't have this
> patch series in my inbox so I'm commenting here.
>
> Since the driver name is equilibrium I suggest you to name
> intel_pinctrl_driver and the like (probe, remove) to follow that
> convention to avoid confusing this with the Intel pinctrl drivers under
> drivers/pinctrl/intel/*.
>
> Maybe use eqbr prefix so then intel_pinctrl_driver becomes
> eqbr_pinctrl_driver and so on. Also all the structures like
> intel_pinctrl_drv_data should be changed accordingly.
>
> Ditto for:
>
> MODULE_DESCRIPTION("Intel Pinctrl Driver for LGM SoC");
>
> I think better would be:
>
> MODULE_DESCRIPTION("Pinctrl Driver for LGM SoC (Equilibrium)");
>
> Anyway you get the idea :)

Yes, i understand your point. Will update in v2. Thanks.

Regards,
Rahul
