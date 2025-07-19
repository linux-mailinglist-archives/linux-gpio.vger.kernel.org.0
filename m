Return-Path: <linux-gpio+bounces-23512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938AB0B0B6
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 17:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842F1560F20
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 15:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C97288504;
	Sat, 19 Jul 2025 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebKgJs54"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122C02874E5
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752939728; cv=none; b=dGs3ORTXjVkO556CECzHGKwQql5+rgHJp1FiyJ2fl3NRBmhfEwurRIFB1kR8dPqR2cIqpgzrxvrc4hvXvwbeVbYcDFuqemx7ZS8AVFDiSX1sx5wTmiGFVfOhLYkXJcpNk+1wmSD128OVtKJgBeMLCo4hG/DH98rTLQ6M953Tb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752939728; c=relaxed/simple;
	bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBcezFNxUnNNKQd0PADPpPLkHK2kVDGUzHoczPSrdPDCwD/lWaPiGS2M0Tcuz4z0DfSV39px2US3mM6eMIuBMe5DoBTqihUKtbVYBqVhy+MCfbaaGSn4pfreALyxSRDzPVvy305AEbFRJHbCyYBeUg5dsP3dlUVkgIUepg5FYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ebKgJs54; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so27110831fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 08:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752939725; x=1753544525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
        b=ebKgJs54pJ2fab+5VlnaUg/5Bojl+h+Q1zvBui86qYGWpEGMsYNCC/f+LESEA9uhM9
         4ebh1vYN47hGuPGSYW0cydgVvchSD/ceo6AuKz2aNeevZFGQzqst1lL5Zh2BFZTIBWAA
         jiflfmk91dvsQrILf7YPxK+tVeNXx7pQh5tPrRVhYulTUcFkQbhJ6nhTETNEE6WNs00e
         ArEHPYsaobCpOHISSlGjOfQQbIsK5x2w1cl0CyuiYt8iA1gUY6WzxaYqEVVqU1A6dSsQ
         pIiVypiiB8DadSHRO53FaKDf0wEymKRk5VbK5sAYXcYy/V9cIw7FDLkQk64DMkNqNmlU
         32nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752939725; x=1753544525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rn1nnfWM5bSta9/PZz3/I1BzLdbB7ZlLj09o7IEgKVU=;
        b=UyFgWw/xckultn6bPgp/tdOtwAA++o+/SQ1W7lx1YEKU6Cq0dBuZp5XLwdjo92URod
         tT9YGvZyDmMrB+8qhnkvfWlkmB9bY2fLjISIBIR7BQllmN3p25GHfcAIaRtoRxhnl1rW
         3H/rwA77lmWnBzctivNxZgYqSF6ygVBrACeyHAeGVtBQnYUHyM650QlO5vDipyuTr9R3
         NM+dMG1TyzpxiKKLepVf8TcT7yBCjk9CD3jHRZtlg38/G0UbMP+Mv9Uzd+TmL+VCh7io
         26EDjPK6PnGy9F5rNnrX7sEyW8jskUOLn61eFpNX4h/1eTYHrfdMa9LqcXxBVPqiT8Bs
         YMZA==
X-Forwarded-Encrypted: i=1; AJvYcCVB8ap7mmxW+7YGe68IOU2aAFbSO7GsqjBDSVWY/NikZ7EojDFR3md0GMOKtXc/hzGhbxx2Ol0Iu9rC@vger.kernel.org
X-Gm-Message-State: AOJu0YybYjlc7YvTJXnvNNBOLCv2SqmadxTQU1LR6vO7EKA1zk8A/nVX
	CRgZWKGPPya/taXsZM115D97m1GHkwOZ+bLbkXLWSmQCtcUCQ0EmJ4whnXfxoRrbs+P+qWs1Qy9
	XWE09AaU5ueLabr7wf8xY0zFr+5Xd5cycwjMEsMM2Kg==
X-Gm-Gg: ASbGncvGcYTSTIqQgJDBZAsLSL1gGFOrng8B6koqde3z4hWKoR4MriNSOAT7EHbONFj
	HJ/ZtvRTSMinbbOcMtVbXbMxy6udzqZ4feg6n+Z0CLMWdd72gl8o9NDzHvQJ7QSEBiM7hmlSSIZ
	nfWaAmfaWaqpRAqaMgiV8J1k39yHzaIZ38lKGqpktifdmysa3nW32EvZXd253oExCb3I580TK5B
	MSgncM=
X-Google-Smtp-Source: AGHT+IHz0AgUzYYyokGlt/TZ09DPKHJYVrOty6k/FTgVY5vV1r1KxHh9aV72LWBbI4MCzMrbevh/6hzgi1HVNc+Usj4=
X-Received: by 2002:a05:651c:54d:b0:32a:864a:46eb with SMTP id
 38308e7fff4ca-3308f2b7638mr46687401fa.0.1752939725118; Sat, 19 Jul 2025
 08:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-6-556cafd771d3@kernel.org> <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
In-Reply-To: <8f9fdb3e-9655-44ce-8a2f-c1628c88c929@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 17:41:54 +0200
X-Gm-Features: Ac12FXwAlxaX4ocIXQ1MhtIhdmA9pd8x_pk-4cH3CUUGhFSCjbZy3REqIbEaUb0
Message-ID: <CACRpkdZdz7eHVjgX-X_UwjJ_qSu5hSPeocuQ9DWSiyjNLU5AmA@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] gpio: Add new gpio-macsmc driver for Apple Macs
To: Sven Peter <sven@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, linux-pm@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 2:59=E2=80=AFPM Sven Peter <sven@kernel.org> wrote:

> top posting on purpose: are you fine if Lee takes this commit with the
> rest through his mfd tree?

Bartosz should answer this since he's dealing with the merge
window for GPIO, but generally it's fine, and it's even using
.set_rv.

Yours,
Linus Walleij

