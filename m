Return-Path: <linux-gpio+bounces-27579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B42FC04BB7
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8407B3AA27F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8F32E36F3;
	Fri, 24 Oct 2025 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eY4dbEO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE12E2DDE;
	Fri, 24 Oct 2025 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291148; cv=none; b=TwF0rCJ/cSo5ixo+7BQOizVB8tvKKyAN1EZ+HELZtGVVNKUBXH987v3mnTNiGV9CjMGMA07P00QVfOaYxG4SuhvtrziIev1wM7ZTu4gSlo6fGYQ2jJls9jszi8SanQLRDkGnYG3nGlB7txuczo3gRS6mJNRo6+GDY5P1Mg8znQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291148; c=relaxed/simple;
	bh=eaxooXoJIwmcd0CEY30Yd6if/sFPAp16VRbJcMq8Keg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmhkkh27ift2dbi5J98WTO5PoYFrpDyWsBCcKVSfXWupx12doMsIPIukpOYSYt9VjMTtHgfukxsLV1g+VJor/XIWM7RgPvaqxJO1I4oCQtHoeTUh+MO4mnq+2hMzUAFVX5ASk+NZ6ViZgmiCWc7EfjExVT5V3gqTKvvtTEx3pFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eY4dbEO7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761291146; x=1792827146;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eaxooXoJIwmcd0CEY30Yd6if/sFPAp16VRbJcMq8Keg=;
  b=eY4dbEO74W450/Ez2dA4g9bEDUe+w+AJZLABZTlG5tIWYxLF6AmvXsab
   SI/JDMUadw08V+ZoBKipLbJs9hbnGA40WMjOitfScxKshJALYG67td73M
   iLY7fqWCs3VCki/CGWBbvlX7Pnf1kRnpe+dmAHBoSl1OpGnzGgjg881D0
   Dleg78ba0xJTkv2zcMFnayly6+WTsa8iUgLobjm+IXLTzD5Re0RQ8fr1D
   IhlYPj0xQmDoyXHbHszsUUS+6ZnXaCFI/eI7HcrJIPSp6L6Nslgpmrw6p
   RyiK64yz+OxDbHBJFw+iys5eNYkc7mhESzrCG8lB8rPeNo2sb/jx/fD60
   g==;
X-CSE-ConnectionGUID: sBWESiJxRcyP4VYZMJHFnw==
X-CSE-MsgGUID: 3N+xhSP7QY2j009NtO+H7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63394483"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63394483"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:32:25 -0700
X-CSE-ConnectionGUID: yNWj9OsXSROF0TUUq8ct3g==
X-CSE-MsgGUID: zkApki+9SzmjUPgtZniraQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="189491561"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.211]) ([10.245.246.211])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:32:18 -0700
Message-ID: <3907f4ea-31c2-42fb-b4ff-a6952874a9bb@linux.intel.com>
Date: Fri, 24 Oct 2025 10:32:25 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
 <CAMRc=MdWjyTyJh5zfE5qncO8ABn7QSuV1CUZXa+cSMjWoXUrNA@mail.gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <CAMRc=MdWjyTyJh5zfE5qncO8ABn7QSuV1CUZXa+cSMjWoXUrNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/10/2025 10:20, Bartosz Golaszewski wrote:
> On Fri, Oct 24, 2025 at 9:17 AM Péter Ujfalusi
> <peter.ujfalusi@linux.intel.com> wrote:
>>
>>
>>
>> On 22/10/2025 16:10, Bartosz Golaszewski wrote:
>>> Problem statement: GPIOs are implemented as a strictly exclusive
>>> resource in the kernel but there are lots of platforms on which single
>>> pin is shared by multiple devices which don't communicate so need some
>>> way of properly sharing access to a GPIO. What we have now is the
>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
>>> doesn't do any locking or arbitration of access - it literally just hand
>>> the same GPIO descriptor to all interested users.
>>
>> I had few stabs on this in the past, all got somehow derailed, one
>> example was:
>> https://lkml.org/lkml/2019/10/30/311
>>
> 
> The main issue I see with this approach is adding an actual device
> node for the shared GPIO which is now not accepted in DT bindings. We
> only create nodes for actual HW components.

Right, that policy came later, true.

All the information is
> already in the device-tree, we just need to scan it which is what I'm
> trying to do here.

I had a prototype later without the sofware-node which worked for the
use case I had, but over the years I dropped it, it was a bit of hassle
to roll it for nothing.

One can argue that the shared-gpio node is describing the solder blob
where the GPIO line is split and routed to two different component.
With the approach one can handle cases where the level is inverted by a
passive component for one of the device for example - unfortunately I
have seen such a board marvel as well.

The device's binding will tell _how_ it expects the GPIO's active level,
which might or might not match with the real level of the GPIO line and
if one of the device's branch have an inverter, that is going to be
interesting to work out in conjunction with the other devices non
inverted 'direct' line to the same GPIO.

Never the less, it is great that someone is trying to get this supported!

> 
> Bartosz

-- 
Péter


