Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9459E1127B8
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 10:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfLDJgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 04:36:44 -0500
Received: from mga14.intel.com ([192.55.52.115]:27867 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbfLDJgo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Dec 2019 04:36:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 01:36:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; 
   d="scan'208";a="294118284"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 04 Dec 2019 01:36:43 -0800
Received: from [10.226.38.71] (unknown [10.226.38.71])
        by linux.intel.com (Postfix) with ESMTP id BF149580AC4;
        Wed,  4 Dec 2019 01:36:41 -0800 (PST)
Subject: Re: linux-next: Tree for Dec 3 (pinctrl-equilibrium)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20191203155405.31404722@canb.auug.org.au>
 <1a78124d-bef9-46da-aef4-60f85fddfceb@infradead.org>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <1c54235b-545c-db3e-4225-ec6824ac6003@linux.intel.com>
Date:   Wed, 4 Dec 2019 17:36:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1a78124d-bef9-46da-aef4-60f85fddfceb@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Randy,

On 4/12/2019 12:33 AM, Randy Dunlap wrote:
> On 12/2/19 8:54 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any material for v5.6 to your linux-next included
>> trees until after v5.5-rc1 has been released.
>>
>> Changes since 20191202:
>>
> on x86_64:
> # CONFIG_OF is not set
>
>
> ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `pinconf_generic_dt_node_to_map_all':
> pinctrl-equilibrium.c:(.text+0xb): undefined reference to `pinconf_generic_dt_node_to_map'
>
> Probably depends on OF.

Can you please tell the compiler/toolchain details that you used when you see
above error ?I tried few versions of gcc and i never see this linker error.
Build always passed successfully.

I have a patch that adds 'depends on OF' in the Kconfig to resolve this but i
want to ensure that i recreate this error first & confirm resolution with the
patch before posting it. Thanks.

Regards,
Rahul


