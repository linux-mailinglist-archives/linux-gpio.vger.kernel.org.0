Return-Path: <linux-gpio+bounces-34380-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI/+GOEVyml85AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34380-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:19:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD1355DC3
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 08:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04500300C930
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D153939BD;
	Mon, 30 Mar 2026 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnnrS6EF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5F3306B05
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 06:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774851497; cv=none; b=mCNkGg63DF68TlYTwAUvgwrHFnBpA6Pq3SNONFYmVec9dUIIUS8Blz7RbwFsCd3UEMF1kOO8gyUEQUvepKvFiRnwrkJZfhO7GxUHPKwDlaC2Agf/2C4t5mDRymJRzAe9FBo9erXbAbnVeujuo1Sh2+ZlCkg2ZLtn6y5Y9FEl5s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774851497; c=relaxed/simple;
	bh=iFF4L6fSz2TWlM/UUZTLqalbCHPU2Kl+7JOPCGns9Yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEJcr7cTvlsinhhpgr3V9zJ9K+nhstMGhjrspeapHyAoxZOAHp+mIBjmPqgikyEOMwpz6yg5DF4XdR3KHUk64tmKP6CxsYodJnATjwQ5dIf1EvULV6g/+a2O3qVdx4lnws21SkPLizU8iPRGO9nUUnHX7AeWsThcZh0loi989sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnnrS6EF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso48334615e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774851493; x=1775456293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yuE0HkRfBycim9wJKOaxqJPmUNYpM5vPakvE5AaVPg8=;
        b=bnnrS6EFStcH+hUfOGlMWa/ESeI4JOxcbBpMzNXGzBRr2SPe9Il24D2rHUpQsE2AJK
         m0z9bFkBN+GICtXwC2J/t1yMkkQkAI8UcZFg0rTfBz5StaWR17dtSEKLuKudnjZS/ASy
         W5bmDX5Xpas2ZxEZpW7hVkvlW8IGk/C0OmYaLrTNOQNJme4U3RH+mAXgfvHxRyQxfso/
         TF70fbbJ5qXazys0Gvj/YRrG9TcIK0pRwPYaMcDQ7+5hdtVNfBACdjFplIbaT3rNrlT3
         9aNhK1IcqxP9wFa45usc4BaHTw6A9uC4ahaIx7PtLIOx7D2LsWdYlokiC11O3l2b+aMc
         QjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851493; x=1775456293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuE0HkRfBycim9wJKOaxqJPmUNYpM5vPakvE5AaVPg8=;
        b=A4brtb9g60UpBV/KfG+SH7y6yd6+V+mxrlFLIiz0laUuhKncfGNomp/q1hXncLLT5T
         Dkuqu/v8gFgPEEkwwUFaL+GEETHZqPmcbNglQPKyr67yXHIy3Pzfj68TrnkbzBAMT7x3
         tSSTb3En4R1mY61DP0tFgaqlJ2yu4Iq/7HzENH2qcGJKC3fwGwUR8dhS8Z4oyaICCjnp
         G2/iFrGZ8LhnEQi3tJAKKmaKanaqoFIw918A2ADUISprbIXvf5frT1Xg4jGUywLFxHje
         qJA1vuQEqtJpLNup+oIrhyoudrDHGXktxbjcT3ZUAUjPvJfHFaQLbc4rfb2EHOLtfA2I
         rEGw==
X-Forwarded-Encrypted: i=1; AJvYcCWTTXL6+hCTS0So61g2wdQWeWZcoe2ewWlZ9nWzdKANRcHaD3mUFrbyjx5ZXtY3iWU2myMYgVVWLOBx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Q5eXLYCibuTcBFyE0rlMwHmlog2Ex3/h77hgkTltTSU7cjQH
	SqIRmY9fNRLeMYG3oFaZAjp9acYATfupX/ll6Q/eja1NroI/sOPUqcEH
X-Gm-Gg: ATEYQzw/Oob+AjloqwFA58kUorazmRhwjXlDDC61MxYIo08IVvB/V+tUu1Jf7afml0f
	covHaEomgTfxb0JGVzNE4PI8pDR2L+UqKRp70JLRjqPj7zofmHg5vswgTL/v/DhYe0wOkjCiJ8/
	4NeTZBmOVbW7TTczd1kUKlkl1x4HbHMcOLB/zjrd98NVKp1u+uOTUwy5Yzefc3eQXtfV9fiO9XZ
	zru6pvCCCzaMU30I2RBMi5etxPogH5qKZ6ATpezwn1WAuvSFJOv4a5x1F4vcafuCg8vpwZbJMti
	E+JGMeIcpAK1kETGqOt0dIAbEFIZQIU2SCRAX8BjmWgHzC6LlEG607bryjKffUt+rtSRhsY6fne
	7DzBhJMKrhF0t+iPbE2poKsYCiYV8pvDDEK67Ar0k4oegTQGR5dcF9Tb9VNctMqWjKN2uxthnpZ
	fy+a+RDs6yWu1MOfqltOZI91brYW/XaBccwhVmT7c=
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-48727d67a21mr177769405e9.1.1774851492529;
        Sun, 29 Mar 2026 23:18:12 -0700 (PDT)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm450247125e9.11.2026.03.29.23.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:18:11 -0700 (PDT)
Message-ID: <dd858ec6-7621-45d6-9328-b5b03a4d0cec@gmail.com>
Date: Mon, 30 Mar 2026 10:15:43 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34380-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,vger.kernel.org,lists.linux.dev,avnet.eu,gmail.com,amazon.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitrutzceclan@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0BD1355DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/26 9:58 AM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Wed, Mar 11, 2026 at 09:17:12AM +0200, Dumitru Ceclan via B4 Relay wrote:

...

> 
> ...
> 
>> The following v4l2-compliance test still fails:
>>                 fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>>                 fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
> 
> Could you post the full report here, please?
> 
v4l2-compliance 1.33.0-5455, 64 bits, 64-bit time_t
v4l2-compliance SHA: 95ad25f6a77a 2026-03-17 13:08:36

Compliance test for rp1-cfe device /dev/media0:

Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 13 Interfaces: 13 Pads: 29 Links: 28
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for rp1-cfe device /dev/media0: 8, Succeeded: 8, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video0:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00001
		Video Capture
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000021
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001f (31)
	Name             : rp1-cfe-csi2-ch0
	Function         : V4L2 I/O
	Pad 0x01000020   : 0: Sink, Must Connect
	  Link 0x02000041: from remote pad 0x1000003 of entity 'csi2' (Video
Interface Bridge): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video0: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video1:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00001
		Video Capture
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000025
	Type             : V4L Video
Entity Info:
	ID               : 0x00000023 (35)
	Name             : rp1-cfe-csi2-ch1
	Function         : V4L2 I/O
	Pad 0x01000024   : 0: Sink, Must Connect
	  Link 0x02000045: from remote pad 0x1000004 of entity 'csi2' (Video
Interface Bridge): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video1: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video2:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00001
		Video Capture
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000029
	Type             : V4L Video
Entity Info:
	ID               : 0x00000027 (39)
	Name             : rp1-cfe-csi2-ch2
	Function         : V4L2 I/O
	Pad 0x01000028   : 0: Sink, Must Connect
	  Link 0x02000049: from remote pad 0x1000005 of entity 'csi2' (Video
Interface Bridge): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video2: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video3:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00001
		Video Capture
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x0300002d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002b (43)
	Name             : rp1-cfe-csi2-ch3
	Function         : V4L2 I/O
	Pad 0x0100002c   : 0: Sink, Must Connect
	  Link 0x0200004d: from remote pad 0x1000006 of entity 'csi2' (Video
Interface Bridge): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video3: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video4:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000031
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002f (47)
	Name             : rp1-cfe-fe-image0
	Function         : V4L2 I/O
	Pad 0x01000030   : 0: Sink, Must Connect
	  Link 0x02000051: from remote pad 0x100000a of entity 'pisp-fe' (Video
Scaler): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video4: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video5:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24200001
		Video Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000035
	Type             : V4L Video
Entity Info:
	ID               : 0x00000033 (51)
	Name             : rp1-cfe-fe-image1
	Function         : V4L2 I/O
	Pad 0x01000034   : 0: Sink, Must Connect
	  Link 0x02000053: from remote pad 0x100000b of entity 'pisp-fe' (Video
Scaler): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video5 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video5: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video6:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24a00000
		Metadata Capture
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000039
	Type             : V4L Video
Entity Info:
	ID               : 0x00000037 (55)
	Name             : rp1-cfe-fe-stats
	Function         : V4L2 I/O
	Pad 0x01000038   : 0: Sink, Must Connect
	  Link 0x02000055: from remote pad 0x100000c of entity 'pisp-fe' (Video
Scaler): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video6 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video6: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video7:

Driver Info:
	Driver name      : rp1-cfe
	Card type        : rp1-cfe
	Bus info         : platform:1f00110000.csi
	Driver version   : 6.18.0
	Capabilities     : 0xaca00001
		Video Capture
		Metadata Capture
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x2c200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x0300003d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000003b (59)
	Name             : rp1-cfe-fe-config
	Function         : V4L2 I/O
	Pad 0x0100003c   : 0: Source, Must Connect
	  Link 0x02000057: to remote pad 0x1000009 of entity 'pisp-fe' (Video
Scaler): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video7 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 1 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Output 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Output 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Output 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Output 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rp1-cfe device /dev/video7: 48, Succeeded: 48, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000059
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : csi2
	Function         : Video Interface Bridge
	Pad 0x01000002   : 0: Sink
	  Link 0x0200003f: from remote pad 0x1000010 of entity 'max9296a
6-0048' (Video Interface Bridge): Data, Enabled, Immutable
	Pad 0x01000003   : 1: Source
	  Link 0x02000041: to remote pad 0x1000020 of entity 'rp1-cfe-csi2-ch0'
(V4L2 I/O): Data, Enabled
	  Link 0x02000043: to remote pad 0x1000008 of entity 'pisp-fe' (Video
Scaler): Data
	Pad 0x01000004   : 2: Source
	  Link 0x02000045: to remote pad 0x1000024 of entity 'rp1-cfe-csi2-ch1'
(V4L2 I/O): Data
	  Link 0x02000047: to remote pad 0x1000008 of entity 'pisp-fe' (Video
Scaler): Data
	Pad 0x01000005   : 3: Source
	  Link 0x02000049: to remote pad 0x1000028 of entity 'rp1-cfe-csi2-ch2'
(V4L2 I/O): Data
	  Link 0x0200004b: to remote pad 0x1000008 of entity 'pisp-fe' (Video
Scaler): Data
	Pad 0x01000006   : 4: Source
	  Link 0x0200004d: to remote pad 0x100002c of entity 'rp1-cfe-csi2-ch3'
(V4L2 I/O): Data
	  Link 0x0200004f: to remote pad 0x1000008 of entity 'pisp-fe' (Video
Scaler): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):

Sub-Device ioctls (Source Pad 3):

Sub-Device ioctls (Source Pad 4):

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for rp1-cfe device /dev/v4l-subdev0: 63, Succeeded: 63, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev1:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x0300005b
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000007 (7)
	Name             : pisp-fe
	Function         : Video Scaler
	Pad 0x01000008   : 0: Sink, Must Connect
	  Link 0x02000043: from remote pad 0x1000003 of entity 'csi2' (Video
Interface Bridge): Data
	  Link 0x02000047: from remote pad 0x1000004 of entity 'csi2' (Video
Interface Bridge): Data
	  Link 0x0200004b: from remote pad 0x1000005 of entity 'csi2' (Video
Interface Bridge): Data
	  Link 0x0200004f: from remote pad 0x1000006 of entity 'csi2' (Video
Interface Bridge): Data
	Pad 0x01000009   : 1: Sink
	  Link 0x02000057: from remote pad 0x100003c of entity
'rp1-cfe-fe-config' (V4L2 I/O): Data
	Pad 0x0100000a   : 2: Source
	  Link 0x02000051: to remote pad 0x1000030 of entity
'rp1-cfe-fe-image0' (V4L2 I/O): Data
	Pad 0x0100000b   : 3: Source
	  Link 0x02000053: to remote pad 0x1000034 of entity
'rp1-cfe-fe-image1' (V4L2 I/O): Data
	Pad 0x0100000c   : 4: Source
	  Link 0x02000055: to remote pad 0x1000038 of entity 'rp1-cfe-fe-stats'
(V4L2 I/O): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev1 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for rp1-cfe device /dev/v4l-subdev1: 82, Succeeded: 82, Failed: 0,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev2:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x0300005d
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000000d (13)
	Name             : max9296a 6-0048
	Function         : Video Interface Bridge
	Pad 0x0100000e   : 0: Sink
	  Link 0x02000017: from remote pad 0x1000015 of entity 'max96717
13-0040' (Video Interface Bridge): Data, Enabled, Immutable
	Pad 0x0100000f   : 1: Sink
	Pad 0x01000010   : 2: Source
	  Link 0x0200003f: to remote pad 0x1000002 of entity 'csi2' (Video
Interface Bridge): Data, Enabled, Immutable
	Pad 0x01000011   : 3: Source
	Pad 0x01000012   : 4: Sink, 00000008

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev2 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(448): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(448): s_fmt.format.code == ~0U
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(302): node->enum_frame_interval_pad !=
(int)pad
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Sink Pad 1):

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(302): node->enum_frame_interval_pad !=
(int)pad
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Source Pad 3):

Sub-Device ioctls (Sink Pad 4):

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for rp1-cfe device /dev/v4l-subdev2: 63, Succeeded: 57, Failed: 6,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev3:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x0300005f
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000013 (19)
	Name             : max96717 13-0040
	Function         : Video Interface Bridge
	Pad 0x01000014   : 0: Sink
	  Link 0x0200001d: from remote pad 0x100001a of entity 'imx219 14-0010'
(Camera Sensor): Data, Enabled, Immutable
	Pad 0x01000015   : 1: Source
	  Link 0x02000017: to remote pad 0x100000e of entity 'max9296a 6-0048'
(Video Interface Bridge): Data, Enabled, Immutable
	Pad 0x01000016   : 2: Sink, 00000008

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev3 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(448): s_fmt.format.code == ~0U
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(448): s_fmt.format.code == ~0U
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(302): node->enum_frame_interval_pad !=
(int)pad
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
(Not Supported)
		fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
		fail: v4l2-test-subdevs.cpp(302): node->enum_frame_interval_pad !=
(int)pad
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Sink Pad 2):

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for rp1-cfe device /dev/v4l-subdev3: 63, Succeeded: 57, Failed: 6,
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev4:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : rp1-cfe
	Model            : rp1-cfe
	Serial           :
	Bus info         : platform:1f00110000.csi
	Media version    : 6.18.0
	Hardware revision: 0x00114666 (1132134)
	Driver version   : 6.18.0
Interface Info:
	ID               : 0x03000061
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000019 (25)
	Name             : imx219 14-0010
	Function         : Camera Sensor
	Pad 0x0100001a   : 0: Source
	  Link 0x0200001d: to remote pad 0x1000014 of entity 'max96717 13-0040'
(Video Interface Bridge): Data, Enabled, Immutable
	Pad 0x0100001b   : 1: Sink, 00000008
	Pad 0x0100001c   : 2: Sink, 00000008

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev4 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
		fail: v4l2-test-subdevs.cpp(631): route->flags & ~all_route_flags_mask
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL
		fail: v4l2-test-subdevs.cpp(631): route->flags & ~all_route_flags_mask
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is
supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Try Stream 1
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is
supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
	Active Stream 1
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is
supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is
supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 20 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for rp1-cfe device /dev/v4l-subdev4: 77, Succeeded: 75, Failed: 2,
Warnings: 4

Grand Total for rp1-cfe device /dev/media0: 740, Succeeded: 726, Failed:
14, Warnings: 4

