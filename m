Return-Path: <linux-gpio+bounces-36476-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN2HBHYo/mm9nQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36476-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 20:16:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CC4FA75E
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 20:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADC763034B10
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 18:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FBC37BE71;
	Fri,  8 May 2026 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoVtHq3L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7612837AA7A;
	Fri,  8 May 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264139; cv=none; b=UlTtCndByExgJpesYfWAsIF3GqaS5antQK0HCk/MuZhbVDQIsO7S9X/xwINUytF8oDm92Q4WReWo7ktJjnasleawCZIh7Fd4kEsq/hxYxEDjaZ6fChiqpxOUN/b3tu2JYZIinkMsYcC8qQ4d/0frMkoXzPQf3WZFHS8alEnxivE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264139; c=relaxed/simple;
	bh=VXdNdUVDlNnrZMEfP58I/g5Qk2zen5k91cmmz+Eb7dU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oWbusas8Yvf6OFJD46ArPpF87s88vel775OnfpxQTqRcf2N5vV4hAgFrU8BrhGt5cw2lhkGYgRl1RcajvKwZL/MnXroP/cmsbmkemMBzsHPNquhJxegtyMQTI6EmzRf4FcCytSahDmvWzK53NDQZZNfxHnWCC2pfgksblxLOSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoVtHq3L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778264138; x=1809800138;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=VXdNdUVDlNnrZMEfP58I/g5Qk2zen5k91cmmz+Eb7dU=;
  b=ZoVtHq3LVX7dacbIK1MgIgBBAFv1PNlBGb3o4xsiVwCISbFTJaED6rBL
   xnU/h5k7NJTatOF7FxrCvBGcWwviRMAIzCFvseEBKMpLjXTOGacmoNi2v
   lpD7IBdNTWqdQV2JngB6bvogTVRe1Q2QCcz4fAaFHcyLtogeiKAN785r8
   Z+QHVOKk4/AZr63VeBsJ9uoNakW6GCT2YYXiJsHHz3YmlTKEh9EprpRTS
   457fshUrP6mhNzBla5lgDU4PzP8ceidpPt+v3mRYK/M8x1XDcKvEaBmdt
   vT2REkvB9Uwr6VT0+m4/dZ/AQvgaq5BwKSlNUpKUeJPtxi748Qcx51SlQ
   g==;
X-CSE-ConnectionGUID: x4EsYHAxR9GQO49WBglRUA==
X-CSE-MsgGUID: zmcNmp++QdaWfDP3wtD7+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="96665841"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="96665841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:15:38 -0700
X-CSE-ConnectionGUID: vFA22ba1Qma2f4jms0kdEw==
X-CSE-MsgGUID: gUkmPBOORTG+RDk/G1VHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="232320521"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 11:15:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, brgl@kernel.org
In-Reply-To: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
References: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Message-Id: <177826412637.8043.3507805822778132637.b4-ty@linux.intel.com>
Date: Fri, 08 May 2026 21:15:26 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Rspamd-Queue-Id: 976CC4FA75E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36476-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Mon, 04 May 2026 12:58:55 +0200, Bartosz Golaszewski wrote:

> First let me repeat the problem statement:
> 
> ==
> 
> GPIO software node lookup should rely exclusively on matching the
> addresses of the referenced firmware nodes. I tried to enforce it with
> commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the
> key for GPIO lookup") but it broke existing users who abuse the software
> node mechanism by creating "dummy" software nodes named after the device
> they want to get GPIOs from but never attaching them to the actual GPIO
> devices. They rely on the current behavior of GPIOLIB where it will match
> the label of the GPIO controller against the name of the software node
> and does not require a true link.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] ACPI: provide acpi_bus_find_device_by_name()
      commit: 083a59e05db9203c346e87d822c0c12a0f7a7c85
[2/2] platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips
      commit: 1448c2d2ca5cc7f4ea6694e6bc809946de0a751c

--
 i.


