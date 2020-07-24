Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5116922C251
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 11:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgGXJcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 05:32:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbgGXJcU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 05:32:20 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14338538;
        Fri, 24 Jul 2020 11:32:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595583135;
        bh=Cips7pSNDfpgtho04Lh5hkgIg9jLAxz9Mcu4eoJKuVk=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BkDiNIBu4JegKCJlagORd38wBDCf/q38XsYr8zuBBtfqozbk6l1G2t8g1CabBy36Y
         9gkHAUfJATMx/WTnK7/INcawcOn1d558KpBclNGYEbvMtdWQI/2bYC7u+J+Ufsf9zZ
         oKagvrLZc6f4Lq1NBTd2uwIBtQiRnFVSq5g813hE=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v10 2/4] media: i2c: Add MAX9286 driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
 <20200612144713.502006-3-kieran.bingham+renesas@ideasonboard.com>
 <1fb4a023-d177-744f-41f4-755aafbfa7f2@ideasonboard.com>
 <20200723222834.GC829@valkosipuli.retiisi.org.uk>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <c4b0e30f-b0b7-1b19-f43e-36d417eb6d28@ideasonboard.com>
Date:   Fri, 24 Jul 2020 10:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723222834.GC829@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sakari,

On 23/07/2020 23:28, Sakari Ailus wrote:
> Hi Kieran,
> 
> On Thu, Jul 16, 2020 at 10:02:24AM +0100, Kieran Bingham wrote:
>> Hi Sakari,
>>
>> This is the output of checkpatch --strict on this driver. Sorry for not
>> detailing this in the commit or cover letter.
> 
> No worries.
> 
>>
>>> ./patches/gmsl/v10/v10-0001-dt-bindings-media-i2c-Add-bindings-for-Maxim-Int.patch has style problems, please review.
>>> --------------------------------------------------------------
>>> ./patches/gmsl/v10/v10-0002-media-i2c-Add-MAX9286-driver.patch
>>> --------------------------------------------------------------
>>> CHECK: Prefer using the BIT macro
>>> #246: FILE: drivers/media/i2c/max9286.c:40:
>>> +#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #251: FILE: drivers/media/i2c/max9286.c:45:
>>> +#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #262: FILE: drivers/media/i2c/max9286.c:56:
>>> +#define MAX9286_EDC_6BIT_CRC		(1 << 5)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #268: FILE: drivers/media/i2c/max9286.c:62:
>>> +#define MAX9286_HVSRC_D14		(1 << 0)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #286: FILE: drivers/media/i2c/max9286.c:80:
>>> +#define MAX9286_DATATYPE_RGB565		(1 << 0)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #304: FILE: drivers/media/i2c/max9286.c:98:
>>> +#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #312: FILE: drivers/media/i2c/max9286.c:106:
>>> +#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
>>>
>>> CHECK: Prefer using the BIT macro
>>> #316: FILE: drivers/media/i2c/max9286.c:110:
>>> +#define MAX9286_I2CSLVTO_256US		(1 << 0)
>>
>> None of those are appropriate to use the BIT() macro, as they are all
>> entries of a specific field with a shift, such as:
>>
>> #define MAX9286_FSYNCMODE_ECU           (3 << 6)
>> #define MAX9286_FSYNCMODE_EXT           (2 << 6)
>> #define MAX9286_FSYNCMODE_INT_OUT       (1 << 6)
>> #define MAX9286_FSYNCMODE_INT_HIZ       (0 << 6)
>>
>> Checkpatch is only picking up on the "1 << x" variant of each entry.
> 
> Ideally you should use "1U << x" everywhere. If you happen to have a
> register with 31st bit signifying something, mayhem would follow. So the
> practice is to make all such definitions unsigned.

Just to clarify, because of the location you've put your x, which is not
the variable in the above case.

These definitions are possible field values with a shift (enum << y),
not bit values (1 << x)

They can of course be unsigned though.

Is your statement that you would like to see these as:

 #define MAX9286_FSYNCMODE_ECU           (3U << 6)
 #define MAX9286_FSYNCMODE_EXT           (2U << 6)
 #define MAX9286_FSYNCMODE_INT_OUT       (1U << 6)
 #define MAX9286_FSYNCMODE_INT_HIZ       (0U << 6)


Or that you would prefer a macro'ised version:

#define FIELD_ENTRY(value, shift) (value U << shift)


Or rather, I could just convert them all to use FIELD_PREP:

#define MAX9286_FSYNCMODE GENMASK(7,6)

#define MAX9286_FSYNCMODE_ECU      FIELD_PREP(MAX9286_FSYNCMODE, 3)
#define MAX9286_FSYNCMODE_EXT      FIELD_PREP(MAX9286_FSYNCMODE, 2)
#define MAX9286_FSYNCMODE_INT_OUT  FIELD_PREP(MAX9286_FSYNCMODE, 1)
#define MAX9286_FSYNCMODE_INT_HIZ  FIELD_PREP(MAX9286_FSYNCMODE, 0)

If you want me to change these entries, I suspect moving wholly to use
FIELD_PREP/FIELD_GET throughout the driver would be the best course of
action.

A bit of churn, but I can do that if you wish.

--
Kieran



>>> CHECK: Macro argument reuse 'source' - possible side-effects?
>>> #399: FILE: drivers/media/i2c/max9286.c:193:
>>> +#define for_each_source(priv, source) \
>>> +	for ((source) = NULL; ((source) = next_source((priv), (source))); )
>>
>> This warns against possible side effects, but the 're-use' effects are
>> desired ;-)
>>
>> If you'd prefer this macro to be re-written please let me know.
> 
> Works for me. Some warnigns are just not useful. I bet quite a few macros
> elsewhere in the kernel would trigger this.


I think we'll just leave this one ;-)


>>> CHECK: Lines should not end with a '('
>>> #1372: FILE: drivers/media/i2c/max9286.c:1166:
>>> +			ret = v4l2_fwnode_endpoint_parse(
>>
>> Full code block:
>>
>>>                         ret = v4l2_fwnode_endpoint_parse(
>>>                                         of_fwnode_handle(node), &vep);
>>>                         if (ret) {
>>>                                 of_node_put(node);
>>>                                 return ret;
>>>                         }
>>
>> That one is awkward, and I chose to keep it as a lesser evil.
>> Of course now that we can officially go up to 120 chars, I could move
>> this line up.
>>
>> If you'd like this to be moved to a single line now we can go over 80
>> chars, please confirm.
> 
> I don't mind that. Mauro, any thoughts on this?


And I'll let Mauro decide that as it will impact my line-length choices
in the future ;-)


-- 
Regards
--
Kieran
