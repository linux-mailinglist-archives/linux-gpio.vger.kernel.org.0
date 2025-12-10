Return-Path: <linux-gpio+bounces-29424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833B8CB44B0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 00:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 277F9302D5E7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 23:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F5223817E;
	Wed, 10 Dec 2025 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usv1X7xS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63908236437
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765410181; cv=none; b=nj+e5IOP3dXkEytyIiVRaG4gz07IYZYfAyUbqsn+9Wtqk6XJVPbVyTt0sGEPzmbNkkDLR00cI+1vP8n0aDOrlMU9OvZl2fSoYAhEVhXCWKMALs4b4BTE76GlLv99Tk40BrLQwswoQ3tMVXIazB8ORUt8gb8zjC7tuJyQsaDZZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765410181; c=relaxed/simple;
	bh=xuR36PvFL0Q3EY4Y9TZfSqZj9ouM7b9aN42bFKSXO3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1o2lw9Tg+PZocNdS5kEsNtGdo0Mvc/bbSll7uJ1y1HHlPGtLSt1Md0ZFJNTyUx09g5n7aJMeMVvdKtl4n/Quek0PiX+j+sTcQRAdpIxHVN2UDsODouYjdBBAY9XsZ1xBTxkjQbiFy0bvLh136LgJbw2iExh4/ctUM82kOjxxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usv1X7xS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06470C19421
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 23:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765410181;
	bh=xuR36PvFL0Q3EY4Y9TZfSqZj9ouM7b9aN42bFKSXO3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=usv1X7xSTdK883Q2ujg3AviNOXOXWPSYU69neku84Nb12bGBk/vTL0F9BTdaKOn8J
	 u6gVbkEuh/VlBJiIV5ipsD7SJxJQ1sgoIwF9Oe+XkecBlJqJqwDrkrX/f+Qy7pL1g1
	 bpAylV7wvHuaod1AQ4YXIjJL5T1CSzz5M/5fwK+R033d8FQO6lBHDrS3ewHOm0Bbfu
	 kCrDLIKEhXFwuQs0PBm1ox9SRc/i3ax1//1UlmEce/Gi5o63xcvUFzTY3qkbATXPmz
	 6GglcfaMTSiPKS/xY65LlU6qEOoYj6mV9Q+SMmnOg3mA9y+cPJtqPpQYVHy8BrE4+G
	 bv9RgV5hdn/Nw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78a6a7654a4so4395727b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 15:43:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPi7tyRwOtxV/5t5faRejzqBzTjwu8STtKoQrjbBcBibnrkSeR7+csnP6p2i39IFI9ob9EDW+E+8xw@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXXgLf/uyZB07HeXdeTRPXcPeYrpBq+N++MLL150cd+OFv1DA
	bCj+tGS5lQ6PEiOJl8ygxwdgdUFhn55SVMBA+E7BpxGvL3BGSaz3O4kcV1eL+LNIK4XYT6LhK/K
	IkZR3VxPjZB0+d/y8xOFeoSUTKWOJUe4=
X-Google-Smtp-Source: AGHT+IE/Wck9TSXGf7lHIyUMOIm2dM/JUihMqhIDeNtEem+1RQODmUdqiOpe0Lz0kuzdAQ5Oyw+TjVSHM7SkdaBN2MQ=
X-Received: by 2002:a05:690c:6a04:b0:786:8410:31dc with SMTP id
 00721157ae682-78ca6412e28mr32811977b3.53.1765410180406; Wed, 10 Dec 2025
 15:43:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 00:42:49 +0100
X-Gmail-Original-Message-ID: <CAD++jL=POtR7Ta11Pcv7CEmcAkuAOk_9dWFwsMYfRMEd1U0qCQ@mail.gmail.com>
X-Gm-Features: AQt7F2ovRI_cLb32qblZu3yEcoKXsyQstRm6NV4emvZr825urgD-Kzv--if_tik
Message-ID: <CAD++jL=POtR7Ta11Pcv7CEmcAkuAOk_9dWFwsMYfRMEd1U0qCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 4:03=E2=80=AFPM Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:

> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Document the required properties to handle GPIO IRQ.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

