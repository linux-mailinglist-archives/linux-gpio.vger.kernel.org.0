Return-Path: <linux-gpio+bounces-27535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8CC014A9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 15:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3843AD4CE
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3A7314B9D;
	Thu, 23 Oct 2025 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v/8+Ah+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BCD309DA4
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225324; cv=none; b=GN+ZhdO3tTqMIT8w+tvBhY+2LeYRjmXEJeS0OAoW2iDcddRhLVt6ia9Fp4dsd4L6CR5g6SzJ2I8SD2z6Ti3zALMiBN5eWEWN5bP8JH/zgfQELoQkrJpvRlgQtHejLTSREXsHroVVd0Q0MFmY6zo/nmAWNTyz64ssXtEj/JEwSTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225324; c=relaxed/simple;
	bh=z76NHbYS0l11eBUt7HKnQi+UP7NNGUE+0BdLSRPd0MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbHh73qnws3jXN1stukCibvCqs2qtQzbnB4lhplUbNLJ0zSIQYa6/vMlRetWeDWCABK80E2Z1tUAv+z5tgGtoaCuO4wQP7hvz7oU7+jDYz+jIFurHb9a2j8GxcX6coTQH3rI7hXx5+/aJFvNX6u1d6zCxpG3OFrqoy5Je0xnrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v/8+Ah+E; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378d50e1c77so7524021fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761225320; x=1761830120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z76NHbYS0l11eBUt7HKnQi+UP7NNGUE+0BdLSRPd0MQ=;
        b=v/8+Ah+E94O993/x9K1KeDjV8MYEBky1QF2AsgHqGiukg1O6EShOphrzgIigfER504
         VFaiVGBJMDYSDNBnixNVCUDIRpGbzvy3uz+CmBMLj9HvMYg+R4wK0l5YRACz18wxq66i
         eHjWLMA9wqWhI64MNtWu89JOY+LZVy1ptiMHcc+1hIn6nQ2rfMso8t4bMmNxHQWWM6rB
         Dk+dBBypmHIr7G+c6sZrCEBYcPV6mIQ8Q7eEj47dsR2vD1H9QAwteAGmsosMqnH53WOg
         mH5zBgEKcKvBhhqwigHdpLk6bGrYEsokEEcqEjGEL3sHnTdJeGxyu9ocjstIgx5KIXJF
         CEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225320; x=1761830120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z76NHbYS0l11eBUt7HKnQi+UP7NNGUE+0BdLSRPd0MQ=;
        b=Z9JFIpXckIw3yizbBupa0PITxrV9EL+1bZ2rXSbRM+TuVUQaOXxnkLvA3wILx7zqz9
         yYee6skLZo+imYx8XGSS2z94vqV8P96yrlDCR6Q9zr4uSQf4wWiYAjusIBRW4fmq0pTk
         dn+/g7EWQkaIDKDjkWBAP/14vUrl4vpq8UO1TAgtWeJ2qBKck+Wt/9wnS+Uc+AT/7Wal
         H+diEy10OUVh1Clgi06g5Hu7PgMXD7Qyvszp6+5sZBDaDK+fgEWPHvqKnTp5zFqoX2W5
         ms72yVaBXIasKuv6uvmGYYg1KsArLTKRLMaOxZNhx6t1vzQKiDSFWlc/XBQOsXriH2Ut
         kaIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1KLfsuALINZJ0W4Tl6hNzPFoW9Qab6ZQWXiACaCD/arcrQRf7RxtfMuOKEnWxUMRKzxWG4oSWzwXq@vger.kernel.org
X-Gm-Message-State: AOJu0YzEs9SA5A8D6UKvBoRzuG2E46WuL+nNqjStJCrKUNRLmjQAqyGK
	e74PZWS6GxLs07dbeqfY9PQ5knukW+fufnqfrykO8xiTpNSwGBIiLI5Xg0YoXlCG+Ls62NWbnoi
	0QGMoHuexoJpIMrNxqFAiQUF4TKVxsg+EJpSYnfwIMQ==
X-Gm-Gg: ASbGncvqi5GnTBkHCTGrLsYklq6x91oU6y+1kvp8nNYF8DGQFgsoANImBlb5JOo6MTb
	j5jPruyo+yG4cke6B/NShr6vknEoWXany8pGL5xH6tVSbI9LMb6qZjGhOGUTjLWeYSE1g5In3ts
	0GCvjhCWrCGbKY9Nm9CrBq8f17z6AAulJ9mj/HAfW0Dqvyr8Ij2wx378DbUnwzKon/1MOCMDiJg
	SpgOHe7X4FD0UuhzDvOZ91rFJSJSgaM3aGZ62BvZPt/4yX80dcAacn696j1ArHNIOL7Ei3nvWov
	FzspdA==
X-Google-Smtp-Source: AGHT+IG/ZAd7RUnoCK6/TWMMjPJ1VQjmx8Caf3SATBmY9x3/PxhBlmEnwJGz57NSvFmOq7fh2pz0uSBe0AV0o43DOpw=
X-Received: by 2002:a2e:a906:0:b0:378:d424:d3d0 with SMTP id
 38308e7fff4ca-378d424e478mr9052641fa.8.1761225320551; Thu, 23 Oct 2025
 06:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org> <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 15:15:09 +0200
X-Gm-Features: AS18NWB6N45TxgNnccz0wGQlLC0_F0Qi57GxnfcGIPV2g0I0ThiCPIszr8ydkDg
Message-ID: <CACRpkdZ8rcWy9SvNuh+wq0Yz+byYMPkK6ZMkqjd8YW3SKKBzug@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: toshiba,visconti: Drop
 redundant functions type
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Referenced pinmux-node.yaml schema already defines type for "functions"
> so $ref is redundant.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for next.

Yours,
Linus Walleij

