Return-Path: <linux-gpio+bounces-25424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342CB413B9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 06:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BACE6548131
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 04:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B73F2D4B4B;
	Wed,  3 Sep 2025 04:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFzhnF/g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7770028726D;
	Wed,  3 Sep 2025 04:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756875254; cv=none; b=t/8X2nqDfCJgnfrZyt7EJfN/euw7i/AAmxwk+kEjjTfiRUyw4FVZwRY/oUuHdiNQqRsP4CD1omLvaXuRAkNlelMjY6CuVZzE9f/SbHRifYZE7pqAlxElX+aAHxLKAZoO0UDZjxfpVrJcfRjURfZbvyb8tddxnNJ+SouupJbahZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756875254; c=relaxed/simple;
	bh=Swv/4TkZXPbhwRzMi7ryS+1KbC7OMYHKl+Yq1l5G9Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnIbjODvBgEMduIKJs6nwAIoegmPJm0F/f/2P2L34y/xDvB1Ga0yRaPJs8WcXLv9784iU11WaS38TfqzpjZ7Y5se7mIfnA7WT2vCPt5AKX5uT6iMBxoNkJ2ECL7FYLLgrWKfYE4FBODJWD8ErS/dEfTb+XSbQ906exNcEBBxjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFzhnF/g; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso2942288e87.1;
        Tue, 02 Sep 2025 21:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756875251; x=1757480051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rhZh6NZAvU3E4oAEUrNh3pZpIczRmILAh+nP8L+lBY=;
        b=bFzhnF/gUcYqn7luCvA31cT10+Am1foAWvwj6ZAhgqmD11NaKMZ3YDgNVJFAqhYiEy
         98cITfi04h6HeHjHXm/S8noqwdde0Ntu2j5JqianYUJj8csjYtfLggTQjnNiJyzovCqe
         JaTUSUiKckQoe88G7aeCtfoJu2z8NKeJSi25O7a7BZhfgMy2xfc4kin5Qf4v4FTOGbWM
         k1hHOPxZDzshQtx9c5fIahQvmtw3u3B2iiBVxgMSwvL7XidNSNyHB7M2i4B5DHEmOkJm
         epr8MBV51VJ7rWKGfBUq/rrpTo3I2gsDd+VdA/YnfLsyH5RPcT9OPJ5PSyxPLJTvoGSI
         ksRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756875251; x=1757480051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rhZh6NZAvU3E4oAEUrNh3pZpIczRmILAh+nP8L+lBY=;
        b=tygdjy+oQD0f7rnEvazzj3vp/I06ouaKXfEQuN8t+PFdnmfiSa70TA7miobwL1rS4U
         VXh9aUHflnvv8rIuRvI8XkfRKjF7Cgi7V7N9otVWT30nGowok9khHvCNVlmjm0Tv6LJY
         BcmzEOm8+8OdVIg4PVBPeQSfQrytNAV7LfQwzCm8clm0Vd1NgRNK6mTVUi3j7cgkIWq2
         fT15/rWooKVttnEfdgj+UBgdhe/+eyKuVXqEWYNoNoiIUPODQbSWxSqYcYjCK2P5xY0G
         JeucsomUcXrc4PNWCDKWgjXPt3h7CKxvsQyj+C71ExYnCPRCy9UEBp9E4/gFmSENSANG
         lf0w==
X-Forwarded-Encrypted: i=1; AJvYcCUNlpRJLiFi5ezPqt+yOWmseZC88cmGL90ML6zi+WR9p5r/yEm571hFUrEieR1l0Cdk6zWbnZpEORyjzw==@vger.kernel.org, AJvYcCUxnW7XSAaMnpPymDGklCOqylZvVVSzHz2NeVHvOzeWJEzFS5ANN4t+W8msTrFHaF7cMqK/2OWgyagg@vger.kernel.org, AJvYcCWn1LTNmw0jb11cDmZ0mI3qh+pyveSyeM5kTrNls5mMKtjox8KR1DarGxoxqvTzto+En633LKI/HLW6O3Eg@vger.kernel.org, AJvYcCWnPTa2hjenE/2lQ+WKzhbpBVVBPensWS2XohCnIR1DfkDIL1SBYotsFrVo9j/VvsaelL3FJ0Tx1s2PCuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvICwLV4+oi5UvI2VUc+uEVvH8xQKHGnm8/joLBvEALXtVT9iq
	EO8yeSzOIbeBrallYc4rKCLUVRv4Gikq+Pclty/TSuwtnh9Pnvj47kOJLTT9b0pTauyRrpPe3WH
	29jguTGBJ6rUilyi/roXdAF0tgu5ANus=
X-Gm-Gg: ASbGncuvHd30EsJlCZ13MenE3ISaauAlH093UlD4Y2N3zDILEwrzgRO1UZVcwe5l7rI
	iKyBooTDI+lBHEnk81gEj24+gqk3e8kXTXjLaSMsEKw/oQSRCRqECQtimJW86v33oGz8OSfifLn
	PDosRMkgPUnljW8gI0DS8iUIV8RONNTy0MQBlca3QoKyhaFYDK46rLzZIoQS4Y7HJXHXNTE5HZW
	1yapA4=
X-Google-Smtp-Source: AGHT+IEGi+kkNh8GNcjYgR3eKvrJztZkclYUkTZN+8nVDpBeXYf6B0Sso2W51gibGl7augusIWcOVjrQ23sZLefLwIs=
X-Received: by 2002:a05:6512:eaa:b0:55f:69e2:9ba4 with SMTP id
 2adb3069b0e04-55f708ec3afmr4714530e87.31.1756875250354; Tue, 02 Sep 2025
 21:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com> <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
In-Reply-To: <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 2 Sep 2025 23:53:59 -0500
X-Gm-Features: Ac12FXxU2zLX4HVsYIqbcHwIc5qaZuk3xhpWZCE1G7odzshIlHjjs_yRItBNw3Q
Message-ID: <CALHNRZ-dRvaN_SyHRfAsq2MO-ec8rzkeCy6CtJpYdWTobf1-Wg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 6:30=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> > This series adds support for Tegra186 pin control, based on a downstrea=
m
> > driver, updated to match the existing Tegra194 driver.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> (...)
> > Aaron Kling (3):
> >       dt-bindings: pinctrl: Document Tegra186 pin controllers
> >       pinctrl: tegra: Add Tegra186 pinmux driver
>
> These two applied to the pin control git tree.

On patch 3, Mikko noted that I accidentally amended the formatting
changes intended for patch 2 into patch 3. Linus, since you've already
picked this up to your tree, is it too late to fix this properly in a
new revision? It doesn't appear to have made it to the main tree yet.
Or do I need to send in a fixup?

Aaron

