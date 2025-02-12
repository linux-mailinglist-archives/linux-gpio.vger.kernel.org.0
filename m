Return-Path: <linux-gpio+bounces-15888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A419A332F2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 23:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E145D3A5CF6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 22:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9DA2036E2;
	Wed, 12 Feb 2025 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYW6mTKF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E5024C692
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400947; cv=none; b=KU4GvrlQI8llR/Ru20aqQwhw4Asi/w170niGlZLFLGD2Cqmv2Mn3j3/RqniMRsbWHPQKAX4bCt+LuIe2yPBuSb6iTMK73REqmZfkXO4jxuTHwebVfdKOT6ceSXm1F+7DI/dgpBtP80xRYVNsgMYhJPbh/rYMdK7OWemH1ptARTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400947; c=relaxed/simple;
	bh=Vh8OHOSoRu0tL2Xo3xK7ABKzYb3yz9WcNsydc0J1CWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=og2cVkYB/YiRQLrhh3piryaRz/rMETKVxRGjnitzXhDw4YGtyKoqpetb5MQInJRL3YlHAVwO/16jG+wlLVwXTc2tmysesWn2RxbXNb/3fYBAKMBK5GtCQktATttiT/lCF52FocvIBby0H1RO7wRfeSbk7encioswktVLYXUFqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYW6mTKF; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-545074b88aaso165997e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739400943; x=1740005743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vh8OHOSoRu0tL2Xo3xK7ABKzYb3yz9WcNsydc0J1CWU=;
        b=QYW6mTKFawKMvbHwECidwOahBBH1WUrqhMOgh4WK5UpjLaoFFriXB5Fi6/FuXMZdWS
         uvAh46xDB88yNxY3BIY/odRCqGOzBsf6oiiezEObQuamD3CX56PNSumVdBMPIk1gr1L6
         sVMT6fEKImv3k4eLaI0uo0idpJTVzcs+j+jtJ+EzDazHpe/KJEuLhCaSqC36h/66aUTE
         NVrv8B4yRv4+O53BcIr7ijLdZfzNp5n/+OINDTGelCYo/pWCidacSVkHrt1MROzBTxYJ
         YDsgX0Q+ss3/k4nQXx5o+Wk64/mnnJMeWkdFDASPSyNP7R1W+bWLUynZPqRX9/6j9Gr1
         TD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400943; x=1740005743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vh8OHOSoRu0tL2Xo3xK7ABKzYb3yz9WcNsydc0J1CWU=;
        b=uMOoLI4hMdm1iGBdh1iiPqopXEAJUuxXLeivrT/tQUus9qILhDMR109P1/t092HL1x
         CnPQscgQl/fGYcWn2vLRTfFL7t0Nin0vkfHJrucrrhm6jfgMxBUe0d/62WCnH/ECBxf6
         cbZr8JM3z+rJsGF5zF1Fm98i4uemRKkH9djmkD6l85y201E3IN/Ipe9jw2StFRyOfipz
         ICH3E6nwoyga/SljDHuiCl+ooSCobf/iMwQJhk4umscT8wDz9G+1AqceEjXH9kOoA7YM
         TpAmr/YGZNmhdvEYwnA3hU3KMYkS0dZ7BuKlmv60Mnsi7s9HTla4gOQ7z96UxAmYZ23o
         YvvQ==
X-Gm-Message-State: AOJu0Yw5rDR+0is/uMocWYFZ4pm8F31yk0eBYF4yb8u++ssZXAJNobiF
	rqWyNa8bsbkN4anJcBsUR2DIjGaRzTjazJxXK/2kWrRBPqCGPh9rg2EAPJQi4za7X8rQgThflmE
	cQxCrDhuhEY80x5NF27IBCpjZ0Q/iP0MpMbMiaLc6khl1ucYs
X-Gm-Gg: ASbGncuKQXZazIk7IraO5G/5EYOs2UCh4GDDox59SZGeuz688hG9w06MmOP/eURb0Dz
	tfvzUaL+c/H7y28QhtJqgwwvcrPlLTGildgc4cF/8jr4vWirgK0fVsOpeE7t5QGPeY2m6eaFB
X-Google-Smtp-Source: AGHT+IFO/FcemoGJE1XThod9aovk0qho24pkfaWi+AF8m2zM7DfIEMsY7q5oQo7rFA/RtypHMAEP37EbGXxF2pqj5og=
X-Received: by 2002:a05:6512:6d6:b0:545:df9:5bbd with SMTP id
 2adb3069b0e04-545180e90ccmr1518608e87.7.1739400942991; Wed, 12 Feb 2025
 14:55:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
In-Reply-To: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Feb 2025 23:55:31 +0100
X-Gm-Features: AWEUYZkI_WWF5CIPSuWdxs0FRwaXhf8GWaDz97og2RAlktqshtyBrkPapy0zQwA
Message-ID: <CACRpkdbUCjeJXkc4iBBqJFsQ3sEbiv8HO9eh7ft5dAC88f7XSQ@mail.gmail.com>
Subject: Re: small brainstorm for the problem I have
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 10:31=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> 2) The firmware for the device uses already some names for the GPIO lines=
 that
> not compatible with SPI GPIO schema.

I guess you mean the node names
like "cs", "mosi", "miso", "sck"?

> I was thinking about the following:
> 1) Use GPIO aggregator to fake the chip that will provide necessary names=
.
>
> 2) Hack the GPIO library to add a quirk for this specific device to trans=
late
> the line names.

I would honestly do (2) if it was device tree, because we already
have nicely centralized quirks for it, but for ACPI I don't know :/
Aggregator feels a bit like overkill for this.

Yours,
Linus Walleij

