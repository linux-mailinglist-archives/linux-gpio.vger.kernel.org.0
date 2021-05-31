Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FCA3958DC
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 12:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhEaKV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 06:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEaKVz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 06:21:55 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BC7C061574;
        Mon, 31 May 2021 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jTxFZ32tnC3Ys9+FwIaxl+M08wou4VWg96vlIkqQ/wA=; b=Zgw1ruXqLsR3QQlE0elhCRhz6M
        DCk1NqucnKGaOJ4l5VFPh7YhuDZBQMM4wquACWDUUBHo/vQ/sVVsxExh1W9xFs7h0xbKEEVWYz/9C
        rDgLVslQeXaSEdpM4iP7Z39EqY7Kayy3i9yxibxWqCsol43iFwRjaOnPkLt2OCsK03rv+WLhawFeU
        TLXUOxqc4AWuTGkbRqRa9TekSyd9Sorx39KKrGkxqNOX461Dlszft8gjn6NUh8BQ4qbFCrYhknyeU
        UxBtos19lLrGSKTaOMMzaTs7RI/K7pb/uKGTAax8JcEl9KkNYWHKjDvvX5apCS+Lp1GkdptNg3zhZ
        ehAxhI5A==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:55252 helo=[192.168.3.116])
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1lnf1V-0001sN-3p; Mon, 31 May 2021 13:19:53 +0300
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     sandberg@mailfence.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drew@beagleboard.org, kernel test robot <lkp@intel.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi>
 <20210530161333.3996-3-maukka@ext.kapsi.fi>
 <CAHp75Vffj=8WKBO23iRxxFmva+SU5u58eBkZfMRyY6GG-6maXg@mail.gmail.com>
 <0307426d-83a3-8c45-e1a6-ffc422780cbb@ext.kapsi.fi>
 <CAHp75VfkyV+2p50c=iK5n4uiv6ptypsqc-GkWi7ZJHTs7Qmr3g@mail.gmail.com>
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
Message-ID: <a8301a34-5ce6-6bce-63c9-3a4484a8b20d@ext.kapsi.fi>
Date:   Mon, 31 May 2021 13:19:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAHp75VfkyV+2p50c=iK5n4uiv6ptypsqc-GkWi7ZJHTs7Qmr3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 2/2] gpio: gpio-mux-input: add generic gpio input
 multiplexer
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 30.5.2021 22.38, Andy Shevchenko wrote:
> On Sun, May 30, 2021 at 10:02 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>> On 30.5.2021 21.09, Andy Shevchenko wrote:
>>> On Sun, May 30, 2021 at 7:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Is it a fix? Shall we add the Fixes tag?
>> In the v1 a build bot complained about .owner along these lines:
>>
>> --- snip ----
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> cocci warnings: (new ones prefixed by >>)
>>   >> drivers/gpio/gpio-mux-input.c:138:3-8: No need to set .owner here.
>> The core will do it.
>>
>> Please review and possibly fold the followup patch.
>> --- snip ---
>>
>> I removed the .owner attribute in v2 as requested but wasn't really sure
>> whether it was "appropriate"
>> to add the tag so I put it there anyhow. Technically, this does not fix
>> any previous commit.
> For this kind of thing you may attribute the reporter(s) by mentioning
> them in the comment lines / cover letter.
It's there in the patch version notes so the 'Reported-by' was 
unnecessary. Should it be removed?
That is, is there a tool sitting somwhere that tries to match reports 
and their fixes?

