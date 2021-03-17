Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C466C33EA5B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 08:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhCQHI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 03:08:26 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:52630 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229472AbhCQHH7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 03:07:59 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12H77lLO019222
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Mar 2021 08:07:47 +0100
Received: from [167.87.41.130] ([167.87.41.130])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12H6vja0026646;
        Wed, 17 Mar 2021 07:57:46 +0100
Subject: Re: [PATCH v4 2/2] gpio: sch: Hook into ACPI SCI handler to catch
 GPIO edge events
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20210316162613.87710-1-andriy.shevchenko@linux.intel.com>
 <20210316162613.87710-3-andriy.shevchenko@linux.intel.com>
 <YFEZ6GYuXGaX/LP2@smile.fi.intel.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a3a6c80a-724c-e2fb-9597-b14a302c5ff4@siemens.com>
Date:   Wed, 17 Mar 2021 07:57:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFEZ6GYuXGaX/LP2@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.03.21 21:49, Andy Shevchenko wrote:
> On Tue, Mar 16, 2021 at 06:26:13PM +0200, Andy Shevchenko wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Neither the ACPI description on the Quark platform provides the required
>> information is to do establish generic handling nor hardware capable of
>> doing it. According to the datasheet the hardware can generate SCI events.
>> Therefore, we need to hook from the driver directly into SCI handler of
>> the ACPI subsystem in order to catch and report GPIO-related events.
>>
>> Validated on the Quark-based IOT2000 platform.
> 
> This patch must be dropped completely. SCI handler is not correct way to do
> this. The proper way (and we have already few examples in the kernel) is to
> register GPE event.

As explained above, this is not supported by the preexisting firmware,
and there won't be any updates to it anymore.

This platform is history, the SoC was discontinued by Intel long ago,
and our devices reaching their support end as well. The race to upstream
was lost in this case - backlog too long, we being too slow.

Jan

> 
> It took me a while to gather all bits of this puzzle.
> 
> At least now I get an event, but kernel oopses, I'll continue debugging
> tomorrow.
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
