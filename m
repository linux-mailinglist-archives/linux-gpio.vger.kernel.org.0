Return-Path: <linux-gpio+bounces-30028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7456CED75F
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 456AC30038F8
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7491830AAD0;
	Thu,  1 Jan 2026 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TamhxSSL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348B1282EB
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767306927; cv=none; b=p3q8LshEc2UwEpyz2yHr5Hp4g3rjkZpM6ZjWJhpb0dJH+XT6LlQ2viwNf2smG4TW5z9nYpCg6OOa8iZImmhfcoRQoWa+oE4Lbr3iGOKxoqc7i8LdnMc9KaEiUqzodeaS7soqiy3ILtHaQD1C2XiRb+AZcZxKOR983VMEbF7kDIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767306927; c=relaxed/simple;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kn3TGuTH5jfLE/kRPkC14QTdMSlBzgGqnvGeGIqQCpptafdMfM3gvtwUWkUsyDZyqs4vtseLWM2n6z0n6jh5Olu2y8Y3OwOhX0ItUs9Dr63HXxGh2eAjODEosxotTm+cX7uHWRfKrUObmIIPOi2R0bbR8K8rPmjBOfl53t6c5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TamhxSSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15935C4AF0C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306927;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TamhxSSLWIOQnVFBB+j1xRP5/0Fc2qml/H9hmn/sRwxOUNMOPZaCOqCscVhB+1UYy
	 TMg0pZ+LKEaH0bFuNBbtzv7tTReSpQlHlrNKLEzWH4THopRGFpKJFlcmQnbW6+BOPv
	 duJoNVJSJsnaKfyD62ZZzg9biYWkXjYLrsoxCWk9AdrG4ZLO+YrO+yitM/GTx0Lv9Q
	 ctW3z6Jss0MV5cRnpcYNa2FWaSRTOoh8TECiSyT1Z9sEDvccbPAX3MEksTrxoyUo6X
	 e0YmE/TdtuLVpv+pLnP9lglEnZt0MlvTtc+Iy3KkO37NMKXzbmDGN8mHbdfQIVImCL
	 dFi7Dt8Nf15xw==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-646d9eb45afso255617d50.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU55CoT05VoJ5+bUQFosC9lmGVweLnVQ0CfupZdMMxwhlUNAHDAuasKrT6TsL4C/2lt91PfgRBQL0VE@vger.kernel.org
X-Gm-Message-State: AOJu0YxHN08GK1eUvHAlCs65Zy48lTYPimIiphCQeL7oSivhbM8HJR4s
	LH1F8xsCgx/Hqr7XLHEopHEmrIlmaLbH30JxCHT74WU3838hyYXN/fOOdFiu7yGgdO/4cXFjQHT
	4rkwVQr6eK2kNOPLPm4+KblqX9+feDik=
X-Google-Smtp-Source: AGHT+IEeYsqPV6C7f4vJ/O868DjdRj8egVDw87qil6wCyQBZLNxaoQ2yxDSsZp3aYoWeqUg+edGFSQ92tz57Fm1YugI=
X-Received: by 2002:a05:690e:13c8:b0:645:53d0:2d20 with SMTP id
 956f58d0204a3-6466a8bfd42mr31278495d50.62.1767306926398; Thu, 01 Jan 2026
 14:35:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com> <20251219-gpio-of-match-v2-1-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-1-5c65cbb513ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:35:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLn_aED4koAz-4+v-=e1DK2uZwBvLXAEC_g+PYTD1qk28Q@mail.gmail.com>
X-Gm-Features: AQt7F2rtDNyDLbQCzYXEsAv_emsxTb9NcgwKtFoou1KzZzvhme1jN_YZGGSmW2U
Message-ID: <CAD++jLn_aED4koAz-4+v-=e1DK2uZwBvLXAEC_g+PYTD1qk28Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: aspeed: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 11:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

