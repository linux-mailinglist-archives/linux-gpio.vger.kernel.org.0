Return-Path: <linux-gpio+bounces-18805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C514A894D3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BADC7AA9D6
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0F027990F;
	Tue, 15 Apr 2025 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAOzSlQD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187727586B
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701717; cv=none; b=GKLRK3SSZlT5OhF6bWjHpIXXSmvGgQ6lF92l7nyjwA5sD/JvELPWaElCsrQ7yFcnKiHYYo6Q75QLkbs9Lt0t2SAHdzVjz3rd/QHqT/Va7FgkfS7q0mNrx+xbbmEQzFWcQP8FRt9N+CuWPDFUcBIhbehtTBRAVmantYt8V+GN+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701717; c=relaxed/simple;
	bh=eFsTWyuxYY/YuxE/bwNDIbnXBjWIwIeYCmpXbUubXmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hp7R4YELChzBrf50WeKG60vVH44OReeWVsifFr3vpRgBTc9psEBrqZCG3Y3YsEmO7EJtF5xIWomQel31+Y8ogLKnBypo5tR1EQhVOv5EEX7qWJE4Hg1wesGSvJCWJhI0XoYW10HeTsxvInbFP/V+0BI/BvF7nA0k9Ucq+mS/eNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAOzSlQD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfca745c7so47708761fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701713; x=1745306513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFsTWyuxYY/YuxE/bwNDIbnXBjWIwIeYCmpXbUubXmE=;
        b=QAOzSlQDqzYo67M8m9edNPe6vccMaKB1g6ksymGQJ3FTE1+kEmYXPNO3eQOc9yBS6a
         CXu1MD5OZFy1b7gcdedNE81uwqhj3ZbLdT4uS0+XOoAsRP0ZZlPkwS3DetcNTk2GLfuX
         KzY0sweVqJceSqvnRGs3CUOKdBDCIu9E2zZB84OfNcg0YbNcS9NbTE0CQNjzJcCG8Y5X
         9gaTlkQyocHZWoSmIak0rvs7wlRr4063mncdnCI1PBrpxdXqVWMvLIggANOHiMFPhNiK
         Y9sqaYYwVcdjQRqww5YlG76YKL3e6fmqGAgZ+tsXyfIB8ldIA86i0c9ZitOMzJ84yPIf
         +gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701713; x=1745306513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFsTWyuxYY/YuxE/bwNDIbnXBjWIwIeYCmpXbUubXmE=;
        b=COhdsI7SpyQGj6g5SZ3E66D6E2lcVIYROtCkFrzesQDI8HihqD5kwR+5fInOKCpCPz
         AZWLnNE0Lm56/RoGsxJFE4HlQab3Vtr5HTwYL/XsJydDOUTrQn3n01+cKbnivT0pfb5p
         /wZD3F9Sagn+ywCpKUcjGlZtBv30qJoYqPBYZLnpc0n2LpxOtrhPsT7MesDdnqKC3yIJ
         8ZVeem6jU3GE0tkIijNjIvYMWR8AdG1b4H4++IQJp2p47J7BWA54DBm2B9XPqI2wunGB
         g+/5EOI3LQkpTFQblhZjMB6eM4zg8822Kosxl5vdH9dT6dJo2f0puqs+4E5/ItTvqtTV
         xLSQ==
X-Gm-Message-State: AOJu0Yxmwr+zChktsuwFVkzq3BXGLLXxaSgiKJ1S5Sczs8RjmJJc0Elj
	fPlLmtY+QlT465zGO30+AcZVAgcR4LhHxzhWQo57q6F0m0EI8SPlQcFmouaY8tN3zmq5t6tBJX/
	0wO38u13/CLd8ekvLqsEI64eOM/zkmV41GM996QBGWMQtyXWd
X-Gm-Gg: ASbGncscCaue7X+/8y17Qm73ac+eMdY4ye11HuKZMvz6aYz1lCQU76S8VL1f4fe9+k2
	IvX28yJo7rByrPt4dNvNDhFty5giZweT0mhiLSveoRvESk0acC34wrDHwl7zE3ATQx6zJ+oGUJu
	RL97PfpKMjHRFPSdVeutuPNg==
X-Google-Smtp-Source: AGHT+IFw6QC29o6y83Ew4gV1rrLV7OzOu0H71UYaa/kxGSsVv/o9K3r8vj3ssSpN67/x7bdfuOhN2dAXxRaPJ5uBNbA=
X-Received: by 2002:a2e:bc01:0:b0:30b:fd7a:22e9 with SMTP id
 38308e7fff4ca-310499fb07amr37295851fa.13.1744701713410; Tue, 15 Apr 2025
 00:21:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8cb9c8b1-3ce2-4a2a-93ba-a38ee66a1643@emailsignatures365.codetwo.com>
 <20250314151803.28903-1-mike.looijmans@topic.nl>
In-Reply-To: <20250314151803.28903-1-mike.looijmans@topic.nl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:21:42 +0200
X-Gm-Features: ATxdqUGQOzCo07rUGS7fbuGaKRtUvt7ykk_FyjbaWn1yBc1ggDHONN9md_suB58
Message-ID: <CACRpkdYLDLM603DHJvkMbDRo8pVZZfB6DT+ck4070zVAB4SCBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl-mcp23s08: Reset all pins to input at probe
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Mastykin <mastichi@gmail.com>, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
	Arturas Moskvinas <arturas.moskvinas@gmail.com>, Andreas Kaessens <akaessens@gmail.com>, 
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Thomas Preston <thomas.preston@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 4:18=E2=80=AFPM Mike Looijmans <mike.looijmans@topi=
c.nl> wrote:


> At startup, the driver just assumes that all registers have their
> default values. But after a soft reset, the chip will just be in the
> state it was, and some pins may have been configured as outputs. Any
> modification of the output register will cause these pins to be driven
> low, which leads to unexpected/unwanted effects. To prevent this from
> happening, set the chip's IO configuration register to a known safe
> mode (all inputs) before toggling any other bits.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

Patch tentatively applied for v6.16.

CC to some mcp23s08 users so they can check it out.

Yours,
Linus Walleij

