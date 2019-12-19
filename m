Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF13D126781
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 17:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfLSQ6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 11:58:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:14807 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726760AbfLSQ6o (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Dec 2019 11:58:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 08:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; 
   d="scan'208";a="228308843"
Received: from dpshah-mobl1.amr.corp.intel.com (HELO [10.254.191.243]) ([10.254.191.243])
  by orsmga002.jf.intel.com with ESMTP; 19 Dec 2019 08:58:42 -0800
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
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
Date:   Thu, 19 Dec 2019 10:36:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> +static int wcd934x_slim_status(struct slim_device *sdev,
> +			       enum slim_device_status status)
> +{
> +	switch (status) {
> +	case SLIM_DEVICE_STATUS_UP:
> +		return wcd934x_slim_status_up(sdev);
> +	case SLIM_DEVICE_STATUS_DOWN:
> +		mfd_remove_devices(&sdev->dev);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

this is interesting/surprising - I just noticed what looks like a 
significant change in how probe/initialization are handled.

It was my understanding that in SLIMbus the Linux devices are created at 
probe time, and when the device reports present this 'device_status' 
callback is used to notify the codec driver of a change. The rationale 
for this was that the codec driver may control power switches/gpios that 
are necessary for the device to appear on the bus.

This argument was used to require an change in the SoundWire 
implementation, so we followed this model of creating devices at probe 
time based on information reported by ACPI/DT, and used the 
'update_status' callback when the device is present on the bus (which 
may happen after a delay or controlled by an external power switch). 
This approach can lead to 'ghost devices' described in firmware but not 
populated in hardware, and power management opens on how long a bus 
needs to remain active if no devices report present.

What I understand from the code above is that the devices are actually 
created when the SLIMbus device reports PRESENT, which seems a 180 
degree change in directions?

I actually prefer it this way, and all current discussions in MIPI 
circles point to the fact that when the bus starts all devices on that 
bus should already be powered and have the ability to report present 
immediately (if the bus starts in a 'safe' mode and then later programs 
different PHY parameters, a device can no longer join the bus)

I would however not remove the devices when the status is down but only 
on an explicit .remove.

Feedback welcome.
-Pierre

