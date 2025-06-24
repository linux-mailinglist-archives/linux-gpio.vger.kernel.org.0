Return-Path: <linux-gpio+bounces-22088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42389AE6F88
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F054D7B2BFF
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDD22E7653;
	Tue, 24 Jun 2025 19:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfnnfCxV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC8E22D4C3
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793158; cv=none; b=iphhy9hlh6J/GETTVUSedlxO33zyvSyh3fdW2Uh+HSCS++VflzBHEVTo7c9YYMo7CCCuDTLpK5hBrOsS2F2xkuxBzJFTk4AyUe9N2f0fVVnb2qa4Hh1a+PFyGheeXERJbf1fcxYhQqcNkkEf9jlQRAtx9662ArsO9a7g00n8V6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793158; c=relaxed/simple;
	bh=O/XxGCdRT5677dIKZkpmfz5WR25prUU7MyTPbxh5LeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHl3Ep48yJfvjhCOzcP9I74OT8INcxS85oKuHy7HD4zSBb9v0SiGaQm9RIn4oh11cFdGxiF34L9CjPmWl0VQqsJIYaC0U9suB4F7ZiTs8Z1PrAGVeZxfRNDwyOHRdEU+FF75mrvGXuWlKABtNRdA+ne/0ajxCZuVRMWm3R7QE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfnnfCxV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5535652f42cso878936e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793153; x=1751397953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/XxGCdRT5677dIKZkpmfz5WR25prUU7MyTPbxh5LeU=;
        b=NfnnfCxVTZd7vJZFXIchr7HQxz24q5dE3bI375lFdIApdI7qd/26Sm94VXv8x3c6R+
         O7LJTo5jU/r5UzkGKdGV/NoRkZRNmeH0FR96bZKyxvRuSy4p3Xg1K6XqkWmGC4HR0c9M
         o/PgO2urM/sgfqUcvotKMLq1dLY85QBtM5UmqPDvVune8qP8yZ6YZ2bPzaGh8cyAi185
         WIvdXEhhOX34oEZPA05gqJARP9gOtZv+DVtpPYUieA7nyS1YwzFL72W+brZ0c7qxAigk
         lVAuaev1I5brqTRXjyTCShajxLrIqUzELaJfqqXABMQw0OkVZFwZxn0gIS5+2+4kKonY
         38Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793153; x=1751397953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/XxGCdRT5677dIKZkpmfz5WR25prUU7MyTPbxh5LeU=;
        b=XWvb8GWudBv+3QP0VsiqwKzycfo5xa7DmdMk9eC3MJs0gAZ/04Wn8innhW2V6r59vM
         Es5SpwZgbF7eZMMflSdYFC2nY/Ojf+dqXFgQ7MTD+EPNUCuVfwVGTSVPDtHEAEUVNKWK
         5PgrE5wW/OjvVLYch8GU7xaNTPCqzwPKv6MRUDyiBLrkpAxPIuzu32w2KcgcYjqVobP5
         ma3KswzXfqNmlzPq46M1A2HycMLpJ+M0zOppOpcmcfAwEMraTIzhOZdcYmNhDeVt7qe0
         nw5Z7LRUeaCejOL+/BFsGyRdiZ79n4tS2BbNq7G0b+auHlHk7MgYa2fLd6Tg8SZ/YR7F
         ykEA==
X-Gm-Message-State: AOJu0YyTOzbc6ovpWK/6xX+/VzTCEW4WadnCAdaWspt27boHvlaOrKuv
	wsOhW1Z2DyUOBiMVQB9T5FzK7liWk/GKkVQX58AJ3nVkEmCehl2peDOGnA78tmAIN2CndixiUZx
	JRM80aSw3b38jbiWRMIXOSiwGLE/dv2ReiGtq1ifEvVKhsbrObmRjckU=
X-Gm-Gg: ASbGncvu2lJFPmtfss+WYEIwLJlluZ7uCbIRvhh0lV1VCduyyj9F+H4ECTo7X30WxJM
	wCIhgOJ0gfQ785Dsqf1MpYyFngVaX6LeOdfAvFcbz0DaCbijS/hEtGyJXiFLF/P+wOLQ6+0mpIg
	HsPxPoK79toWDWr3+IjTYbyyqjIqZGSN8DxHFCfK/wkOw=
X-Google-Smtp-Source: AGHT+IGfIYY9ja6+MyS7nJgRCe0NKGQFj0wJs4m710HBtSTQrEiLVhY3RtHa3mZNxJGIIiJJmkhYu1xm5OosUwV6rEg=
X-Received: by 2002:a05:6512:4018:b0:553:a740:18aa with SMTP id
 2adb3069b0e04-554fdd19f31mr29838e87.22.1750793153546; Tue, 24 Jun 2025
 12:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org> <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:25:40 +0200
X-Gm-Features: AX0GCFs59E-1SHptMGQVMOGsJv3WHoWXZBWNBNSQupjPdwTjOjfHVsxUuY8gVro
Message-ID: <CACRpkdaF_h69v3JWdfu=m0BFV43jyDVvXaD_f-De61DEcB6qzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: make gpiod_is_equal() arguments stricter
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 2:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> It makes no sense for a GPIO descriptor comparator to return true when
> the arguments passed to it are NULL or IS_ERR(). Let's validate both and
> return false unless both are valid GPIO descriptors.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Link: https://lore.kernel.org/all/Z_aFBfjb17JxOwyk@black.fi.intel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

