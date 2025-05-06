Return-Path: <linux-gpio+bounces-19701-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244DAACDA7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 21:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F22E50491D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 19:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3B312CD8B;
	Tue,  6 May 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QykOJBJ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375724B28;
	Tue,  6 May 2025 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558116; cv=none; b=deouplL8/EA9lwiw/NqwXNOfgfHK4oNFSPmwjk8PHLV229JrNrMewUDF85l6vpk01jhanJHOQZQc88xSw8zaFRJIKY7n0bnU+PWpKXthZwmX1M/DXf9YeONElO2MiZwXds+fabYkFc25dspKbu5ipYKRk00Um7mL/NoaF5b2kvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558116; c=relaxed/simple;
	bh=VhezuHT/cXWGlna450cAfGgZoaiiSyYXiqcDWVWAW1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVn3fQ9nv2a3xZrwLIxoojE6jaum+amFaXMCm/2tzJLUnAYXx3mp+nAD1XazBXgy4ZONMaWkekHcTkqXm3DhLmja1hE75SCK/EL0pjXfe5GJmpts415lgvF2lT4zDLBtzWs7Z405f7q0nVFCczoYaN4lb8Yy+OU90/TKfwG4OYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QykOJBJ2; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acec5b99052so1206188966b.1;
        Tue, 06 May 2025 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746558112; x=1747162912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=;
        b=QykOJBJ2GaB0nXPSRe4sK6hio8dBnRVtoUkGko6YCbz72Z7saNTRGdOrmkED13DAzb
         A3GsUucC4/WK35N2o2HgO3xn/HLE68eQkiux/RpeEgyM/xAIIGbCzMgf2oWsXRELD8aR
         /ZV0sE15hd/N9WwWXhJu0izQogvdZcxrk+6WwgVomy9L8p84kLxGfSPIFMIw2hDRiESE
         2I7tryHtcH9oWQGvlZCLdL0fSWKMWDHGz6h++0/vYQp6kkqeHlhwOWQh/X5Rq2uOBXQo
         KYFs3Gv8iKW+Hd0XQzZE4qJZ9sXms7Hi6uFr5VvgXOJi5IJDYZoTE+XSnYqrX0v9cna+
         OnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746558112; x=1747162912;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=;
        b=dilFAbFBBx99fXOXy3DNZSEGndkUIHuXW8FvL2zpYIO/G7GerjYZm7d69zWbmnIN6h
         OOXH3Exfs683kfq6ZbQBNAPBid8bXO1VGbACButjPs/ae0vR7n0evBtBCe4z5gllWmTL
         g9a6gPQepNWXitMJDm5kw3DJK3REBUJQt2E6mUGgqAG+WP9A47ozfaF9w0/i68utKatd
         wft5uJ9RIBOIHeQKIPph3m61K0JcJSw/He7/d1JJhEkHCii9R5RA90AyyXfOtnSAWy3D
         j0x9nEI9vmYuZvgU037/vxChP6KjnruftxZp5RfD/eNCLL0F4xZOSpIe0AAGXWsy1AGv
         jwEA==
X-Forwarded-Encrypted: i=1; AJvYcCUwFj7w155dtbiR0+achlz4Z5T9JJ09mGFg97GTsH539BGkZWsfY04YbVtw4InHiYq5IxUryyPx6HsCG0oW@vger.kernel.org, AJvYcCVdS635HE9p9rqw9CGSoL3JMcvo6Q39U8xdgYgpMtxcZ21WpO2Tu4YbY6WuvvitZRnN3GPXuFvZeepJaMA=@vger.kernel.org, AJvYcCVvILn+kpjRLFA2h823CBmk28hnaObR9ZKY4gzu6IRUKl6YlwFalv/b5V+vl1MOZmHl5UmBVCZNz+7o5g==@vger.kernel.org, AJvYcCWFGScgbTYqtIprMplTEoe5k/19psXlpbWX6PW2gV6p5IjrZ/BRJ8ctYf2sAmwMR13iMx0HrS5o0bSu@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaIwdabfvmkRNewFhTxwjx+LbV6MenP1bXYU3YNPywkzcnZdk
	fqDomlU2OXkCSWgGS3Y/NPUWYkmHF+RhP9+LLr1cyevoEXsshi/U
X-Gm-Gg: ASbGnctiurxU8uDgjSJo4U0cGzfmYb5B1o32wlxBlfQpEWHxnfRzsShWFpWzuS5DCGr
	imZGZGOn3pJ1mCBFmr39tnHay58HK2KvTSWWlR62hMPMJ9TKQLqX5Ab+1TWcX2Ns5/Y0Ju/oePo
	TJ+X4o9zTG8wRyMcdp4/N0b63LwIyuGiRUERsYJJ7ND2NOnGo8co+29oD7iFvGg4YYAualt4f8F
	Y04vOhR/5ixlO8Vct4cEjf2Fkwj1F4l8SlGTn2XCFZK3kZF4tpplz1hi8IXh/HlZ3MHzI5Bu9Fx
	7EgMeFRvs0OV4zbLeRQVrm5bj9i6JluTAi4b8zphSQxS9w==
X-Google-Smtp-Source: AGHT+IFWEXs3lgGVsw8JtDGd7ANyYp0zdsacD9hO6mvpw5fW/FuafssUE5pgzZvlYTNbTtqLhfLFDw==
X-Received: by 2002:a17:907:1b05:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1e8c662f9mr60826966b.33.1746558112095;
        Tue, 06 May 2025 12:01:52 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895087d1sm752900066b.128.2025.05.06.12.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:01:51 -0700 (PDT)
Message-ID: <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
Date: Tue, 6 May 2025 22:01:46 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
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
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/6/25 9:33 PM, Jakub Kostiw wrote:
> Hi Cosmin
> 
> Awesome work. The initiative to establish a common framework for GMSL 
> devices is a great idea.
> 

Hi! Thanks for the feedback.

> I believe that we have found few bugs:
> 
>> +#define MAX9296A_BACKTOP22(x)            (0x31d * (x) * 0x3)
> 
> The first multiplication is wrong and should be replaced with addition:
> 
> +#define MAX9296A_BACKTOP22(x)            (0x31d + (x) * 0x3)
> 

I'm aware of this issue and had it fixed locally, just haven't submitted
a new version yet.

> The same goes for MAX96724 equivalent macro:
> 
>> +#define MAX96724_BACKTOP22(x)            (0x415 * (x) * 0x3)
> 

Although I haven't noticed that it applied to MAX96724 too, thanks.

> In MAX96714 driver there is an issue with setting up lane-polarities.
> 
>> +static const struct max9296a_chip_info max96714_info = {
>> +    .max_register = 0x5011,
>> +    .set_pipe_stream_id = max96714_set_pipe_stream_id,
>> +    .set_pipe_enable = max96714_set_pipe_enable,
>> +    .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
>> +    .phys_configs = {
>> +        .num_configs = ARRAY_SIZE(max96714_phys_configs),
>> +        .configs = max96714_phys_configs,
>> +    },
>> +    .polarity_on_physical_lanes = true,
>> +    .supports_phy_log = true,
>> +    .adjust_rlms = true,
>> +    .num_pipes = 1,
>> +    .pipe_hw_ids = { 1 },
>> +    .num_phys = 1,
>> +    .phy_hw_ids = { 1 },
>> +    .num_links = 1,
>> +};
> 
> In order to make thing work we had to set
> 
>> +    .polarity_on_physical_lanes = true,
> 
> To false. So this field is either improperly set for MAX96714, or 
> handling of this case is wrong:
> 
>> +        if (priv->info->polarity_on_physical_lanes)
>> +            map = phy->mipi.data_lanes[i];
>> +        else
>> +            map = i;
> 

MAX96714 has different value meanings for the polarity register
(compared to MAX9296A). On MAX96714, the bits represent the
polarity of the hardware lane (not taking mapping into account).
On MAX9296A, mapping is taken into account by hardware, so
the polarity can be retrieved directly. See the comments surrounding
that piece of code. It's entirely possible that I was wrong when
writing this code, but this was cross-checked with the datasheet
and the GMSL SerDes GUI. It's not out of the question that any of
these could be wrong.

Are you setting a specific polarity on the lanes? I've validated
MAX96714 (after the upstream submission) myself and it works.

> Upon mentioned changes we have successfully tested two GMSL2 
> combinations on Raspberry 5 platform:
> 
> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to 
> hardware limitations)
> 
> 2. MAX96714 + MAX96717
> 
> We have also been wondering about these registers:
> 
>> +#define MAX9296A_DPLL_0(x)            (0x1c00 + ((x) == 0 ? 1 : 2) * 
>> 0x100)
>> +#define MAX96724_DPLL_0(x)            (0x1c00 + (x) * 0x100)
> 
> There are writes to these addresses but we could not find any reference 
> to these in either MAX96714 or MAX96724 datasheets.
> 

These registers are not mentioned in the datasheet of MAX96714 or
MAX96724, as they're considered "hidden". You can look at MAX96716A
datasheet for a description.

> Are You willing to add support for mapping MIPI-CSI2 lanes? This is a 
> very convenient feature which comes in handy during HW design.
> 

This should already be implemented by using different numbers in
data-lanes property in devicetree.


