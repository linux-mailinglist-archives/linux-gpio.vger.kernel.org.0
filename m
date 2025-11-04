Return-Path: <linux-gpio+bounces-28016-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF709C30974
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 11:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AEDE3BFF50
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 10:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BB72D9EE0;
	Tue,  4 Nov 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o+qO87oL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C82D8DD3
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253382; cv=none; b=r6MUNS4MTOVY17no2seq0nIJdsFyE6CkDGYqW+YRHjH8+r7v3jJJl+ZcEQPYvfKdOfVxU9XEqpV2e2ipzVAAuUvK9VgkqxFCSVSa2vSO0b8cell0dIAv5otwjhDtSs8xK+L31HRlcDouZL82XL8y3oEMF61JPSKl5sKEWP6qiF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253382; c=relaxed/simple;
	bh=ak9HRSabsPSc2sAYhp/DgmsudFPRzOz/MW27WLeWYw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSPKj54bDNZ9Jyh8C/ACSdIqSLxbGUtOc0J45Qwm332k7C3uE6nzUdmc+oLU+BB4at0A/dkFRMvwY+WSpArLKvjPW6d3hP2FjfZBI2AH1+vuSvpjfyYJ0o5ghiD5HDm4Vl8F/RHmasFrpCFRreDhP8Tmd0pT0066clNakNSwX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o+qO87oL; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7815092cd0bso73168227b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Nov 2025 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762253379; x=1762858179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak9HRSabsPSc2sAYhp/DgmsudFPRzOz/MW27WLeWYw4=;
        b=o+qO87oLjqt1HGXCIT4G0ktzVOXrDixA1IfDAkhH8tKdcYu8J/FZgETOWz7u86zZcf
         eey/jBIFshN5cltJ8pU4Gddp0f3/yLDIvZJNFKWWCh1ryqBiMtud0/QEuKwNAzv/lmaD
         roVZD/SMxZgWvHZHk5sGceJG0dMvtXwWeZu1DZ0+P/WNyP4azho7/BnyNwYxlQIDs3f1
         YYXLe2xWD+g2Mvd33nlfAkZEu8qhpOUw6akene0TqCxEfmAjMq8X1YZevYK5atHeFIR6
         AX98O9A6FOlGDbCbiLCaxFwngFaxQfOHNZhWcbFT0SO9FVlJURbAONLbtj9bMJCdkbg+
         gZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253379; x=1762858179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak9HRSabsPSc2sAYhp/DgmsudFPRzOz/MW27WLeWYw4=;
        b=GGnyeLYvTf601V+DIQbErkheRIB3KLQ+UwYRW3oE1XXVx4C0R2uvGTSM4pfWnK2ps5
         4+b9x1zdpWtZFV0cTWdlm3ZV6teSKQmEBsH6VkWtfR/AxsdkAhw0dYhz4ucftAyAANiv
         tXMj5z+1dihfHvw9hKS+ShVUdBZWcEBiYELK5yEY3T/29knCEdfMAGkq2Lwm4OMCM//Q
         nnl0Uvi22Dx+zjdrFfPnfNWzAg8ul1eU9zuX4R1I0LveskqcaVFNZXPku5c1MGXecoId
         lJG5LHbhz3Z8l2JpeLPPGc/OruRKq73Tv+u7kk20AcNCsyV+cIxDZlcG+Z9kc+bMnzSb
         OUYg==
X-Forwarded-Encrypted: i=1; AJvYcCVVd1dtb6qS+no3uUVAnUo7cvIkhiD26hXq6NTrF2silqd9OTXldSOOxXp6QDBEQVaGUO5sx/8vfMz8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yOu3XRkVEqx8MyphAg42vHUb6x2ChiERetHJASCQIxdL/OYT
	FZ7+z9TQ4PY2BoPL/sX35iowDc8aOrYovJ+DVNRXyBZ+7GBIN5dFYiBlOHpS8r2Yt+WOksdWVgA
	K5Pbd3mEEO7Dua6MBPFanpVM3moLx9F3ArQBObCCzWw==
X-Gm-Gg: ASbGncuw9252fp1R0kIbhpb7QzXzFe7UBgSxa3TdPJmXIEsyK9r6LIfxOAw/v3WxF3k
	pnEAG2ScnBAu2wSFeS7RrhNF9FpdT/UnPiBUx4Ndy4UD/Dle9LrW1SwDwMqaUM4+1XPmj4x5Ql6
	mD0GDhJ4G38cq+QsMPnL/oa3FdHVZuPz0+x7e74iYvrC/H/BGxBnOB+kzAi1zmdOOzHCh9azrF8
	nPV8VoFuDCpRmY231jS7sJOmQRp6xYxI3CZVZESZ8sfZpKVknsrG/pwmY9u
X-Google-Smtp-Source: AGHT+IFkRk12Uz8wpzuhpMIHhTXXbZyl3DIW8r7FnluskO/7yYtfMjAEvExmUGloPG75YUmDMmv3zjusyYiPuTnpWEU=
X-Received: by 2002:a05:690c:6ac8:b0:786:68da:3f4b with SMTP id
 00721157ae682-78668da4023mr149747947b3.31.1762253379370; Tue, 04 Nov 2025
 02:49:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028061345.3885632-1-gary.yang@cixtech.com>
 <CACRpkdYdQa4=4JvBWJcRv0X_A0PnkQpZQQ8NTPzF0ntdt9qX=A@mail.gmail.com> <PUZPR06MB5887C2D161EA5CB13A41462EEFFAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887C2D161EA5CB13A41462EEFFAA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Nov 2025 11:49:20 +0100
X-Gm-Features: AWmQ_bk_lIuQg0K_Adlxvvq0mVAjsPYqUJ9ljmVmC85MrC3marOjlEWPUkD0cB0
Message-ID: <CACRpkdZtQkbGnQtb3DZf1XOVpbZgnBbqZD3kxEuCCAS4Pm3AGA@mail.gmail.com>
Subject: Re: [PATCH] Pinctrl: core: export pinctrl_provide_dummies() to fix
 build error
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>, 
	"sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 4:35=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:


> Generally a device may has two states: default state and sleep state. The=
y are included in DTS file.
> So DTS has two nodes, one is for default state, and the other is for slee=
p state. When the device works, select
> default state, but select sleep state when the system enters str.

What is "str"? stand-by-retention? (Sorry for my ignorance.)

> There is two pinctrl controllers on CIX sky1. One is used under S0 state,=
 and the other is used under S0 and S5 state.
> When enter str, the system enter S3 state and S0 domain power off. So the=
 pinctrl controller under S0 state is also off.
> The settings for sleep state are loft and make no sense.
>
> But if we remove these settings, the pinctrl can't find sleep state and c=
an't change state when system enter str.
> When resume pinctrl, pinctrl core may think state is still the same as be=
fore. So the settings can't be applied
> as expected.

Aha!

> To avoid write these unused settings in DTS file, we have to use pinctrl_=
provide_dummies() interface.
> Do you agree our schemes? What's your opinion? Please give us some sugges=
tions. Thanks

I think it's fine to use the pinctrl dummies, I will draft a patch and
send so you can ACK it.

It's fun to get the whole picture of how this works on CIX silicon,
it's a new way of doing
things with two different pin controllers so I haven't seen this before!

Yours,
Linus Walleij

