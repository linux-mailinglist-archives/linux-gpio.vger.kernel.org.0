Return-Path: <linux-gpio+bounces-16157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DAA38747
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 16:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DA8C188C7C6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 15:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ADC2236F6;
	Mon, 17 Feb 2025 15:13:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076AA153BE4;
	Mon, 17 Feb 2025 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805190; cv=none; b=HCbo3NkZRyqpcZ06CMqTQhrYNvPGBwxL8PX043W233R6dz5q+lmoKeUSSoA92AkHipa1ScLZne/NTKtlh04B0rvt+aMENXRS8XNj/xVu18dyf0iML7pim1n+G7YX/1iAk3XRo6XSuhkyB2SEAiLCwz5+qOhOtvUWBmoti85sduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805190; c=relaxed/simple;
	bh=WqBPs7TXi1TZ+t7BcT1Oc3H2Z/zeW3wGdbgAmH8XYY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmYhFlfJvbajH1Jehn+H57B8onXGPnNwjfx4vwD+Stlen0J8ulZLvA1Wd6jqju8ppN3zL9wFy6nTzSB6TXJrMQ2I6FOAIzPKdHvDAbOgEPTOSBr1EB5a8nGAl7C+ux+lemZ0PAw0TwLrasFNh+i0UV3PUPegnvjVHfTbHfWGeP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307c13298eeso45966241fa.0;
        Mon, 17 Feb 2025 07:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805185; x=1740409985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqBPs7TXi1TZ+t7BcT1Oc3H2Z/zeW3wGdbgAmH8XYY0=;
        b=SVE8uJBsU0Zcx654UHEXuJjlhT7obVYG9SzxDJC2mKch+k6P+Mcj/zzz3vOd1ePtNW
         llwJWbBjWRWtlFgpjaYDvNx+iQDCctyC1iTGvD9FS6B+nPrO3hQ9PxqFwqWclrTEJXwl
         dSiVI/hq6ssrQGJbTuxVuevcuoUBfBDX/fpRt0WPSjJmTaPZseBsrl0DMdOMXFV09C0G
         /3SA8GHYaAmKJikSSrVQ+5/gHCQop0ABYvN7nUzU+hlGNw9bnDeOZdQ9omHEq5++sq1+
         H3zs9CpnZawhELpiqUDQkt9CJdH2N9em1XUv1cNuAhy/Nn+ofHfnVrZJjdW8085sZvjQ
         +A8g==
X-Forwarded-Encrypted: i=1; AJvYcCW+qD23RB3ZZRhiibbeoaTmR5c5B0EIyg2/sotN1utClgWWH5Y9p++RDlQDcFCljYZu/oL5CAFGCa90wGdx@vger.kernel.org, AJvYcCWCLW/nvU4xkj+D4KjanV4bftQDQjp5QJ477i0+JixTOc6Hasq45tOzsLQvmuxEexJwW7QdGeOxcfS8Ig==@vger.kernel.org, AJvYcCWm8ZCW36DSG8QPFcCXkmc5ql6pjx3ddTiLsk5SebWXVuJKLXzwI+8gR/BjrT/k5ZKGH3SrmfTN32BO@vger.kernel.org
X-Gm-Message-State: AOJu0YwpfMxs8/B36p3TsWGEPw/zMSDyIxxVs/uSpLBVacgj8FxReqer
	UToMUU8Bt1OiGB5pIb5TR/djK+L2u9XpsMOenE3s9vPSva4S/JCr4vJ5TYV0
X-Gm-Gg: ASbGncvt/yJWk1dMnTdDW99W4x2vDTmUP7FuRVzNz+qjJiFkxrzhSlCknFt/xekSH8k
	CGqZWThvr1I72Lfxy9JqhjDxjax4MCgLlfty8fAQdt51b1VSHeW08aZyiSivjoFltrVUcXpJZmm
	+lr/dd5uwHgWHGXQMvUXsD3VJxypU1vk2BbOOdkQ831D3nemxHWwqQXwCYe0dF+sR6JTAZR1uzM
	X4KPWSF5d3MZzS6jQZjtccZU6qkH97lncpVZAHEs0aKI2oDyHXP5cbBpS/qgv2VYpkRThdfClNf
	6W3qo8JvP82wv/mFo2VekGd669jDOtTSc7vadBRTmDPN1mHT
X-Google-Smtp-Source: AGHT+IHTsNMZxlzR4SEolEYaoZ1TqhJ/B9csMx4+jJe+ehMTAJFy8DTqIfDM19IJqTgBA1X5O7hjnw==
X-Received: by 2002:a2e:910e:0:b0:309:28c9:54c3 with SMTP id 38308e7fff4ca-30928c955aamr24560051fa.12.1739805185385;
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a27206f15sm6691021fa.61.2025.02.17.07.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307c13298eeso45965951fa.0;
        Mon, 17 Feb 2025 07:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/vnJLy4AD88mx+dUHOnVWzZWLu2yHq14iUPupGoijXs/hO9ISXn5xob6f32e4iLdZu/xokPz+1Oj6CQ==@vger.kernel.org, AJvYcCVokJRMXJYE6pk9FzQw7ZfFjd4Nj+99f0YJoxCBIGUkM3tiFe+/GqJYsjcP7VV37/q5Tb2oqv423Qkf@vger.kernel.org, AJvYcCW4dnL9qdUwx4UM9bWNhaHnbksEfqRjVTtjdIEcrOQC+BnABLbH21l6XkkRiWjJGPMYF82gQhnb7iNysUIk@vger.kernel.org
X-Received: by 2002:a2e:bcc1:0:b0:308:e521:591 with SMTP id
 38308e7fff4ca-30928b55670mr39756701fa.16.1739805185075; Mon, 17 Feb 2025
 07:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250214003734.14944-1-andre.przywara@arm.com> <20250214003734.14944-4-andre.przywara@arm.com>
In-Reply-To: <20250214003734.14944-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2025 23:12:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v65PNymVgAW5gJzoaAN9bCvbNrUPh=MOGT71wimkGnT8Hg@mail.gmail.com>
X-Gm-Features: AWEUYZkPH3DyqUAjqlsWUrgFVAz25I3j7gx6gVj35UBevzeFHJcZOXdE_CBm2aU
Message-ID: <CAGb2v65PNymVgAW5gJzoaAN9bCvbNrUPh=MOGT71wimkGnT8Hg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] pinctrl: sunxi: move bank K register offset
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 8:40=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner pincontroller register layout used to allow for at least
> 11 banks per controller, any more banks would reside at a second
> controller instance.
> When the per-bank register map size was increased with the D1, it turned
> out that the last bank (port K) of those maximum 11 banks actually would
> not fit anymore in the 512 bytes reserved for the pincontroller registers=
.
> On new SoCs Allwinner thus moved the last bank beyond the existing
> registers, at offset 0x500.
>
> So far SoCs never used more than 9 banks per controller, but the new
> Allwinner A523 actually uses all 11 banks. Since that SoC also uses the
> extended layout, its PortK needs to be programmed at offset 0x500.
>
> Factor out the bank offset calculation into a new function, and handle
> the case for the last bank separately. Since none of the older SoCs ever
> used PortK, we can ignore this case, and just always use offset 0x500
> for the last bank.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

