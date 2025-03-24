Return-Path: <linux-gpio+bounces-17897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B003A6D582
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E50166FCC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 07:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D948325C71B;
	Mon, 24 Mar 2025 07:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J6BjXIa3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238A25C719
	for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802823; cv=none; b=S+5BQK/0hmLiUyE0P1lIrD9k0kgxBbj93oIByp5OWwQMAxm8E9vN9iIqoUfgGwF7YlHRdj82rVfn/+L2OfNxLresdyqqt5gWo4P1LGYDg0IhwPsMnTBEhGr7CmCqEoXhCvlFfsrtscsb9970Zpl7rVabCm8hRC88fxGc3TweUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802823; c=relaxed/simple;
	bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZ7o42QqQQPHaSa46PivpXtdpLk2tsiRp0NTOH64iBJPngZy2B0EKLUIUdeKDQb2J8Zuz93RIsM/9MP0+SU+yayMdLYjAwAtUu9G8vVMggPJbHsAawSV1O4MmpmqCkmwZqsjwpar0dDzeMAZbC1efCwkJzlYsXLIk+dfJCa+kXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J6BjXIa3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499614d3d2so4652270e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Mar 2025 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802820; x=1743407620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
        b=J6BjXIa3ZKFWJ6ecAZWraYCqhddWJoKDbn7NVjR5XoONJW0FvaylDeVROdTQhA2wBa
         ZHRCHg3SdbE7ZQRCmsVq1rGPjLMyklU0Wk0+plPrcDuX4+IpwaHrldm7PECy5HLcT8F3
         Wtw4w8x5qnUZJnv1FXJVkBk3knyY/we1vj9c5+ey9lUfwFuPtlNGZLcqNsSxCRUzk0co
         9dpkj4v7B1pMKs0AJCptXvdPpAJImMkuF2LjAdKa2KzPURXCpuzQlcIvVcvG3xfAzc5/
         UuazW8QAaPe75UCAxSKnCv7KNu/dg7SKMXAKpEyQVGLZBk0oMxLBPm9DPc24pZsWkUg2
         feUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802820; x=1743407620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wYOaUvH2+wGNYkwE9FMO2ObsGp/j2F2VQglfrqeSwY=;
        b=k0cF/tbeyntBCsvfxt4fiH5LUXcP9vEyJagXmF3ykNPevjMxW8Qhuen1dKXgorDb9e
         4MeeS/fJRuq1tGv7UHd0TRikr+Tc+bc6PuEslkHzH4YG+ZZ0iJzZoxEy6cNDYbmsEXXX
         KpI0cXQWZvM0+lg+xag80NjczlYEojzwNKWy973iogRZLfrsy7YTAlnrVW6AseIPWWpi
         twztO2EPfHea8dZfybKRj/otqQzJa//Nc3MCdNHToCUonToa0XYuk2iWjRBle4w8heu5
         NfbT/3ATOTL1288WaOxo37Mif7WaEYOzdsaci6Kvwk1/ckyHnuVFgjifeqaM2jmiJzzl
         b4hg==
X-Forwarded-Encrypted: i=1; AJvYcCVLMncbamjMuDDRJaChRH48pT4U9GAbu7U/SCAghl/7gYKH0BtmrvHC2Yo34ljbIMOu1zm19NwrfrW6@vger.kernel.org
X-Gm-Message-State: AOJu0YyPfAkrJuvYaDRaGPgeK92AsjfKodKCoPmMDRnvXyWOmICVrY1L
	gJ6Br9G1634Vap4qKSvgzS/Lx7Jh9kB4jIi7ND34bqJ94fUc0ZyauOCx47B7hUxGoOIn7w4E0wr
	ygR7ajjNn82J6zgoDUOb8CmhRlQU5ZBqipnwKMA==
X-Gm-Gg: ASbGncskxJBWE7e7pfpIoXNZ1Y+GaAg63WrqGGaQzbn3vICYZPCLQ/pjKA3Talm/+Qu
	3xqU2qfu5bouZvZbpk84sSG1X0dQitMVy443tJ4AtcwlLoApJWH1d5gfKeIvOR0WaDcGGLATlVb
	4dYd4nd/SHs0dOoQ/Tuwc8iA2Sngk+/QhEZg==
X-Google-Smtp-Source: AGHT+IGCsf6gs4boVKvi872tdBJFNBLIE72SzFHUnHiJ2uqF225HOjiewrQhZXAtHdFlZf9qfC6RwySnYBdeijJWt7I=
X-Received: by 2002:a05:6512:ea5:b0:545:3037:a73a with SMTP id
 2adb3069b0e04-54ad64850e7mr3708934e87.13.1742802819820; Mon, 24 Mar 2025
 00:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322035307.4811-1-ot_chhao.chang@mediatek.com> <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250322035307.4811-2-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:53:28 +0100
X-Gm-Features: AQ5f1JrIT3jjMlJn7-UFm0QREZvmNoSOiORkmH7amKsqv7WDxLgWsH1QR8-hb0M
Message-ID: <CACRpkdZT1GYsZjeRHQqWJmuw5jg-kz7x+53_u8_Y3goyu=uRGw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] pinctrl: mediatek: Add EINT support for multiple addresses
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 4:53=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> For flexible routing, eint will be divided into 5 bases,
> and it will obtain the operation address through the pins array.
>
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Patch applied as the last pinctrl patch for v6.15!

Thanks for respinning this, I think it will make things easier.

Yours,
Linus Walleij

