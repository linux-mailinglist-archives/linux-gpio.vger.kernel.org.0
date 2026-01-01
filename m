Return-Path: <linux-gpio+bounces-30031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A033CED777
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43E823004CA1
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598AC1A9F91;
	Thu,  1 Jan 2026 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kl4pgeQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D171C3F36
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307028; cv=none; b=XWn1dU6DnLhhQVaxn7WIRFW+raGIE6chVxN06l92IH4EnMHzWVVHcQZMIvZZqWa2EfEbHesnKxVFh0SYMz/PAaIBqz0MpwHhDKmJgt5sTB/RWyOVI7hUAXNhbAaClmjyHypk7CFisg7Ul6IXRoYS30LOUgCupArviIafNryRTAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307028; c=relaxed/simple;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lp1ynXdjdgW5BzBsyul4cldT1apHQVXQv2e+tfD9qZKe97qAEdXS2VSfTM+F5INUl7xNxTE09PWXyu8yFmU4Sq21UnkYyYIXdNi0lEQ1XEQ9neVCIP+X7LxWFvD+qRke71ORerPjA2iwfnXMGc6wGF4KmuzjHxLAWfIeX+D8hKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kl4pgeQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5A0C4AF0D
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307027;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kl4pgeQTMcNieDd0E9vjK0PVEZAl50YBJtlvRVdNDWMxg7YN8mqBWtoYLiY91IMRi
	 BdXVr1OyKkuUtXwyc9LJpZtj1d6UUH/o8Mg6pvaHUk+5Dbex2dmg5YHvJp42+5K4EP
	 pB2Yv6wpLhNBBuu9UBgbxxW8T8hCh+NS/C1Wbr/xVwmfm/re3MF43VA5FptGVfY0fa
	 UIa3jTgCrqkr6g/v4LgRdhf/+L+Yp4SYf+V79kXo7SKh4hZRaaHQOEEI76o0bm+Z6O
	 WeBWvuD+es7Z46FwOPh2OmjYP2GQzdh1XD5xyydWSA8e6MwSjpUaHB7+Y/yOY260YL
	 8Uz4Jv4EQEhQg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7900ab67562so45980187b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHKPTZf0xXH0W7oAjAcOfXodt+e1tRHN7QpSAMrXkuBEUx+BOAW1wzSqG2C4vq2BI/OCIuZjMA9kaG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TdIuK3bcfNXUtBJzC3/i1icws0dA6o5+61MtnnLABs9s17N+
	dPu5mN6aHH2tlh7UhtlSQjuklMVQy3d42o8XOTwkiH8tRyyqRElxe34JPbUCBlHEJ6kw58zYnht
	crwRvXErxYwWHzNo71rP9dJyxEHqenSk=
X-Google-Smtp-Source: AGHT+IH3rHX+MO0pndYIAY3BMyel2/PmtkDfaZjjQgMxYMPVkQt2SYFlCdvDRxCbn4W4GcVq5UmB1hnOFsctyFssdo0=
X-Received: by 2002:a05:690c:6f8e:b0:78e:1aa5:e970 with SMTP id
 00721157ae682-78fb3f5c183mr344105557b3.31.1767307026776; Thu, 01 Jan 2026
 14:37:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com> <20251219-gpio-of-match-v3-2-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-2-6b84194a02a8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:36:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLnoxse5RrX0-m3dNNa-B_h0yHCw6H24H14Dkts5XwYCDA@mail.gmail.com>
X-Gm-Features: AQt7F2oRBtplfDlu9a7oL72YgDu3OW_f7prR_jrtoZC5RVkWzk3Mu6ddY4BWlD0
Message-ID: <CAD++jLnoxse5RrX0-m3dNNa-B_h0yHCw6H24H14Dkts5XwYCDA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: creg-snps: Simplify with device_get_match_data()
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

On Fri, Dec 19, 2025 at 1:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

