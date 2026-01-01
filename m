Return-Path: <linux-gpio+bounces-30030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA84CED76E
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2B8D3005BA1
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BF71F37D4;
	Thu,  1 Jan 2026 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6knG1Bu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472738634C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307013; cv=none; b=mkAgHn8N3LgI0L6vODYtRLkaGqs8EsZeMFr3muluUZtzvvdytGlMvlc1Vn7b2/H4Lb4HBpDJa63KhF1G92uSM7jvwsJTxEGk6kW1DdT59xHsBt8D37CeEWvqGS9RQm70CFLerCReFelyURKUpO4DqQ6DnK/DnVqZ7uynDU0ADJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307013; c=relaxed/simple;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfrWRV0m+/APVj+wwGqMA08jRdjlsC7bLaCBkl8wkeezSEH7R6HFgPvAh7FV2qq0SB9nct+lGh4haegK7ZQJPEFvVNPQ3VSnNFgP3bKJWmgcJsw/yZFixednLyFHBIKP94MXthgYh4VJHomnOiGwhSee0utMb1fFBBGFwY08Hmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6knG1Bu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F350BC4AF0B
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307013;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D6knG1BuD6qEHVAwPQ2DKg9tTyDVtorlevdSLRckmOa5iIdxKiJii051JNf8yAACg
	 GVr/obGJuSkR/0A0kPrv3oSUVXN/kLfADsbKky+M+TRE4vARsxUK/Eaxl9ob2LKcoJ
	 Hkawuibs9rcWXGzgoBDF2J/+HtC8kzKH+jKB3t37OYIIFOFZkEDhwLm3Wyc/4gwQCw
	 IV6Zx7+Y4dgH5BTebhaj0+Z0bEb2xwXgjRu2FhQICRyhumbmY8L5eLc5ya3MfDVjIX
	 ztWN+sx7EtKFZQzoGdk6w/vppML0zDAeS2H5iBWq/sbTKDcdUSbEmulGoPs+9gYkhw
	 5hmJkSUkwFcIw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fc3572431so86598077b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:36:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3m5kg0GtD9VYh0hUztEVk+2ACrNXpUKwZhP+wqY8lt3uvL5XvvFnBZBYX1Pt9DnxhQWJAEb050nJI@vger.kernel.org
X-Gm-Message-State: AOJu0YynUi2PdejseVWjOJD0Sd0HusnivVdKW+mttUgSNsS+NT8B72Cm
	cwBza1Iq086AlgZRUzHPtu0qLasLviBRVr5HLnaI2KJu71Ys3CiKLHUmqS5cy8HcyuqlZnQrJGG
	+dp7Sa6lzSCb9/ExQbh6BiVCoP91Zewg=
X-Google-Smtp-Source: AGHT+IEO5LwtEScYPWNW+HTmyiMl4lA6z8T55VrgRQjoU6dIngv+B6BdPNzDk5TNK4hhdSKTxLiw6rjQ1I7m1uaT2oY=
X-Received: by 2002:a05:690e:4190:b0:644:7a37:e8bf with SMTP id
 956f58d0204a3-6466a8a5cc8mr30736205d50.55.1767307012376; Thu, 01 Jan 2026
 14:36:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com> <20251219-gpio-of-match-v3-1-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-1-6b84194a02a8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:36:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLmhxts7jPoTZabzCUCxjjxqSqgh488UrQk5CgeGC1T1nw@mail.gmail.com>
X-Gm-Features: AQt7F2pUbvBtP6_wDtOSoTk6qQP2DBSKO-EAbAzEKgRoIHXV2ayoPr7YsCnPilE
Message-ID: <CAD++jLmhxts7jPoTZabzCUCxjjxqSqgh488UrQk5CgeGC1T1nw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: aspeed: Simplify with device_get_match_data()
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

