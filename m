Return-Path: <linux-gpio+bounces-24529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD21B2BD0A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B5F18900CD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 09:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A8231579D;
	Tue, 19 Aug 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hNrNC0Ne"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687125F984;
	Tue, 19 Aug 2025 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595098; cv=none; b=RVbuH36jociE4V+n1k2g7eqsU8+zsIxR8m0l7vgKc+nfz+i5muRrgDWi87+cM+Dcbp475fwNIMQDQr6qBNqbkQZdegNeLCcR96QPlIf08tHWApazCvOmNf7SF8r7mjdV/GCYhBLI/5ZRaqOmYO95eKm313okRwwwUPPsBl4xV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595098; c=relaxed/simple;
	bh=LYgmLFvpv4Gtdddrhpy9dSjoQU48MtP+6kQzk7wcZnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BCRFoFLtrgT/YOuVL7+EA4g4lvC/y45Lj9yqvTuECCyrnhj67/K/laDt4q9sil51M63CQH7xjvJLZxSLqrhfM63l28AS/nOb7q0dz1J27CFZwGPGCEJaCXEPrR2h9DkUkPbSQsnxYQLV06Y4x129LAjWa8PDkQKpxCHermLFu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=hNrNC0Ne; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1755595084; x=1756199884; i=wahrenst@gmx.net;
	bh=AlVIeoby2Tqzgrsv+ZuVu4uYXHlpH4uyosFxxOSmnT4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hNrNC0Ne6n7BT0bFfWRRHo/N3FHsJjxZ2JdGoO8BqPbn27U/Ts4Bgz3oMxoEBa/Z
	 +ewSrxseYPI67wOz7R7/qWTnJLQFD9AAWOUHk3X3eAbpFeI23V4pCfLJxdtCAtr+p
	 5SSIZsl1qVWP4xmQ9bsQcrw2Gq0GmeLuvRkPsUD8PvYkZvfeoA3uGYhi3UWBVhknc
	 3sbQbD/crXeZheQ2nVl2ohrU9agqAg5i4oa9j8F5k1pGz6JFpLtlWRq3TdeSk76WG
	 IO8D+Eq0iJL4HuRMb7zLl0NLNLnIrXQee6UTj0PUPfiAtK6i7jkiS4Dgm5aRtJH7k
	 3fHVpU55DMbAKZZpsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1u5eP848Av-00ea1P; Tue, 19
 Aug 2025 11:18:04 +0200
Message-ID: <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
Date: Tue, 19 Aug 2025 11:18:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 florian.fainelli@broadcom.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wspc8HiojZaugpMhWvJAMYMAW6WrnpjejmlEgUoicunrjoy0wUh
 chZHQiJrku5dToF9Xhh+1r3EsuuCQf2xnbZBhhlTwK1BajpJhheWGNUbug+5lwCUnFw2478
 mvgMTt+n5LwEumWSm0s9ZkLSHlcCqIx0nptlrczRP8SsBCnVFWyF73l+iYrgEvgSNSkyuVU
 Y5Lknbp1k0TaZa9rXfX6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bRXDiYYwcJQ=;C0jAyzQn5x/JjZ+KRQEOKGWmt56
 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
 jVxM/wjNp89gsfpAcM5vFQqXPg0/Bsf9H7SHn

Hi Andrea,

Am 11.08.25 um 16:46 schrieb Andrea della Porta:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
i'm not sure about the whole driver naming. The cover letter describe it=
=20
as "pin control driver for BCM2712 SoC", but this patch is described as=20
"STB family pin controller driver". So as a reviewer, I'm a little bit=20
confused of the domain of this driver. Is it for a single SoC or really=20
for a whole family of many SoCs?

I'm asking because all the other BCM pinctrl drivers are mostly SoC=20
specific and not really general for a product line.

In the former case, I would expect a driver name like pinctrl-bcm2712 to=
=20
make it more clear.

Best regards

