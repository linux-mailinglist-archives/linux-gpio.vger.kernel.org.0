Return-Path: <linux-gpio+bounces-16733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16622A48C6B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90DDA169E1E
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 23:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EA926E975;
	Thu, 27 Feb 2025 23:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKtr77nN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF57823E32C
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 23:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740697643; cv=none; b=uvYsRo2o8qlshSP3ubEeB50ELNR13TurvONjZtPpbEvk+xSodaZQ2+EHD4E4YWP/m03XCnjTTLaGB1KUNFvyRCUBoNW99EHCqsGG7QsXcFh261MmQ9TZdZquck43u97l1xQUY1dqQF1/BJp0oUK1mmMg3kik++3dCT1NkwtTO1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740697643; c=relaxed/simple;
	bh=vz1obdxJIIoDV20lR6JnE5eTn9ujKWpbRqwh9oeEfIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YfEL0eY96Y/I1uJBL0UZP7cKLADB7m21t/dudpff8gWswm2Dwh0vWedS67yaH0DN5NoywGzSm7QBAJ5bxtH4i9k+QQ1pNiPJUover7xLBxJseC83yq+/HBifrTQT/aLjWN7Rrwg5TSQZhoLc36CCGF+JgF+Qk3KF6mRBS2fNf7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKtr77nN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30a2594435dso25060741fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 15:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740697639; x=1741302439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=;
        b=VKtr77nNb4ymvEhjFfpJCOJi/uffVf29PItT2KGqEbg1YLlQjbwC6hmRwZ/VBl5hNy
         /iCZDg4uJL7iD7oW26mwRqWrs2lGEaIm1VUDT009QupDuQaGUy+gVm8pyO5sKMUb4z1M
         IeIAdmU+42CWpD4EJQ8ssgsHO0V3WwlD0oh59BhFMOaF85rpHouAtr0J23mBdtx8Ly3o
         dYTvwwAUqX27UwdJJNIGDGifM32K7ZELdIzquK05iYZjaUz+Adx0hnMnKqJ+J7tUt6v/
         Sndl9voM3Do0/LQJMGqcuYCREo6sYW1tvICW2+wuZ1eG13RZPWdeBpYcSKly0+rsNtGj
         h5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697639; x=1741302439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=;
        b=ibM8F4Ka2micz/ovqkyqLY6feoEN2l/M0dLACbINa1TfGyvst9AYb5fZjYgJ7+0IO+
         LrMJOK1RCP8VCOghRPJUcuCEyVGuC6KqCwrhTNpuHiQXcD6/Apy+zL+SvUwx3yyxQ+Ev
         p6Q/4+Xzij3ppwHrNQjbOyVrqnx+rMZV0uLRvhPDLpN5QXQ5ldQwucXkpWS1+QB55TpK
         sI9dzc5sI+QqOK/9rin/WIPQE+kmiELd+U3g5Z/E/gNyaYz8qymBh9yyLRYfLd8th7W0
         jAri0I0IaCOHMcW+y6VSM7CyMbs4y85h3YQ9jnkMkjpK4au6MJ+trCUEvJkr4Cer5Noy
         NFDA==
X-Forwarded-Encrypted: i=1; AJvYcCVp7mIMkHoRthkKodtwDKTCzzjfVui/giaYV0uDkqCVZWLsEA55amaWtHcgNFp/7NFdFWug7ZOMdwVG@vger.kernel.org
X-Gm-Message-State: AOJu0YzKM6TCkifQAxE1QGhuH4ODhL2VdWkemFxMo1sRPhTE4E2wu1MC
	tmFXOXJNNDzCIVXcDFDoXYgkqT2eh+qcusM1dylVBtsqpr7nlNQpWsGuVgaJCh+AvIAF0Z29fkz
	KfD6DsA3GCannMabHn2gnf9g2bqtKCOyt2/DwQg==
X-Gm-Gg: ASbGncstLk6CFCOLR1juPTreKdaW67FP0jdh1Gox9/Z+7ebnqqmTgv/Lr2Fx58zCAI4
	kkZ6uSFfcznHEwgs/rqIsGDQmMYr7zZLqxt9vl2bpKT0K95UxhFumJr28xV+dBYgXWgprklAK0i
	uklk3SnQA=
X-Google-Smtp-Source: AGHT+IFufz181XNYlSjaAjssVbP9sbOQz0B9cNRA45vok7xAon3DLgbajO4WEtqa7uIwsizRpA7u/lhxgF69lTQZ82w=
X-Received: by 2002:a05:651c:2105:b0:30a:2a8a:e4d0 with SMTP id
 38308e7fff4ca-30b90a8247cmr3926491fa.17.1740697639007; Thu, 27 Feb 2025
 15:07:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:07:07 +0100
X-Gm-Features: AQ5f1JqjsVFh7X8JQClBDzM8iluOtRQbPulUgXhGdh38CQTozMVRauwBZfmmZkc
Message-ID: <CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40khNZDdYb01-BGigw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

I applied patches 1, 2, 3 and 5 to the pinctrl tree on this
immutable branch:
https://web.git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/log/?h=3Dib-amlogic-a4

On Wed, Feb 12, 2025 at 6:24=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

>       arm64: dts: amlogic: a4: add pinctrl node

Please funnel this patch through the SoC tree.

If there are dependencies, they can be pulled in from the immutable
branch.

Yours,
Linus Walleij

