Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E052D1C61
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 22:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgLGVxv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 16:53:51 -0500
Received: from mga04.intel.com ([192.55.52.120]:9201 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbgLGVxv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Dec 2020 16:53:51 -0500
IronPort-SDR: R39LUIX27zWQgIlL2VBtImaQMlLdwN7dke3lI/d6+rBJy/Jl5vHhbj4DpM8gVHazNotTba9gz+
 nAOuTLbn+4mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="171211317"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="171211317"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 13:52:05 -0800
IronPort-SDR: U8AZmk0xViIpXcBYm7BaywiwIl+RHz5k+AxSqyoeuifZ9z37s1yamTj9s8ToCdPb6bTZSHjDJM
 7NvW2sFbmCuQ==
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="347628969"
Received: from cegeorge-mobl.amr.corp.intel.com (HELO [10.212.61.7]) ([10.212.61.7])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 13:52:04 -0800
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
 <20201207181656.GZ5246@lahna.fi.intel.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d5319c0f-977e-d152-ba88-033a4feafd95@linux.intel.com>
Date:   Mon, 7 Dec 2020 15:52:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207181656.GZ5246@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12/7/20 12:16 PM, Mika Westerberg wrote:
> On Mon, Dec 07, 2020 at 07:59:40PM +0200, Andy Shevchenko wrote:
>> Mistakenly the buffers (input and output) become together enabled for a little
>> period of time during GPIO request. This is problematic, because instead of
>> initial motive to disable them in the commit af7e3eeb84e2
>> ("pinctrl: intel: Disable input and output buffer when switching to GPIO"),
>> the driven value on the pin, which might be used as an IRQ line, brings
>> firmware of some touch pads in an awkward state that needs a full power off
>> to recover. Fix this by, as stated in a culprit commit, disabling the buffers.
>>
>> Fixes: af7e3eeb84e2 ("pinctrl: intel: Disable input and output buffer when switching to GPIO")
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210497
>> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

On the initial device where I reported the problem, and with the battery 
disconnected to make sure there's no EC issue, this patch restores the 
touchpad functionality.

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

