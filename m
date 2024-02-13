Return-Path: <linux-gpio+bounces-3250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD15853D64
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 22:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F140A1C2114A
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 21:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B67562813;
	Tue, 13 Feb 2024 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nu+rDl5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493A626DD
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707860423; cv=none; b=QaSWdBEusYNJTyXanKnePTgFH7i9ZeW/UonHCkWNTQDl4VqerJPBB6xDeQdii0iPr+MPnPv1Nl4RoujJ8qNN0CZmckgYIAvLveX0fu17+7PoC6dsSflkhpiv6VHPYUa5mi98PfIY3i+g7WsYb6tRTc56T9rwZzCwQSGPlNqSS7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707860423; c=relaxed/simple;
	bh=dbFTyn7f3Bl53OcK8D9X/nWjgslx47eYuZAqktCtuuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ipsr6KricS7PesSvXI0NNqZg6x1XIkRkYe4Cf0xa7zE5sM8zy7/HsTYdWRC537m/MmeLslWf6bqzTjeyTFbZBpfuoY5PIb+jjZjO2mA5zqNf4jBqO5P2xySkahuEwbKcHemVvYitwMQXh2IymVCZohSQBstzN0BO4FtlYhGkBws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nu+rDl5z; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6077789e054so18251297b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860419; x=1708465219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbFTyn7f3Bl53OcK8D9X/nWjgslx47eYuZAqktCtuuk=;
        b=Nu+rDl5zo4iTrqjqPj78xjkzT4cMscx1PPubPBWe5N2cMjjLIDO18lFH3dM1JFSKZq
         26UjzIah0cH/OWRiTC0v2MkcZ3kh8jFe6Nlwtqfe3yS7f2EmM8iPK64w3r05XpiJxnNh
         RcjkbuHwbZxK+J1HqDufXLVPgSXUQ29zYnFPWGti6W7VxOgddSZcfIBHjTpHg6wpQ4Rs
         CWQU0ydzXJNutGwSBXpJWpJ8ETw40aPHfruES92QxaBFcp90uiR8oOQRhAPE24GfTRGb
         z2LpAPJ3LVxEoRrd5o3OczWvjTD9cQpM62f2ZRG1qjiNpY+Z4snzZ+N/X4Z5j2jxhcH8
         rVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860419; x=1708465219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbFTyn7f3Bl53OcK8D9X/nWjgslx47eYuZAqktCtuuk=;
        b=hFuXaBOlyaPxVwXltuemlwdsi8RQGClJQTC0jntCFrUkbb85+TNxYO6jizeuanDuJq
         Lag0EIT/6FK6CW8Mg0ly+izr/heuXZ0oj4fBANRTE8R5UUajDOm3gIDd16ALfLTWb4vi
         OOj1uM/mE6nigC4M5fnXXULqFkLvQtJY48HwsCsCyn9fExnlkf1ezEIl340jf381LMM1
         J1baYCLuDAmBiVYe1I4eR6YGSmA6Fwmmij/bDzTj2bUqxd85owtJeermcspnOqfTMvyI
         9xLyV2k5EU/ehRG1RoYBT96W8ypJCmtMYzrYGnlEtm+AVM9wzW6byl3RQ5fb4DBGUvk5
         pNFA==
X-Forwarded-Encrypted: i=1; AJvYcCXsQ1ReXGn/t99ej3bO+2aRhibm5ZzSlxzr85DuXyyWNSEiCKZe81A2KMlsc5FP2HIF5E0df/ENUanlPut9MI0Z3NchJAl17Bvbwg==
X-Gm-Message-State: AOJu0Yw1XJzXE5jsy8wD8zw/wPTvfLXRw0taGpzaxjeCMztKXKlYcoaG
	gKS7FFvq4yTPTt3XNFEzvYCEEsP+C5j+q4D4SzApg/rB46EjQ/qHUSAeIAuOOiIKiPmN8G/GgDk
	ri6dUQZPhAeU4+p8CGFmNkntkhwr3U+Iqk5KIF7kMT5q195qPlBY=
X-Google-Smtp-Source: AGHT+IG+DrTkq+6t5fDsH9BhBPiao8mavkN9+7BGb5kbh070ERv4KU9R3wW6RVskOso+QLGC3mPrRgt0YTpbyg4aQl0=
X-Received: by 2002:a25:ac18:0:b0:dcc:787:e8f9 with SMTP id
 w24-20020a25ac18000000b00dcc0787e8f9mr426631ybi.51.1707860419256; Tue, 13 Feb
 2024 13:40:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213141222.382457-1-warthog618@gmail.com>
In-Reply-To: <20240213141222.382457-1-warthog618@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:40:08 +0100
Message-ID: <CACRpkdYGTay1s=yK6nWXar-AoVzyZhd=i-h2Ff9xdH7_CO=gdA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: consistent use of logical line value terminology
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, brgl@bgdev.pl, andy@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:12=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:

> Consistently use active/inactive to describe logical line values, rather
> than high/low, which is used for physical values, or asserted/de-asserted
> which is awkward.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

