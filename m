Return-Path: <linux-gpio+bounces-2777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18738843892
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 09:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8A17288A36
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 08:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC4C5677B;
	Wed, 31 Jan 2024 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCP17sop"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3CF5733B
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688782; cv=none; b=iKUCWssHLDDIWfz9+7vdyU0HB3STDj0BOPXnKrsx6Q0bkiouVH0Vha6OlS3hE9fx2TxGz4lK7j0/3IJpGC7/b8P0v9yEbxFOsQ903JTrKy/KtDl3dk+Ygnt4zTSrXT9P5XVIwQ93OovEezp+dJvCIw7C/Xxy79iMoKJUdJoSx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688782; c=relaxed/simple;
	bh=+KixwNmf6DvpKIQRSBV/2LlYNkbWX43zmPDpGkU2JMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbgxddXgvfvU/hQpG08rai/HSlF8zGGHEL4c+ztaWFyduXiQhCr8Ta77BjFb+Ysj6LOnzVS7CxObSQFVgIF9Er0IxpDOpJHbxsSnzMsZczq5P9l1WdVCgtEBYGwEtMy2BM2S53kvQbc4Uv9ET7qODrxLp96rDyEt7uyFpn2H0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCP17sop; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-602d2e67217so49144737b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 00:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688779; x=1707293579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KixwNmf6DvpKIQRSBV/2LlYNkbWX43zmPDpGkU2JMM=;
        b=BCP17sophzgFlS/UQErPzQWYPBYChk8PfkSDmlLdvu4Enf9Z5jtBVitVRrQVUiPXyG
         nri2CJBpgroJY4bWjzv0E+XaiobyQjEV9zY3sunCcxXpbVe9r2U+YZQ4Sa3DA5bhZbb8
         27nC9CuwnOUk7nKpq4PgPFPbtbYaiRVYdusV+sGAY9kz5S5kJtQJmKak58s5HHVWXBCH
         BpByR/7ym+h+a034a4DKi07zIFMQEgvRfjz3lc67ek7Wd29GCBBZD+8/m+0VhfQ93hv2
         UrFaqEO9RFKaNXShN8kPT4PABkh81IFSzu2S+pydVAhjeyf5dgTECw/O+gZ0Votw1xlf
         +lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688779; x=1707293579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KixwNmf6DvpKIQRSBV/2LlYNkbWX43zmPDpGkU2JMM=;
        b=Bh0EWaX4SDFSX4gtwPDVIeJRirn2cK1xbMrXjsgBfNIEB333xK5Jo5wd3N0pw86RsQ
         SRITIxFfvPiemwc7fY+UvOYggrcrmOPZABSByOqXIETliGCzBZidiS8EIHRY+e+JoPLc
         5lVX98nBHTwsEA05DYCm6cR8irEezLSxXmKE63e+WBtm8GO1sJi7jFaB3wOhIRRQg26W
         QLPU6kbIfZbeoPFUlqa6SIBmC/EViUCQOOxxoSdyAKZd9PbywfmlK/neDt8ZRCK18m2S
         +t2Zl5Mu4EA13Nbb9nLkQ4UPfAwySFxqUoWaOUlvA4mpl8ScejMI/JWMixf673wdogf4
         JPpQ==
X-Gm-Message-State: AOJu0YxI6Sivf6H3UvNVZIm+jdh7FHdHgVtD1zYku1Fea/lJTvagWDIC
	14ZBa521+7pA65Z/DFTY0tdTyr8yoRBgm4JNpvfTSLE0sagQIxmq/zKGBPwryxchixp8S8mk6oR
	dEN5TnmslL4p3w36X1//kFPeTo3Evqk78fg3Zaw==
X-Google-Smtp-Source: AGHT+IE1ePnyf9R2/vj/wqdWOc+ilDJEN6SZ67TiGNb8iq0ONNteXFR3L4EraGMr1U1PHXQpSPpMayKcMhP/snK+3Ts=
X-Received: by 2002:a81:608b:0:b0:5ee:6ad3:b0b1 with SMTP id
 u133-20020a81608b000000b005ee6ad3b0b1mr787906ywb.4.1706688779694; Wed, 31 Jan
 2024 00:12:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124161725.79582-1-brgl@bgdev.pl>
In-Reply-To: <20240124161725.79582-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 09:12:48 +0100
Message-ID: <CACRpkdZByCdn4qqbETd-HxcmV6p5A02UDM9yQPqWATHdrzKExg@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: remove leftover function pointer typedefs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 5:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The locking wrappers were replaces with lock guards. These typedefs are
> no longer needed.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

