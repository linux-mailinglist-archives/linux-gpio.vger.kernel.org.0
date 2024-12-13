Return-Path: <linux-gpio+bounces-13845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 417FC9F00AF
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 01:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFC3169A7B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 00:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6E417D2;
	Fri, 13 Dec 2024 00:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcdQZCWX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D3802
	for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2024 00:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734048927; cv=none; b=DW7SVNCGZ8pMHJ97QCpu8PkphpaZjmmxOyh/hV7u/n/rLROThg3HuEfAwcqdxBWyGeUCGCDI6TrKsTvbuuLTsuEtjB/59k0JS+NxoPs4JUGTkLmctBTDlyPHLDbJLWGxSwUtlGdfo6uqrXy1IIGzyDznm9nr+NG9/QdvsaT3Wvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734048927; c=relaxed/simple;
	bh=vQLAAHrNu8HAwhOxh+FkpsYtnnkpXPTL3VdKn+y7R2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irh1vzqfA30nulD+phlysZjAHs5WFDVbiPis6PYGqaOZk8/TWAUP4cBupmEidu5R6e/F7Ly7D4Ot3evOwA/439v3WyfARR90+3tSBLgoxLRYIe/i5hqhtTuBZ2NMhZoOgPXx7kYLWTRaD5VviufM96ld+EYmKYTXhqVD9II03hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcdQZCWX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30225b2586cso23110481fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 16:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734048924; x=1734653724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQLAAHrNu8HAwhOxh+FkpsYtnnkpXPTL3VdKn+y7R2k=;
        b=gcdQZCWXsqCvEfKfuvh5nFAH7K9UBZY7DAWuEEWmlM+YGuD0C/xUdXWp6rCOH42AQA
         Gt+wWxtDxMVKn3TojU9IPPFkgfnu4HyHUubNKvqGC51l7MSZZBrsMowx+M7H1tIQMTb8
         TCv1oawCTX26XR4TbAeodC5OBWoTr+mfNKawxGcpF1Fjq5FpPaEsP3HnxLva5QnMRmUq
         IVZtUX7FMZ5pwthftWR7qlLI3dnBJm/ze+oLK0lnlC7NBxC2Hh7rVPf98DfFWSwNBDqw
         lTDPpnf4zZYZtMUHkH19Gyuf2Ow0NOXj7Zn+2x2u7vVEUNlsp4T9EknxBlzCDFuk6biH
         X94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734048924; x=1734653724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQLAAHrNu8HAwhOxh+FkpsYtnnkpXPTL3VdKn+y7R2k=;
        b=OgLjHdwkY9WW7bihUM3f0bfZYH08a7YInwjZWCWeTqsdXtBb1IeUtbEp7H2oYvTZXO
         MR0rQb4MJK3DEcd4PDJ7LsEz8qoYqHxgqPuvCNInH6LDviDFKDJlR5SRAJLDPpANFa4+
         ZOFB2DvNYm4gZUzji78qpsW8zKjiSVFjj2B8dSsZMutCFwn2U1Z4o69pWS7hpZxDKMOy
         o5Y6hRBv6Vy0Pt9Ou3KUKrZDyan5UBJiKGLdtUZpsTevIeKaMn8OwN76CZWgj5zF1T5f
         BWu09rBIjsf0CT6Qcg0tSos90G8AGxAYg6mXr7brgW26ghOZZnFJJJ6Ay4Kv5Hl9IDrc
         anrg==
X-Forwarded-Encrypted: i=1; AJvYcCUmkjaNkHYSNWc3Jy7BRlOIeIO9BHzxC8poUe8GeByPF6p15HJy4ArfbLdVogooEPL788AEsoQveqGa@vger.kernel.org
X-Gm-Message-State: AOJu0YxHWghYtFNJ7WeqnBqeTCsIuxbJnNmPMrycAoGsm/xPSONWCHDr
	p38D7kNvc21Wi+Bc1z+ejVbh2gAaWB4YcoKl0DjFvKLKLBhpfc+Drt0gBHUhmU/lRDl/fZ+lVk7
	ynalNKzWTWB7E5s2FMysYHdZEuJlDeqQRQH2QMg==
X-Gm-Gg: ASbGncsbM+p8r0HCICvJPqc6MRTZJT1MYPaaoITcAhNJkj1Fq6kZFvwqvXSX/rPGtme
	th+biLkjhilHSuGAKIgGl2KLc1cEdOMpo65FX
X-Google-Smtp-Source: AGHT+IGto+HqauyF8o2vgmuC7GK7AZOSBMmGgSe13yKc4BaTYV1aQRpsIlQvUoBUfr6hPCD6cUt2MwGevF3QkBLKPeE=
X-Received: by 2002:a05:6512:2396:b0:540:2de0:c363 with SMTP id
 2adb3069b0e04-54034260c67mr627269e87.13.1734048924079; Thu, 12 Dec 2024
 16:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029012312.3448287-1-unicornxw@gmail.com> <173395639623.1729195.12285623767079173929.git-patchwork-notify@kernel.org>
In-Reply-To: <173395639623.1729195.12285623767079173929.git-patchwork-notify@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Dec 2024 01:15:13 +0100
Message-ID: <CACRpkdZTrb-CYtP7Mbdon-BdVWxtByJP2M0CegV_ikodJ-dXSg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for cv1800
To: patchwork-bot+linux-riscv@kernel.org
Cc: Chen Wang <unicornxw@gmail.com>, linux-riscv@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, unicorn_wang@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:33=E2=80=AFPM <patchwork-bot+linux-riscv@kernel.=
org> wrote:

> This patch was applied to riscv/linux.git (fixes)
> by Linus Walleij <linus.walleij@linaro.org>:

Interesting, I didn't hear about me doing that or even being
able to.

Yours,
Linus Walleij

