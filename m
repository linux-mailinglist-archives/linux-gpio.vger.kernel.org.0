Return-Path: <linux-gpio+bounces-23669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36942B0ED20
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20DF31C815BD
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D11827780C;
	Wed, 23 Jul 2025 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WF2Xc2ES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9927780D
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259160; cv=none; b=T5KGT0F5ERTHi440c1as4JYgKXeD7U8ZjU8GvnD+XdbcH0kTvJHyffO+F+4XOKB6khinpQcGKuYD5u3Lio7Ybp7AX1W/UrbIv0ePaxCa5rnC2ULS5PbrDV6HD7jP8lOaQtKJ2dPlMSqd4ZliMTOw8IknljsHwHA+7ty8Mz/07V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259160; c=relaxed/simple;
	bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsd53EtDroOfsRQrQzCqCXB66SkQUgGuR+QgTAcNCS21rLho9M40A2NUlBzajtvVTT/qYk9XbVS7Xw4P0dWh9Oxs/ILgf266RnI+YCREb/jiEQhon/Qm67y9M/yTTrZ+gbzEFNpB9QHnfYvnfEfQzVsuAyKfeFJy1A6oY/8OCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WF2Xc2ES; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-879d2e419b9so4201140a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259158; x=1753863958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=WF2Xc2ESZUXC3I4997szY/O/Q2b8sQFJDwGqigrANiJNjwrQgnWk/KgiUjPftfzFf2
         YUADAbu9eIdyFhPrkqBiefiC1jjzmUhXODL5cM5E4M+gVRXQLQJNJCAbF5LQAI0FEefj
         q8MxMVO9ld3BbUf/aaJqD6gt8F++fbHQ/OBNzs7YGg4l1EmRhzW/YAVxoXGzw4MRoUre
         7p+327nZRUY2hjKCflgCpBZrPK8JaJWKKILr/859g7GVsWIzAzbdinzhOLaP/UOkmAp4
         W3o0M+K6QAVSrxdF8uS6CNj2+NiV7wNwVJnNH7YJrUx58XVYBith9M8CmJspWHHkuxPW
         E44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259158; x=1753863958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=VpFu52AqFt/hFm+qOrXE5Q9XcXu8jkyxROi1xZIEpLfa/nHcSbW+tjB0zpbQQgnh2Z
         40qUlspy9Dpo4VArF/iqoZ9C/ubC/hWyDgCKcQaHY5m8RvVzjWAPlPrPSvZSpfUAwYpp
         35xHOglph28/vznZoinmtPYuxODquuva9LyoMwgGz0wOb3W0vJ3A/yl63fkuNyaxJnIx
         tzqlG6+R1ciph2idsIH5QrAO2TVGRrdmLi37OALEAJL0PNZISFfwmpINH17l8DWeLu0d
         7kSzSxjuPk71arAhFLt5NI5EplfnMDxnhwCNumy1PhWfuizomNxgkSbCCLzb2/kRMOga
         w0CA==
X-Forwarded-Encrypted: i=1; AJvYcCVEmIVDfeC7u+L713MVnhJxF/91wwFTNIwWmdFNTTUvIGnoNc20hm6lRYQcm4uHvpc7g64wdAT3226H@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ5gXNxRF3EkNlq+OJjnusOSfUheVLlISIEaiTBo0wlK2r2lFy
	d5oXIUV3VWt33UXT//M+qkihAzvGJHfzd/Sis9XWADCX3qw96gctG08P4KQRtbYatunpVt5LCoS
	EZX9bVCSV6Kz9olfWdSBWdNMtdq1bwEZCxMZYqFoMPg==
X-Gm-Gg: ASbGncuubm2cOxLuwLmtTEPiSucx80Ad0Lr5otHVjdM774rE9VMJlU03ZttS+OGl5jH
	QIdyGzHxDRttJAuo3ubofGS701DG6eHxug/mVXZqiYb4taFV9dgT9lHCvZMFUZHWQS+oNzV3fGK
	BiZCztf8xdyIxRDN2UVgf23XT1clewAO/0oSm7PfsJ0D9sirbdzyPMt+rj25L+jtb0W8DrFG3zv
	12j8lwO2Mx4JRjD7VYPYNO6MkaVTmA/Qzp0z6Joxtti1GNm
X-Google-Smtp-Source: AGHT+IFzwCafFosCdx131zbcEFY3D64m+7mo0loj5vAsYVkMFUgy5UAHuuRGjg5yAkxctR2cI5zO8+e+kqhHgdsFxCw=
X-Received: by 2002:a17:90b:53d0:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-31e507dc7b4mr4498294a91.24.1753259157929; Wed, 23 Jul 2025
 01:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:25:43 +0200
X-Gm-Features: Ac12FXyLbBDcOzrp8fBxUqR9jIu-gUOTaGAF4LxjwERQBqGacqdoGbliH_T9iv8
Message-ID: <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 10:16=E2=80=AFPM Harshit Shah <hshah@axiado.com> wr=
ote:
>
> -------------------------------
> Hello SoC maintainers,
>
> This patch series adds initial support for the Axiado AX3000 SoC and its
> evaluation board.
>
> Change from v6
> - Ran "b4 trailer -u" and add reviewed by Krzysztof
>
> Add soc@lists.linux.dev in the to list and send this series again as per
> suggestion by Krzysztof and Arnd. Thank you.
>
> Checked locally and able to apply these patchset to soc git.
> (git/soc/soc.git, for-next, checked commit: 7dfbf3176d886ff9a0c7786942d3a=
89809d0641e)
>
> Sorry for late request, please consider this series for the 6.17.
>

I can't speak for the rest but do you want me to take the GPIO
dt-bindings patches through the GPIO tree for v6.17 separately?

Bartosz

