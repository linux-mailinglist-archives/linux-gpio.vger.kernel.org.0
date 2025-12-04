Return-Path: <linux-gpio+bounces-29262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA383CA5279
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 20:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32902318C512
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 19:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674491D5178;
	Thu,  4 Dec 2025 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m661XtEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E72B9BA
	for <linux-gpio@vger.kernel.org>; Thu,  4 Dec 2025 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764877233; cv=none; b=K9frFjyyMurW/x2THsufFDdUnCZAIEVh0diRtHdnvZIBNIdKtp2hobbqO1UIzKFMCJUUXCRrFYztfAHEXXl/nBkDTzOa6Gl4fnmSmOpjwQet0vBQnGrX5suOTlpg9Ia3vF/EIVc+QPYvJ0euaKYgSMdSzGYXV+envqeqSxUq35g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764877233; c=relaxed/simple;
	bh=uG4YBMOAwdGXmEe6ekzqODhSRno7iDvPXFjSVXs0Syw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ahxyksf8S+eOQS5dAS3ASLVKCmJmDy6b0BmH2r1dQDd9AeYD6nQPKAG6kEbojCgW2MQRmod7L1KTD8Ox9ZDK29NvU3ocQnFXliLo5dFsxJsag9Ay5qtbhVESce3pcfN7mgJU0QTu3/I0dLGxsj439jP3SOLeVXifckBPvL14R74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m661XtEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F416AC116B1
	for <linux-gpio@vger.kernel.org>; Thu,  4 Dec 2025 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764877233;
	bh=uG4YBMOAwdGXmEe6ekzqODhSRno7iDvPXFjSVXs0Syw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m661XtEl/0sqZeRG+YiRjFvOzlVAqqXNAUXxapy+hSXaTLRePsTJ63Ua7VNBoJQry
	 LefiKlzilKDccyfznvsjXbrNzJlZuh4WR2kyT1ltnvBApdGEFr+mHb9O7aCBFP4Sxm
	 9qAZJhSyufN18cxm/bfzqg1yv4IULqdx9AqCL5zE5KnPxzn/U38yltqPXrvuG2oCIi
	 UUbr8rpIXYbM5l2qzS9yDa4249lLdGOBMprLnOYVYQ8c1tekTV2yMKy6DuLtvDNiw/
	 60lcK2RtUpSBz9Ce4h5n4KDRL/RoVXRaTQ9TvCA93LrbNQ1BxZYpmIHFfH31fUS+Az
	 3YY5Az0v5X5uQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63f96d5038dso1125056d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Dec 2025 11:40:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUARg2zYO1jZBJToWmWFFecBh2TB/lE7sx2FSOig3eUJj95d+BGePjZq1oVL+Weelt/MaIe/0uhQ//U@vger.kernel.org
X-Gm-Message-State: AOJu0YwSB0jGFXvJqfdnO4oVJqWWQ6Gv5/lrssf1qzFSuWDX4Hl/vgZ4
	SBCkbefBYxmnCtvgQwW+K+AUi+FOPKb6i444fxLKcrnTcCCU2uHhNtCgFQVh7VT1EC/BmBTyrav
	fP5y/FITuor7gt+YQyY/3Re/CNrXih24=
X-Google-Smtp-Source: AGHT+IF2+xskkUlWKaNomtXxN4rXrM1+++T9NEPhPP/vELYLxaQI74ZpUKuV48p1onq7Z5gVZBB7OjfqUKq5dpemgoM=
X-Received: by 2002:a05:690e:1919:b0:642:2cf:f9fb with SMTP id
 956f58d0204a3-64436f6dac7mr5352794d50.4.1764877232324; Thu, 04 Dec 2025
 11:40:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204095024.1031947-1-arnd@kernel.org>
In-Reply-To: <20251204095024.1031947-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Dec 2025 20:40:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLk7ZFOEnpZ1xu6NFuJCeUTHJHM4Qv2nd7mt0PqrjRoxHw@mail.gmail.com>
X-Gm-Features: AQt7F2rv3BkyEhB4i1BsopOiHpNhI9Smz_DrcRDLXF4yvGrSn1P2q6w7OM4oLPE
Message-ID: <CAD++jLk7ZFOEnpZ1xu6NFuJCeUTHJHM4Qv2nd7mt0PqrjRoxHw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add CONFIG_OF dependencies for microchip drivers
To: Arnd Bergmann <arnd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Yulin Lu <luyulin@eswincomputing.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 10:50=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The two newly added drivers fail to link on builds without
> CONFIG_OF:
>
> x86_64-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pi=
nconf_generic_dt_node_to_map_all':
> pinctrl-pic64gx-gpio2.c:(.text+0xc9): undefined reference to `pinconf_gen=
eric_dt_node_to_map'
> x86_64-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinc=
onf_generic_dt_node_to_map_all':
> pinctrl-mpfs-iomux0.c:(.text+0xc9): undefined reference to `pinconf_gener=
ic_dt_node_to_map'
>
> Add a Kconfig dependencies.
>
> Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Trying to get my tree in order for a pull request, this comes at the
right time, thanks!

Yours,
Linus Walleij

