Return-Path: <linux-gpio+bounces-22793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D2AF8C66
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50712B6043D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B174A328B0C;
	Fri,  4 Jul 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPG9eN9s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391E328AE4
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617900; cv=none; b=NVcpjchS4+48hq8PlyPdahJ8SMyrJbFd2tKPp1Baj/+rH+P1fhgRn8o9riQ7WfhHFPGrxVqzNNq73G7UmbY6BaIvvc3N71bBE480I5XsMdHjIncocXDDof+3gtUMx/bh6SQ1tocBp6L+IGMmo1miiGwI4EMGk5o+gf2bu1Tvgws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617900; c=relaxed/simple;
	bh=RvN2Un6f2xSlS7HughJpiOFyEdo67EsciAuBpKgNWC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UACp1pe7DMde+sbujb/ncPtAI+osEsvEI9Qw9oLgPeVaj512kbOc21DD8xpo9WbSI/gXtqZPcfaNLphgzwKeS/vnfQIF4EQHBtJzk6i2GpeZ3Ceu7FCCDqTTtSctLe4oAqT2tw1vwvBMWW5ul9yruhk1OKbpNrfB8bRT1ZoJE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPG9eN9s; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10594812so913880e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751617897; x=1752222697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvN2Un6f2xSlS7HughJpiOFyEdo67EsciAuBpKgNWC8=;
        b=dPG9eN9sa51UWzgbfGykSUDaw2lR/L8scGAJSNov4qFHMztfbW6Ke2O9GD8DLw6nqq
         84v4vT+lU3k3jCJYEobDn8G2YfyCampcuJkY46UFzFo8YFxnsfVyHYvhSnYjgZ8SQ6Kx
         y7jFdMhksLH4h3FPfnm7y/iie2zDpsdfeE3lbaP+4qCAaRC61mWB4MmfYOA7o08iDi7r
         epkpFlxGr+WE5FNOnF16OMGpxu2KZkE7TYgFk62b4iNrz1tkh+FBwzdDkiGDzLqidmyO
         GLMB0AlZiZvdl1hxo7G3/syIDp8/xRChJBeYZMaQ1lJn0nuENMdUV2mR1UXpxECI46rd
         iqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617897; x=1752222697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvN2Un6f2xSlS7HughJpiOFyEdo67EsciAuBpKgNWC8=;
        b=oyG7cSdKCPDxkgwyE8/6SUGCZYMPdUQpAVDtCLs7+4FFJq12jKNtRIeY5sRcJ5z+g9
         NWawLRRhhT/9Li4uxd3R+d3cZMUK+rqW8+22z5IB/UXehyOQWOC2vv5h9E5lrsAd1una
         K4AOAnABN+6E8AtV4vrVtZylTHplvkQdNN7Y2We/Yy03oJqrIwsqVxMs/BUXdtlGxRtQ
         bHPHvEIfVGWPzbTjE303LQz+cwX053Tj2UPtdp1Qvn8cXSXG4rj34kjySj103PPPIUC2
         mZ9oPPmNt//LP9QLXEybDcfBUhJyl0pTkIwesGjmVzWdy18B/mxzZ8sX8DxTtDrxwuis
         TiVw==
X-Gm-Message-State: AOJu0YxOoxq17d9C7WoUjf83Yh1aq85kdqrvK4Z4e/V0XnukIuyQqzH1
	PeT3yS1SlnWh0FNRbN2VJDDuJ/EHLBhGjYvTus5qzfnyrcEvuZlgae5DOSMNdE6L9FBRLw2cvUo
	Nmk7QrFpmWItlwNdYqksSp1sVe4aPZL0TlFpx1dXFpg==
X-Gm-Gg: ASbGncvUxwCYKzXbz2tRfwAYcfi5QVgvp9ODASHB8KOldWPSgcV7g12hH3U63P5rSnC
	BBRV2MhyU47t8K++CoI2Yiil+DhIE8+gve8qNayJzMRz5xp687hgb+sxlSUNgy99IHQteABluvC
	3IsOF5GZqfUVGj8ff1JgComEd/OW5ZlotpAZAQ2P6OfMXquv3rY0LGiA==
X-Google-Smtp-Source: AGHT+IGn+kXvbuhkTWM2jRg7AZexmx4hsQZ+rHES1ugrlCG7rv9TjBidI2dQZm+dURqHkBY2T7JElheKLsd+CUcc+g0=
X-Received: by 2002:a05:6512:110c:b0:553:2fa8:8405 with SMTP id
 2adb3069b0e04-557ab2febd4mr274029e87.56.1751617896571; Fri, 04 Jul 2025
 01:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703143039.5809-1-milan.krstic@gmail.com>
In-Reply-To: <20250703143039.5809-1-milan.krstic@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:31:25 +0200
X-Gm-Features: Ac12FXzCpp3nQ7kq2hELMov7t_cIx4248LXRTsEkDtKyF2500jka7bfNQPEUa-k
Message-ID: <CACRpkdZJ--Jt6VhXUQz6RTpCZG5VELksYij5S9vy2Xg1+Fyipw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aw9523: fix can_sleep flag for GPIO chip
To: Milan Krstic <milan.krstic@gmail.com>
Cc: linux-gpio@vger.kernel.org, David Bauer <mail@david-bauer.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 4:33=E2=80=AFPM Milan Krstic <milan.krstic@gmail.com=
> wrote:

> The GPIO expander is connected via I2C, thus the can_sleep flag has to
> be set to true. This fixes spurious "scheduling while atomic" bugs
> in the kernel ringbuffer.
>
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Milan Krstic <milan.krstic@gmail.com>

Patch applied.

Yours,
Linus Walleij

