Return-Path: <linux-gpio+bounces-31391-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDE2LDYAgmmYNgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31391-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 15:03:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C353DA517
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 15:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89A123046A90
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 14:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89543A1A54;
	Tue,  3 Feb 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l2MemYRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E75340DB0
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127409; cv=none; b=tbkXls5o1Y0RIfzjdToFc0fRYktgcOccLEDzelNqky5rXL1LRVWUHNrQY89hUCug56H3+AFX/3IPZKv8Ml1ywZcvGLzBMFR2D9onWrDmHVVllq8ddq3SHhEfB3HfmkciQcICSgpX0ICHkaLfKTptnxETF8yvmK9rPZsL/Ip7fag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127409; c=relaxed/simple;
	bh=eqlA3EqmxLfxE7QaoNTcC3oTDfV63ivVGxnH0rWO/AA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=i6znYzrJlTib9p2tdEDhZm1RkpVuRhFEnDGTQMj6dwjlIDTK8Sdx27b7drp6bSkTcXVOZ/Eqemiy9RLbuiX7ft58fkjGCYskuZjV/P6GIwCB/K/5JPACuMTixv4Pc3UmIcFaiua8lRRV5i6r7UKy5iIb/9fNHwBK7PlLTpSQFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l2MemYRl; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770127396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRrkh3Ad3sEIOvwMJAakZ3eaeEUS2YBl+bQjyr22hDM=;
	b=l2MemYRlC4Fr1R/MCS5VKCnOQj4gfgs+xBP7IzHZ3qhkVcuCqfMOX7aLlr4kjOeMcf2CUk
	lG9KwbO2RqNqgHGI3YmFcYLIrhi5LydtItW9ZaAfMWJwu++dRnJZAYdMt0FOs72oKJOhjQ
	stjaVuYPuJd7HQJpE4xHrGDuQ77AwUo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 22:02:33 +0800
Message-Id: <DG5DRZU7IUOE.38JEHK3H9ICCV@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Linus Walleij" <linusw@kernel.org>, "Jiayu Du"
 <jiayu.riscv@isrc.iscas.ac.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <linux-gpio@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <gaohan@iscas.ac.cn>, <me@ziyao.cc>
Subject: Re: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference
 when parsing devicetree
References: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
 <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
In-Reply-To: <CAD++jL=Up=y_pX4Xy50in08cT978ANaoiD_98nn99frb8=5vOA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31391-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huang.ze@linux.dev,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2C353DA517
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 8:32 AM CST, Linus Walleij wrote:
> On Sun, Dec 28, 2025 at 4:53=E2=80=AFPM Jiayu Du <jiayu.riscv@isrc.iscas.=
ac.cn> wrote:
>
>> When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
>> dereference. The crash trace showed:
>> [    0.732084] Unable to handle kernel NULL pointer dereference at virtu=
al address 0000000000000068
>> [    0.740737] ...
>> [    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc
>>
>> In k230_pinctrl_parse_functions(), we attempt to retrieve the device
>> pointer via info->pctl_dev->dev, but info->pctl_dev is only initialized
>> after k230_pinctrl_parse_dt() completes.
>>
>> At the time of DT parsing, info->pctl_dev is still NULL, leading to
>> the invalid dereference of info->pctl_dev->dev.
>>
>> Use the already available device pointer from platform_device
>> instead of accessing through uninitialized pctl_dev.
>>
>> Fixes: d94a32ac688f ("pinctrl: canaan: k230: Fix order of DT parse and p=
inctrl register")
>> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
>
> Patch applied!
>
> Sorry for missing this, I was waiting for maintainer feedback
> but it never arrived.
>
> Yours,
> Linus Walleij

Hi Linus, Jiayu,

Apologies for the delay.

I tested this on k230; it fixes the NULL pointer dereference during pinctrl
probing. The approach is correct.

Thanks to you both!

Best regards, Ze Huang

