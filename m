Return-Path: <linux-gpio+bounces-16408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F648A400EB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83939426D90
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568D4253B61;
	Fri, 21 Feb 2025 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Dcpixypl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD4253331;
	Fri, 21 Feb 2025 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169711; cv=none; b=WfO29xZvfjKecPdksU4spTdFwIhmUoIQyarpyumEIuLQ3rydw1g0AYjL0Vmbr0hzoLNAP7BJp2Fr9FfI0FgPvKTppHXAj3XQ7h6JehC80plQKuTJsANycXlm/DN3geR0zti9qf/ifkKU2WrfkE8sXPKQbV3d6ltLcULnUKCEmCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169711; c=relaxed/simple;
	bh=i3zlCZibFD0eQokesJk/br8l4LUviz2RiIqYvY6msH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y+PbZoG1QU8t0h5ZgVfTFeWndB6ALfzA5BIshdqAIp2JDJPq0twPKZB7nvX3Mh+SnAVc5C6Xp6YqFGEYs3GxFETPf7UPpMnbsbEd/U0MHGrnNtny1bixc3Al8TY+4jE/M4zOrT13VZ97u6+hiTX70IIqBW1UmpzETDXN1eGxJ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Dcpixypl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AD0AD404E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1740169708; bh=d/g5e9b3qHFowIhkzXPTAYkXciFPkiSG5CC7NM+HmtQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dcpixypl7aWHggX6xBceTk4grLU8oHptHItcPRossG7Lmj6r93fA6rIOOg+kVf77W
	 tGo7JKm5OwPCv1U8pVlHtQRk6fez6M1T41v50bmoqQXebWWjDA3pW/gi+hvtSZxFPN
	 wG7VKzoBzzC3IzsgK88oTq/Ise4VD8TPSLJ9J0nIFxzf/i/0q9vgZeRai+H3KRtOYj
	 GMYbG/gdn5DfVIVWOYeQa891SbB+Rc7M9DPOuOFhMgP7Nq8WPauEQaBw1xLrgSKhWO
	 ftH5RFMEjLfqIoMKqXeVZ8mMbCX5teob4TEHr+xcX6DaPLYlT7Fg4Cy0DnMntT6X4D
	 WcKqTlfp6+9kg==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AD0AD404E4;
	Fri, 21 Feb 2025 20:28:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>,
 linus.walleij@linaro.org, brgl@bgdev.pl
Cc: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Fix typos in admin-guide/gpio
In-Reply-To: <20250218193822.1031-1-maksimilijan.marosevic@proton.me>
References: <20250218193822.1031-1-maksimilijan.marosevic@proton.me>
Date: Fri, 21 Feb 2025 13:28:27 -0700
Message-ID: <87a5afghzo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Maksimilijan Marosevic <maksimilijan.marosevic@proton.me> writes:

> Fixing typos.
>
> Signed-off-by: Maksimilijan Marosevic <maksimilijan.marosevic@proton.me>
> ---
>  Documentation/admin-guide/gpio/gpio-sim.rst      | 2 +-
>  Documentation/admin-guide/gpio/gpio-virtuser.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon

