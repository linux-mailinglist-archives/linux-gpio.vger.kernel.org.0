Return-Path: <linux-gpio+bounces-20023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E85BFAB4FDC
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA6A177AD6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420F723814A;
	Tue, 13 May 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGrLbBdN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA921D3F6
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128764; cv=none; b=NLAXXhZmLAtyHNL2Gnw3tX8Ekd1fGbbasKN1cAiGMWA3gpqGNLuk1D+1BpZgkJtP5cYvHZiHfe7rLsa3k/f9xecgnZCEd/KtAJTmuiXf2mB9Pa29bwnpIreTk6dE7JFOWuBNAjAlRhUutQsAg3Ohi+5rLvkeK8BIDobvrIJZpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128764; c=relaxed/simple;
	bh=NY6vJD4bfvHx2WAT2VVCtdPSXGmyW9DHyy+RXKVoSAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/uxmUg9I8IZRwOIu/PeJOXIWqFTvpjizAjDt0RdluUc9sOsG+Lr/Sy3vpRXsdb4m4UWcKPodkUNNf07rSAAwU1P9olnGuRyvI5NNcQpW0b/5c3CEk+J1zfaQa2vFQKirvjJaqaBJ1VzYUCUYOBV9DExDzXC8fR+lxhm8sCpPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGrLbBdN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6969714e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128760; x=1747733560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY6vJD4bfvHx2WAT2VVCtdPSXGmyW9DHyy+RXKVoSAc=;
        b=oGrLbBdNe47+XhC7TJrOpYDGraecVQIUsdahLRDkYTEymSZekogcC9clY4rGX9O4EA
         SyGRIJJh0KYEzI1izldRcXez2IEjVPslU2GReqr2wr+fOVx4IYJS/S9t5HG/akhS82Do
         OPPrsCBOQ8AWpPhx4vm95xqFL46rh9IpaTOHLDlcr5XLQtVMbMLfPk3Mpws3ppXoRDLn
         kLl3zs65IlT0EhhCNwSejQ+QcaMoACgv2iS9rYXXw641iq/Gd0Lamug30VZq+iv7jSWJ
         04f1dt5xZOqCLOHc7oLR1Gn5xUpcIys2v40BmxnNdOPxK0mRaoPW96Q9nU+lt0KCCMYr
         hzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128760; x=1747733560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY6vJD4bfvHx2WAT2VVCtdPSXGmyW9DHyy+RXKVoSAc=;
        b=lk82+sEO6QRMu5FieHDyLogClNhWgi6wtmKLqROiDlhJSdBkUhpxrY/MzT+xorRz/K
         to0Sg6fC9vxIyMYovYwHykSbr0z/FttXHsGpmgK0Z2DTZ7E3ZfoKmaVBfJR9EG9Ns+nA
         ecTxOsG5QNElXaOEpEmaP2+f+DDAZHAxWz7cPOQekDEFHAYidYjEmJuztCptbGn5aYtF
         Z3vyeYTdfdR5ZSJ7GxgPsX0OAIC/Ao4s2bOWAZZ6fjnJdff+0yG6kGNgG8LzsgdqcVCj
         YCEcpKQjBBqsilr2+G/SPMvTTnaEkm7NfkzzxWAd7FVa6AwWgb6KEBkJvkEbjd4RiS8U
         ioTA==
X-Forwarded-Encrypted: i=1; AJvYcCVOft0xoDOeSK7guK3WffYDhd3o4Rohi4p7MXLkf3UtmcHBcRMtDPggQtOydzmBQ3VbhXNiMU9F72lV@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNEKBUSp12GlN7rG6jK6N1rOduDfP+1thS9ItR4UQpMzNMQxK
	1uHvILu1f+2PkmSDRb9FNd8ZOegdD3Ov+mXjiDiPBLgpz8dxQjOSIonE0T4PnjywbYSvw9ukZRE
	fRWdfhjwfdAuHDo3XRLVvBYIOINY4Y1j2V9CLAA==
X-Gm-Gg: ASbGncs1LTXcQjr9A0DiWzpVsN6l4R/0lkZNu0pXmVN1GHCPsE/KDZTgnPEmEuXFVrg
	Nto+AIUyyVJg3ydj4zSkDviNCiIj82YH8ZqMVzpoTOvjswkrmVHB5VvDdAHeJyOr/TMibWbgeWc
	YhqWgs8bVGVEEeCpM+tYDrbkhNRqgc209L2R7D0UzUz4o=
X-Google-Smtp-Source: AGHT+IFnK4yMmep2oyTd3Pj8ao8ZioYGFRMefY/RBKYSi7PGi/PRviB7Soxar1b8q/3OFeF6n//VAYjpNJYFXydwDaU=
X-Received: by 2002:a05:6512:ea4:b0:54f:c17a:9ec6 with SMTP id
 2adb3069b0e04-54fc67ed719mr5685544e87.55.1747128760174; Tue, 13 May 2025
 02:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745605382.git.Jonathan.Santos@analog.com> <f76579f8aa040125568c044c86761211a2e2f5ae.1745605382.git.Jonathan.Santos@analog.com>
In-Reply-To: <f76579f8aa040125568c044c86761211a2e2f5ae.1745605382.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:32:29 +0200
X-Gm-Features: AX0GCFup66n6QQY-S1ZUx_c9rDRe7cXgMWjG_C9fMa-KAt7hqRpUWdgbNpUpBRs
Message-ID: <CACRpkdZG0h+0vDJZSt_UyukYXVTX2wLjK-JReqgutJJ8zJS_yg@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, 
	jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marcelo.schmitt1@gmail.com, brgl@bgdev.pl, lgirdwood@gmail.com, 
	broonie@kernel.org, jonath4nns@gmail.com, dlechner@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 2:12=E2=80=AFAM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> Inspired by pwm-trigger, create a new binding for using a GPIO
> line as a trigger source.
>
> Link: https://lore.kernel.org/linux-iio/20250207-dlech-mainline-spi-engin=
e-offload-2-v8-3-e48a489be48c@baylibre.com/
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

