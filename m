Return-Path: <linux-gpio+bounces-15431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27904A2A4C6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E001888C17
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903AA226196;
	Thu,  6 Feb 2025 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="licLhQ5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6D226175
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834761; cv=none; b=V1QDfqusddfitaaLtke4+UDkiX0ayTo2eDKBS5AlEA8b4Mt+UFaJoVNWY+xtknuEtOdNl4IweNCLrO5ks+eoUrxMCLJPFbsyqpqcCGS47Rysh0SlH7vqbjOGuDfj2jxl53DORWmF49Ifg0o/HioJPnNovg6hirhojRW1+Oqdh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834761; c=relaxed/simple;
	bh=QxqCdZ87Rgx4ITls+sBoaB5NXU+rg+6sFyys6kqsgrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaGn1m3Fu7/mLKA3MzWfC3zX8q9MrD8eNGOYQcWQGlrXjChLBW4ljhDQ0oGfJLgA7B8NMNiSVrZtvsGjs0OpD9qJ9qzfjIgTKjK3tb2zPb3ZEmaOYUv3l29gwTVNcKdC0GBx33xy8XxBHUf4U2Lftd+V3htsXyjC0CwWNcla1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=licLhQ5e; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so630068e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834757; x=1739439557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxqCdZ87Rgx4ITls+sBoaB5NXU+rg+6sFyys6kqsgrM=;
        b=licLhQ5eluAjHoFsYIbW48leUXFFrxtQZp+uT7wowm2HOsPHZS0jcfoTUJMckdz5Q3
         Jfh9DeT40HqnUK7zLqMjbUzW8IFVc9DT7Sk5w19tf+M5zO+J+Fe20wmBeVrjdtdcT0q9
         GrYRgeOfHC7Hll22udPz93wCAAbfvD8Qy0ck4ZdggdcHHnGnOWchX4fJ+IYU1Zl1QN1z
         a2WMRH25KGl11EIFVZRTPTytWmkSF03w0a5/of72MmZSLewa/4qLD6cvOg7RvDYHxGF+
         r2Ii5U59SwZfrL9joMoskb2bze8zTD2EXP3ZSRIIYUiiLj2Z9w+YpYl2C10IU8A/r81w
         qkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834757; x=1739439557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxqCdZ87Rgx4ITls+sBoaB5NXU+rg+6sFyys6kqsgrM=;
        b=NLeibrbYP+JRZf9s3ZD9U+DmSZZt1+1gL9rnuIr+essroM/NbAXmrptL9BwiStVn70
         /V0GfbWbFVN8E1YJ6CDLRnCINfPwwbGxzmJfHBTEg+AzNw78E1HekrHwHhUevyUmNfvg
         u4lLPmP+SG2UeNWxXkmrITZ30IxSzgJTg6qpW/jFXfMz7IBdGnCFTvuwET6sx9pJ4Dhy
         nFwBy42H4qtJWO9zTQXZWl+xenImFsSdeccEu5joa3WViUv6QqqLQN/Uj9cp8vJzU0vq
         kbFu5v4YqgPjhJlz6p4GvOIzu8GgexY6LuKQwp7ribJJT9lk885zJyBrDCEren6w4v/e
         XoGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKyksaT1FAnoPtwNGu8+ZZoGluX/fBblkSalKc/eFh84tVYW4vmofcx0wzkN7I4iGefCKX1fIca6Ln@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8Tu51LEgg4k3XXLxNEi/auf95jkpF9yoE7BXstYlq6OF3t81
	rvcKWWy8GcbwPMjvhW+cZ7b/6D+uxKS/GsYYUL+qY36C3tlUCIlQA1WzmpADrjRsVsu47oluWWD
	CKTo7pQakMj5Uhq7RoCywWQZzb2nXz0zMfMrO/w==
X-Gm-Gg: ASbGnctQIpiwj6fN8fR0SBe3oygkkM0nJNr/sh8pms0r9fwzdOC+o/FLGrLlKQqQ//X
	+WAvmFUBoveIw0z1eemRlYq74b7FtdjCEC3TqSgRhXOP7rkjFDf4CJF3re/jApEnSbaJ+R14=
X-Google-Smtp-Source: AGHT+IHy2erTOylDXjPHhr46b25AbKpq4hR75UITsDiNv3fd/IuGBDeoE5/TCxFr0JD6443xhniX9GkOIwD7QR0zOhc=
X-Received: by 2002:a05:6512:1385:b0:543:c3d9:418b with SMTP id
 2adb3069b0e04-54405a0c5f6mr1856455e87.16.1738834756940; Thu, 06 Feb 2025
 01:39:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738328714.git.mazziesaccount@gmail.com>
 <3d85fe979fca352bed4d9841e3233c055dfaf154.1738328714.git.mazziesaccount@gmail.com>
 <6867812e-7269-4686-9fc2-55afd9fa91bf@gmail.com>
In-Reply-To: <6867812e-7269-4686-9fc2-55afd9fa91bf@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:39:05 +0100
X-Gm-Features: AWEUYZlG4xyNl-aquwRcbpurNNF0W3dgBH-PwD4_WNVA671mh_9EE2XioA6hXcg
Message-ID: <CACRpkdaP6biD8ueeezBDw1P3LP6ARoJw0zfkmxC-QKK0fw79YQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] pinctrl: Support ROHM BD79124 pinmux / GPO
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Nuno Sa <nuno.sa@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Dumitru Ceclan <mitrutzceclan@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 2:40=E2=80=AFPM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:
> On 31/01/2025 15:38, Matti Vaittinen wrote:
> > The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The AIN pins can be
> > used as ADC inputs, or as general purpose outputs.
> >
> > Support changing pin function (GPO / ADC) and the gpo output control.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---
> >
> > NOTE: This patch is not properly tested. More thorough testing is to be
> > done prior v2 if this pinmux approach makes sense.
>
> Just a note to reviewers - I dropped the pinmux from v2. No need to
> review this any further.

Why? Gave up on the idea or want to pursue it later?

Yours,
Linus Walleij

