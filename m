Return-Path: <linux-gpio+bounces-37625-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCNnCKgCGGp+ZQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37625-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:54:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E55EEFF2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F1F03002F75
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F653803FC;
	Thu, 28 May 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lXk7I5Q0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814F3672B6
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958041; cv=none; b=dNtRSTdit5VVNe04naK0PfUISbBWLwMF8TSjLR/tWIEOykfciT9SDKMsiKhXxzEUsyzwK7LcvJyI9F4yRl8Ygr8rqtsNbEQyREaWc/MBs8kXkMxN2PMBvX4wIJczw3YhPZsUEpHl2wsiodO9QCkV4jmkljutTRl/HI0N+ycrgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958041; c=relaxed/simple;
	bh=XsjnXd2LhmM50WR6xaUdTRMhEQ5lDRCHpmh2LyoJ7Mw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GSj6qd0PGpyIEhDKMNYFglgwlJRe6ZoKpsq5n1JBwo/2VxnkVE0/uKjY6vz+UTMUV2Bype+QZXrxTznAYn42w2Foib+5RY24Y4DTvVaAZ/XOrgo3nxrb5lgL2XMmVoT5m0HfIDiWgQ5hOFp/01dNN/oWnr4oN9P1IXtS8O5GzOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lXk7I5Q0; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260528084713euoutp0108dc10dc2d14aadc9d625a15188797b2~zrmas6NLL1383413834euoutp01o
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 08:47:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260528084713euoutp0108dc10dc2d14aadc9d625a15188797b2~zrmas6NLL1383413834euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779958033;
	bh=NiUIzz2J4mK7mbZjU50iRpjfnP1Bj6jF4LC/ZLFwGZk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lXk7I5Q0jQmOD+6ZQRsJIigr0AAzUwJloV41D4rzZWnq69/Ps4zCX/SQNbVip9WNC
	 dchsF/l3HfBFtas0kw/r1g6tUNqdn0P1NZqoj1EkM76DB4xp8QUKEMHJTGZeaZB5Mt
	 z1yivN1LA4R0opi2WSs89Bv0Y67DwM9UOOKZBvg0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260528084713eucas1p27b7c9bec1fd4c966be3666c74b4227b1~zrmafLrN62545125451eucas1p2g;
	Thu, 28 May 2026 08:47:13 +0000 (GMT)
Received: from AMDN5751 (unknown [106.210.134.141]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260528084713eusmtip2e222380135653e043b49419fbba35dde~zrmaDLlLt2118521185eusmtip2J;
	Thu, 28 May 2026 08:47:13 +0000 (GMT)
From: "Sylwester Nawrocki" <s.nawrocki@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Linus Walleij'"
	<linusw@kernel.org>, "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Alim
 Akhtar'" <alim.akhtar@samsung.com>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
Subject: RE: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
Date: Thu, 28 May 2026 10:47:13 +0200
Message-ID: <001f01dcee7e$94730c50$bd5924f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHUkhLpbWZfxeh6MF+vd143+1Jt/wKaMwmyth8HM7A=
Content-Language: pl
X-CMS-MailID: 20260528084713eucas1p27b7c9bec1fd4c966be3666c74b4227b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47
X-EPHeader: CA
X-CMS-RootMailID: 20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47
References: <CGME20260527210902eucas1p124029ab58e08b006a54d0769c92e1d47@eucas1p1.samsung.com>
	<20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37625-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.nawrocki@samsung.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,samsung.com:mid,samsung.com:dkim,linaro.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3D8E55EEFF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>

> Subject: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
> pinctrl drivers
> 
> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> This follows discussions with Krzysztof about expanding the Samsung SoC
> maintenance team in the kernel.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>


