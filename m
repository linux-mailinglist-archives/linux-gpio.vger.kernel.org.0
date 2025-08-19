Return-Path: <linux-gpio+bounces-24552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C6CB2C38F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B30722BD8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E913431F9;
	Tue, 19 Aug 2025 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMJtx/vu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC4A3431EA
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606085; cv=none; b=KLYL2SJ8UZKVVnMiBVcB1HgYYrPvpO9/zQ43VSgfg5ytTXg4NSBBvNosBRj24jLrhTAJHPMzTQvqVFY+3om+TzxcwBtdlCq4uZmrNU1u96CD4+BCi6brwRokDfYw/OmvPfNzZq088X3iflwqBfjJ6JCLxMrOMc87Qj9hrCjc4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606085; c=relaxed/simple;
	bh=du4ZhCLp6jwzz1WznFiWC20I7LWdN5CARyDoG5mPfUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFSpkUIlIWyvW6FyNW3hSCLOdfzoPKESEpaVoV58ZjH9Y4wOy2cOI73RLl1r6wVIa0qRjr2CRCBQxdzszXRuSUtak0sr781w3gpTLRCNMlGRLArP+PvMzhWxydeqlHlmB4W0kNhVNS+jG5nJfcABdlSb9ge2+J+aBZWrnecZR+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMJtx/vu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-333f92cb94eso40539741fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606081; x=1756210881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeH/5E9EduNToqMljlnTlRgquiWKLO96iiPG3OImUmQ=;
        b=CMJtx/vudOdYAc+kWgu64kHjCOQyCbb7NR2Tee/0CQrj42W1bIemk8WchLUNBgrtmo
         C96ZWVolF0kfo6UgxQrnzrfer2QF4LPXadWjhhGIHsrkbkO7l9hV3VI/cdCkKsd4srCJ
         YNyu95hgyj8ahat7avJY2pMHcAyAD3/gH0pZA69CcKx9p126DfJIteqp4nCHbzTc5umz
         5QbSRapAl6RNf/LBXQfd5aWOhxq9XbDf4Ri9HzjbcMtnJiE1VHqEtzDqEwot0gUQ46qk
         CndkyCYKAYjAF1/qLip5z3jyXvRxpB7MRQcnELUg0Ea9Rp801J2ocSSkuhubJImpmfps
         Vt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606081; x=1756210881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeH/5E9EduNToqMljlnTlRgquiWKLO96iiPG3OImUmQ=;
        b=Q+Q2CTWqz+6gNrTxlO7ZzYGh/FEmrZwTIV/S+S9uhY3YQwnxEI9BpB14uGNsDpfyZk
         dJYqfIX0pH3h2fLzdWwsB7NLdgkqq3s0pp0cUrBCp2d7532Eif/qHb68F5vuHl/jk3aZ
         XBXxQJHQ6FLZmz8o0/4bRu117HCDvBBDa5QCDF94ThNUk0TmOesXWep0wCoR3gzUhxuG
         vxdLt6B+ssbZPQ23Z0y4Vdx2huGZAqmGsalW0brsIuOeaRP3kjIvAdhEqx0gFrqDN2QQ
         qnlJs8/00n4i9aM9OUdLVr5bCbV1t7XThvyA9tTqD878Zd26GQmgKdqhUgyeOXQ2mj6E
         gYig==
X-Forwarded-Encrypted: i=1; AJvYcCVXVjWx475d9pUlZxPLf/EGnIVR1G86SSBD+a76v9Szsx3PawmEKcMb/lIEy/FUzKWOt+h+Iz780UJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEwHfuK6PHmq53/INJtBd4n7jarfiYccQv3mMPZ9vUrYb0E5b
	dxDdMN86tWf6S4QXohIISnhwJ2VnJEJZFqAs/kcKTyl+2HmwD8+tmhfBhSIJmRfZndvNPrbAYdt
	vP/w/9UAQiSrvcL6rkzHPKdxAnMYhD3QiOIS0fQbExA==
X-Gm-Gg: ASbGnctqqv+mAj8iatVsmrRpSKS0qUF/5mBLqbKMa4C+jfkUp5WXdf/IQ/76KzBqIpd
	VKCBFwZ1Z3p0ovfxC5QMeQLNJETjMt6ADcmsaaxkHr1v6kGIq+7piQcFbApa/NtKMuMfVVbJ2z4
	+/Bj5JDBCaPq33BFaytakkXQ4rj+jgo9Nz29Ik8Net7kijTFRdmvPxqkxzGTqtjKQtEmSFkk2sQ
	ZZi2G0=
X-Google-Smtp-Source: AGHT+IHeRrn6G/22XsZ1QiTrxbXODwTyBntlQVbiPlHb0TqImCDAlPIZxwjYQYw85X5R6vMRBa9HTIMznhFsXD83yrU=
X-Received: by 2002:a2e:8a8e:0:b0:32b:50c5:2593 with SMTP id
 38308e7fff4ca-335305cec84mr2984981fa.18.1755606081286; Tue, 19 Aug 2025
 05:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815022721.1650885-1-rdunlap@infradead.org>
In-Reply-To: <20250815022721.1650885-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:21:10 +0200
X-Gm-Features: Ac12FXxRmb1YwqQ6HwzM4AEiqQ6wLPibOkhxcYw04VdUzA3RJ_ksFtnMCiihScg
Message-ID: <CACRpkda2Q6UgmVjjCRkXUGPfo62SaOPwG-Bifwia-jYCrh5qCQ@mail.gmail.com>
Subject: Re: [PATCH] pintctl: STMFX: add missing HAS_IOMEM dependency
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>, 
	Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 4:27=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> When building on ARCH=3Dum (which does not set HAS_IOMEM), kconfig
> reports an unmet dependency caused by PINCTRL_STMFX. It selects
> MFD_STMFX, which depends on HAS_IOMEM. To stop this warning,
> PINCTRL_STMFX should also depend on HAS_IOMEM.
>
> kconfig warning:
> WARNING: unmet direct dependencies detected for MFD_STMFX
>   Depends on [n]: HAS_IOMEM [=3Dn] && I2C [=3Dy] && OF [=3Dy]
>   Selected by [y]:
>   - PINCTRL_STMFX [=3Dy] && PINCTRL [=3Dy] && I2C [=3Dy] && OF_GPIO [=3Dy=
]
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO drive=
r")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Patch applied for fixes!

Yours,
Linus Walleij

