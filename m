Return-Path: <linux-gpio+bounces-36077-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKKzGdGv+GkPzAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36077-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:40:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C50694BFDAD
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F58A3009CFC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 14:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04D83DE45D;
	Mon,  4 May 2026 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1S68tZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9B3DA7EC
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905550; cv=none; b=SRG5WIh3/L762AhO6uMDEvDJXHm600E19tN88m7ZDdyACOh/XqfOU0xYPgSisUognokTpSoD2fU8hYftedCnCR1QXI1thOGceSt2TArwh+A5Y631Y0Z1HAid27cpdiZzqqUGMT+Xr9RW3+16uGm4n0aQWuJ/r4CiaNtKbzvza3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905550; c=relaxed/simple;
	bh=DH6GxipD1JVJ+S6qzqDGcgA+zWxD7WPa3RRlnb752qg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSPi3G1jLPmEW6KehpTwgnGrV8NNELtwDWfu2NCZTtH1/3qAbdVrQKnqtX1C/nFNBC/Kr5o0+9kDFfxRVLUNvxjo6lgL08Vd3wBoQXkjNFB10VmH7T5+3fehOKEBJajiPvQa9x0Lv4Mb34u47W8IZnOrdW5F3Lu483lBio1xJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1S68tZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A61CC2BCF5
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905550;
	bh=DH6GxipD1JVJ+S6qzqDGcgA+zWxD7WPa3RRlnb752qg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=D1S68tZPnYu1V0bCy9REcTABOQPO/H+FY9NCnMUifUHJ0aVGVM/4RqOUrOi3dZ7tq
	 SXzE9fZyeruuFmsormEI9/57aLiDhSrowoO8hT3TY4AGjeG/CyZhaNS8+Keza6yny+
	 HdReQ/pmn/2asK43l41qAI3EsES8X5v4sx/C24LcGuIziybTH0isrk6o8UAdPxvNwI
	 dC8Gl8stpEn+8ikHvK6rh6ZjyaTugqxKDqtlonKKLpJg2crnmGkGCD6II0fklERtNF
	 y9qDu5JPGZj11Ht04AAdDQ0lmausLskc9DcJofl8yxybU1bb9QG8Jy+tCPMo7F1TBe
	 BYZREq1b2FbVA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so2913445e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:39:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NKG/3QvFMwe5poHfVcQF5CEsvbjqELdzjABmkwSSgI5S1nKYaK/Iifh1zFsYE3wvUEk+iiDsuohNr@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJ7BH/y0flI9uK1bum+6i/TrC+CnpElBj+MgBR++Ouakrg2sv
	X7BUWARKJHeEj7NWgzPAMrUOSkEJMvy8gOCYN4XIk0xJdqEpjM5sllwxcczYtbQGDjZgYjDVDMb
	oDkToy8DJGBGbbcVB1GJ3gPGBDuK0jzezxLhhtl9xow==
X-Received: by 2002:a05:6512:1255:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a86b8167c7mr3261187e87.30.1777905548656; Mon, 04 May 2026
 07:39:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:39:07 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:39:07 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 14:39:07 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mdy5d+8fi1Z3cOZ56XiKTNd+BQPfFc9VSYYpk-6KtFQAA@mail.gmail.com>
X-Gm-Features: AVHnY4LDGkzvq-F0a-Lhky6B8AKh6zx1azWjATamTll0uX7umMCaYvXYiBIHOaI
Message-ID: <CAMRc=Mdy5d+8fi1Z3cOZ56XiKTNd+BQPfFc9VSYYpk-6KtFQAA@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C50694BFDAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36077-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,nxp.com:email,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 4 May 2026 15:11:42 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

