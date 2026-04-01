Return-Path: <linux-gpio+bounces-34528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKoUMT7BzGkWWgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 08:54:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD0375733
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 08:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1700A30AEA63
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 06:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0801533ADBF;
	Wed,  1 Apr 2026 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YFK/JW9b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2F33B6DF;
	Wed,  1 Apr 2026 06:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026069; cv=none; b=jXuqPeTerlBwfvKZ7WPyDq3J2K2ljFbm30M1xAmJh+iDfkmPjhHTvvtgl4YUeBXFAhixfQXm3jXZi9L+yjIEpCnH7EcmXy5gIUnEUP0wVbcZ8Jialq3ThzN9vAs12HHgjuEn7Mvjc4T2VjwTmWrp/TcVAfFhIp2DFFnXyINhl9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026069; c=relaxed/simple;
	bh=7+gEutQ/RvWF/TclM39XWAocQIzbC5MMchwsxAgsIhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNyy+HkdjTUUP/8FwR2uATQN0Y7ZOPbVpwZFbg813erVX+AjzWgucbM6KL6pgGcEHLAmA4FQcqsSqPc6uSbkFo+vVSeSA/4evimseWpT+pxIrlT1iWEDMpvd6/JYSsDJNP7C00jv5uXnqki48Tq97vE5o/soZmOA7QgkloelnYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YFK/JW9b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B669105C;
	Wed,  1 Apr 2026 08:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775025981;
	bh=7+gEutQ/RvWF/TclM39XWAocQIzbC5MMchwsxAgsIhI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YFK/JW9btYqpjPGCjZBVCoac+swVC/vS0tayR4hGEsxbbEIdkEHORJ4RtpxR9MICI
	 XsexkWTJtD+PLQT1eDJRNs5CQQP3BV9DoLjuUVNxWCkQb9F1+MptZ4w7ckhxv4pJnl
	 6rVZ/iVpVYSgrlVTdqtH101sKgVfOZYb34f9B1w4=
Message-ID: <8e924699-e0ab-4e39-a1d1-b218d749672f@ideasonboard.com>
Date: Wed, 1 Apr 2026 09:47:40 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Ceclan Dumitru <mitrutzceclan@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <dd858ec6-7621-45d6-9328-b5b03a4d0cec@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <dd858ec6-7621-45d6-9328-b5b03a4d0cec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34528-lists,linux-gpio=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,analog.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,vger.kernel.org,lists.linux.dev,avnet.eu,gmail.com,amazon.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 44DD0375733
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 30/03/2026 10:15, Ceclan Dumitru wrote:
> 
> 
> On 3/11/26 9:58 AM, Sakari Ailus wrote:
>> Hi Dumitru,
>>
>> On Wed, Mar 11, 2026 at 09:17:12AM +0200, Dumitru Ceclan via B4 Relay wrote:
> 
> ...
> 
>>
>> ...
>>
>>> The following v4l2-compliance test still fails:
>>>                 fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>>>                 fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>>         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>
>> Could you post the full report here, please?
>>
So why do these failures happen? It wasn't obvious to me from the full
report either.

 Tomi


