Return-Path: <linux-gpio+bounces-30100-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFCCF0D67
	for <lists+linux-gpio@lfdr.de>; Sun, 04 Jan 2026 12:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323F530047B9
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Jan 2026 11:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0419286D57;
	Sun,  4 Jan 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyJSJ5ED"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0F285061
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767526800; cv=none; b=nXMR+wQN4BU+yjAZY5FNKR1h/DnYkFulPttzTlaibTyaEgPFCgyM1+c8HE2AoK5CsBRHRrL62NDKWfO14gRm0VM8TyHaIesVSHbq1fNtDspUWSl9uRvymWtk2ZZ26WnwDl0TDpK+ID957HmFNE/+WWxkB2KmSBArxzFylyPrmrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767526800; c=relaxed/simple;
	bh=4OlOxxutktzHnj47iAJg6lb1/kg6UJCstgjPUdHssPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azy1Q/icaezhArInMNn+fatQFKjec46+DYGt1CBeo3Eaehz8DPElo9mmrvF+zEQ1uG4E6rvyPsW82UqoFReW0vdQOk4/38lmITZDUXJqhvzN/S4M3GcPif/oXAIoetbunYk66Nme462SjeqZcPKJDkZfefIJrhpVvLy4ywgRzSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyJSJ5ED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7915BC19425
	for <linux-gpio@vger.kernel.org>; Sun,  4 Jan 2026 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767526800;
	bh=4OlOxxutktzHnj47iAJg6lb1/kg6UJCstgjPUdHssPw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hyJSJ5EDQCgI/03F+MYNO93KhNLLP8NLLkVCB6stSSFPbPGXYuMrIbZ/qqWq9WL3G
	 YDonSDrxXoYN10wmBOrpUBAmr28DuD54Q9KjBjqNrB62lV2PvC1gCSxHIjVWLqWd8S
	 bNCWaBLyVG/jHfzGI5kw0WshYZp35yT646rPHUFuckTIubSF1bPtEKRyfh0zdjBX+J
	 ghmz1R3FfjfY+6w6NHLvgv5ulKfL+Gl/CxxhHiNl3keA++7ZRwlvgHm+qb7M9V3280
	 8cDSKZOsSNSaiwuCF8/YSRx1ig+rF0alihaa4tOSRDpfcwAa21PO33QSAtOWJXtQCF
	 75TwETjtqNvPQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-786a822e73aso118186277b3.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jan 2026 03:40:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWk2cQ2GBK2fK8sXabBzId2G+wEfETMWe4SIQwC1xNJi+SF1ZjkpwZ5IKOqCuJWWEEKBMTpMZY/r1Fs@vger.kernel.org
X-Gm-Message-State: AOJu0YxJU/WvH1nD98HxBv/ZmW+kLYe+ZouqSAOZA9FXosmxfFZ6TNrY
	YdyKLa3mfyBAUFnUXq5ebTdFGOeT+rrhRqi9tfyQAMU2VfV3q7ZWqZceKlXRVvdQzwNiA0hAre4
	UX1frLoRLoLw15FASUO6Fi0qAdutXx8w=
X-Google-Smtp-Source: AGHT+IGKIXjy7lexXGYCiKMkRPD8ggwV371jcFQdcHsITC/B9zTB3o/bAj5rEawF9HMxUDdZ3DoVx/M+caRG/RtXYBo=
X-Received: by 2002:a05:690e:1519:b0:643:33e8:11f1 with SMTP id
 956f58d0204a3-6466a859594mr34395536d50.38.1767526799488; Sun, 04 Jan 2026
 03:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
 <20251216112053.1927852-7-ye.zhang@rock-chips.com> <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
In-Reply-To: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:39:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLmLhgxagenhum0KQ1eDuzAa1E5DQqM-oN1VQUby3mTpZg@mail.gmail.com>
X-Gm-Features: AQt7F2rYKdQBghWjfGpof99Et6swSjlhX4OCTK6LrN1u1e2LW2ybvz55mCS36AM
Message-ID: <CAD++jLmLhgxagenhum0KQ1eDuzAa1E5DQqM-oN1VQUby3mTpZg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correcting myself:

On Fri, Dec 26, 2025 at 7:07=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> > +  rockchip,offset:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The offset of the RMIO configuration registers within the GRF.
>
> Can't this just be a cell in the phandle?

This can probably also be determined from the comaptible, can it not?

Yours,
Linus Walleij

