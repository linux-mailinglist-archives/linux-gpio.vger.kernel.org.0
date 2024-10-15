Return-Path: <linux-gpio+bounces-11341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AA99E01F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66265B23778
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEBA1B85E3;
	Tue, 15 Oct 2024 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fxRaw1l4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A51B4F2B
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979259; cv=none; b=Nq+Odg3A1L7ytQ8RkJoIEwiW9KnGC+Do3V2fwMEurwNwvSgIZlFi+xkMsGuQfcVmz8Ihyzurp5ETv/mCYw1HVN16FceChSo6C7NQ8XDY1ucuMs9lQK3FbFtQGsJQkSbQtE9xf8G5nURZyuHeHzAhmh4wElu7orRIyHtUm7EMC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979259; c=relaxed/simple;
	bh=jHgMpCTM4SlQ/6GdpYDS4btE8Eew3VVLXz1adZR0qII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPEdFlBEeatISH+E7UgU2Qy8gw5UnIHzVFiyRdgzxfzlxa9tEbaFS3xEOk9/BevA1NhN/UUjsMgygWnvBzxMIMI0vMxJSv3TZCCXtff0cxI8R4h9//56JTSz//KB3o5isJSn676JamGr/qwny0fGTRMRPeK1LaMwew2kBkv3xwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fxRaw1l4; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so14025541fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728979256; x=1729584056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHgMpCTM4SlQ/6GdpYDS4btE8Eew3VVLXz1adZR0qII=;
        b=fxRaw1l4aNU0qkw2PWfDkSkzeccJAQXWqSgA9YRkKFhNz4gH4P5fia+TRMw0HMtmQd
         mPCSJpiiwZHNH9xvuWltooFwFv0nfOMjm2Xm7WLEVGtoplKKIQCZd3I//cB+jR8euU4m
         dUNm0hTkAaupvPDCE/x6fsDppuLOCU87EfgM6s3AsxJEQBYKvWvJ7PpkEFszU5xUksXB
         fyWLB1bA6Uz9AUI+Z3DYF02yfxdccOrHRlLNpa1Fh6weB25u78leFp2rIcJna07s3Ckc
         rRPFkjIJUH2qIidhHsj/SoxLkuZVTourxC8h3raT/PLBbp4KmcX1q60ADhkTYLGqt0p2
         bjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728979256; x=1729584056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHgMpCTM4SlQ/6GdpYDS4btE8Eew3VVLXz1adZR0qII=;
        b=BkvHdH/8P6N5l0tE9Mi7vPhozNA9QJJHd99WKA5X7IT9/oKBKS9NH2lCXh/66jJxfi
         p0Ps8bLt4WiKMkZqNLdT2pLq3LiZCBzAgaO7pkT9ks+KI1Pgl2Q95WKmlGAYrs4moxZ8
         hgahMcnSkIlSbcQTta1MHvBBhqrIrgZTfqK3NcZRIGTZAKRA0OR7fIJO60mY38JWfJZP
         Pj61v8fGZBTpp9kktlgyLeCJFecsHfPqvD1JV+yhFDR4BXt+s139LACDcENcJEd1VDqq
         y5JZKwUVvAYoYIQDNI+inPHMtku9XieVEMc9mnXWPh8FEzb92wDVbIbNr74vd9HYbuCz
         m7cA==
X-Gm-Message-State: AOJu0YxULVVFRRhExFaudX445aZyFLTZc3yFzSHUL6HNgKclg+rujEoA
	JJob1PN0MXc73ditpzt//dVPSZc85jwWG3CrXcGDIqsAhkME5dFC5v10mUrAOK5UFHwL/ISBpH9
	qK13g9mQ+cCGMDFqJCjw+Nzr9izwnMTbDxrJVYA==
X-Google-Smtp-Source: AGHT+IGhh8cbNNdBvYGtYy+hVIjC9uHyrif591LD5maFyHpMiDqT6EiZW1E+t7FildxioHgmf0UJmXMezYyMZGRMdm8=
X-Received: by 2002:a2e:be8b:0:b0:2fb:4f2e:5be7 with SMTP id
 38308e7fff4ca-2fb4f2e5d27mr33207911fa.24.1728979255684; Tue, 15 Oct 2024
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014092227.78886-1-brgl@bgdev.pl>
In-Reply-To: <20241014092227.78886-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 10:00:43 +0200
Message-ID: <CACRpkdaGy7W8CRr8G+R9O6+DEfCz=j=x+-j8qPK8-zwVF=gb4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: menz127: simplify error path and remove remove()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:22=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use devres to drop all goto labels from probe() and remove the driver
> remove() callback. While at it: drop the unnecessary dev_info() message
> as not only should the driver be quiet when successful, the message is
> also wrong: the device was probed at this point, the driver had been
> registered earlier.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

