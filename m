Return-Path: <linux-gpio+bounces-15279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304BA25B08
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF216188316F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22151204F87;
	Mon,  3 Feb 2025 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mM6ozxRC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25079205512
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589760; cv=none; b=OqfDPWoxz8QEOYzZ0rw13i3ht8E+FgX5Sg8HDnaqtij65AH/gHVS/7j/bzXnybAdzVT7z8x5U48ntAI6lh0n6I9bNeTqA87DflT9lvKYFRAqTBDe0n6VMUvZ2rnrloiePGK4k0B9vcWtZlHfU3EpV5HDuQPMEf/4C7a9xfeYWW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589760; c=relaxed/simple;
	bh=9i+TRd6fMeAucoxvREtTbYzk17wUVO/ofjr8bEz5aBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOw44Tj2edcFFzWfZfK1sZ2I8gcQcNzincVOByrEQSvAjzaDG1mip5PpEvb24y3kGO+1OvwU7eCtajMupRW8u97wpH+HJB2XtdAP3VafP1raTGG/bnL7OeNu9cRcxKmSIHkr/JRRGEcDacm3Tua9jD+DV+zjsmH91n6M9zJAUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mM6ozxRC; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30229d5b21cso32511871fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589757; x=1739194557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i+TRd6fMeAucoxvREtTbYzk17wUVO/ofjr8bEz5aBw=;
        b=mM6ozxRCMCJlI0yPxx6OjfCJSKpoOSEVE8tAXQoUYODJpejLnkvZel/Y3gMZiSzdPk
         LIjQ1GrB6g2hk6I2hgy0daK1cpM1djHI6S+JjVO4ImvLLA/CEOOaUI7MGKojD0PQyWYr
         P8OyDbXdpRbkOVW1/FGRcW4rdwOJ9TUtt+BWO6ZSdP2an3+E0D5q/xOY/D0zVUoOZlIO
         35mA8aTtPPtrUEZrP7z10SPj/7egvHgpRKCEkOzNp+olpZ7fDP1mhC+mtVQdgh15zFgU
         d6PxnS8x9kM7Y9cbFdEzvBdZlNZLVkeHyvFUmyY+K61R1nAWGOJa4LpyaQpQV2qPY46Q
         qPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589757; x=1739194557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i+TRd6fMeAucoxvREtTbYzk17wUVO/ofjr8bEz5aBw=;
        b=YIYtVJ2FqkX0BJ4sHAYkLeJgb6Wl8QblLEspOmIdWnHSwyAI1w7abC45o7TDTOoJ5j
         7Y3NHEJksEx+7A+sCzp5jlH6PpI3NCHi2+lwY2renMDta/HzAeG6I9Bwb7JvbL76cXKx
         1NfB5sy19v99vCrlur9nX9wQBGzbB3KNJbm7N7k9Al8+MuyjEljfxxXvny6lxcoqG4ll
         bHTkmEhcRAn8Gl6Y43i9BewWEr6Nule9ZbubapWk6H5WPyer17+xMDyg2Ww0/xjTWsin
         y9GGbaWWw6X9i4uTIuBfWpRlRHZkdARi+eP1m0P1/FZSJ5u8CMHX0+Tx0Avd5bHpDOMO
         EwNA==
X-Gm-Message-State: AOJu0Yx8qAjNvIeCGEVfD3g2CpqgenkG1pLPacOCA6Nlpli5aFIaPFeV
	f/gAMaF3vEdhbooJroK+pt4ykWMust76AFbExqaJvUstUM98PeK+OZAzjvGWMk4Dap/7FuFb0AF
	b2Evx/Gi7TTuYupYI/Otig+zHqLKgTaFXXwq4aw==
X-Gm-Gg: ASbGncsfRziNwnD+5KMLlzMqXy3djfE2zdD2par0djwIz65j8aUkekbEd7DOhsT/0EG
	jkssdK5HbBrokzbFpZVTuo5U0Fdl2syQ7FHA8EN03taAQliVnm4bjMtN9Z3A0DQtGRztTRAE=
X-Google-Smtp-Source: AGHT+IF2uQQf2LlzVO/SvvaOzU4QwwvuOQNtQ4y8783YxBD/GETqIfKElvcdVDtRO7eARDp5oQ6LD38X+mTqxoSWN5U=
X-Received: by 2002:a05:651c:1993:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-30796950f43mr78550631fa.24.1738589757132; Mon, 03 Feb 2025
 05:35:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Feb 2025 14:35:46 +0100
X-Gm-Features: AWEUYZnig5RYlzvUIDF8INcKiw1Mj7TxOB08-QJWBdezeD_KADFV59RnOb9VboA
Message-ID: <CACRpkdYPAa3NYDz4_ch9NG_bno8QfO7g9QTHfDB--XrDRd2NXA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] pinctrl: cy8c95x0: Bugfixes and cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 2:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This a set of the bugfixes and cleanups I have collected so far while
> testing the driver on Intel Galileo Gen 1 last year.
>
> Patches 1-2 are kinda important fixes, patch 3 is half-half, it helps
> a lot when debugging, patch 4 is semantically a fix, but can wait.
> The rest is number of refactoring and cleaning up changes.

I applied patches 1-4 for fixes since we are early in the rc cycle.

I will probably start devel off -rc2 or so and then I can queue the rest
on top of that.

Thanks for fixing it all up Andy!

Yours,
Linus Walleij

