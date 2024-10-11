Return-Path: <linux-gpio+bounces-11218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51C99AD1E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8E12822A0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398DD1D0E30;
	Fri, 11 Oct 2024 19:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykLRA7OY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264C21CDA05
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676433; cv=none; b=OFLWrFNpB0YWbGovb0j1CyNJ0sEfIwtzxO2cyFpBn0QrqR+1E1m+XEqFg1oLtMqkSyg6Xs1Dt6NKD6B0dfPXr1HpRMLbiweROoD3OeG8Dk96SVLSVa8OCZZjmyhqjNiO591F/hF358f4YBpiBfeeQ0kETyWqfgqCy2aegrzDBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676433; c=relaxed/simple;
	bh=Q1S0l5bqrCwAJE2B4cYVKcDGAaSdEGWZdPav2c6jOXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hN2yPGgM32VJMFRpnVkkXDM/UkutFtGbK04lXw2w4vllHemprHYDkjTGXdvXR+PDuc7RQfa0+ZgsjxjgPb5vzCDnXadWZ2JYDLAntpTqvlwWyWFLaw2ffU+Usbldy3w9aZb2VGsM6jKkJPZ1JPPKvmJROLBkW8KHgIZXQxdobWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykLRA7OY; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e4237da4so22475217b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676429; x=1729281229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1S0l5bqrCwAJE2B4cYVKcDGAaSdEGWZdPav2c6jOXQ=;
        b=ykLRA7OYQ5Ec0ufU7EhhstmGYutoYTpf17zjILB3a2LtP/Ek5saC7Nfjj5TPla7/eX
         vQcz4QCc8Y5KXl7nduSzYG7jNMnZEua9vCgUIjRaKmkbYBV8lhG1W2E7gqQ7KWjIqWTu
         eJVnLUvtQCCdZZwhuvvVbfcORtxF7SfKWoar17VR7aRZJ1/rmHCy6W3tLV/X3v+0eQLa
         qBb/mge4dxkiCcoTcxKKVNOJ66C+FdGYl8ukRcijjeKye3Ynu4n4yvoXkGiTBAinWvl1
         TYN6PbJvEzBQaPseKahqdSMyE5wU+jNr/YrVH1ZxhhQWghZ23GKxdB/DuTsoyH3yBO93
         R2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676429; x=1729281229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1S0l5bqrCwAJE2B4cYVKcDGAaSdEGWZdPav2c6jOXQ=;
        b=GgG1Us4xmm+FaGAzZuxjA4+Ax1XosNTGYArxSbnl0IEYCfr79M2AiLnj4lDr6BIh3W
         cGexSYqoRW3cedY6TkW7N9j4l0UavlY+DmN28pbfQwlkYruoVaxWRbhIBdFz3wuNBTCm
         t/REEtkaH/7MhEtfBIc01pLY1cSnGsfp6ZRxTH8l56I0KhBCqpq+jdWSvasaoSaaMFRC
         o36Lo7WWLfWcWAP4xElGey+GAWKbrA4djpglJ6Kl9JCF2dN6tRxIg7OO2l2yAZKfJsFj
         hbFrdlZOr8h8+VBIxKWAIFdyfPpv56OB/9suEGbLFnSn/FCWBRRshUaDZ6v9YzRaQs9P
         6ssg==
X-Forwarded-Encrypted: i=1; AJvYcCXV4z1+0oEm0AjQxTS/o45jVGEZNpt/eAhAk/GYOE60jK80ZvqCCCn4Xe1oTDcDSpk1Kc0rYQxfq8q2@vger.kernel.org
X-Gm-Message-State: AOJu0YyWz5qKqrBOzOQfXnjgiKM6Uq/9xw+u87dXVd0EDGReJ1W2hbdh
	mfbJeMFiiiMB0NJPwHki67YP0CYdIY8+3kwVNQbm+v2Y5+epGe3fBJcajsMHGzuNH0DFO5VDIJ4
	W6ow/vcx9bT7f9YPZf044ilQWl97zOVHIyDj5Za5DXEq8YcDf
X-Google-Smtp-Source: AGHT+IEHFBjlZz97FIa9PukcMmi8TZq/8cMlUE9lnXcka8rn5cesotys6U1UbJ3A7nRbAy9qk3PKHL+XgC4aX3ra/EU=
X-Received: by 2002:a05:690c:4e89:b0:6dd:c8e9:6655 with SMTP id
 00721157ae682-6e347c52d0amr20589117b3.45.1728676429175; Fri, 11 Oct 2024
 12:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009151249.2086702-1-marc.ferland@sonatest.com>
In-Reply-To: <20241009151249.2086702-1-marc.ferland@sonatest.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:53:37 +0200
Message-ID: <CACRpkdbJSM+gB2rzkLYt6VmmpCUeF5QaJ1NhDJxekU6qJPuiNA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Fix two small typos
To: marc.ferland@gmail.com
Cc: Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 5:13=E2=80=AFPM <marc.ferland@gmail.com> wrote:

> From: Marc Ferland <marc.ferland@sonatest.com>
>
> Found those two while reading the code:
>
> EDGE_TRAGGER -> EDGE_TRIGGER
> BOTH_EADGE -> BOTH_EDGES
>
> No functional changes, compile tested only.
>
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>

Patch applied.

Yours,
Linus Walleij

