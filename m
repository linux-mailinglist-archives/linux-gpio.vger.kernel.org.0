Return-Path: <linux-gpio+bounces-34526-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK/RM8SyzGkMVwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34526-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 07:53:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0D374F87
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 07:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 202C43017243
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 05:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A7A329C49;
	Wed,  1 Apr 2026 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HejP+3xA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D282FFDF8
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 05:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022785; cv=none; b=TmQ3FFe6JFRZgxUETk0flEBLquPLtYfam4hwgrHiBWr6bxB5Z4oY/TycsID/0hnhj/NpVttUc0MiWrw61veoOWvLLFOOF6wu1liYWwp0i/sDmriM9KBkSydr7reFEDysE8WI3Kv1RRa98WWse2lFrjKTPjfe9VFftt32HMDw8mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022785; c=relaxed/simple;
	bh=vn+Whyqndr9lPTR+5c+7GGHj6JO+k6GBr1ThCNEZSec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgrKwlaLKAQ4i/9g6MsAa5SzY9g/pQSIHK24fhaRLWmUiRbS6rjVFiuSF7n7wKFPxtGzfsdMqjBJfM88pFLDFkNNWMp7H6EM4SdNJ526+Z2h8+q9PdVHCffF9y9gevAUvEchmWR+rBCvww/vuXiTWQGFfr/5PhXbJYnQ7RJR9IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HejP+3xA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48374014a77so76367235e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 22:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775022783; x=1775627583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INcc211bG9FjWsZ9dybz2/l2jRpAaGE+SI/LHykHcTQ=;
        b=HejP+3xAkMpVkd3w72H84ARFeSnZUys4TU0wTI2asHqDbjLQv8Sl/Q0X6zW0PFgFcv
         +SGNYMCSM2h2h6QjWwYKqAz5oIZILR8nguy9LE4Hk3NMUzdUlxlIZC+xZd9nsXgNqQ1l
         r/vNTNLjSH4XRxs7rgMvQJAjp8SddCH+kW05pAqPBc4GEKK4JZBvTJzbV6U+qG3pdEtn
         9FtscbDlVH5WBsdUHOoZI8epL+AMEQr3oGmUN4vQXTfztpCtkMmUUkgAtkU24HyUQHS2
         B11o/dG2+TUMxszaD1mYGO+xPNZU7VoFUwFB1wY/zrtLTDFLZgpdVYgtJ60Bb14aO4F4
         uxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775022783; x=1775627583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INcc211bG9FjWsZ9dybz2/l2jRpAaGE+SI/LHykHcTQ=;
        b=hCww1aWDJN4Y5jMNqbQh0I4V5HZ2pDVMe/J/4JgAvrrSWubh1ubizVOiSM6dyPsUc9
         HcbxKVglZj3xxCIyPTevR3GxWHp9apbGToDshIGUywhdq7tV1x9rSXzd5WBVd8uQvVOk
         EtuyuWVw24OWEP85exTtWhuwnhaikn0WDnlpX7JMhETT/wci0vVIGDHz9xNzUjZfq8nC
         7kHZwTsw/ZGhThCwsZAiXCH/xTpM4UMk3plSWTNTieegZim0Z72gbTzrumQVtw4xa81g
         f6/c6Z0XeNLgvqBgPd/v314pNO8UiJQDt7vbdNVM+URh/gAkxiifV8D9/IjH4Nk7pme3
         y09w==
X-Forwarded-Encrypted: i=1; AJvYcCVACjWI+DLm7ldgGMeuP6ae2+OTwVc71A3Z2P0N2UUgKTUZRoTetrG1nqHueww3QnIqU7/kkJVc49dL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6q3xzI3vprog2ErXD3x4Sn/9h1BNH20v9PrE/18A+DsLQMuW6
	lWggz9Ce0O1O9aTTp1q9U3bBE1RWBJxkzNEYMkWrrgUEpMrrRgvsRrRD
X-Gm-Gg: ATEYQzwm42wTsCfUEOPM76j34X1tif/EGGE2MxP4HI2Itu+xIV7rJJ0D0RrI079pYe7
	P2zEZeIR4ysmBA994JE0nre7U7onQi5OSw7LuLJhbZ/vowUBnxAT7B0UHh3zIu85kYBQgOi3ggf
	O2Aht8+6WzFjSUV9YGdgHiD0aJAozCjsvUO75vtMnwsNC8wSTzY5y/hDKLpE+OSH3a6EM8XIB9a
	yYWTqgkh3PDkAwkD35FopmCUC+g9zj4zX8q9WbAFAoTH1T8N6yQGxqgCkQFayAqVx6NZQRDlqrg
	OYwbfA4idIwMIoy40FfUlJjqo7xD68JzjZ5VA4YJd2TS18jG/E32NfYUL4OzFj8WXTiXr+FNJrC
	wZA6lLHH+HXB+TJamoOc71WGlfgCqKZM1Rf2MXF/zfLhY09RNC5ECcMWVq2iJ2bkcuTz4XkLIh+
	rAqIHTf6AgM5kX6wCMUdqj68dvis3p
X-Received: by 2002:a05:600c:468b:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-4888356275bmr32683845e9.12.1775022782457;
        Tue, 31 Mar 2026 22:53:02 -0700 (PDT)
Received: from [172.25.98.130] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8ee2d3sm34684675e9.32.2026.03.31.22.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:53:02 -0700 (PDT)
Message-ID: <8e8acf76-2101-4566-ad09-ce32b6f51e94@gmail.com>
Date: Wed, 1 Apr 2026 08:52:59 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
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
 <86a96690-1307-4a6f-8265-1d6d30ce6d6c@gmail.com>
 <MW4PR12MB56682D24FB2D7B1EF2D53B78E853A@MW4PR12MB5668.namprd12.prod.outlook.com>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <MW4PR12MB56682D24FB2D7B1EF2D53B78E853A@MW4PR12MB5668.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu,ideasonboard.com,gmail.com,amazon.com];
	TAGGED_FROM(0.00)[bounces-34526-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitrutzceclan@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47B0D374F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/26 8:43 PM, Dayananda, Vivekananda wrote:
> [Public]
> 
> There is one other patch that is required in addition, which enables the remote-control channel links from port 1 using REG3. Adding the patch below
> ----
> From 36936732c6ecd599f1a26744bef3031e41194229 Mon Sep 17 00:00:00 2001
> From: Vivekananda Dayananda <vivekana@amd.com>
> Date: Tue, 31 Mar 2026 08:12:20 -0700
> Subject: [PATCH] media: i2c: maxim-serdes: max96724: allow selecting CC port
> 
> Add a DT property that lets platforms choose which control-channel port the MAX96724 exposes to the upstream I2C host. Document the new property for the MAX96724 compatibles and default to port 0 so existing device trees retain their behaviour.
> 
> The driver caches the chosen port and reprograms register 0x03 after every reset, restoring control-channel access regardless of whether the deserializer was power-cycled. Boards that need to talk through port 1 can now opt in by setting "maxim,control-channel-port = <1>;" in the device tree.
> 
> Signed-off-by: Vivekananda Dayananda <vivekana@amd.com>
> ---

[...]

Thank you, will be included in V10. I'll await first confirmation from
Sakari that the failing v4l2 compliance tests do not make sense for
serdes like I've considered.

