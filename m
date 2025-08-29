Return-Path: <linux-gpio+bounces-25211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E2B3C45A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 23:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19DFD1887922
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 21:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826D727054B;
	Fri, 29 Aug 2025 21:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LPxPzA7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893431A314F;
	Fri, 29 Aug 2025 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756504229; cv=none; b=ECgDr/I6imwIsBC80jmkmZNZbxrr5i2k8cIMMYUQMG2RB+qMoxjBX60+uYW5fd9IkW4d+S7mozsfp3BGbs76DzxljOgXk2jJ3SJxptLBZw3DOGABHuVx/95Rzgen0StTGDBO3PwHuc1Za0SWO9uQ48ZbCWwBjp9nTVgdLsaod00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756504229; c=relaxed/simple;
	bh=QFcV05pxlisVUWvQ8RM8qkjfzRvIZ2bLrLGIRANs+Zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cfdnM7+4IWEyO3zAFTbmjtl20cartijW5jcXHEwmxxihcwD0nG2vmWe4eD45xJUnMg3r6GDshXZq0eTAnxiA1p9SLI7A59emVSE7d5BLzUwbV4RVbi2VjYS0ivWU2cPSFGITzIaHHCR7RKY+ZWabsByQ8Tin1Bo8d7XSc3SQ+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LPxPzA7K; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A8DEF40AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1756504220; bh=fSBqc3e78aFfjbu0f9KoHXppGsKhkHo5tW/1FzhC+VI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LPxPzA7KBaIDwBpSb0PBd6MjS8vrPpdq41vnFipLMfW0kKuAvXBgsuQtJdmgakPNO
	 ujRu1o5CjdMGzriG1xnih2SdE5iaxwKOQy3ukBv8w1PWj0rc04uwBWSyvUNuEb7yZc
	 MT7AMpY83PkcbEvaJ9MyqawFYDFgZAsYYQZYx70mggCu+st89kmgPemxHRLb7SVygn
	 LUa5X5fhjJUTz5pFiw7K4MtGLsQUejhauDp9xcoPBq2Vjp+Yu+K6l2a2pRK7XRb9tD
	 hQ7I4ywoxVTNqInQnZLeSjVnsCBzTM7fpgSG7cX/qu1DLCLSgcsPPb6mNxnhfWd7D8
	 D85JjUovny7eQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A8DEF40AE2;
	Fri, 29 Aug 2025 21:50:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Tran <alex.t.tran@gmail.com>, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Tran <alex.t.tran@gmail.com>
Subject: Re: [PATCH v2] docs: driver-api pinctrl cleanup
In-Reply-To: <20250827074525.685863-1-alex.t.tran@gmail.com>
References: <20250827074525.685863-1-alex.t.tran@gmail.com>
Date: Fri, 29 Aug 2025 15:50:19 -0600
Message-ID: <87ldn14x2c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Tran <alex.t.tran@gmail.com> writes:

> changelog:
> v2

It's best to keep this kind of stuff out of changelogs so the maintainer
doesn't have to edit it out when applying the patch.  I've taken care of
it this time.

> Replace FIXME comments in the pinctrl documentation example with
> proper cleanup code:
> - Add devm_pinctrl_put() calls in error paths 
>   (pinctrl_lookup_state, pinctrl_select_state) 
>   after successful devm_pinctrl_get()
> - Set foo->p to NULL when devm_pinctrl_get() fails
> - Add ret variable for cleaner error handling
> - provides proper example of pinctrl resource management on failure
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
>  Documentation/driver-api/pin-control.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied, thanks.

jon

