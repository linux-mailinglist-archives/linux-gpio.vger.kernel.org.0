Return-Path: <linux-gpio+bounces-28333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E3C49AFC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 00:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18ECD4ECBA9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406A43009F8;
	Mon, 10 Nov 2025 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hn5LVw6v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3C22B8B6
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 23:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815756; cv=none; b=HawLy/LHBzuq0+URacFKztgV6XCuZuC2TL+ozKPBJSBE7vw1HnZcF+qsfGMw5hTGXgJG3feXi+UXSWBe/+MVPfLhRUcr/zAQAKsWJh+u7tUSnb+OHvySfWP9aNDf7YYulDS65hRIhD38rjY/PDqMKjkS5MRFnE7Nt0NQ80iib2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815756; c=relaxed/simple;
	bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Om+SbWbvjdclIgsvurL4QPsANLC3hjCPuS2UbEr2DEqfuCxoQgHzxDTZthCi1/LH+hj4ZhoNYR+LhMs0YtfIncqGbO9imG+GtGc4Z8uxuOg8SvOjl3PEvXVlrzZ1iuzua2vY1HNP3vjZjqkH0ZqxT+IaLhs+xJVSWT0r0hpjzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hn5LVw6v; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63f74b43db8so3359970d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815752; x=1763420552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
        b=Hn5LVw6vU2b/gtQu8sSJwEAuJHz8XxPxp/nG0PFaMwie324+nH4/qPvzvhV/wNELKx
         KNNhKCuy3rdh9NEf7Y8fXjjICVh27va4T3MAaCGYR8kz8Gmoil23/u2W7JPX4lrhhO89
         flCI6hc862fvJuRmenUsFGSE1nFXCdwRIomQjz4J1hN/xF415CKoPOIQygAijXFwmMmF
         5KX7jpsTxjhlEuFzTmrrYPLkWiB9KyqpYA+QhJ3aXlkVmRPiFB1AlCP/1ivCSRIyomrz
         naEZLbv0IbaSlgW0SF8FBrojkw6+wGmiSuqQsp+mZAzwaYvP4Rl+hkGZ+akrS0BpEu5a
         vl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815752; x=1763420552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
        b=uKuZqlLg9kj6xopshzGFJ9DZfD8dH/2KL+EGwddpL5OErmcNsJf2goBDWpM4gBWpHA
         i0iPbR4psv+js616rlBGqPy67NwHPwAxE3jlbyH1sPbfgc3tnhUh1VYGQinph6pt93zZ
         1PBbQYvLeyoD7VS7PDI2rpFpCeCIRQEtNdmRMVVWHJq/vyEqejhdPX7q5EMw0TkD8ets
         eW584a3bt+kdFPb0Y6a+dV6aE5i/5ZjJHQXVpdxBgeNZ1eK+lPFgsvPUPqK2SJDLtDVB
         0d9OT3aQjOm6tm33y6lXt1TqT6KMTDzSDvJcSab8dGHSYlimRk/5bKck442u2wera1H1
         Rwjg==
X-Forwarded-Encrypted: i=1; AJvYcCW0bIX89Bv1kR88qfT1Osb7Uejq24zUHAQUs6JnB0RYeRKsIIiyxxnDQR1T3G55fbFXs+O4a+EkdGGb@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7KxZgG5BdrKqO0+MVqesulZ4aqUpN+/vsTbSj3tkLmzMo3Sm
	0nvOE+WuzCLLUIDjJ5wGL8Fk8w6ChE8OxFwEAl9V9D8n2u1Ah2nCbSwDNQdAEsbCY5UHIbvWj0k
	8D19jihNjjMzCwR82d6ofdam+tWa7Hjpa8cB3pJQDhA==
X-Gm-Gg: ASbGncsiZ68p94lw4fvcYfJIPz3mGRIZ7uZgsKlQkCu2Y6V9wCnptaRJbP4Tchh7aWQ
	Fpjgakatu8s1xUZ1ILbnyuqGM7CM3HNY1CL3jmvIm0RamixIdbMZcG/I9J4ddv4CqTtdTdbs7nw
	D/96sKs8UjRr2Td1wIz+vtmY87gnzHS3Ex6Po/SFB2ZKjq6GCsez1NjJ8iU8npH93wDTN8/HcDa
	VKyCzvYfNdiZk7CKZ8hWJolmnEA7Qd1+6SIQF6LuvPRzdZOJJScGsrgN0TL
X-Google-Smtp-Source: AGHT+IH6NHwNRdzXaS+QmN+qfk8m2r/FZh8cnCLNpPmojXJfkBdWQ2u20ATg0QrVP2xgMhdnhTJVLjKCqz+f06cVvC8=
X-Received: by 2002:a05:690e:1508:b0:63f:b985:66b1 with SMTP id
 956f58d0204a3-640d443bb2fmr7893340d50.0.1762815752364; Mon, 10 Nov 2025
 15:02:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027132817.212534-1-linux@fw-web.de> <20251027132817.212534-2-linux@fw-web.de>
In-Reply-To: <20251027132817.212534-2-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:01:40 +0100
X-Gm-Features: AWmQ_bl6gy_kvbbOxsO0c9yQS8V5cJB9oHDprLAgoRQJdA1aIm3YFAnru5uFW8g
Message-ID: <CACRpkdYwh69JsvUGoG=SrYTBtgUCFxTUV4Pxo9aAHuDyMqbBdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 2:28=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

This patch applied to the pin control tree!

Yours,
Linus Walleij

