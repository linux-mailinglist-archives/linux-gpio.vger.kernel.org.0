Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A34F48549A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jan 2022 15:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiAEOcN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jan 2022 09:32:13 -0500
Received: from mga17.intel.com ([192.55.52.151]:2677 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240918AbiAEOcJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Jan 2022 09:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641393129; x=1672929129;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MIb266mzAe1OmHItr3ekG/hS6Ob4ACfCHQRZYW42My8=;
  b=m1qQGnuFKaK7jZvm060nNF6lLLnebAfoc+rlGv2JV6hXI8SsXjcu4h5r
   wBu8N/IqkVssFAJ2ocUPCIZ3tk4/zD0M4H0J/djCvABK3Al1ulw93SdH6
   aQswG9c3TOljGzJW4hjjHLdPI7/mkY0AdnDIpqHeNmtMUmacD/MpcfL9a
   9aAAmiaBmdOAz5aluPlGQqsMLWEf8J92QdpqnwQ1V5oStOwRbeuQDWr2E
   wzhuHvXlF3TegsvKmupwV4eYaZcc34XaoiEOCHsqVm9C+5O0DojSV/YoO
   +LdRvAp8EZtEJFMhPj4y2w/s6z6r6Uun1+tWnz/boFuEHaaOcPyRmOLJ6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223136255"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="223136255"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="526551796"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orsmga008.jf.intel.com with ESMTP; 05 Jan 2022 06:23:25 -0800
Message-ID: <0c6900c2-656b-833f-5775-b76a852bc8eb@linux.intel.com>
Date:   Wed, 5 Jan 2022 16:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: pinctrl-cherryview regression in linux-next on preproduction
 Braswell
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <70004f1a-fef5-f6e9-6824-47eeb59f8014@linux.intel.com>
 <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
 <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
 <c29e98f5-c8e4-1967-a249-a461776488ad@redhat.com>
 <65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com>
 <27a870e5-675a-564f-2bfe-ee913bdec0ac@redhat.com>
 <60adc8c5-3d58-b7bf-6c53-70599118b83f@redhat.com>
 <e3052473-0dba-49b3-c58c-c100742c978d@linux.intel.com>
 <d04b5312-a38f-e7a7-f6cf-35320daade39@redhat.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <d04b5312-a38f-e7a7-f6cf-35320daade39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/4/22 16:47, Hans de Goede wrote:
> Hi Jarkko,
> 
> On 1/4/22 15:38, Jarkko Nikula wrote:
>> That gave me an idea to look at is there anything suspicious in "top" or /proc/interrupts (no and no) but powertop shows CPU 0 is over 90 % in C0 state and max frequency.
>>
>> But comparing powertop on v5.16-rc8 it does look sometimes the same and sometimes CPU 0 is less in C0 (but still over 30 %). Hard to say is there difference but obviously v5.16-rc8 either is not good on this machine since CPU 0 and package seems to reach idle only 5 % or less.
> 
> Hmm, does this happen to with the "hack" patch to initially mask interrupts
> triggered by all the interrupt-lines of the GPIO-controller ?
> 
> Ah upon reading your reply a second time I see you already checked
> /proc/interrupts; and that you are also seeing this with 5.16-rc8.
> 
> So the load is likely not caused by the pinctrl issue and there also
> is some other issue I guess...
> 
> For the high cpu-load issue it would be good to know if this is
> also present on older kernels.
> 
Sorry I mean cpu load is near idle according to top and no visible 
interrupt flood in /proc/interrupts but powertop shows CPU 0 is mostly 
in C0 or C1 state and doesn't idle or idles very near to 0 %. This is 
from v5.16-rc8.

I think on this machine only MMC card detect is using the pincontrol. At 
least pinctrl_cherryview module usage drops to zero and no users in 
/sys/kernel/debug/gpio after unbinding all devices from 
/sys/bus/platform/drivers/sdhci-acpi/.

MMC looks like to be well behaving since nothing changes after unbinding 
it and card detect is this one "INT33FF:03: using interrupt line 0 for 
pin 81".

However if I blacklist cherryview-pinctrl then CPU 0 and package will 
reach deeper C states. Perhaps misconfigured pin etc by the firmware?

But since those issues were here before the regression and your fix 
makes the machine booting again this case is solved by it.

Jarkko
