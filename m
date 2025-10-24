Return-Path: <linux-gpio+bounces-27582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6150AC0542A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 11:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9441B81330
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD564309DCB;
	Fri, 24 Oct 2025 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSquGxND"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399D308F2A
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296984; cv=none; b=BLgoVXfZYvg1SvoLsyXYFzuZ0QmO+R2Ek5cWHb0yZV6wegotcwETZyhEvURC+8AMXJANlUysmxMwyJ3v2ybt4cZ8/MxsKw5rw+YE8fU2MWy3ETpnGKnB467FLF5druvWTrjUj/bXj0BloBMh2s9C9H37dVgIdaAIk1DY4gVgt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296984; c=relaxed/simple;
	bh=UAqe7CZi3/gqCGelPBXkKXXnwmTO3hbdt/2MJeLAtzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeSUdrH16SQkd8glyYMwdW/OXQSmVJ+8SSToLblTwhy/vU8KjTczAbaYO/HkeGRi6kuYdc+GfW+9kxUjep1pxaEaNSizB5Sfa9KGqWgk1MkaBoJqsogxxVaPSRduhcWPYbWBXWAj6cS5zYO0425pKOUmWYYS1lYdaV2MyHGL3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSquGxND; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2132717e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761296981; x=1761901781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAqe7CZi3/gqCGelPBXkKXXnwmTO3hbdt/2MJeLAtzA=;
        b=XSquGxNDnLFm8CXhoRwXciPYi48IDRmy0lZSSSmkvMsZgWl852n5VKIWz/VrFi0o1s
         OHSdl5jneYdsrY+kcvC90KSiH0I/QRT+YxVo5PEFvIEIsz74Ju5oYAfMYlI9TzgATUU1
         4dBGC4YVfwJm+CK/mZ676FFmB4O5xoT4KxwnOMZEN/TRCTcVPMNJunDE06PAWNC/G/gy
         l3e+738pS6pHeElN37MzKglvDcA1FFazgWbE0TjjkkANNr7EsJjWzWweKWyczMblJ/D+
         9+rNJMoOP9AGXwiyFArDYepQGvPgjaOl0qyxJFpoo725MoIq4qh7it0vl/qjgc1J/S4t
         /iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296981; x=1761901781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAqe7CZi3/gqCGelPBXkKXXnwmTO3hbdt/2MJeLAtzA=;
        b=f7jOBpZSk4Y7z+SWDBi6UuPP/fH7m90lorzWFEFt3gvuW8DG2aKKLu2NQkaik4jh/4
         C9VX1wlUoHw0j4AtQIvXAgy6ZHWi9yXc6A2gS8pUe93XzI9fuld9oFyYYlSbOdi1hvPH
         FZ0UWeMjo4DXSAJ2l68KsZ+Mj4l4+N/zEdw6nx0AeAA+xncc6de1AYPYlDhNBgtFOb4K
         X0oWmn2EONGLzKISju3tvXQSaTGAVb99j/fKD+b35+H/car77VzxQ1+/E76Z3dgGSxoE
         p4lrIlO0Dv6gHAQCbq8MdyHRNgJDKCwDur+fNo7vA4QkGtHwuS1UdzYOLihBwh2Xcta8
         Wy6A==
X-Forwarded-Encrypted: i=1; AJvYcCXZpKarcrm9oKFeDO2uKnL0GZfrE6bRI2EiX9kYEHA+floFtS3kOStVqIt+TZYZduEqFKRJbY5OMAhq@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRwSUHLhFsKbmnVS0mESG4w7M9wbFzcHqIKMlMXwBCkqsoyS2
	jVpD2JEG15fXgpu9oeOTxz9xCzeojGn+FFvWZgEkTgv5kIpyHlDeqQWIbasV7OPNyx9FOCaobqO
	Kmq+KwzqZfpAW9noXGdO1TCVgTNvJaTMtKZF4O81CkQ==
X-Gm-Gg: ASbGnctl1x9oN8pM7KtXJFuYN12nIfRVYnnI++1yUYDiwYFtRqDJcttEFotnRgagi0k
	qShkPN5X8yhpfOcpplCt70McDfLnBTBzj5DTN+5YpwuGJkqMUyDMbdvJLQMlUyUdacwAu0W2nkC
	eNav05rWtIOkYnPhdlSFHPddHktcTR/Qnxs6RzDyKc6n7FPqoD6DsxQ4yozYYA6PqumQLVjKEra
	4ObHDYjBbPgcTNh0VeRpyHwrtgd0xB6wqxmCsnOF7FqZITehDdkjf5nAHywGR0Sv4fPBaw=
X-Google-Smtp-Source: AGHT+IHDOu6wke4O4DC+iGnNtg6zbqtK6KSChdJ8QpPRqUvEhR6minp0q16+phIn+H9iRbMdYm+MpMhaLWHPjXa2aRU=
X-Received: by 2002:a05:6512:3406:b0:590:656c:d106 with SMTP id
 2adb3069b0e04-591d857b65bmr8390462e87.53.1761296980742; Fri, 24 Oct 2025
 02:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023-stopwatch-cough-47d5497be5aa@spud>
In-Reply-To: <20251023-stopwatch-cough-47d5497be5aa@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Oct 2025 11:09:28 +0200
X-Gm-Features: AS18NWAWiEwRej3g2OXhBBdqWHb3gfghzPpIRKV8fjV2g8m8SOiJLs6wRO03VzA
Message-ID: <CACRpkdZ2-S+h+Snuj-+QE6-n6J4xSf+edmzdp9+o5dP1Vo1Zgw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Microchip mpfs/pic64gx pinctrl
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 7:15=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> There's a tag below for you to pull that has the syscon binding that
> gets edited in this series, since that's not in mainline yet.

Pulled this in and applied v4.

This is obviously in good shape and any remaining snags
can certainly be fixed in-tree.

Good job!

Yours,
Linus Walleij

