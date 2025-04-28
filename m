Return-Path: <linux-gpio+bounces-19404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B7A9EF79
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 13:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E73C1A8123F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 11:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4E2266EE8;
	Mon, 28 Apr 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsNvLvQ1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46047265CB2
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840350; cv=none; b=ScmTNxzzU6ILPO6O89gFrQavJL+QLzBBf40C3eFL0zpggfMpLUoet3e6qXht6SFU4OaUGNKRC+JEh3eMJSiqUkarQGoT9Drg1S+Oal257RbpCEno0liRlf/LUH2DZKjXQInOKMuj7zeicC1TyVr5xBylwNgHZkZ/5Acr4QP31rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840350; c=relaxed/simple;
	bh=r+bKtVRMoREgbBikFSIQumk3XCPBbJ1IWQQriCVNGRc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jg2qCyTrSHNYo+si6qjnTpVSkXFBYhG1HlXyx3c7AIF6eyzW4M3MvPvFHuhrkzQxY18ZEdFQrM/2uyiVhHcEMerVolWRkx0Fh8PQuhA3OZC4v+uvEG1ZhzmFTgfEXA2PouXEHbLaZBFNSdWF92zdlD0rWyoxc6uV8J/8qF9lIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsNvLvQ1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so1098654f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 04:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745840346; x=1746445146; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r+bKtVRMoREgbBikFSIQumk3XCPBbJ1IWQQriCVNGRc=;
        b=TsNvLvQ1u+UXkVCmI1VitBomvGa+pCVfZhgyAnXLdyFEdrvqzwCP1wLM8lnYqFGpsi
         kGH1VuVd8MvxqP7vW/fQq1Jv78my6C3QnMLKDzNhb5XrhPXl1UVgBcUbyYX+VBz4j3Ry
         wHsxsE3EI1RjV3XkttJG6J2L4d4KUQntuQG3J8C0g7e0LYDAPcJlYTJUKpu9le/IpwmQ
         4rgwg9vmENmO6eWNMbZg3phpcgtycZFPQ0/CrYjtl2DcP/5rg8QZ8Tyxechz37v9Ozi/
         DQOufDDHzwCwWx6kh60N8DFV6lTj0L0Ej7PEOpi0kcf4yGU+/P0RTxSkFmoeJ4R25WgW
         /IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840346; x=1746445146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+bKtVRMoREgbBikFSIQumk3XCPBbJ1IWQQriCVNGRc=;
        b=aB7tpktrLjGYavtSWA3YcHs75rXxMNys54pdamyV/tx90XfIfenMvSKKLwfwbxEwpB
         1dNZFVe6KlAwjxdzrl9mJ3sEXqYFfVpH5DU0b62u4oBOV1Rz6J4d8B+vYFd3zYOeVr1p
         a4ykjXz8P1txqRRMkzFkmPm9+AbsGQ56IxJ74tp6Xz8r2tyHzBbmCi9SEPW0zfsV/gOr
         IM9ke2Owi4oW0A8C0KodyJ60TWHQimHolDHxlgrpesPF9p895dhZLzLnWJ3m/lFxoZWX
         Varec/sjQ6qlKvxvZr12FpvNYwgLp5QFmN2DckNWzQUr+6FL27V5lQivktMoEREUSrTy
         2kYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoalwFFwmCfTVtPTeer7weQIqxVLG6NHXaaCQI27zCoX3X5BthBish7LOnH28DdBlw35bLngx3FOI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxtKsDZGw3CvRbJp3hgDBv2xWTu2NprUy2qZ41Tw2GFLDJzxuJg
	nfNPhY1RcbdrNyRt/G6kBbdq44CnWPw2L7BioOAW01hQUBRFRT9/ZZBPRaeHR/0=
X-Gm-Gg: ASbGncsokef0LeZvtYLFEFBfNIxm0GQ/nHVgo2Vx3Lq0gzkpX/0hHAd6oyS9+YZxRoW
	hYILRWtMhrTMEUsaN4HE0KUbF/4TGH0r2HbsLIlE+6+kRp9y0QIf+Mqm2bE8aGCnqpzw2clUPUm
	SQjV+Vseg1gy74/B7tDsMbb8MSxAlfsSi7cVpktP+A80KWg8gmVra7DsroZEei+mpywSf4E8LrL
	BwtrRkRnyb5Jyyc3l1zEHxuGJ+a55NFKTKVPJ+V7MP7LLdkbEdXlPIHScXKudndPuSOZBiz6N3s
	lcto9vjtMwml8KWCv1jXjOBYP9fRaMpVlf6wblrNKYqF
X-Google-Smtp-Source: AGHT+IEHc9Zu/+wGVNqphD8k46BwlK1q8MygLAL16FZGjby9AUt0bgrJdeoGeu53URCQ7olNvcu9og==
X-Received: by 2002:a05:6000:1ace:b0:3a0:8712:5983 with SMTP id ffacd0b85a97d-3a0871259cdmr1278905f8f.51.1745840346615;
        Mon, 28 Apr 2025 04:39:06 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d495sm10655161f8f.2.2025.04.28.04.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:39:05 -0700 (PDT)
Message-ID: <4ab9946d0fe17c825657ed04f7d76047ac7f8167.camel@linaro.org>
Subject: Re: [PATCH v6 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>
Date: Mon, 28 Apr 2025 12:39:03 +0100
In-Reply-To: <20250410091924.GR372032@google.com>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
	 <20250410091924.GR372032@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2+build1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2025-04-10 at 10:19 +0100, Lee Jones wrote:
> On Tue, 25 Mar 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Hi,
> >=20
> > This series improves support for the Maxim Integrated MAX77759
> > companion PMIC for USB Type-C applications using the MFD framework.
> >=20
> > [...]
>=20
>=20
> Didn't apply cleanly.=C2=A0 Please rebase onto v6.15-rc1.

I've rebased against next-20250424 in=20
https://lore.kernel.org/r/20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.or=
g

Cheers,
Andre'


