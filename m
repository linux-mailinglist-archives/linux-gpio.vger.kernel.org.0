Return-Path: <linux-gpio+bounces-25566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF8B4349E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 09:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39403A88B5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199DF2BE020;
	Thu,  4 Sep 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mui99ZOW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59A3FF1;
	Thu,  4 Sep 2025 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972355; cv=none; b=kNPj+RrB+9X6wy9Udvk3hpgEgTwBcwUPvta82MSYS7RiWIzqPP9At0any6GzvLVmfJAgPtByVQpabOiDW0fMjpkX/5QUKbgzb1DNaGjfYNyWcLOivRRhMyROUUHU5dqAQmAT0Shdag1OQkBetVXXlN6iinXV3wMY+fzi+VCRASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972355; c=relaxed/simple;
	bh=21orN1VE+5PgZCwKMsPhR9fn0eQfFMEhZFOeWOXmGSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oay3rjGOow1DMf0DFMYJ1/Mrr1O2ltbeZ2o+gHgcqLjkpPQtuRJbNKF2TpywkhxPsnMS4IazIv84lgI49IJS/ItPdNrCKww0TgFryqomQHMawJt2xR7MvgRwGhUM9VE/XdxcQtiY/rjwhc08MW2fZjYa991Y2p1eer63w1NPw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mui99ZOW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45cb659e858so5657615e9.2;
        Thu, 04 Sep 2025 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756972350; x=1757577150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoP3x+km9iuh1GfpW6tCeTJF+cQEta5f+M+iSTJwmu8=;
        b=Mui99ZOWo44sy+n/ppJtLIb/Yi1ppMT7VySunE/+CjGm5crjxnadBo8CHnvyUm6vHg
         Ovrr6lQV2GYtglndBpDciPLjvBmWLWNWbeCXsJZcubQfysp99jq9CLJnhDzMYyeadAjv
         irQGGTU9laj+he6airl7gxtgQSsHIm92FEjPr7jfrsKmJcb3lD7NXwIOLYtjLhPOPU5B
         AyhDQCsIaTE/ou7L/X9dv51fCd1Vhutn6sJmgosTByI+H2GKUSwZcbvmNWHo2+QFrRxM
         LPFrr1jrdP8a2u7/uJCQ509buHgOSPAAWd4BtLJ1L94H8FEHLI6sU2QOqlIh4wYcjDUI
         54fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972350; x=1757577150;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoP3x+km9iuh1GfpW6tCeTJF+cQEta5f+M+iSTJwmu8=;
        b=iG0Aa9VvirShlaqoAjkCXkHk4wxsydWnnnJLYHi9BKd2OCUpWO/VgVbTyDlx23w1G9
         2J2ZIND+0bTUhogp0Dq/BtdibXttQ0YiGVh1opBEQPdeJqGvC+ER6fOBxt7aTNizIt2s
         c2xJqT6nIh7x4Jl+35SM6ZKIVbF1RuCeU8T37biAm5/g6ZqOddNz+KITdQ/wu5Quxh5n
         5SO88QfLxL1a6kuNtNzekQqxzJ//J/tqSV5dpWAJ8bbtFb9FARXbq0gXZOHsnO+n6Atd
         DPXv6UtgkUvJVE/4Bagl26rTavWU12p63rLbfCgmP1tUGWMcqIRrlALsbWvL2Aam0KCT
         gInw==
X-Forwarded-Encrypted: i=1; AJvYcCUzyevLHCdJmj13bB6Q7H3qFX20uM/iGO29Zg0foicPfiD57qh3Mvf8HyiWwRdfxin9xiMgHMnQo0Mj@vger.kernel.org, AJvYcCVNLjiex9kdNV4littIH53qeneThEnyyoBJ4aUbtwB0JjC0zt516Phwt293w6y/nHJsP6D1QoT4N/Z4Xw==@vger.kernel.org, AJvYcCVQdoFNkgyYiriLXGQvuLkDW0EklN+Yj8JUERDvxjhGIYIbediS24wG+2E1UhX5+azputMh3IdM/ovCLIE=@vger.kernel.org, AJvYcCW/Jrv3PLoOzwNNTjlMpBeWMAoVMzEdavHgdw1kHCvL01v3RsVv06310XEy03PwvMOrKB3vqOCPLhs8aeTY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1prt/KUZpoOCibfK/Q9LzEc5Cgiv9pVPRLP9cYKeJGdOURty
	Ok9lIl0hPiFn5TcPlXVhZQhAM4HiT5bA1CFzObYPB8vyPY+T8o2Y0fNe
X-Gm-Gg: ASbGncum/dcMpGMxAoIVBQqsj/nw2oxJRmlJowp18ZEEPEVVCpKKZv9LGOaW/HlE+fi
	FKNNX0CU941M9qB+aE05f2R7X1b0y9QWeXoam8NuoOkfKP/OAl6FkPNgfSFBpAr8H61r20pxgkD
	UjwAhU75+yxTVIFcWTqweatd9Pzv7uxh5sr3rLnDil2KnMY8NtQNAAn8DPyuhTw/jVztt56wJAq
	bbxUJQ8dXmqLvXYsQNjRWipOUNAxm7xCZhewABs7bf3dGheKbBSqhc7iqxt9wMhX+5y8vdSGNQu
	cr7FToZKK6EhCOTsDpszLNFBjZT4uJbnEXAFK9OVIKP3cLpww5ykRqMvFOYlsNad5Ird3avaVPW
	Fv8YpM44bGi7zdIv183TnUICHAOJg7aCXJMqQcRZ+htMLVB3lB0Xx
X-Google-Smtp-Source: AGHT+IFZw/POjIQ7atdb2zR+33+SXgwBFqNu/K4k01/GuEu/DaKGJVCfFEgX+8Abx24IZyoMtKmjpA==
X-Received: by 2002:a05:600c:4705:b0:45b:74fc:d6ec with SMTP id 5b1f17b1804b1-45b8553f1e8mr163407165e9.8.1756972348871;
        Thu, 04 Sep 2025 00:52:28 -0700 (PDT)
Received: from [192.168.0.100] ([188.24.124.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm273380085e9.12.2025.09.04.00.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:52:28 -0700 (PDT)
Message-ID: <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
Date: Thu, 4 Sep 2025 10:52:09 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari.

I recently left Analog Devices but I will continue to try upstreaming
this driver. After the upstreaming is done we can switch the
maintainer status to someone else.

Here's the output for the commands you asked, provided by my
ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.

Do we need to fix anything based on the compliance tests?

media-ctl -p -d 3:

Media controller API version 6.13.7

Media device information
------------------------
driver          rp1-cfe
model           rp1-cfe
serial
bus info        platform:1f00110000.csi
hw revision     0x114666
driver version  6.13.7

Device topology
- entity 1: csi2 (5 pads, 9 links, 2 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev0
         routes:
                 0/0 -> 1/0 [ACTIVE]
                 0/1 -> 2/0 [ACTIVE]
         pad0: SINK
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                 [stream:1 fmt:SBGGR10_1X10/640x480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                 <- "max9296a 10-002a":3 [ENABLED,IMMUTABLE]
         pad1: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                 -> "rp1-cfe-csi2-ch0":0 [ENABLED]
                 -> "pisp-fe":0 []
         pad2: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                 -> "rp1-cfe-csi2-ch1":0 [ENABLED]
                 -> "pisp-fe":0 []
         pad3: SOURCE
                 -> "rp1-cfe-csi2-ch2":0 []
                 -> "pisp-fe":0 []
         pad4: SOURCE
                 -> "rp1-cfe-csi2-ch3":0 []
                 -> "pisp-fe":0 []

- entity 7: pisp-fe (5 pads, 8 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
         pad0: SINK,MUST_CONNECT
                 [stream:0 fmt:SBGGR16_1X16/1640x1232 field:none 
colorspace:raw]
                 <- "csi2":1 []
                 <- "csi2":2 []
                 <- "csi2":3 []
                 <- "csi2":4 []
         pad1: SINK
                 [stream:0 fmt:FIXED/632x1]
                 <- "rp1-cfe-fe-config":0 []
         pad2: SOURCE
                 [stream:0 fmt:SBGGR16_1X16/1640x1232 field:none 
colorspace:raw]
                 -> "rp1-cfe-fe-image0":0 []
         pad3: SOURCE
                 [stream:0 fmt:SBGGR16_1X16/1640x1232 field:none 
colorspace:raw]
                 -> "rp1-cfe-fe-image1":0 []
         pad4: SOURCE
                 [stream:0 fmt:FIXED/23200x1]
                 -> "rp1-cfe-fe-stats":0 []

- entity 13: max9296a 10-002a (5 pads, 3 links, 2 routes)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev2
         routes:
                 0/0 -> 3/0 [ACTIVE]
                 1/0 -> 3/1 [ACTIVE]
         pad0: SINK
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 <- "max96717 15-0040":1 [ENABLED,IMMUTABLE]
         pad1: SINK
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 <- "max96717 16-0040":1 [ENABLED,IMMUTABLE]
         pad2: SOURCE
         pad3: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 [stream:1 fmt:SBGGR10_1X10/640x480 field:none]
                 -> "csi2":0 [ENABLED,IMMUTABLE]
         pad4: SINK,0x8

- entity 19: max96717 15-0040 (3 pads, 2 links, 1 route)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev3
         routes:
                 0/0 -> 1/0 [ACTIVE]
         pad0: SINK
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 <- "imx219 17-0010":0 [ENABLED,IMMUTABLE]
         pad1: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 -> "max9296a 10-002a":0 [ENABLED,IMMUTABLE]
         pad2: SINK,0x8

- entity 25: max96717 16-0040 (3 pads, 2 links, 1 route)
              type V4L2 subdev subtype Unknown flags 0
              device node name /dev/v4l-subdev4
         routes:
                 0/0 -> 1/0 [ACTIVE]
         pad0: SINK
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 <- "imx219 18-0010":0 [ENABLED,IMMUTABLE]
         pad1: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none]
                 -> "max9296a 10-002a":1 [ENABLED,IMMUTABLE]
         pad2: SINK,0x8

- entity 31: imx219 17-0010 (3 pads, 1 link, 2 routes)
              type V4L2 subdev subtype Sensor flags 0
              device node name /dev/v4l-subdev5
         routes:
                 1/0 -> 0/0 [ACTIVE]
                 2/0 -> 0/1 [ACTIVE]
         pad0: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                  crop.bounds:(0,0)/640x480
                  crop:(0,0)/640x480]
                 [stream:1 fmt:META_10/640x2 field:none]
                 -> "max96717 15-0040":0 [ENABLED,IMMUTABLE]
         pad1: SINK,0x8
                 [stream:0 fmt:SRGGB10_1X10/3296x2480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                  crop.bounds:(8,8)/3280x2464
                  crop:(1008,760)/1280x960
                  compose:(0,0)/640x480]
         pad2: SINK,0x8
                 [stream:0 fmt:META_10/640x2 field:none]

- entity 37: imx219 18-0010 (3 pads, 1 link, 2 routes)
              type V4L2 subdev subtype Sensor flags 0
              device node name /dev/v4l-subdev6
         routes:
                 1/0 -> 0/0 [ACTIVE]
                 2/0 -> 0/1 [ACTIVE]
         pad0: SOURCE
                 [stream:0 fmt:SBGGR10_1X10/640x480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                  crop.bounds:(0,0)/640x480
                  crop:(0,0)/640x480]
                 [stream:1 fmt:META_10/640x2 field:none]
                 -> "max96717 16-0040":0 [ENABLED,IMMUTABLE]
         pad1: SINK,0x8
                 [stream:0 fmt:SRGGB10_1X10/3296x2480 field:none 
colorspace:raw xfer:none ycbcr:601 quantization:full-range
                  crop.bounds:(8,8)/3280x2464
                  crop:(1008,760)/1280x960
                  compose:(0,0)/640x480]
         pad2: SINK,0x8
                 [stream:0 fmt:META_10/640x2 field:none]

- entity 43: rp1-cfe-csi2-ch0 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video0
         pad0: SINK,MUST_CONNECT
                 <- "csi2":1 [ENABLED]

- entity 47: rp1-cfe-csi2-ch1 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video1
         pad0: SINK,MUST_CONNECT
                 <- "csi2":2 [ENABLED]

- entity 51: rp1-cfe-csi2-ch2 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video2
         pad0: SINK,MUST_CONNECT
                 <- "csi2":3 []

- entity 55: rp1-cfe-csi2-ch3 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video3
         pad0: SINK,MUST_CONNECT
                 <- "csi2":4 []

- entity 59: rp1-cfe-fe-image0 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video4
         pad0: SINK,MUST_CONNECT
                 <- "pisp-fe":2 []

- entity 63: rp1-cfe-fe-image1 (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video5
         pad0: SINK,MUST_CONNECT
                 <- "pisp-fe":3 []

- entity 67: rp1-cfe-fe-stats (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video6
         pad0: SINK,MUST_CONNECT
                 <- "pisp-fe":4 []

- entity 71: rp1-cfe-fe-config (1 pad, 1 link)
              type Node subtype V4L flags 0
              device node name /dev/video7
         pad0: SOURCE,MUST_CONNECT
                 -> "pisp-fe":1 []


media-ctl --print-dot -d 3

digraph board {
         rankdir=TB
         n00000001 [label="{{<port0> 0} | csi2\n/dev/v4l-subdev0 | 
{<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, 
style=filled, fillcolor=green]
         n00000001:port1 -> n0000002b
         n00000001:port1 -> n00000007:port0 [style=dashed]
         n00000001:port2 -> n0000002f
         n00000001:port2 -> n00000007:port0 [style=dashed]
         n00000001:port3 -> n00000033 [style=dashed]
         n00000001:port3 -> n00000007:port0 [style=dashed]
         n00000001:port4 -> n00000037 [style=dashed]
         n00000001:port4 -> n00000007:port0 [style=dashed]
         n00000007 [label="{{<port0> 0 | <port1> 1} | 
pisp-fe\n/dev/v4l-subdev1 | {<port2> 2 | <port3> 3 | <port4> 4}}", 
shape=Mrecord, style=filled, fillcolor=green]
         n00000007:port2 -> n0000003b [style=dashed]
         n00000007:port3 -> n0000003f [style=dashed]
         n00000007:port4 -> n00000043 [style=dashed]
         n0000000d [label="{{<port0> 0 | <port1> 1 | <port4> 4} | 
max9296a 10-002a\n/dev/v4l-subdev2 | {<port2> 2 | <port3> 3}}", 
shape=Mrecord, style=filled, fillcolor=green]
         n0000000d:port3 -> n00000001:port0 [style=bold]
         n00000013 [label="{{<port0> 0 | <port2> 2} | max96717 
15-0040\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, 
fillcolor=green]
         n00000013:port1 -> n0000000d:port0 [style=bold]
         n00000019 [label="{{<port0> 0 | <port2> 2} | max96717 
16-0040\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, 
fillcolor=green]
         n00000019:port1 -> n0000000d:port1 [style=bold]
         n0000001f [label="{{<port1> 1 | <port2> 2} | imx219 
17-0010\n/dev/v4l-subdev5 | {<port0> 0}}", shape=Mrecord, style=filled, 
fillcolor=green]
         n0000001f:port0 -> n00000013:port0 [style=bold]
         n00000025 [label="{{<port1> 1 | <port2> 2} | imx219 
18-0010\n/dev/v4l-subdev6 | {<port0> 0}}", shape=Mrecord, style=filled, 
fillcolor=green]
         n00000025:port0 -> n00000019:port0 [style=bold]
         n0000002b [label="rp1-cfe-csi2-ch0\n/dev/video0", shape=box, 
style=filled, fillcolor=yellow]
         n0000002f [label="rp1-cfe-csi2-ch1\n/dev/video1", shape=box, 
style=filled, fillcolor=yellow]
         n00000033 [label="rp1-cfe-csi2-ch2\n/dev/video2", shape=box, 
style=filled, fillcolor=yellow]
         n00000037 [label="rp1-cfe-csi2-ch3\n/dev/video3", shape=box, 
style=filled, fillcolor=yellow]
         n0000003b [label="rp1-cfe-fe-image0\n/dev/video4", shape=box, 
style=filled, fillcolor=yellow]
         n0000003f [label="rp1-cfe-fe-image1\n/dev/video5", shape=box, 
style=filled, fillcolor=yellow]
         n00000043 [label="rp1-cfe-fe-stats\n/dev/video6", shape=box, 
style=filled, fillcolor=yellow]
         n00000047 [label="rp1-cfe-fe-config\n/dev/video7", shape=box, 
style=filled, fillcolor=yellow]
         n00000047 -> n00000007:port1 [style=dashed]
}


v4l2-compliance -m /dev/media3
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for rp1-cfe device /dev/media3:

Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7

Required ioctls:
         test MEDIA_IOC_DEVICE_INFO: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/media3 open: OK
         test MEDIA_IOC_DEVICE_INFO: OK
         test for unlimited opens: OK

Media Controller ioctls:
         test MEDIA_IOC_G_TOPOLOGY: OK
         Entities: 15 Interfaces: 15 Pads: 35 Links: 32
         test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
         test MEDIA_IOC_SETUP_LINK: OK

Total for rp1-cfe device /dev/media3: 8, Succeeded: 8, Failed: 0, 
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/video0:

Driver Info:
         Driver name      : rp1-cfe
         Card type        : rp1-cfe
         Bus info         : platform:1f00110000.csi
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x0300002d
         Type             : V4L Video
Entity Info:
         ID               : 0x0000002b (43)
         Name             : rp1-cfe-csi2-ch0
         Function         : V4L2 I/O
         Pad 0x0100002c   : 0: Sink, Must Connect
           Link 0x0200004d: from remote pad 0x1000003 of entity 'csi2' 
(Video Interface Bridge): Data, Enabled

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000031
         Type             : V4L Video
Entity Info:
         ID               : 0x0000002f (47)
         Name             : rp1-cfe-csi2-ch1
         Function         : V4L2 I/O
         Pad 0x01000030   : 0: Sink, Must Connect
           Link 0x02000051: from remote pad 0x1000004 of entity 'csi2' 
(Video Interface Bridge): Data, Enabled

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000035
         Type             : V4L Video
Entity Info:
         ID               : 0x00000033 (51)
         Name             : rp1-cfe-csi2-ch2
         Function         : V4L2 I/O
         Pad 0x01000034   : 0: Sink, Must Connect
           Link 0x02000055: from remote pad 0x1000005 of entity 'csi2' 
(Video Interface Bridge): Data

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000039
         Type             : V4L Video
Entity Info:
         ID               : 0x00000037 (55)
         Name             : rp1-cfe-csi2-ch3
         Function         : V4L2 I/O
         Pad 0x01000038   : 0: Sink, Must Connect
           Link 0x02000059: from remote pad 0x1000006 of entity 'csi2' 
(Video Interface Bridge): Data

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x0300003d
         Type             : V4L Video
Entity Info:
         ID               : 0x0000003b (59)
         Name             : rp1-cfe-fe-image0
         Function         : V4L2 I/O
         Pad 0x0100003c   : 0: Sink, Must Connect
           Link 0x0200005d: from remote pad 0x100000a of entity 
'pisp-fe' (Video Scaler): Data

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000041
         Type             : V4L Video
Entity Info:
         ID               : 0x0000003f (63)
         Name             : rp1-cfe-fe-image1
         Function         : V4L2 I/O
         Pad 0x01000040   : 0: Sink, Must Connect
           Link 0x0200005f: from remote pad 0x100000b of entity 
'pisp-fe' (Video Scaler): Data

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000045
         Type             : V4L Video
Entity Info:
         ID               : 0x00000043 (67)
         Name             : rp1-cfe-fe-stats
         Function         : V4L2 I/O
         Pad 0x01000044   : 0: Sink, Must Connect
           Link 0x02000061: from remote pad 0x100000c of entity 
'pisp-fe' (Video Scaler): Data

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
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
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000049
         Type             : V4L Video
Entity Info:
         ID               : 0x00000047 (71)
         Name             : rp1-cfe-fe-config
         Function         : V4L2 I/O
         Pad 0x01000048   : 0: Source, Must Connect
           Link 0x02000063: to remote pad 0x1000009 of entity 'pisp-fe' 
(Video Scaler): Data

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
         test VIDIOC_DBG_G/S_REGISTER: OK
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
         Driver version   : 6.13.7
         Capabilities     : 0x00000002
                 Streams Support
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000065
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x00000001 (1)
         Name             : csi2
         Function         : Video Interface Bridge
         Pad 0x01000002   : 0: Sink
           Link 0x0200004b: from remote pad 0x1000011 of entity 
'max9296a 10-002a' (Video Interface Bridge): Data, Enabled, Immutable
         Pad 0x01000003   : 1: Source
           Link 0x0200004d: to remote pad 0x100002c of entity 
'rp1-cfe-csi2-ch0' (V4L2 I/O): Data, Enabled
           Link 0x0200004f: to remote pad 0x1000008 of entity 'pisp-fe' 
(Video Scaler): Data
         Pad 0x01000004   : 2: Source
           Link 0x02000051: to remote pad 0x1000030 of entity 
'rp1-cfe-csi2-ch1' (V4L2 I/O): Data, Enabled
           Link 0x02000053: to remote pad 0x1000008 of entity 'pisp-fe' 
(Video Scaler): Data
         Pad 0x01000005   : 3: Source
           Link 0x02000055: to remote pad 0x1000034 of entity 
'rp1-cfe-csi2-ch2' (V4L2 I/O): Data
           Link 0x02000057: to remote pad 0x1000008 of entity 'pisp-fe' 
(Video Scaler): Data
         Pad 0x01000006   : 4: Source
           Link 0x02000059: to remote pad 0x1000038 of entity 
'rp1-cfe-csi2-ch3' (V4L2 I/O): Data
           Link 0x0200005b: to remote pad 0x1000008 of entity 'pisp-fe' 
(Video Scaler): Data

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
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
         Active Stream 1
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
         Try Stream 0
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

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

Total for rp1-cfe device /dev/v4l-subdev0: 70, Succeeded: 70, Failed: 0, 
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev1:

Driver Info:
         Driver version   : 6.13.7
         Capabilities     : 0x00000000
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000067
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x00000007 (7)
         Name             : pisp-fe
         Function         : Video Scaler
         Pad 0x01000008   : 0: Sink, Must Connect
           Link 0x0200004f: from remote pad 0x1000003 of entity 'csi2' 
(Video Interface Bridge): Data
           Link 0x02000053: from remote pad 0x1000004 of entity 'csi2' 
(Video Interface Bridge): Data
           Link 0x02000057: from remote pad 0x1000005 of entity 'csi2' 
(Video Interface Bridge): Data
           Link 0x0200005b: from remote pad 0x1000006 of entity 'csi2' 
(Video Interface Bridge): Data
         Pad 0x01000009   : 1: Sink
           Link 0x02000063: from remote pad 0x1000048 of entity 
'rp1-cfe-fe-config' (V4L2 I/O): Data
         Pad 0x0100000a   : 2: Source
           Link 0x0200005d: to remote pad 0x100003c of entity 
'rp1-cfe-fe-image0' (V4L2 I/O): Data
         Pad 0x0100000b   : 3: Source
           Link 0x0200005f: to remote pad 0x1000040 of entity 
'rp1-cfe-fe-image1' (V4L2 I/O): Data
         Pad 0x0100000c   : 4: Source
           Link 0x02000061: to remote pad 0x1000044 of entity 
'rp1-cfe-fe-stats' (V4L2 I/O): Data

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
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
         Try Stream 0
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
         Try Stream 0
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
         Try Stream 0
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
         Try Stream 0
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
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

Total for rp1-cfe device /dev/v4l-subdev1: 81, Succeeded: 81, Failed: 0, 
Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev2:

Driver Info:
         Driver version   : 6.13.7
         Capabilities     : 0x00000002
                 Streams Support
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000069
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x0000000d (13)
         Name             : max9296a 10-002a
         Function         : Video Interface Bridge
         Pad 0x0100000e   : 0: Sink
           Link 0x02000017: from remote pad 0x1000015 of entity 
'max96717 15-0040' (Video Interface Bridge): Data, Enabled, Immutable
         Pad 0x0100000f   : 1: Sink
           Link 0x0200001d: from remote pad 0x100001b of entity 
'max96717 16-0040' (Video Interface Bridge): Data, Enabled, Immutable
         Pad 0x01000010   : 2: Source
         Pad 0x01000011   : 3: Source
           Link 0x0200004b: to remote pad 0x1000002 of entity 'csi2' 
(Video Interface Bridge): Data, Enabled, Immutable
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
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Sink Pad 1):
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Source Pad 2):

Sub-Device ioctls (Source Pad 3):
         Try Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL
         Active Stream 1
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

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

Total for rp1-cfe device /dev/v4l-subdev2: 70, Succeeded: 54, Failed: 
16, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev3:

Driver Info:
         Driver version   : 6.13.7
         Capabilities     : 0x00000002
                 Streams Support
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x0300006b
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x00000013 (19)
         Name             : max96717 15-0040
         Function         : Video Interface Bridge
         Pad 0x01000014   : 0: Sink
           Link 0x02000023: from remote pad 0x1000020 of entity 'imx219 
17-0010' (Camera Sensor): Data, Enabled, Immutable
         Pad 0x01000015   : 1: Source
           Link 0x02000017: to remote pad 0x100000e of entity 'max9296a 
10-002a' (Video Interface Bridge): Data, Enabled, Immutable
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
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Source Pad 1):
         Try Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
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

Total for rp1-cfe device /dev/v4l-subdev3: 62, Succeeded: 52, Failed: 
10, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev4:

Driver Info:
         Driver version   : 6.13.7
         Capabilities     : 0x00000002
                 Streams Support
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x0300006d
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x00000019 (25)
         Name             : max96717 16-0040
         Function         : Video Interface Bridge
         Pad 0x0100001a   : 0: Sink
           Link 0x02000029: from remote pad 0x1000026 of entity 'imx219 
18-0010' (Camera Sensor): Data, Enabled, Immutable
         Pad 0x0100001b   : 1: Source
           Link 0x0200001d: to remote pad 0x100000f of entity 'max9296a 
10-002a' (Video Interface Bridge): Data, Enabled, Immutable
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
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: FAIL

Sub-Device ioctls (Source Pad 1):
         Try Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Try 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
                 fail: v4l2-test-subdevs.cpp(228): doioctl(node, 
VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL, &fie) != ENOTTY
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL
                 fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || 
fmt.width > 65536
                 fail: v4l2-test-subdevs.cpp(418): 
checkMBusFrameFmt(node, fmt.format)
         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
                 fail: v4l2-test-subdevs.cpp(302): 
node->enum_frame_interval_pad != (int)pad
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

Total for rp1-cfe device /dev/v4l-subdev4: 62, Succeeded: 52, Failed: 
10, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev5:

Driver Info:
         Driver version   : 6.13.7
         Capabilities     : 0x00000002
                 Streams Support
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x0300006f
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x0000001f (31)
         Name             : imx219 17-0010
         Function         : Camera Sensor
         Pad 0x01000020   : 0: Source
           Link 0x02000023: to remote pad 0x1000014 of entity 'max96717 
15-0040' (Video Interface Bridge): Data, Enabled, Immutable
         Pad 0x01000021   : 1: Sink, 00000008
         Pad 0x01000022   : 2: Sink, 00000008

Required ioctls:
         test MC information (see 'Media Driver Info' above): OK
         test VIDIOC_SUDBEV_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/v4l-subdev5 open: OK
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
                 fail: v4l2-test-subdevs.cpp(631): route->flags & 
~all_route_flags_mask
         test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL
                 fail: v4l2-test-subdevs.cpp(631): route->flags & 
~all_route_flags_mask
         test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL

Sub-Device ioctls (Source Pad 0):
         Try Stream 0
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         Try Stream 1
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
         Active Stream 1
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
         Try Stream 0
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
         Try Stream 0
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
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

Total for rp1-cfe device /dev/v4l-subdev5: 76, Succeeded: 74, Failed: 2, 
Warnings: 4
--------------------------------------------------------------------------------
Compliance test for rp1-cfe device /dev/v4l-subdev6:

Driver Info:
         Driver version   : 6.13.7
         Capabilities     : 0x00000002
                 Streams Support
         Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
         Driver name      : rp1-cfe
         Model            : rp1-cfe
         Serial           :
         Bus info         : platform:1f00110000.csi
         Media version    : 6.13.7
         Hardware revision: 0x00114666 (1132134)
         Driver version   : 6.13.7
Interface Info:
         ID               : 0x03000071
         Type             : V4L Sub-Device
Entity Info:
         ID               : 0x00000025 (37)
         Name             : imx219 18-0010
         Function         : Camera Sensor
         Pad 0x01000026   : 0: Source
           Link 0x02000029: to remote pad 0x100001a of entity 'max96717 
16-0040' (Video Interface Bridge): Data, Enabled, Immutable
         Pad 0x01000027   : 1: Sink, 00000008
         Pad 0x01000028   : 2: Sink, 00000008

Required ioctls:
         test MC information (see 'Media Driver Info' above): OK
         test VIDIOC_SUDBEV_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/v4l-subdev6 open: OK
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
                 fail: v4l2-test-subdevs.cpp(631): route->flags & 
~all_route_flags_mask
         test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL
                 fail: v4l2-test-subdevs.cpp(631): route->flags & 
~all_route_flags_mask
         test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL

Sub-Device ioctls (Source Pad 0):
         Try Stream 0
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         Try Stream 1
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
         Active Stream 1
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
         Try Stream 0
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Active VIDIOC_SUBDEV_G/S_FMT: OK
                 warn: v4l2-test-subdevs.cpp(566): 
VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not 
VIDIOC_SUBDEV_S_SELECTION
         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
         test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
         Try Stream 0
         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
         test Try VIDIOC_SUBDEV_G/S_FMT: OK
         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
         Active Stream 0
         test Active 
VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
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

Total for rp1-cfe device /dev/v4l-subdev6: 76, Succeeded: 74, Failed: 2, 
Warnings: 4

Grand Total for rp1-cfe device /dev/media3: 889, Succeeded: 849, Failed: 
40, Warnings: 8

On 8/28/25 5:42 PM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> On Fri, Jul 18, 2025 at 06:24:36PM +0300, Cosmin Tanislav wrote:
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a
>> common framework that can be used to implement such GMSL chips, which
>> avoids code duplication while also adding support for previously
>> unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the
>> current mainline drivers, the choice was made here to add a totally new
>> set of drivers. The current drivers support only a small subset of the
>> possible features, and only a few devices, so the end result after
>> extending them would in any case be essentially fully rewritten, new
>> drivers.
>>
>> This series depends on support for internal pads, for which a patch has
>> been added.
> 
> Could you provide v4l2-compliance -m, media-ctl -p as well as media-ctl
> --print-dot output on this device, please?
> 


