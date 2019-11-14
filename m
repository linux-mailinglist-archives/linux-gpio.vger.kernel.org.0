Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61E3FBE4C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 04:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfKND1g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 22:27:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:41987 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbfKND1g (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 22:27:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Nov 2019 19:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; 
   d="scan'208";a="235515175"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2019 19:27:34 -0800
Received: from [10.226.38.118] (rtanwar-mobl.gar.corp.intel.com [10.226.38.118])
        by linux.intel.com (Postfix) with ESMTP id 1724F58049B;
        Wed, 13 Nov 2019 19:27:31 -0800 (PST)
Subject: Re: [PATCH v6 2/2] dt-bindings: pinctrl: intel: Add for new SoC
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
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
 <CACRpkdYhy1KLyZd4MNSODpy0Q59_SAcc+wkofrZr4b4N+rYDxw@mail.gmail.com>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <1d3be294-5f12-462c-855c-e53ecb9190b7@linux.intel.com>
Date:   Thu, 14 Nov 2019 11:27:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYhy1KLyZd4MNSODpy0Q59_SAcc+wkofrZr4b4N+rYDxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Linus,

On 13/11/2019 10:46 PM, Linus Walleij wrote:
> On Mon, Nov 11, 2019 at 11:11 AM Rahul Tanwar
> <rahul.tanwar@linux.intel.com> wrote:
>
>> Add dt bindings document for pinmux & GPIO controller driver of
>> Intel Lightning Mountain SoC.
>>
>> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> (...)
>
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-pinctrl
> Just noted from another review where Rob noted that this name should
> match the internal name in the datasheet for this hardware block. Is it
> really called "lgm-pinctrl" inside Intel?
>
> intel,lightning-mountain-io and similar are perfectly fine if that is the
> name it has in your documentation.

Our documentation does not have any specific names for these hardware
blocks. It names it in a very generic/standard manner like GPIO, pinmux..

To make the name explicit & self explanatory, i should probably change
the name as you suggested i.e. intel,lightning-mountain-io.

Regards,
Rahul
