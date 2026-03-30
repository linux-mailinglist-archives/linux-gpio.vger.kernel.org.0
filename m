Return-Path: <linux-gpio+bounces-34382-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGQvHOcgymmu5QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34382-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:06:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FED356374
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9D23059F22
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 07:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7379139EF17;
	Mon, 30 Mar 2026 07:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBN8PO8u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BC386569
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854060; cv=none; b=rlI81FX0kmd1RGHM+zqJGvbzBBU7NY/qMSywRN3ssF3NH84ADZvr64EbEDvIabNsgTY85N4MFfh/XZZ9Ph9OdGwRGpqtVRE60vKTwbxbvU4FYJTI4PJwXBjovUCV3ugLc49Op1KtajF5PJSUHJ5O5870rxpYNjKxa+niPTokxx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854060; c=relaxed/simple;
	bh=6rA9Xtcdmd08VsogKTmBjHNQ08z/ML2F6YvYntFpRdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWvk7dhRSiT0qNRdJuP9st+77iuGjd97hnyXstFY+0jb23jrsrabGJkCmjo2bAs6hSOEqaIJY3e3xUr61zY64cAN1fMMPNb2HGcLwi9QEIU0gjLZpuobVG2R2qouxa2VYW7UzzLcS4rjVN4ssHsJoctPQa8QTBG9ijMJXuF/AMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBN8PO8u; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48704db565eso54224015e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 00:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774854056; x=1775458856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OSgZl4DlE+4zGVexrD081h/4vsBgQuVjimFrCd20fQ=;
        b=TBN8PO8uyufWFLj8OSj2Ok76sA0LK0XBj0xvpRgJN10USvtxq6/01Fam8AasYSxLs0
         6PD3td+DQJeJjYysEq/KgMNbWOTQ+8V0X7hbcc5Zbwb7Xi2WfNiiB9wPIb+k/rqxPTLj
         Kz1raPeTjNsafGAalmoSx8TNdDDoSqjPffr/3Qr6xq2Dk/A419D6etlWVMkn0sA6olOo
         f8mRc3nEX5ydVQf9NJM1elmBsGFshA6N4ogrk8TJs/iAISca0mbYcWMDmNRmCzmzPUZ+
         6Znn0yRk4AjrrcFvW/XlGmDfKI8/ur0AkvOb+bsLMlZIltop+A1+c5fzeDbuVzrCNXFS
         Jo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774854056; x=1775458856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OSgZl4DlE+4zGVexrD081h/4vsBgQuVjimFrCd20fQ=;
        b=KwgdPCxXT579i5i6HYqtg/8NQ0wfQJ4HtKwYY9ZTuXSyRlvv3XV42fvFM+tE1XErr4
         DmElNCZkSohFaFzVQGTTXRZRVWNJjqNnSJU0tCHsxhbqYdGGmMWXO5P0LU366jqnKjaX
         mfPXIX0UC0sRKYnXcpjmgTIqVB3uY6ur0DUf9zWXr3jOHksVqYX/wLiOsmfCj70BNrkV
         YcAe7sdENVJNf6kTtI4ya7Y/Kze5jXLZnZp5vfOwQ9LrRei1shnpM5EPhkIOAp6sL1qC
         Eb1V4plu7nXyAqKWTOFQZWtvLVNU8TWNEPWo8enIsm3trGWA2nTJhtvYarRzgTTYeaUI
         aanw==
X-Forwarded-Encrypted: i=1; AJvYcCXLIiAUaWAdvbeMIKKza4ZA7W1VeK83JoDjTF+0ejwcSutfNwwXyR0F8XWe8vFfo9JUH0hCMh8cfooI@vger.kernel.org
X-Gm-Message-State: AOJu0YygaorwlNHT+SeHV4G5OukFhOrP+2h4Q6EPfI4PF1Yw2auTTExm
	uLsWeSVjY9RqHmThC/YgI+FgnGE2Hs+23FiAZb5J+P/GO+j4mnlUYYCE
X-Gm-Gg: ATEYQzypCaWL9l/N6p7VjI9aGSxtp3sGFA5X9Uz7TG8Ppraqzxk43KaNO0aXlfHR38T
	YntvgOfgGX+qwnBVhlS6Ip6dhjKGn32IgiM5uafaLOR3cJTmNVo/3YZKInaClGZAFo9xtug0qA6
	1ja6y3wYPhLg2+DA88Y0+BphiYwLOVN/0ifVzoat1FT3E14HRb3lsXshn4w1KbYDcFXzFc7rGFb
	LxSQGK1BMNnJLbLxes52fX77Jy6o7Ger6r9W5WogzYAepEl7gy9IaSw1WTiaokR5Se1U/6RlhMa
	441AvTYLVyG7JgsOtwJ9Mb81VWhYpwq+lXgQJckrjs+30F8i/vh1SA/FQ9/WaznnM+wWtZJvWBg
	cXKCwdUsMtxwf0cMPt1243x+ciyi/psLYaUYq0qOmxc8QCigL1N/SNZOy15QW5Kr/wKKqgSeCGO
	2Jrufrgyckbci8TXIMdMDGzqIoZqnbBgk2cyOlJKI=
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr197649325e9.14.1774854055722;
        Mon, 30 Mar 2026 00:00:55 -0700 (PDT)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d3b315sm96290265e9.0.2026.03.30.00.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:00:55 -0700 (PDT)
Message-ID: <86a96690-1307-4a6f-8265-1d6d30ce6d6c@gmail.com>
Date: Mon, 30 Mar 2026 10:54:52 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Content-Language: en-US
To: "Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>,
 "dumitru.ceclan@analog.com" <dumitru.ceclan@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "martin.hecht@avnet.eu" <martin.hecht@avnet.eu>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <MW4PR12MB566835A0D88DAA21D6642832E856A@MW4PR12MB5668.namprd12.prod.outlook.com>
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <MW4PR12MB566835A0D88DAA21D6642832E856A@MW4PR12MB5668.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu,ideasonboard.com,gmail.com,amazon.com];
	TAGGED_FROM(0.00)[bounces-34382-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitrutzceclan@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74FED356374
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/26/26 7:00 PM, Dayananda, Vivekananda wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Dumitru, Sakari,
> 
> Thank you for the latest patch series. We have been validating this
> on the following test infrastructure:
> 
> - IMX219 image sensor
> - MAX96724 deserializer
> - MAX96717 serializer
> 
> With this setup the v9 drivers operate as expected and we are able to
> exercise streaming end-to-end.
> 
> One item worth noting: our deserializer sits on a custom daughter card
> where the I2C bus is routed through port 1. The current MAX96724 driver
> only supports I2C on port 0. It would be valuable to extend the driver
> to support additional I2C port configurations so that setups like ours
> can be accommodated.
> 
> Vivek 

Hi Vivek,

I have found the EZ thread where the I2C port1 issue was raised and
resolved. Would the inclusion of those 2 commits from Cosmin suffice
or were there more changes required for your setup to work?


>> -----Original Message-----
>> From: Dumitru Ceclan via B4 Relay
>> <devnull+dumitru.ceclan.analog.com@kernel.org>
>> Sent: Wednesday, March 11, 2026 12:17 AM
>> To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>; Mauro
>> Carvalho Chehab <mchehab@kernel.org>; Sakari Ailus
>> <sakari.ailus@linux.intel.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Julien Massot
>> <julien.massot@collabora.com>; Rob Herring <robh@kernel.org>; Niklas
>> Söderlund <niklas.soderlund@ragnatech.se>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Cosmin Tanislav <cosmin.tanislav@analog.com>
>> Cc: mitrutzceclan@gmail.com; linux-media@vger.kernel.org; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> staging@lists.linux.dev; linux-gpio@vger.kernel.org; Niklas Söderlund
>> <niklas.soderlund+renesas@ragnatech.se>; Martin Hecht
>> <Martin.Hecht@avnet.eu>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; Cosmin Tanislav
>> <demonsingur@gmail.com>; Cory Keitz <ckeitz@amazon.com>
>> Subject: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
>> deserializer drivers
>>
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a common
>> framework that can be used to implement such GMSL chips, which avoids code
>> duplication while also adding support for previously unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the current
>> mainline drivers, the choice was made here to add a totally new set of drivers.
>> The current drivers support only a small subset of the possible features, and only
>> a few devices, so the end result after extending them would in any case be
>> essentially fully rewritten, new drivers.
>>
>> This series depends on support for internal pads, for which a patch has been
>> added.
>>
>> The previous version is at:
>> https://lore.kernel.org/all/20250718152500.2656391-1-
>> demonsingur@gmail.com/
>>
>> Since the previous series, Cosmin has left Analog Devices.
>> Because included changes from previous version are trivial, his sign-off and tags
>> were retained.
>>
>> The following deserializers are supported:
>> * MAX96712 (already exists in staging)
>> * MAX96714 (already exists)
>> * MAX96714F (already exists)
>> * MAX96714R (GMSL2)
>> * MAX96716 (GMSL2)
>> * MAX96724 (already exists as part of existing MAX96712 driver)
>> * MAX96724F (GMSL2)
>> * MAX96724R (GMSL2)
>> * MAX9296A (GMSL2)
>> * MAX96792A (GMSL3)
>>
>> The following serializers are supported:
>> * MAX96717 (already exists)
>> * MAX9295A (GMSL2)
>> * MAX96793 (GMSL3)
>>
>> The following list enumerates new features that are supported by the common
>> framework and their respective chip-specific drivers:
>> * Full Streams API support. Most deserializers have support for more than one
>> link, and more than one PHY. Streams support allows configuration of routing
>> between these links and PHYs.
>>
>> * .get_frame_desc() support. Both the serializers and deserializers implement this
>> to query and provide frame descriptor data. This is used in features explained in-
>> depth below.
>>
>> * .get_mbus_config() support. The deserializers implement this to allow upstream
>> devices to query the link frequency of its pads.
>>
>> * Address translation with I2C ATR for the serializers.
>>
>> * I2C ATR translation - some deserializers cannot do muxing since I2C
>> communication channel masking is not available per-link, and the only other way
>> to select links is to turn them off, causing link resets.
>> For such cases, I2C ATR is used to change the address of the serializers at probe
>> time.
>>
>> * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps,
>> GMSL2 3Gbps.
>>
>> * Automatic stream id selection for deserializers which need serializers to stream
>> on unique stream ids.
>>
>> * Automatic VC remapping on the deserializers. VCs are picked so that if they
>> were unique on the sink pad, they will end up as unique on the source pad they
>> are routed to too, prioritizing using the same VC ID as the sink pad, to facilitate
>> the possibility of using tunnel mode.
>>
>> * Automatic pixel mode / tunnel mode selection. Tunnel mode is used when VC
>> IDs do not need to be changed and all hardware supports tunnel mode,
>> otherwise, pixel mode is used. The serializers are automatically switched
>> between the two by using a private API.
>>
>> * Automatic double mode selection. In pixel mode, double mode can be used to
>> pack two pixels into a single data unit, optimizing bandwidth usage. The
>> serializers are automatically set up to support the double modes determined by
>> the deserializers using a private API.
>>
>> * Automatic data padding. In pixel mode, if the data being transferred uses two
>> different BPPs, data needs to be padded. The serializers automatically set this up
>> depending on the configured double mode settings and incoming data types.
>>
>> * Logging. Both the deserializers and serializers implement the V4L2
>> .log_status() ops to allow debugging of the internal state and important chip
>> status registers.
>>
>> * PHY modes. Deserializer chips commonly have more than a single PHY.
>> The firmware ports are parsed to determine the modes in which to configure the
>> PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using fewer lanes).
>>
>> * Serializer pinctrl. Serializers implement pinctrl to allow setting configs which
>> would otherwise be inaccessible through GPIO: TX/RX via GMSL link, pull-up &
>> pull-down (with strength), open-drain & push-pull, slew rate, RCLK pin selection.
>>
>> * TPG with selectable formats, resolutions and framerates for both serializers and
>> deserializers.
>>
>> The drivers have been tested on the following hardware combinations, but further
>> testing is welcome to ensure no / minimal breakage:
>> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
>> * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
>> * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
>> * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
>> * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219
>>
>> Analog Devices is taking responsibility for the maintenance of these drivers and
>> common framework, and plans to add support for new broad-market chips on top
>> of them.
>>
>> Special thanks go to Tomi Valkeinen <
>> tomi.valkeinen+renesas@ideasonboard.com>
>> for testing the drivers, helping debug and coming up with ideas / implementations
>> for various features.
>>
>> The following v4l2-compliance test still fails:
>>                 fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>>                 fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>
>> As the serializers and deserializers are format agnostic and the values set are not
>> used to configure anything in the chips, this test does not make much sense in this
>> context. If needed, a check for the specific ~0U value can be added.
>>
>> V9:
>> * split max_des_ops into *_info and *_ops
>> * use read_poll_timeout macro in *_wait_for_device()
>> * return read_poll_timeout error -ETIMEDOUT in *_wait_for_device()
>> * remove use_atr duplicate from max9296a_chip_info, present in max_des_info
>> * fix max9296a DPLL register offset
>> * fix C-PHY DPLL frequency in max9296a and max96724
>>     reported by: Cory Keitz <ckeitz@amazon.com>
>> * use MAX9296A_COMMON_INFO and MAX9296A_COMMON_OPS to simplify
>>   probe ops init
>> * fix borked patches in previous version, actually remove MAX96717 and
>>   MAX96714 drivers
>>
>> V8:
>> * max96717: use the renamed PIN_CONFIG_OUTPUT to _LEVEL
>> * max96717: use the renamed set_rv ops from struct gpio_chip
>> * dt-bindings: set minItems lane-polarities to 2
>> * dt-bindings: "add myself as maintainer" commits were removed
>> * max_des & max_ser: use a default format for set_routing
>> * max_des & max_ser: return ENNOTTY in *_frame_interval for non-TPG pads
>>
>> V7:
>> * dt-bindings: max9296a: use full max96717 compatible
>> * max9296a: make max96714_rlms_reg_sequence static
>> * explicitly include linux/bitfield.h
>> * explicitly depend on I2C and PINCTRL
>> * sort media_entity_operations
>> * add has_pad_interdep to media_entity_operations
>>
>> V6:
>> * max9296a: put rlms sequence in max9296a_chip_info
>> * max_des: reflow stream id a comment
>> * max_ser: remove exported symbols not used in other modules
>> * max_ser: init mode to a supported value
>> * add default routing
>> * MAX_SERDES_GMSL_3 -> MAX_SERDES_GMSL_3_12GBPS
>> * guard reg_read/write with CONFIG_VIDEO_ADV_DEBUG
>> * put exported symbols in MAXIM_SERDES namespace
>>
>> V5:
>> * dt-bindings: max96717: restrict RCLKOUT to pins 2 & 4
>> * dt-bindings: max96717: remove confusing rclksel pinconf property
>> * dt-bindings: max96717: remove maxim,gmsl-tx/rx pinconf property
>> * dt-bindings: max96717: remove gmsl prefix from maxim,gmsl-tx-id/rx-id
>> * dt-bindings: max96717: remove minimum: 0
>> * dt-bindings: max96717: better document slew-rate
>> * dt-bindings: max96717: better document maxim,jitter-compensation
>> * dt-bindings: max96717: better document maxim,tx-id/rx-id
>>
>> * max_serdes: add default TPG values
>> * max_serdes: remove MAX_MIPI_FMT macro
>> * max_serdes: EXPORT_SYMBOL -> EXPORT_SYMBOL_GPL
>> * max_serdes: remove EXPORT_SYMBOL_GPL from symbols not used in other
>> modules
>> * max_serdes: rename symbols/macros/types to have max_serdes prefix
>> * max_serdes: slim down TPG functions
>>
>> * max_des: fix may be used uninitialized errors
>> * max_des: fix misplaced TPG validation
>> * max_des: fix setting pipe PHY in tunnel mode for chips that support both
>> set_pipe_phy() and set_pipe_tunnel_phy()
>> * max_des: move doubled_bpp/sink_bpps variables to usage place
>> * max_des: do not dynamically control PHY enable, letting lanes be in
>> LP-11 when not streaming
>> * max_des: refactor get/set_pipe_stream_id() logic
>> * max_des: remove explicit ret = 0
>>
>> * max_ser: make VC remaps not pipe-specific, allocate dynamically
>>
>> * max9296a: add missing 1080p30 TPG entry
>> * max9296a: move BIT() left shift into macro
>> * max9296a: move BIT() ternary into macro
>> * max9296a: reuse max_des_ops for chip-specific ops\
>> * max9296a: document and compress RLMS register writes
>>
>> * max96717: restrict RCLKOUT to pins 2 & 4 because of hardware capabilities
>> * max96717: add support for XTAL/1, XTAL/2, XTAL/4 clocks
>> * max96717: set RX_EN/TX_EN automatically
>> * max96717: reorder custom pinconf flags
>> * max96717: drop OF dependency
>>
>> * drop of_match_ptr
>> * re-do some indentation
>> * implement TPG pattern control
>> * remove pr_info() usage
>> * inline lane polarity val = 0
>> * inline returns
>> * rewrite some Kconfig docs
>> * split up patches for easier review
>>
>> V4:
>> * max_des: fix infinite version loop
>> * max_des: fix pipe link id when there are more pipes than links
>> * max_des: implement setting pipe link
>> * max_des: do not pass routing to phy update
>> * max_des: move GMSL version strings to max_serdes
>> * max_des: split finding existing VC remap from adding a new one
>> * max_des: add tracking for in-use pipes
>> * max_des: skip unused pipes when finding / setting pixel/tunnel mode
>> * max_des: simplify remap code
>> * max_des: split set_pipe_phy() into set_pipe_tunnel_phy()
>>
>> * max_ser: clean up i2c_xlates printing
>> * max_ser: fix changing serializer address
>> * max_ser: move non-continuous mode check into max96717 driver
>>
>> * max96724: use regmap_set_bits for STREAM_SEL_ALL
>> * max96724: match surrounding indent for MAX96724_PHY1_ALT_CLOCK
>> * max96724: fix setting invalid PHY to 1 when PHY 0 is in 4-lane mode
>> * max96724: remove support for setting pipe phy from max96712
>> * max96724: fix setting double mode on pipes 4-7
>> * max96724: drop powerdown gpios
>>
>> * max96717: use gpio_chip's set_rv
>>
>> * max9296a: switch versions to unsigned int
>> * max9296a: remove parantheses from MAX9296A_MIPI_PHY18/20
>> * max9296a: fix printing of PHY packet counts
>> * max9296a: fix phy_hw_ids size
>>
>> * remove usage of cammel case in defines
>> * move field_get/prep to max_serdes.h
>> * rework stream id setup
>> * rework tunnel/pixel mode finding
>> * rework bpps retrieval
>> * pass whole subdev state around
>> * add helper for retrieving a route's hw components / frame desc
>> * update pipe enable based on active routes
>> * add support for tunnel-only chips and VC remaps in tunnel mode
>> * simplify max_get_streams_masks()
>> * add support for TPG
>>
>> V3:
>> * dt-bindings: drop reflow text patches
>>
>> * dt-bindings: max96717: move pinctrl configuration into main file
>> * dt-bindings: max96717: allow a single level of pins configuration
>> * dt-bindings: max96717: use regex for matching pins nodes
>> * dt-bindings: max96717: drop extra allOf in pinctrl configuration
>> * dt-bindings: max96717: fix i2c-atr channel name regex
>> * dt-bindings: max96717: limit pinctrl functions to gpio / rclkout
>> * dt-bindings: max96717: limit pins for gpio / rclkout
>> * dt-bindings: max96717: add description for bias-pull-up/down
>> * dt-bindings: max96717: require pins and function properties
>> * dt-bindings: max96717: turn single compatible strings into an enum
>>
>> * dt-bindings: max9296a: include indices in port descriptions
>> * dt-bindings: max9296a: remove property-less schema from input ports
>> * dt-bindings: max9296a: use ATR for MAX96716A too, removing MUX entirely
>>
>> * dt-bindings: max96712: include indices in port descriptions
>> * dt-bindings: max96712: deprecate enable-gpios in favor of powerdown-gpios
>> * dt-bindings: max96712: switch from MUX to ATR
>>
>> * dt-bindings: max96714: add support for MAX96714R
>>
>> * max_des: fix POC NULL check
>> * max_des: remove index var in POC enable
>> * max_des: fix writing empty remaps
>> * max_des: skip mode setting in tunnel mode
>> * max_des: remove a duplicate source->sd NULL check
>> * max_des: set pipe tunnel mode even for disabled links
>>
>> * max_ser: apply TX ID changes irrespective of serializer ID
>>
>> * max9296a: fix typo in BACKTOP22
>> * max9296a: make register macros more consistent
>> * max9296a: switch MAX96716 from MUX to ATR
>> * max9296a: deduplicate max9296a_phy_id() logic
>> * max9296a: use proper PHY id in remaps
>> * max9296a: fix DPLL reset clear
>> * max9296a: limit MAX96714F to GMSL2 3Gbps
>> * max9296a: add support for MAX96714R
>> * max9296a: do not write GMSL3 link select registers in GMSL2 devices
>> * max9296a: use field_prep when setting RX_RATE
>> * max9296a: simplify setting SEL_STREAM for MAX96714
>> * max9296a: max96716_set_pipe_phy -> max96716a_set_pipe_phy
>> * max9296a: fix off-by-one in lane polarity when using
>> polarity_on_physical_lanes
>>
>> * max96724: fix typo in BACKTOP22
>> * max96724: switch from MUX to ATR
>> * max96724: add support for powerdown GPIO
>> * max96724: remove support for tunneling from MAX96712
>> * max96724: only set tunnel-related bits when in tunnel mode
>> * max96724: add support for MAX96724F/R
>> * max96724: oneshot reset links after link selection
>>
>> * remove GMSL2 version defaults, set all supported versions explicitly
>> * reorder GMSL versions to start from 0
>> * add support for GMSL2 3Gbps
>> * support GMSL version finding for devices using MUX / GATE
>> * add support for deserializers which don't have individual control of each link's
>> GMSL version
>> * add support for deserializers that need unique stream ids across all serializers
>> * select_link_version -> set_link_version
>> * select_resets_link -> use_atr
>>
>> V2:
>> * add missing compatible for MAX96717F
>> * fix embarrassing dt-bindings mistakes
>> * move MAX9296A/MAX96716/MAX96792A to a separate file as they have two
>> links / PHYs, and adding those conditionally seems impossible
>> ---
>> Cosmin Tanislav (20):
>>       dt-bindings: media: i2c: max96717: add support for I2C ATR
>>       dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
>>       dt-bindings: media: i2c: max96717: add support for MAX9295A
>>       dt-bindings: media: i2c: max96717: add support for MAX96793
>>       dt-bindings: media: i2c: max96712: use pattern properties for ports
>>       dt-bindings: media: i2c: max96712: add support for I2C ATR
>>       dt-bindings: media: i2c: max96712: add support for POC supplies
>>       dt-bindings: media: i2c: max96712: add support for MAX96724F/R
>>       dt-bindings: media: i2c: max96714: add support for MAX96714R
>>       dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
>>       media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
>>       media: i2c: add Maxim GMSL2/3 serializer framework
>>       media: i2c: add Maxim GMSL2/3 deserializer framework
>>       media: i2c: maxim-serdes: add MAX96717 driver
>>       media: i2c: maxim-serdes: add MAX96724 driver
>>       media: i2c: maxim-serdes: add MAX9296A driver
>>       arm64: defconfig: disable deprecated MAX96712 driver
>>       staging: media: remove MAX96712 driver
>>       media: i2c: remove MAX96717 driver
>>       media: i2c: remove MAX96714 driver
>>
>> Sakari Ailus (1):
>>       media: mc: Add INTERNAL pad flag
>>
>>  .../bindings/media/i2c/maxim,max9296a.yaml         |  242 ++
>>  .../bindings/media/i2c/maxim,max96712.yaml         |   65 +-
>>  .../bindings/media/i2c/maxim,max96714.yaml         |    5 +-
>>  .../bindings/media/i2c/maxim,max96717.yaml         |  154 +-
>>  .../userspace-api/media/mediactl/media-types.rst   |    9 +
>>  MAINTAINERS                                        |   10 +-
>>  arch/arm64/configs/defconfig                       |    1 -
>>  drivers/media/i2c/Kconfig                          |   34 +-
>>  drivers/media/i2c/Makefile                         |    3 +-
>>  drivers/media/i2c/max96714.c                       | 1017 -------
>>  drivers/media/i2c/max96717.c                       | 1102 -------
>>  drivers/media/i2c/maxim-serdes/Kconfig             |   60 +
>>  drivers/media/i2c/maxim-serdes/Makefile            |    6 +
>>  drivers/media/i2c/maxim-serdes/max9296a.c          | 1358 +++++++++
>>  drivers/media/i2c/maxim-serdes/max96717.c          | 1686 +++++++++++
>>  drivers/media/i2c/maxim-serdes/max96724.c          | 1193 ++++++++
>>  drivers/media/i2c/maxim-serdes/max_des.c           | 3188
>> ++++++++++++++++++++
>>  drivers/media/i2c/maxim-serdes/max_des.h           |  156 +
>>  drivers/media/i2c/maxim-serdes/max_ser.c           | 2138 +++++++++++++
>>  drivers/media/i2c/maxim-serdes/max_ser.h           |  147 +
>>  drivers/media/i2c/maxim-serdes/max_serdes.c        |  413 +++
>>  drivers/media/i2c/maxim-serdes/max_serdes.h        |  183 ++
>>  drivers/media/mc/mc-entity.c                       |   15 +-
>>  drivers/staging/media/Kconfig                      |    2 -
>>  drivers/staging/media/Makefile                     |    1 -
>>  drivers/staging/media/max96712/Kconfig             |   14 -
>>  drivers/staging/media/max96712/Makefile            |    2 -
>>  drivers/staging/media/max96712/max96712.c          |  487 ---
>>  include/uapi/linux/media.h                         |    1 +
>>  29 files changed, 11006 insertions(+), 2686 deletions(-)
>> ---
>> base-commit: a15a902a91b78f1544760fb52ef0151f83815f81
>> change-id: 20251107-gmsl2-3_serdes-3f2b885209c3
>>
>> Best regards,

