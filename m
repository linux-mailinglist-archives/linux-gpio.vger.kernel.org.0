Return-Path: <linux-gpio+bounces-24554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9778FB2C3FC
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E91C9620B73
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA2C3043CC;
	Tue, 19 Aug 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGCcAq80"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC01527B4
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607026; cv=none; b=oDE54GJHCSsv/gCxoop5GxAxG9D+sWDSBy0YtJGmjWmkoY3fMJ6tuhZ8Mm3PKvLbRPERjDRYG254PaYmQaV3IRJM39HHbJ7Si6UAjT8NJXaBvwcYXbJyf9EKBoF0l8mXDOgUvqMR5Jxu0Cb//Zj+Mg9b7AAuhb1jdsE1I0RfV+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607026; c=relaxed/simple;
	bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Janft8dZTxReoejqoTHaLzNZKsf+4o6N215lCPpXyYZaNyXqqb7PgSbnXnxzOn4hF5LFUjkHejaI7DMG68pqKtnX14GShsKU8Dqcw245M04qaTGGpdJbyAzFW1g/kJgsl0SSwci2DzqIYBtfirMKyR4iJTAKqKQ6g6v/TKDGzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BGCcAq80; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso44831721fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755607023; x=1756211823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
        b=BGCcAq807utLEGokMXk9xTPzJ2PItinwPONnVrP7/PpnAc9Y7qVssUNIxhJvzDuTiE
         srgbAai4+DoRNGsxFpzoC/tVQYScCyT31uIKdMTCvgr3Mg8QEpQZe1GrBmmg2tCaeJD7
         Tol+Mhj9Pbh0FOs4NxaSE9I0FLiruWqPBAYM6FjSpgU8FGVBNAl2VKHfPtmwuqk/rTCs
         bFgwxI+Or7+bkUYpg7c0cGODH17Jh0Ejz5HK0uW1Wc+PhxLRe6RJIu9yPwSwzY0cwuXl
         R2umaS1ZoHl1FIvkS1GtJVZ1CJxyifpGvVFETgZE5ZhYh6TGUiuOeyeTl7GdSVLjJU7J
         5EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607023; x=1756211823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
        b=hqkZKvG4+lamUA5WSN2H4WXl6HN6JhLOIrAUD4/iqGqpByLawianN7O+sSsTfeqe9N
         prREXrDWPnfjVAl5n2IkUw1ecTBIoIG2s+6UQvT03mp1Kc/bQ+pd3E7N2p0lsOgRZcoj
         djkFQUisDxJr7zcfHHlPwt12yoF36Qe/aqJHb+7qD8VwDc76Nhm1exW2CRTa8hKNHQNU
         IgQOfbn9EFYzOVJYX5TWjucjpMZBIox9/6QOHmKumgTOvjqFnu3KTXIwtXGz8CmpkFGA
         7JOiDzk1/DNjdtNJ/wIFTh0H7fINs1acjGHH0ob4aWAwfdhZtu5yuIhZ0Vs+QCywqoEw
         jTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWYbNA1JC9vrWpJOe9abaoA3eGB0vGg5kLTbZvUxmmHDjUk6OlqPj9vAJ7iDFNfkKa5rRDa41vDGdPG@vger.kernel.org
X-Gm-Message-State: AOJu0YwEStI4H7KH1rNYgOTdrhR0QhuHHds2nN+2yB83VL/3Xdtwoc7g
	exRrEI/v7Qxx/4wD46UZr1IOwAOVaV3v7+SkJQC4lNblo+dEjpgxDfoLq2WMoxpM2KM47o6y23l
	JDJa39nd2OFvNxfmSrKnkbCKGwDoNX7YIR37f/4g4iw==
X-Gm-Gg: ASbGncsCJTQFe1RudgAc4wqj+649G24d40A4jA+vjWAOecE9S73BPvNU6Dw3nr0NcbI
	1zAzAtYdXLjkVwU+MUStB2oiWgs9Bfo21DxMsc2+I4B/BgvCUOJmnLr1cvhDs6mSlbduae25s2g
	bmiQVoK7UfUqCy1aLmPISukwErmNS0hHIgKMyPF8VbkLcn1R59SkWKiGbglWQV75d3B1H8o0ACS
	eXigP6ecznF
X-Google-Smtp-Source: AGHT+IF60h4WVMQ3B1KL8q6jLUasLc8BlggUoJR4OlVpazMLoejvJn79GNV6qXgLhSQX6llyrVFMUqcEDHaass7Rvi4=
X-Received: by 2002:a05:651c:419c:b0:329:136e:300f with SMTP id
 38308e7fff4ca-33531447abemr5458501fa.13.1755607023091; Tue, 19 Aug 2025
 05:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:36:52 +0200
X-Gm-Features: Ac12FXxreBRNMQ-2ir2X10nBf7B7qy9Abw0x-1rD12XgK0TSMm41kUIDeST3KoY
Message-ID: <CACRpkdYWNgU8PxVaxDe3F6Cbb15J5cgEV1-kgDooOHdBoXXs3g@mail.gmail.com>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: nuno.sa@analog.com, Jonathan Cameron <jic23@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> The LTC4283 device features programmable current limit with foldback and
> independently adjustable inrush current to optimize the MOSFET safe
> operating area (SOA). The SOA timer limits MOSFET temperature rise for
> reliable protection against overstresses.
>
> An I2C interface and onboard ADC allow monitoring of board current, volta=
ge,
> power, energy, and fault status.
>
> It also features 8 pins that can be configured as GPIO devices. But since
> the main usage for this device is monitoring, the GPIO part is optional
> while the HWMON is being made as required.

This main device just screams Industrial I/O, IIO.

(I think it's fine to use an MFD core and split off GPIO to a
separate driver, and I suggest maybe you merge MFD and
GPIO ahead of the main driver.)

Jonathan (Cameron) will have the last word on it but IMO this firmly
belongs below drivers/iio.

Perhaps not in one of the existing subdirs there but then it is time to
be brave and create a new one.

It will take some time and consideration, but I think it would be better
for everyone.

Yours,
Linus Walleij

