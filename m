Return-Path: <linux-gpio+bounces-25019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689BAB37B2C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 09:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153FE3AB313
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 07:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1152D5C6A;
	Wed, 27 Aug 2025 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EwqflDBq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BFA6F06A;
	Wed, 27 Aug 2025 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756278207; cv=none; b=SgoUvNZLh1Qh3cMSmEn9c6R0ig94+p/xbNbW04LTfK3pPRZ4txkfayWqWBcFWTng5tG3j1jV8AouM3CgpfswBBpYBwD+GTPJHjubYTFryNGUz6Gf/9VvmLYeI3zvALOxFNNzMKO+2DHWw5v7lpliUVXMhuFOYYt54T2NsS5FZPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756278207; c=relaxed/simple;
	bh=z2++cExHvGN4rhuhUsjE+qWMsX+bh9mswfOaBGj0isg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TNfh4aRg4e1HvkuTwLS4n+/bgNwu0xxXUKwog/1a8fSqcbxn4o+xrSKLbofnPyl7BXWbV08ixsrFp52w0bdI/tf02K+YsbAPoNbUDpkAOG2BfAWBqyha9id9pwpcZTBaey6xwTQ6jRy2kZ3eUKsAyCWPEf6e/fmIfZoi8taDPdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EwqflDBq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BEFCC40ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756278204; bh=3bDRWW7ru8ba94cBFlwakY0EgE2dKVeENKnIyfZUzhM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EwqflDBq/Ej+bm+bhOH9uqjyT+WG2aJPrDZhMfAq1EVNiNSACsrK5RNPu/qNJzv01
	 CB+gimdJl8dNlv5CwlGBTAAeIHoAoVOoD2pXOGvUl6HSL6w99oqcYdhlSpOpHqcv8g
	 W2XWf8QiWzZF4gD5ZJco5qBny9zKhSHwn6ID4OlGJ1uliX88pBlqgAo/ayTR2PjCCC
	 JrLk/siGY8l82HvQRv6Gdn/nmLynVDEbQUWmfBca60lsfVBO3CQmr6wdaJm0+O8++N
	 Mxxrc5Ni0ooqKOB7fYchObMBf30T05l3mtFGuEpfe+nwhmoLvbxbGLDgHS9ksGsu2V
	 MCrltqTOH9qYg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BEFCC40ADA;
	Wed, 27 Aug 2025 07:03:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Tran <alex.t.tran@gmail.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Tran <alex.t.tran@gmail.com>
Subject: Re: [PATCH] docs: driver-api pinctrl cleanup
In-Reply-To: <20250827054352.669598-1-alex.t.tran@gmail.com>
References: <20250827054352.669598-1-alex.t.tran@gmail.com>
Date: Wed, 27 Aug 2025 01:03:21 -0600
Message-ID: <87jz2p9rgm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Tran <alex.t.tran@gmail.com> writes:

> Resource cleanup when using pinctrl.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  Documentation/driver-api/pin-control.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

I hate to complain but ... this patch really needs a changelog saying
what you are changing and why.

Thanks,

jon

