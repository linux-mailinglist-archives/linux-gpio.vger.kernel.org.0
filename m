Return-Path: <linux-gpio+bounces-27570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08779C0494E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 08:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9DE3A2280
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 06:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EA62737E6;
	Fri, 24 Oct 2025 06:53:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED89A14386D;
	Fri, 24 Oct 2025 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761288826; cv=none; b=RTqvQNjVEUSyXS+XRICgjU365Dd44dsBh0C4s1aP7VWrkoogdS3b/P435I4qG2n9XaVueH24H2138Svc3BPsFwhbT9kJ+919vETucRxOLjq6wWHNTsL5eN6pufs5xK76KF8kiq0TnbC41D3OCFJYSv8+e0zIRcBLnb4/zZh7hp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761288826; c=relaxed/simple;
	bh=dRKFg2YvDnUYsvv/YroT/jRbJrInx+alIQ+VnVDdnC4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=k3JTF9DZaRtao/FZ/n3JwRWQwKOOfPl+OP/OZuuSEGAGNd/3w2ZwLuWj2I9MhCyz+0yKRcqCDGVU6INPGq45IiEyu57xTgsmAI3g1t1A2USnBgUK0Y+zgAr0rAb1JqAnEwha0QM3WGLjid1ObCeSQmKKLm1oaSpW1MBE7wkoZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (ip-109-43-112-130.web.vodafone.de [109.43.112.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9D2EB19B;
	Fri, 24 Oct 2025 08:53:41 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 08:53:40 +0200
Message-Id: <DDQCS29MOR0K.2TOU2N8QR86Z0@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>, "Ioana Ciornei"
 <ioana.ciornei@nxp.com>
Subject: Re: [PATCH next] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in
 probe()
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <aPsaaf0h343Ba7c1@stanley.mountain>
In-Reply-To: <aPsaaf0h343Ba7c1@stanley.mountain>

On Fri Oct 24, 2025 at 8:19 AM CEST, Dan Carpenter wrote:
> The devm_platform_ioremap_resource() function doesn't return NULL, it
> returns error pointers.  Fix the checking to match.
>
> Fixes: e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

