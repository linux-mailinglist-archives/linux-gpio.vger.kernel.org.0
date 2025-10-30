Return-Path: <linux-gpio+bounces-27870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA1BC1F95F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 11:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8A23B7AEC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 10:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7F934F491;
	Thu, 30 Oct 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yUezNkgI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BF234D91B
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761820388; cv=none; b=VPrxMjT4yPgCw5i5atC/s/cemwM8MsKB7ji+ym3vaPUs3ugul6LsmJRPljEj7l8Ei3gceB0iDs14qeTk18mEQT4PESfdEKMdJNw+K8o42v30kuqtI1hEGjfq5TYnlMEcHJsDQJFgWdDadqUY1nowvtDtKXmvsItUK4gC8A2ECxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761820388; c=relaxed/simple;
	bh=fkQuN4M9OXZln5Gas2xs5QTY9sm7gG9MAV/63TxPaoQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TM5q7O6DwHFxJXm9UbBYEZw1CHwBI7taBx3hZ8BRlUeDahPMK9zJNtGx7EcJIGjxcBarf927foXZqjrU2lH9IcfvzK37sv5PExllGkOtufK3Hp2uG29uzM1POxC2MrtENypWwDLSisT0LsBSCkCifZ0GDRlPi3mMVkMfURjg5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yUezNkgI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-592f5fe03dcso810994e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761820385; x=1762425185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWaZZTU8/qNu3sUrivVmXo8XF2FXNMsT2t8CXXY/7N8=;
        b=yUezNkgIYlZTrlfwOJtks2Z8PFebp31FfT6WnJVyTz63o8qDRM4UoMwfx3xYphtYGt
         +3dXpXT3p8YfNPZtkzZG7o7PwD7Awp8tvRF/2NHm4rrGfjy6Pt9oM+fFWt4RSWSZDzX5
         DDlWsD+XHIaG6aG9gB8W9dVqYJdTfraeHjUH3CCM3g/ON9vaeuFY3Zk95AHo+iZOTPu7
         gxmQmEajv5TVBlnLn+23dCw9kHBdB/I96ffgAh0MzJMXZ3qOvsr9Cw49drRaUBM5eo/T
         vTGTlSSdcj628fzo++H5NNWxfYAG/9pgXCj8oBhje1dxO8PWH/MNoUIOssWLpD5G5ukE
         Q1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761820385; x=1762425185;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWaZZTU8/qNu3sUrivVmXo8XF2FXNMsT2t8CXXY/7N8=;
        b=D/2xYbx0ZW428GnQhF9kqjY/Jv7UtDjAGLCQQFD6lS1w1L0ofGfIiYc5epAbt09Cbc
         S/7L0nxDlK9vYdmP+AQYsLBBaYWbz7c7o6MeenB4/vKu+TETDfWvjXIHvrDXfsnZBbNt
         sJ//tdZSl3s+seHfrlwccyo18/3C4toYRVOVslwC4nobzgtbE1bpKbND9wuCIJhtwXgl
         pS50uTjyxsHpo5Lhou7mJd8xmjbFkPDoo6Yuh1JDai5zC/cftU+k02Zm4SoTfV+iTEq1
         5UMN0jm8UiBfkWOC3dO6BOQ7gW4IGomYUF32k6sfg2sZKVUW4OVMq63w8zqAGv+Ug13E
         4u3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+i2ENWZeJkoyGHq74Y91UKeebK+k2i6tdB6v9TheDQtmQE/QeRLEWS4+FWwGlopjVK6PNiDeXowJc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1usoL0ngwqJ7pw08GoX1cJkv6t6eoJEAVBDzBsgaVeRE0YhQs
	HKSZ8F9kKKv5YXSKpqxkqoL1Ppsm/9V0NCWTH05VDzQaIyO8+HXw9a6xfUUW6TAfGvKPwNDDJsH
	QtdI4mwTbuhOXBdEDDIa1FAvY99umNOD1eTcwjwG3Nw==
X-Gm-Gg: ASbGncvrq1VAJ4aZLshoEk8632kwl/LW6Qk367Vw4qMvVHuXid3csjF5bmqFBHurGbX
	6zwWCf2HuBqXsIGpHNVRUmSNjF57U7/SG5rOA9BOARydIzx9XBKPNGJtLRfa8nNj7VnvYjyeIwc
	d/ttaXp3hSMuL302jPA7qp7yaWlRe4YhfLSJtv92u+ZILKgwbugvhPtOGYQPE2vWym5I7p/zJdd
	AlaDMpCmuASMk3c8MLJZ/uxAaXzBG5C+DLTzTcRRwLccawCDhS+Tp8sB8eP8NOU4VbBGUWFlgYP
	NimVNIf4WY0/jftkh/ls4ijdfg==
X-Google-Smtp-Source: AGHT+IFhFWN/4OudZAxtgLsuvFOZccyNoMyjpf90aD3ueT+mFrZ+QXd3pkXKsskOxyxG+MbzSMsmqJjiGUh6n54vjzA=
X-Received: by 2002:a05:6512:3d0f:b0:592:f115:2949 with SMTP id
 2adb3069b0e04-594128e5f03mr1975919e87.40.1761820384668; Thu, 30 Oct 2025
 03:33:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Oct 2025 03:33:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Oct 2025 03:33:02 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aQMxNgC9SWQp-yUy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-reset-gpios-swnodes-v3-0-638a4cb33201@linaro.org>
 <20251029-reset-gpios-swnodes-v3-2-638a4cb33201@linaro.org> <aQMxNgC9SWQp-yUy@smile.fi.intel.com>
Date: Thu, 30 Oct 2025 03:33:02 -0700
X-Gm-Features: AWmQ_bnzqCfSjLPQSQJvj5qhc2Ow1ivS1ZlAVQqDeOtxRUXYZLAdKO4EXPlIarE
Message-ID: <CAMRc=Md=Dcwj0qDu5ysDafjuV0Ud9z2Ky3PQpDzfiKRt2L-HgQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] software node: increase the reference of the
 swnode by its fwnode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Oct 2025 10:34:46 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Oct 29, 2025 at 01:28:36PM +0100, Bartosz Golaszewski wrote:
>>
>> Once we allow software nodes to reference other kinds of firmware nodes,
>> the node in args will no longer necessarily be a software node so bump
>> its reference count using its fwnode interface.
>
> Same, a short comment (or an update of a kernel-doc if present, I don't
> remember).
>

Andy: the resulting code after patch 3/10 looks like this:

struct fwnode_handle *refnode;

(...)

if (ref->swnode)
	refnode = software_node_fwnode(ref->swnode);
else if (ref->fwnode)
	refnode = ref->fwnode;
else
	return -EINVAL;

if (!refnode)
	return -ENOENT;

if (nargs_prop) {
	error = fwnode_property_read_u32(refnode, nargs_prop,
					 &nargs_prop_val);
	if (error)
		return error;

		nargs = nargs_prop_val;
}

(...)

args->fwnode = fwnode_handle_get(refnode);

I'm typically all for comments but this code really is self-commenting.
There's nothing ambiguous about the above. We know the refnode is an fwnode,
we assign it and we pass it to the fwnode_ routines. What exactly would you
add here that would make it clearer?

Bartosz

