Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E08548310D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 13:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiACMe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 07:34:58 -0500
Received: from mga02.intel.com ([134.134.136.20]:16536 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbiACMe5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Jan 2022 07:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641213297; x=1672749297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+QHvfvPf/8n4DZHM3LhpmvoOGrkL9WJ7x5abbrFkYXs=;
  b=ArfR3LUiKKou01vawXLXY0YAguzWlv9atjREd4j9vq3Zk9H/mzuKk8Qd
   9Z3TLQoI7MHTdTQebzQpSLteURU94C/sez+gMmPFTQ7uSaE/D1DhHacYw
   ogrIMr5Zrvn5R859gGTUh440kXt3QUdfJPIM1geRYtqXq01QnEkNOeK6p
   o3GvDW2S2CEb74Vez4f2HADIHe1dmA9HrL6HGw80GI1KgnsN8gnoEEDPN
   WpdDeJieDmZPV4py2j4k6UgTNCShr0S2QSBznJWwNW0f/AUIMawn8KVjb
   cNRoOvbp33SYmeG9g+FrkB9hgqGZaU8sm4hYaFtY9VOcGSrfR61W273WO
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="229364035"
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; 
   d="scan'208";a="229364035"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2022 04:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,257,1635231600"; 
   d="scan'208";a="512033644"
Received: from mylly.fi.intel.com (HELO [10.237.72.175]) ([10.237.72.175])
  by orsmga007.jf.intel.com with ESMTP; 03 Jan 2022 04:34:49 -0800
Message-ID: <a8b6d8f1-ad8c-23ac-a85b-2c903530735f@linux.intel.com>
Date:   Mon, 3 Jan 2022 14:34:48 +0200
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
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <6d133b89-cc03-6308-6da7-dcea95a93a8c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi

On 1/3/22 12:42, Hans de Goede wrote:
> Hi Jarkko,
> 
> On 1/3/22 10:42, Jarkko Nikula wrote:
>> Hi
>>
>> We have a Braswell based preproduction HW. I noticed linux-next tag next-20211224 doesn't boot on it due to following error:
>>
>> [   34.674271] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>> [   34.682476] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>> [   34.690681] cherryview-pinctrl INT33FF:00: interrupt on unused interrupt line 0
>> ...
>>
>> Linux v5.16-rc8 is ok. I found the following commit to be reason for the regression:
>>
>> bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")
> 
> Thank you for the timely headsup about this.
> 
> I assume that you have tried a revert (if necessary including reverting some
> of the follow ups) and that reverting the patch you point to fixes the
> issue, right ?
> 
Yes since linux-next has only these three commits below to 
pinctrl-cherryview.c that are not in v5.16-rc8 I reverted them one by 
one. I often try these kind of simple steps before going to more labor 
git bisect :-)

db1b2a8caf5b pinctrl: cherryview: Use temporary variable for struct device
07199dbf8cae pinctrl: cherryview: Do not allow the same interrupt line 
to be used by 2 pins
bdfbef2d29dc pinctrl: cherryview: Don't use selection 0 to mark an 
interrupt line as unused

I also double checked by checking out to bdfbef2d29dc and tested that 
commit and it reverted.

> Can you try the 2 attached patches *one at a time* ? :
> 
> 1. Restores the old behavior of just triggering hwirq 0 of
> the pincontroller-domain when we don't know the mapping
> 
Patch 1 does work and here's the output from modified error print:

[   13.550781] cherryview-pinctrl INT33FF:00: interrupt on unmapped 
interrupt line 0

If you want to go with patch 1 you may add my
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

> 2. Restores the old behavior which allows chv_gpio_irq_startup()
> to overwrite the interrupt-line to pin mapping if the current
> mapping points to pin 0
> 
Patch 2 alone doesn't:

[   24.977116] cherryview-pinctrl INT33FF:00: interrupt on unused 
interrupt line 0
[   24.985314] cherryview-pinctrl INT33FF:00: interrupt on unused 
interrupt line 0
[   24.993513] cherryview-pinctrl INT33FF:00: interrupt on unused 
interrupt line 0
...

> Both of these restore old behavior caused by a mapping-table
> entry containing 0 meaning both unset as well as HWIRQ0
> before the patch in question.
> 
> If applying them one at a time does not help, please also try with
> both applied.
> 
> These 2 patches should apply cleanly on top of linux-next.
> 
> If patch 2 fixes things it would be interesting if you can grab a
> dmesg with "pinctrl-cherryview.dyndbg" added to the command line
> (with the patched kernel).
> 
With both applied it does work:

# dmesg |grep cherryview-pinctrl
[   15.465425] cherryview-pinctrl INT33FF:00: interrupt on unmapped 
interrupt line 0
[   16.562282] cherryview-pinctrl INT33FF:03: using interrupt line 0 for 
pin 81
[   17.824905] cherryview-pinctrl INT33FF:02: using interrupt line 0 for 
pin 22
[   17.835757] cherryview-pinctrl INT33FF:03: using interrupt line 2 for 
pin 77
[   17.850170] cherryview-pinctrl INT33FF:00: using interrupt line 0 for 
pin 76

Jarkko
