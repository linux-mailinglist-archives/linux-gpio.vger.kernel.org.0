Return-Path: <linux-gpio+bounces-29898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD2CDE131
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 21:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7268E30062F1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 20:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4254923EA8B;
	Thu, 25 Dec 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9FUNV4A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25548287E
	for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 20:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766694542; cv=none; b=pQAcjwiKfFaWkPpPo0mWoNJQzHBzIy1X8yXpUioM3X6XRd0nTkyx93uskXeX2ifAQkiyPB3E0TzjEPFm1UPHcP7xQcP/7pcaw4oKmvOzcwyatGhnpE41r5QjteukvhcBJn9RNUXGaY83lkm7ONUK+4kPZYcwdyLahKA6/eA5x9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766694542; c=relaxed/simple;
	bh=xYEEgdCtqctqkmM6XptOR7cL+Pwuux/gW6AbdkDAj04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb5XlbKLLHrtjDEwkvTeVQBYrNSClOwSltSsHfdfki7TDu0/KnFQeV/qBi3Xlo1BvppWM5drKsiB3wUqnLfKB8ItRLhtH2Dv/+2n5GZuiJdHTLI0Z3ex0WLcOaIPOgzI6DK7G0hgsNRRI4DXHl0DnHkIKrD9k+ENusqZf0xVlFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9FUNV4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9173CC19421
	for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766694541;
	bh=xYEEgdCtqctqkmM6XptOR7cL+Pwuux/gW6AbdkDAj04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H9FUNV4AwdUdh4Nl4aE5k215loiAjlf5cJi2pUx46hlW4+WjLdRWmxwjBZnGnfq9m
	 APK48kH/a/Ajcea3FOh9mWtpsOCOg+sUmHTNAnQUQzVyfBomwXCXkj9V7coPfz1vM7
	 63Pz1wnXTazZBtbnCbc5LAnd+prqe8Rym51AO06zTJKQL0sw1BmyTQfyPkoExKrHFe
	 GEWodk2eYvacxJUB4fbHXJNLSfj7cq70cAXnc8v/W0a4d8y8BTmmo465NjztQnY9FL
	 OzooJaS1edQLQHyI5H0a/7xXYE8nGCunyubcQ+XupUWFQFcNzZePDPcXY/JovLZ9xU
	 9v3934VBeH3+w==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-786d1658793so59440607b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 12:29:01 -0800 (PST)
X-Gm-Message-State: AOJu0YwB9wfiZ13vbRxO5jBNfnrkAG12N913m6rSCO3DshhQkFZ2coQ0
	Q2kjpbJeCq50WfQxE6xE7hz8/EyxKo7d1SDbOs0RwzzbaUrgLgo6jqgh8R4G1jgnkVY7H9gvnWW
	37KS8MkXTUWAP2/NW6DW1NONzIlMNbI8=
X-Google-Smtp-Source: AGHT+IEDCd3llwGvMbNCvAgJbEIzR45hI+oHLcNtTntKa1MIfZKS/ZT2etjldVzix+Ct60Ai27UygIp6Q96GGYnCZwg=
X-Received: by 2002:a05:690c:3709:b0:787:f043:1f10 with SMTP id
 00721157ae682-78fb40d9267mr392924577b3.66.1766694540804; Thu, 25 Dec 2025
 12:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212021001.28586-1-johan@kernel.org>
In-Reply-To: <20251212021001.28586-1-johan@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Dec 2025 21:28:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLkKGXPLxqn2eGQKV422vmbAsc0LDqKUWNrbjjn0=h4DSg@mail.gmail.com>
X-Gm-Features: AQt7F2ovYhVxA35oa_5KeBxh6eR6Cj4Mq-2CQ1r8ty88mz8DYWH48fU_rgwz1L8
Message-ID: <CAD++jLkKGXPLxqn2eGQKV422vmbAsc0LDqKUWNrbjjn0=h4DSg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: fix compile test defaults
To: Johan Hovold <johan@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 3:09=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:

> Enabling compile testing should not enable every individual driver (we
> have "allyesconfig" for that) but two new drivers got this wrong.
>
> Default to n instead of ARCH_MICROCHIP as these drivers are not needed
> in every Microchip build either.
>
> Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied as nonurgent fix.

Thanks Johan!
Linus Walleij

