Return-Path: <linux-gpio+bounces-19734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F275BAADD84
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 13:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DCC64E75A8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 11:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507ED1553AA;
	Wed,  7 May 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIpx3ao0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149121CC45;
	Wed,  7 May 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617925; cv=none; b=o9uz2VOuawZ9Sn5giXHt8xzATmWfK2KZEryv1CQd4jc06R0zCyEl24TsH995zeRgo8QYnwIrc9Gj0HVeTMsedBog7vbsLOh/qzqyRlObW3CGX/UxmZGob+DczWT0is+1DzVipqv1HDKZGjJICoe+1v2yQD9bqnqCRYO6TTM8wYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617925; c=relaxed/simple;
	bh=1yZlQJHQ4zomcuM/eaY4DuDI2Jgr0zUT6J/I8Q73GhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efY32gm+jCD+R6wcD5V7ehyl6ToZOs9YrMo/tt8SUe8n3nWj1n6gvetITm2YyVls3B5pNTEtw8N6qOMgnq7AE50VDN1vDgaKpqgL8hQgzcUaMQtKD2OgFFx/Et5Kqy8f47dqFsBDqevpiAkCMQ1HzEafu1+x5/guyu0tnUsGJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIpx3ao0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acbb85ce788so329135066b.3;
        Wed, 07 May 2025 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746617922; x=1747222722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=;
        b=MIpx3ao00n07ZTow1LRuKCLefJBvPsJuZGTDOuOHhpMb3Azz9PqwArPqOTQOTpHG9d
         dEl9YV1+DujzlxHUPZq6q0bdZ8ylj2WpbaDrnrjiRLy6oaOI6ebW3w4Yrm/1cEufPQGU
         NZ7bAjbhqRNgLpetMYZgBOEgjr+8AvK4/EUsu1e8/na+P/GEIWGXuc2E9sOqTjR23XCk
         QnaYg0pTR09txifsdh2ohIiUpzmI+FVFj6DJGgNbvreO8sxJoDE310EILkMf7Fh62kA6
         zQ7GsGlti7KScRMnhcK7nX4bUBMWYzPYF2L5hB4hOl8f8hlkSgUTwhQI/j/db+Xz/N18
         geqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617922; x=1747222722;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiVdAIN2EPB5/ddGNaW9SkB5MJnYa5J03/Pp0KFzzWw=;
        b=YtsE9KngH8eSdjdfcL7KVxYw630iJ9B+gXCQGqOPMRkYhFge26Ezr+rfF1Tvg57UzU
         DvU5EIC3xZvr8KY1i41hTKT9vAUgICVwFdFFIqzLf5xF9akr8OoaviUoKCRfHEVuGG+4
         yWyVQJqZtIXo6jmLSbTKJzDWyVw7x2EQjpNgzO5pTHSuPZS3RiNwMRxvDCfdiJ9rWEl/
         bpnXmVWa21tAiAxisNCbUXcMhFJbGCT9TrZW9DGXbYfezlxKNlWZYMVjhWKhXOnMX0aX
         3hbVIawaey7JTJ60T0OeWux0jLrnrfW2zyNpfky0bq63YkQBl94XBjKZ+sUG6MQvkKDF
         vUBA==
X-Forwarded-Encrypted: i=1; AJvYcCUSpFJP0p0cAu0vN6DKY4kaWEjBuyjYuGUK1cHo0RefHTPUXa0HIBDSBPwDsP8o9zdYDkHPMwsfFk4LVQ==@vger.kernel.org, AJvYcCV4ZLvXO8lZHxsOvlzyR1ZYn3yJfhplPncrwlBW5xif6xx7UWk7Ai0YVmzhfCWfZiEyRuIf4FVvNxWL@vger.kernel.org, AJvYcCVgkjh9lwvcjlfqYnBta/biBrH7q5ZfNjdfvDqhjy1P0HRuLMhkG9Vgu+49bbxRxPhwMZqqv99kTnpQH3TM@vger.kernel.org, AJvYcCX6E/BOmyRWohVS7j0HB+k5N7ks17r56vOc3uOxi7weO1US3MGDqIPc43jnEAIpaMwVBeCWVDFV6gG5hvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhIBgfy6/kQODpLkyeoeC1bVZ113F3ekCRqByEE+/hQuNTEg/y
	WeCkWTM2DGIuXDrdGFS8qcYRD+oqn4u4rFPBgInE2hcAPABe7rN8
X-Gm-Gg: ASbGncslD+klSqaAK1QBjGjlwc4L+BNIkdXyMbxPipOCBUOfzkcd1sr5MYubo4qMBHT
	HSydY2kMbjq8BDL9Rs0gnPBv7mpGFJyL5Ornik1wdJ3aQCONZnZ1YWKWGFXxa74S2n3zpyATbjh
	3TIvfU+wMuyUAwH5N3Xxxa7WuiilQb54hkkoF5437riQXumMfgFUjgLUnBlpPjZn84Sql0TzxTo
	AYrzjyrYZmA9zSQ6Us79GBiUPR563u5XEANb43LXujbk/RMo4JS5Gq5nv7W/4sqQLyBnxtG074u
	XdSaeq+FWZ+0yu0iGQTxWyItCYB+aM3Me5k6NcB1WCxFUQ==
X-Google-Smtp-Source: AGHT+IFaUn9FlKna7lUxaaYjgUBZjL/UsUXC91d7yrrpq2Az6cyujMB9sV2nGW2h0aB7+bST1a06Qw==
X-Received: by 2002:a17:907:7fab:b0:ac7:18c9:2975 with SMTP id a640c23a62f3a-ad1e8d053b4mr311005066b.48.1746617921236;
        Wed, 07 May 2025 04:38:41 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2515sm900306566b.39.2025.05.07.04.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 04:38:40 -0700 (PDT)
Message-ID: <b825ab7e-dbf6-4dcc-a35b-3fef0f0c4969@gmail.com>
Date: Wed, 7 May 2025 14:38:36 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/25 2:22 PM, Dave Stevenson wrote:
> Hi Jakub and Cosmin
> 
> On Tue, 6 May 2025 at 19:34, Jakub Kostiw <jakub.kostiw@videtronic.com> wrote:
>>
>> Hi Cosmin
>>
>> Awesome work. The initiative to establish a common framework for GMSL
>> devices is a great idea.
>>
>> I believe that we have found few bugs:
>>
>>> +#define MAX9296A_BACKTOP22(x)                        (0x31d * (x) * 0x3)
>>
>> The first multiplication is wrong and should be replaced with addition:
>>
>> +#define MAX9296A_BACKTOP22(x)                  (0x31d + (x) * 0x3)
>>
>> The same goes for MAX96724 equivalent macro:
>>
>>> +#define MAX96724_BACKTOP22(x)                        (0x415 * (x) * 0x3)
>>
>> In MAX96714 driver there is an issue with setting up lane-polarities.
>>
>>> +static const struct max9296a_chip_info max96714_info = {
>>> +     .max_register = 0x5011,
>>> +     .set_pipe_stream_id = max96714_set_pipe_stream_id,
>>> +     .set_pipe_enable = max96714_set_pipe_enable,
>>> +     .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
>>> +     .phys_configs = {
>>> +             .num_configs = ARRAY_SIZE(max96714_phys_configs),
>>> +             .configs = max96714_phys_configs,
>>> +     },
>>> +     .polarity_on_physical_lanes = true,
>>> +     .supports_phy_log = true,
>>> +     .adjust_rlms = true,
>>> +     .num_pipes = 1,
>>> +     .pipe_hw_ids = { 1 },
>>> +     .num_phys = 1,
>>> +     .phy_hw_ids = { 1 },
>>> +     .num_links = 1,
>>> +};
>>
>> In order to make thing work we had to set
>>
>>> +     .polarity_on_physical_lanes = true,
>>
>> To false. So this field is either improperly set for MAX96714, or handling of this case is wrong:
>>
>>> +             if (priv->info->polarity_on_physical_lanes)
>>> +                     map = phy->mipi.data_lanes[i];
>>> +             else
>>> +                     map = i;
>>
>> Upon mentioned changes we have successfully tested two GMSL2
>> combinations on Raspberry 5 platform:
>>
>> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to
>> hardware limitations)
>>
>> 2. MAX96714 + MAX96717
> 
> Feel free to shout if you want help on the Pi side.
> 
> Pi5 should be able to extract multiple virtual channels to support
> several sensors simultaneously (up to 4 VC/DT combinations). It does
> need a rework so the CFE runs from memory rather than being fed data
> directly from the CSI-2 receiver, but I believe that is pencilled in
> as future work with libcamera already.
> 

Hi Dave, thanks for your input! I'm glad this is getting some traction.

I'm currently testing using Tomi's pyv4l2 tool, which already contains
RPi5 GMSL configs.

I've tested the multi-camera simultaneously streaming usecase already,
all is working well, and I was able to get 4 separate camera image
streams (or 2 image and 2 meta), streaming to the RPi5, and then to
a remote host (where debayer is feasible to do without the help of an
ISP).

Last time I tried libcamera it was not able to properly configure all
entities, so testing with just the mainline CFE using pyv4l2 makes it
much simpler, since we're only interested in getting our hardware
supported.

> Unless things have regressed, libcamera should report all connected
> sensors to SerDes setups, and set up Media Controller appropriately to
> use them one at a time. I know I've had that working with simple CSI-2
> multiplexers and thought I'd had it working with TI FPD-Link III
> SerDes (Arducam's IMX219 V3Link kit, modded to remove their MCU). I
> don't have any GMSL hardware to test with.
> 
> We're also fairly open to merging drivers and overlays for 3rd party
> hardware into the downstream Pi kernel. If they've been reviewed and
> merged upstream then that is the ideal, but if you're prepared to
> support them, then it saves the user the headache of having to build
> out-of-tree modules.
> 
> Cheers
>    Dave


