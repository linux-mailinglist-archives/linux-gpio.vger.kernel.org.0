Return-Path: <linux-gpio+bounces-17603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF308A60EA9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3AD460B56
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E111DA617;
	Fri, 14 Mar 2025 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YG15XV3e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9DD1EEA2A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947784; cv=none; b=KGpuZYVKKkDnFMBWIFoJYpp5fdQPJKz2kKTrbUyW/ycodIuQ2ikuLVMfuen3Sr3QD23VJ50KTw0WgLgONot8SColQ6Mxgf9Spg8jkMO12DWpx24MQy1LGgX7JMY6Wrij01zWGT2rUJf7hT8QhM42OoGBY2625YpQVRphFo9Ttbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947784; c=relaxed/simple;
	bh=R3FNuXX2GmqDhO1V0LTe9ZodhGNso/MxtnDwLp/xsVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WV+Jf3J7iTv6UVmWDC5FEaxuMgmM+6EVApGF25n3dOBApYJaD546/DaTf3Mkg7SnQeZ2mmE82nsciziXn/7gO7YDKC9wM6JxdY+V8bax6L7t0I1VGVwoH3MVJ/rDcRXXdKU201R/OqnX12WrDTnUl+g3ZJRrVRJxpJXIxQtNZyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YG15XV3e; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so2311281e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947780; x=1742552580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3FNuXX2GmqDhO1V0LTe9ZodhGNso/MxtnDwLp/xsVM=;
        b=YG15XV3eTz1eSHuWLs3V/5O9+7tUafD3ST9ePndQs6Fus8jBm1r98ZTQABTzsr5dKe
         fcfK6Zdm0nWjMtGmVMURHXhMRBILWEXzzIRO5ihrdliWZJMxFzBd2dF78SIYoHs7PI7j
         qWalYNvbaoHwosoGYVFrisUtwmRkG2DYvMuLdt/ZN0gyf1I01DdXHC0AJStH5gGbsetz
         BNKo+TpWP3fEDxoKfadcZ01JNUqpucvlDSp4ZEPX/Zug1xDR9rzzhvar4N62N/D6UtwO
         Zi6uvW+OEoZnLtbahBw4jYYxpZtej69J50l7HbyJqdUvxH7aI/Zu+Q+Co2uVQrrqPgx4
         XA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947780; x=1742552580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3FNuXX2GmqDhO1V0LTe9ZodhGNso/MxtnDwLp/xsVM=;
        b=LKSB9KzIq31eYEo8KhULIfY6RZZlSOHiMk5A6hgzsOoPSrg3onFZkqQwATIO5oljC2
         mbjTeE5KJNVKIi9CBugqEjtn2OCPVctP0sBt97JSkT+n2SfLepyPq2d67PPsajhgttPF
         VGRXgi5asZr+BU/CpBn1TWqHyp4Qi+UP6ieH3dqDio7NlXIIo10ZxMnhx011jQ2eJedP
         n/xBQ6lOMXaTvAAc3cwqckFOQIdX+tXYxl0kjKAnIGS9pxcSaXEmjZu37ErfzB6mqGeV
         77iy3tG8Omu3YiIdM1f9pXDsaJfDxHUQjjtcjdyRsNTDdRS2FB8vfhKKt+3vR4GfbY9R
         MYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXQGnKl+5Qp+EDApspst9ZCG19BmsFnF8q8JUXF+NUOfe33V6n1DDUJqtepobpgc0pFxReL2YfcgLg@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvveOmlciD0zttqC4FRJHQqYJuDVQb++fMbLXJbbYtNJJ3+UH
	GczI5aCUj+UD4G5h892/cAS92CItfU9ouS0/D2eExOsVPum4a7ri/ucZ2JUn53QBbRufGOVPblX
	yBfatPxUEV4qAPAztxbcchLLzFEMSw+6WEYR4sg==
X-Gm-Gg: ASbGncuNIFGWn5Sp2QwgQyK6R6MexdUcVMmhFb8rIiypSaiTWOtmEYe0VMI7/Tun6US
	XbErOcQF2y0CcFNqmYE5KcmX0v4dfig0ne8is8vBwNRUKitYQ0GH9bkKQWJEoxgi3CGGc4XjApT
	ZAKMFedStDtt1gDDaQhxZVseE=
X-Google-Smtp-Source: AGHT+IFRy+oj381HcLG17WN2twiWfwvbXqYf+FzldwnytvF99CDrolKoTfBkWEHzPycGeBhKT3RqAyyS6qDRC3LGTmw=
X-Received: by 2002:a05:6512:118a:b0:545:f4b:ed58 with SMTP id
 2adb3069b0e04-549c3902d36mr745591e87.18.1741947780537; Fri, 14 Mar 2025
 03:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1741268122.git.Jonathan.Santos@analog.com> <d055d21a2a1e4e1d64c457d38e3cf6630d4183bc.1741268122.git.Jonathan.Santos@analog.com>
In-Reply-To: <d055d21a2a1e4e1d64c457d38e3cf6630d4183bc.1741268122.git.Jonathan.Santos@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:22:49 +0100
X-Gm-Features: AQ5f1JqGYkWzEfKnAtPNgqr4uBw_KbB-Dek4h3EJu5HoogzTnrZCjzpFr3BwQdY
Message-ID: <CACRpkdZsnDtvKdzRmSUqDSVLfdz_NYygXQq5V5Eig4b64Fwr+Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/17] dt-bindings: iio: adc: ad7768-1: Document GPIO controller
To: Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, brgl@bgdev.pl, 
	lgirdwood@gmail.com, broonie@kernel.org, dlechner@baylibre.com, 
	marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 10:01=E2=80=AFPM Jonathan Santos
<Jonathan.Santos@analog.com> wrote:

> The AD7768-1 ADC exports four bidirectional GPIOs accessible
> via register map.
>
> Document GPIO properties necessary to enable GPIO controller for this
> device.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

