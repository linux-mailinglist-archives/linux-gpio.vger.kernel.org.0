Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D06127092
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 23:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSWVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 17:21:35 -0500
Received: from mga18.intel.com ([134.134.136.126]:45120 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726866AbfLSWVe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 17:21:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 14:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,333,1571727600"; 
   d="scan'208";a="267347305"
Received: from dmulla-mobl.amr.corp.intel.com (HELO [10.254.112.28]) ([10.254.112.28])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2019 14:21:32 -0800
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
Cc:     robh@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, vinod.koul@linaro.org,
        devicetree@vger.kernel.org, spapothi@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
 <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
 <db36d6d7-40a2-bbd2-f299-838abf4d92cc@linaro.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4492b71e-9923-365c-f22c-3766e2d5bae2@linux.intel.com>
Date:   Thu, 19 Dec 2019 14:05:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <db36d6d7-40a2-bbd2-f299-838abf4d92cc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



>> It was my understanding that in SLIMbus the Linux devices are created 
>> at probe time, and when the device reports present this 
>> 'device_status' callback is used to notify the codec driver of a 
>> change. The rationale for this was that the codec driver may control 
>> power switches/gpios that are necessary for the device to appear on 
>> the bus.
> 
> We use same rational here to power switch and flip reset pins in device 
> probe to power up the actual SLIMBus device in device probe.
> 
> Only difference here is that the actual SLIMBus device itself is 
> represented as many child devices based on there functionality.
> 
> SLIMBus parent device in this case is MFD device which is created at 
> probe time. However child devices for that device like gpio controller, 
> codec, clock controller and soundwire controller are created only after 
> the device is enumerated on the bus. Before that none of these devices 
> will be in a position to talk on the bus.
> 
> 
>>
>> This argument was used to require an change in the SoundWire 
>> implementation, so we followed this model of creating devices at probe 
>> time based on information reported by ACPI/DT, and used the 
>> 'update_status' callback when the device is present on the bus (which 
>> may happen after a delay or controlled by an external power switch). 
>> This approach can lead to 'ghost devices' described in firmware but 
>> not populated in hardware, and power management opens on how long a 
>> bus needs to remain active if no devices report present.
>>
>> What I understand from the code above is that the devices are actually 
>> created when the SLIMbus device reports PRESENT, which seems a 180 
>> degree change in directions?
>>
> Note these are the child devices of the MFD SLIMBus device.

Ah ok. I guess the creation of those child devices when the parent 
SLIMbus device reports PRESENT initially if fine, it's the part where 
you remove them if the device loses sync or gets powered off which is 
odd. And I guess technically you could still have race conditions where 
a child device starts a transaction just as the parent is no longer 
attached to the bus.

>> I would however not remove the devices when the status is down but 
>> only on an explicit .remove.
> 
> Am open for suggestions but I would not like the child devices to talk 
> on the bus once the SLIMbus device is down! Only way to ensure or make 
> it silent is to remove.

it's as if you are missing a mechanism to forward the parent status to 
the children so use remove() for lack of a better solution?
