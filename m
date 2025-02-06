Return-Path: <linux-gpio+bounces-15429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB96A2A4AC
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 10:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6690F168935
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 09:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B327227575;
	Thu,  6 Feb 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMGWQCXA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF24227561
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834493; cv=none; b=ji8fAhhASkJfYRN47Fefvwti1SRr7Vhk7bA6zEiX6cXfGGGRWZzMNG/zOk8KCk5JL/BTjZl96N4U6WaldI1JKHQmoxxuWzBqXWcCXhghZGhhfw89JfZ6tBi3PWT30H+yt7xTVfVkXjessl0ZQP0ox2mMqtKVGpx5Mgyv4b11THM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834493; c=relaxed/simple;
	bh=yfen1v4LAdqEiU+cdK+Argg9GudsmsZkygx2izTcW+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcQQbMRTrVUT9Qjt07FfpUfVSdqtOwQM8oB8jd1blgRImBMRS0Fx5YtMEKSkxi4WzWSBHkjIEA+NvaYgTVbwHrp6XUr1Se/ZE5VxsATsIqYzCGrA3QHYt+W+EZ194CbFXAXiiK0kTFDGs5Jg/+LLtnfCVqwSzuR++h31E9SooEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMGWQCXA; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30227ccf803so5822191fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834489; x=1739439289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7lAfvcqgrQXRVsX5y5Frx4KRAfRNlyaJq5G6Gadf7Q=;
        b=dMGWQCXA33/TwduYz39zoY950RpkpCC/ivSEEO92hfX+GPsV4jACoASvA00FJE9flW
         ar/FL55/moR28SJN7Zo2yK677416fA0Oi5A2ktnZqDjrQHNZbkSI2yjIsGLSA/2CaysD
         rI4MqtUOcMa9PvmJAH9jYqks6KuU2i79lFFkYfhwbBm+kuQTYxMhgrHuD/7k4wpi6QAO
         JF9RMudH8eTI1FUTImOdx36zzZsUSn0qw2cgguNXRi+tlDUSzYxu5InnejUwuvZ2Hmzu
         43aCBK9qlCPthc0MMV54CtvTtkTqp5YAH0htzScfJrm39G9/farDg/dJntfvLslUQv1y
         KlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834489; x=1739439289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7lAfvcqgrQXRVsX5y5Frx4KRAfRNlyaJq5G6Gadf7Q=;
        b=qIKMY5ztbNDtnzMDOFge50NfRSg+piU5YquxjxIuEcZ9QCJh73KzPCg+R5jB1n++Zz
         SvPXQVfG6FtMWVvTbfOyO7Ze+8rcgCNM+3jR9mETRTEDZufugGIvnloa908PYg21rk4/
         b4nzkIgv6+YrkqkfCqpLL4YgwYYrpAaWCnMe4yVp/5X1bhs3FZux2wPgFZ6mDOkp6Mig
         jhugkexCYql7I2XA2tPB4qmXtVLQorn/TPFFXjZBWwq3lCdGyDmr/oQpi/Hw24i0qWwS
         5cmDAlXAdWfyVIlnXZeBC2WLR3q3lrAed/zjjyOEx/THhhRNoPDKtqyWUx02o3fgeuLW
         rZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWazq22pchvG1syOLZ0Dktk8X2VOwVlpZPSL6rcI7cOP9ST7H9KRApt6DRlQnfYgmVRTJbQiRFCu1/J@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrl77ON3TNaJmCMExOlYefyB/JwM2RPJvQ5WftH5PDuNdww3eF
	qB88d9U/KoHO1wvj33zYRxoN/+xVkORgBxIYvDXaxgt+Ykz2beBRcp2GuU1mJZfB1QW/H9HzN/3
	QaFJpS7cgDyjz2Od8V9fhB91KeZJsiP24J8HHsw==
X-Gm-Gg: ASbGncsDoYhOfBbgcaKx255czf8D+v0Fw8lxOJQ/1Ww/fLSCAp6BHfH2wTHxJufwwNr
	rh7bflBmT7IeQgQu6v7IXS+I5rFlDpBH7TbdWgAiPhc01ZqUnCGnzGrxR/9MNPMhz8n9kFCw=
X-Google-Smtp-Source: AGHT+IFJioIZ+SIeFji3yfZS6UpOkRsu94ORXpk38zbHIoNMqdqKledBEr+iDuLeIF3Zq4N/T1bFuhjDSADQ2+GpEfg=
X-Received: by 2002:a05:651c:12c7:b0:306:10b5:6b3 with SMTP id
 38308e7fff4ca-307cf2e7a8emr19090411fa.5.1738834489196; Thu, 06 Feb 2025
 01:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
In-Reply-To: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:34:38 +0100
X-Gm-Features: AWEUYZkV6NwmyMBafvSPlxwwJhxpoXuuAWLayW3M3lEdMShuQhStxtyBnygw9vI
Message-ID: <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: bcm-kona: Various GPIO fixups
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, 
	Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Artur,

On Thu, Jan 30, 2025 at 6:10=E2=80=AFPM Artur Weber <aweber.kernel@gmail.co=
m> wrote:

> Fixes two issues that were preventing GPIO from working correctly:
>
> - Lock/unlock functions tried to write the wrong bit to the unlock
>   registers for GPIOs with numbers larger than 32
>
> - GPIOs only initialized as IRQs did not unlock the configuration
>   registers, causing IRQ-related configuration (e.g. setting the IRQ
>   type) to fail.
>
> Also includes a minor fix to add a missing newline to an error message.
>
> Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
> (DTS not yet in mainline).
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Looks good to me, do you want to resend the patches picking up the
Acks or do you want me to apply as-is?

Should this go in as urgent fixes (-rcN) or as nonurgent?

The DTS not being mainline suggests nonurgent but are there
other systems suffering?

Yours,
Linus Walleij

