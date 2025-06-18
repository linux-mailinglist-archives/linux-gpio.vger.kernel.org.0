Return-Path: <linux-gpio+bounces-21750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E908ADEA64
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 13:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 281077AE960
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FCB28000E;
	Wed, 18 Jun 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFp4fz7b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3752E06FA
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246338; cv=none; b=UXoI9zJI2Vsp2XgjH91/U8LJ5nhWcGDpH7PmkF7OR8iIBGRQa/kqA5fUCCynlfxC2PRKpC6EAa/TvLbDgEhrHMEZi0dz9pCjkZh5KTub/o1aPl1e3morloLiusU2anFOtngHGfBbb+Gwip4Xl2kvHybaTIPlOqNBaoMOtcdO9OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246338; c=relaxed/simple;
	bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGN5sbc15h0w3SjLhJAlBVnqve8rmYAUQa16OOS+F8DvL3QxrLmv3PWA8UCvF1tp8XyZx+dZbeG9TMwJq4a8MoktwQLkTpq8eXF7WaMrmNXAIvtHg0A1MZ1gZ/SVv7WMunRftn5pkJoF39FH1huC5wIUhAPd1SGKoT/bdc/lwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFp4fz7b; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b584ac96so5260231e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246334; x=1750851134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=BFp4fz7bOY3Md0H/fnwzevjZjP0acx6Yo3eVji3SmP1oNZzYZDp52a3E65OHcQM6Yd
         7EbzrKGEgdwkFFfxJRs6myFTdPIUjoXWO9n92BiMAvnlaSieV04aWb/GPeXN+/o55gbd
         9ubuYCkGzubPXrCzpNpSg6MANFs0WCBhpSEk4Iji4vbUoCrdKX+H4Br28Rlw97kfBiov
         6r8hLqwNX6Os6SAK5RQZOlh5f4jjWd4Q4Fdk/RG80vs1OTpE9fibxdzdRFlyLjL8VwlV
         Vs4Bfv/tpOTH8cTdppsgpdCY1lpe/DHbuQJLF1TZPoe8Hot1kOhFIWALJUqlncQ/19he
         RhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246334; x=1750851134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=Xa0qCZgm4LlwbAqtI9uyrQaehZx8QOZN7s0Rp7ypo9jFKWRrYYcjOvbwOc/7X3NoHI
         znIox8uu34Trnp3+NPmXKE+nKojvcLHYvmxwVqg3dN2DLHcwCnwOUFW2DH7tO1l73ti6
         vs0BQz7ATcscxQs9o3Z0X0hQHcx2A+dSK64Yf107vXk51vR7/1L2HJYAF/jZ0UnpxQUV
         B23A9FgFlUC5gSNPeR0W7Qe6QHd7lJpFCv/VjlmM3yD4PY/tszMJ/tNtjf6h7Y/UwYis
         aFeplQvp3QWnaD0sapi48rFN/Ki6Xx4AG8VxJn9x+YUjFY9zgUKsFk/6CpWmZzxJZUA4
         +NIw==
X-Forwarded-Encrypted: i=1; AJvYcCWPXicWdsLbeo3GX9meyBcHxMFLHGmpQj9rOKufupgF7hMi+FsvQMvXuUDWEoG0T5Wl/s1Pbx5WXGuj@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMQ0VYeXnpS4Dv6CsnGCQyyA8xH/Y7V1mkhBZRYzauNOIJ9Y8
	f7RDEnImR58tsJvICbeh07CF2VFXJQN3oKKCGCEoeUk+iV12uHfWc+r/hme1X9jnbxBg0rCOHvW
	24BRWijFzSkKlxZP40L3mnztcYar6WGVfxpwN8fDrqQ==
X-Gm-Gg: ASbGncs0RULD5WxnZC/L561m0mUyfA9iDr1D70ZbheY5YNAsy/5ESEMJ4LSGX0sif1K
	Bd43sk6zt3Gk5hK/D3trwz+RJoAp/wWiAO2QoN2O0Y7FkX5kNKlU8a3wSEPn+OqrFX41iupikYb
	wULFUnhLfbB4JxQ/+8XQjQKtwNUy8tyGiuV05pVUMD2pk=
X-Google-Smtp-Source: AGHT+IG/cXE1HQ3EEXy0cPSnaDLNTuKJgzCF0qLdhOb/5CcGOOw+a/DTjj5TWhlAS5cXMjlqM/mbx0AMV43GUJjmW2k=
X-Received: by 2002:a05:6512:31d6:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-553b6e7337amr4658199e87.9.1750246334530; Wed, 18 Jun 2025
 04:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:32:03 +0200
X-Gm-Features: AX0GCFvVR50_3aX2UCUBcxsZuxXj9BpNTfKCs9hxZHJvTphADGhBSjR3yjyWU08
Message-ID: <CACRpkdYkgHzEnqN3VA2MqBChjtwjC+Fhem7Bo3PdnfGZQgQ99Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 12:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied!

Yours,
Linus Walleij

