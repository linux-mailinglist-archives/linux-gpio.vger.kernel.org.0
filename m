Return-Path: <linux-gpio+bounces-30375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6CD0C85D
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 00:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC0E7302CDD5
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 23:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDF7338929;
	Fri,  9 Jan 2026 23:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBwUa+We"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFDD2EC0BF
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000798; cv=none; b=PVSMd9LYfFTMtkXHtagaUJxkG8s7t84bAACFIawAdl19LLOEy7JWozEEGF22HyFzI3x22XnX1cfZoaC0ro6KdXL7dWcn/xC8gYU2VvRcS9yfe7NjkFjkA7URXY6FeIVFB0A/wusGtd5MnVe2CeRklhl/IOUQprZqvOPftP2hXxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000798; c=relaxed/simple;
	bh=kA6ENQ3BT9SeMIKKAuCQrtFGcLvrP/3c1gljUWqVCFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oN/9w65WEucH5eEvkKU6ScU6DExsy8JGgD4uwdGMXtgbApw3+brK9qwV3qPHL6HCDFRwH0CBjQGYwD5PXQFJ1ikJ+4a5/TCmHpwshhxCZC44zX+q91jzi507rWGfWjS55gtr88w7tXg8TiHzZmwfYPB5/VeirchMWrDbbLhEO7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBwUa+We; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3641C19421
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 23:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768000797;
	bh=kA6ENQ3BT9SeMIKKAuCQrtFGcLvrP/3c1gljUWqVCFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XBwUa+We3gWOZXxaBaKk26oSc5BvjauaWanGuFcl4rEbtsil5XwEE3y9+DUkYZe6G
	 ya9nxUsD55UtxkMTeYdUdQ0Iv+3m0eSZRvUCXFqImcLfjJOAGYzMHV2DXbMwM10yMv
	 6gmzn9+m+NH+52jgNqXzrScSeLsBfvqqgRbyOuGiBouduBjTNzeDvA5AyBY2I9SRKZ
	 cA1lQEqSTcXXpnRprRE8wM+1dNKPglZ2OpxKNd2PyyQ/PgQMUlKejoT7n6XoH04tnI
	 W6Nb+DCsXlAoqURKUWrQERg/YPgkTxDnfpbW3EwVDfIQ8K7tXdpvvd+GYSJI0HeheC
	 qVeBo8jsgXG0g==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7927541abfaso270857b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 15:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0VTcJPoQXju0Pp/8hxHcV6E1BqXPYQqV4eT6T8vRXO+tJO+vfBjSIN9di2H43BlOor9/xQ6JAjAP5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJVrUDUxouOU0nfz9QiVx3FJYpOhpev0sIaakDufpAZSBAXHt
	mNICTTJ/g1qbf1YmTVnYf1Azg9mJC/irD15Zl6zUD+gwlTmQIaHqlI+g8p19WqYHwu0NccOiflR
	EMmtUBUNm8QYSfXyAmgWl3f1SDZm5R9s=
X-Google-Smtp-Source: AGHT+IH/Xz1ol2uAKioUMrhUSJFvQuZV4HJpCZ59HPIT1gfdSMnf9TZY7V7lsnzayuoOm+waCesDcmvh4cbve2DZfV4=
X-Received: by 2002:a05:690c:3749:b0:788:c21:b05c with SMTP id
 00721157ae682-790b57eed37mr97068747b3.63.1768000797096; Fri, 09 Jan 2026
 15:19:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109134409.2153333-1-shorne@gmail.com> <20260109134409.2153333-2-shorne@gmail.com>
In-Reply-To: <20260109134409.2153333-2-shorne@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:19:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLnLR-6z2n0HaG0oYZkq-+8gAd3_uPGn_=fr0dr7wOV4HQ@mail.gmail.com>
X-Gm-Features: AZwV_Qic7ay3zvPvxbNNn3sjaC2H9rnJBItlaAKU-IoO0FAw4F40iGZDvbU52Fk
Message-ID: <CAD++jLnLR-6z2n0HaG0oYZkq-+8gAd3_uPGn_=fr0dr7wOV4HQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] gpio: mmio: Add compatible for opencores GPIO
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:44=E2=80=AFPM Stafford Horne <shorne@gmail.com> wr=
ote:

> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> opencores gpio verilog rtl.  This is compatible with the gpio-mmio.  Add
> the compatible string to allow probing this driver from the devicetree.
>
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

