Return-Path: <linux-gpio+bounces-27020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FFBD2AC9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9278834AB0E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 10:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEF1305968;
	Mon, 13 Oct 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPQvDs6B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED23054D3
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353017; cv=none; b=C2njf8hfcTFnJq9zpLfwdSNnqFfx2QFhm7+yIdQR9+oed+5oyD9+oU4fCKKBDzBIRKZzUJd4mY1s0a9L7WZJufF7oTzQOhxifDlD+dHlts0adP18HBiyGp8UGKqe80XyaaBMEC5bhsMEITk8QO7E4t15PUhc4thzPeQfafbmNBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353017; c=relaxed/simple;
	bh=cuhlsRGZ78ZCK+i6pLB4VYiUl/NgpgjamUrqRDCwpe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZyq23lgv5pv3DTtSS+B8T0fOItSj0PqLmZGtI7C5psvR+lfW05IAki9NEYoL0Vh8AHlZISpDGf9ayz5diq+TSNfjIJqq4oTGVtx/jyaFSentKXK1HlZEEhDy59fFQ5b3DuIWXDCpj9BosWZPtBWf4HN1vL2vWNtXAHPDvfbJLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPQvDs6B; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso47117841fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353013; x=1760957813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuhlsRGZ78ZCK+i6pLB4VYiUl/NgpgjamUrqRDCwpe4=;
        b=dPQvDs6Bmyuc5ZcwOv/DvsQtuF3L5hsY2JpOLJs4dzkGaJhXTLoDX6/WdQlx7DkKuP
         kpmftwumVZAiwFB7aLO1kunYRPeeRMGTLCImSl1PH1GJSYeQEUpcyJBuYlTYWKGxEW3X
         NJngTNn2qvyRwy9zrcXgEjafbkWYYEvRh0QYAlCp8hwMM3g58LAybSE51qX8+luDD8MH
         LxBul3Qndq479ErrBL19FSjTU7yNdVtPiJjZvMN79cD0UIJa2sxoTp848+YqyJevwxEO
         oS/Ey7UrjB3svOmHZgBCN3lUtvOG6cTSPQZnQ99tni6YYwdGe4066ESnvGsHqRK8GKTi
         09Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353013; x=1760957813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuhlsRGZ78ZCK+i6pLB4VYiUl/NgpgjamUrqRDCwpe4=;
        b=AD6WDB3IkSgV2lKyWbzY/MNWPpcA1Ja3UhbzzC1knCHsDVYFTY7wZqG9RM6IcOmyYC
         mrdVIbD9OQeB2VHF7Aog1Ybdph/blfnILmrv2Fgwycsx+YDrabm2rIOReeF1c8D+p4FS
         SKeFmWOmTxGuwoNr2Ix4fmiiWrwCbd18ZNmLHGjc5HAQpJnPcqbWVDS9TAgGawnoWw57
         19aFJbIYK5L6sDcGl0BFPfgCX9s3j8vBTMLTI73nhQ9asJ12PY7dQSjuRTKickUOecDx
         kbvkwwxvulSzzzQ3sjSveIRyJvg1ChYovHiJWyLrWAhAGLBFFzVHEsQ/Z0UfYqqVmDtl
         h7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2th3p4/BHk0CUTHTe28oiBGSXi0lr6DS9mdiG/pnjwcQdKR+QE+OZiDh7DSl//8e0A6Nw1M6X1zXn@vger.kernel.org
X-Gm-Message-State: AOJu0YysMCLMsAFPOA5NAafyDOf7c5Lr3nyeKUW96Kiv1/CWcslWYUu+
	BXEkFzBv5vT1gUHrxkeBNg8qbkggGTSLKDNAuFyvw0YEYUu/KobMeIym3M3GWlebKBSmqtCX+jw
	xR4iqTAK4eUm/YAT+2ER4OWD9hGrW+srOcPoLrC5CgA==
X-Gm-Gg: ASbGncuxMEgasyz7889qYI42dMenJIeSrKXrmXp7+w1YDVp+AUuqe4EqXJVBE6Seh91
	IURaYc4nNbUq0psE3kkFuigzSJz/TItrl4Tq66BK9KmNxqIDgwpjXK0pfpImUHcO/sZxvRN9C0E
	FjWbjfnof3Lpc5fPIpEuwxWEN5Mx2WrkDGM4DqFVliY3pu74h9HXlUC9aq7tPo/rcPnNNCsK7qY
	QR77rzS9JiqPlZOkKOW/UBbJrq7QQjDU7o49LPJ
X-Google-Smtp-Source: AGHT+IE1gkkabOIAnZfQXu8kGXe6MkVX0ZvpgT0Y/MWr8zsJV81cmdZYE3u4QKqYOJmeh1bYRTRFWqIK0UfiPypTXaw=
X-Received: by 2002:a2e:b8c4:0:b0:336:aebe:27d7 with SMTP id
 38308e7fff4ca-3760a511824mr48512821fa.11.1760353013278; Mon, 13 Oct 2025
 03:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud> <20250926-gilled-muppet-6ac08937cea6@spud>
 <CACRpkdYoECsAGwUno0b_nz-iBB=iwO0Js_6k4O5k+xhig2NYkg@mail.gmail.com> <20251001-grunge-unroll-d7a48294570a@spud>
In-Reply-To: <20251001-grunge-unroll-d7a48294570a@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:56:42 +0200
X-Gm-Features: AS18NWBfQSwJS9NQHEtjvH0WH7Q63ja9J4yGdPqiKLaT9B-wFkcpU4BJlW9NHIU
Message-ID: <CACRpkdYi_n0VcN78eTCty+rVvTnSPFa-pRGOw1LFziBd_2vwBw@mail.gmail.com>
Subject: Re: [RFC 2/5] dt-bindings: pinctrl: add pic64gx "gpio2" pinmux
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 5:47=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> tbh, I found it hard to understand the "line" between using a pinmux
> property and where stuff should be described in groups or functions in a
> driver. What is that line?

There is no such line, basically what I like as pin control maintainer
is what exists in the documentation with groups and functions.

Then various driver maintainers have pushed me around since
day 1 because they think it is much more convenient to just
have some single value to poke into a register.

I have come to accept both because the discussions just
go on forever. I'm not a very stern person, "those are my
principles, if you don't like them, I have others".

Essentially it is a question about what the device tree is for:
is it just for (outline) description and configuration of hardware
for a specific system, i.e. where everything that is not
system-specific should be encoded into the driver, or is it
for dumping all kind of various SoC-specific stuff into, without
abstraction. There is no clear line there either, and that is
part of the problem here.

Yours,
Linus Walleij

