Return-Path: <linux-gpio+bounces-23676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D37FB0EDC7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73D223BEFA3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313FE281351;
	Wed, 23 Jul 2025 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mYqGRTG3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771E26B09F
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260989; cv=none; b=NfreALaeF3TLCPoTqP7RC0ODiLHkve/HuXGHZ3z52Glc0R2PP2IZtH6kUyfuW3eLRp9dnXGd+dPrpsm79BnK6PIBgVilUmt85ZI+Noo5iPyk8Fino/i/9QA/IBSdfPsMbdFW4arp92nXd9L2G/8Ex+zWAZ5dp0fZAyTFY5u/rBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260989; c=relaxed/simple;
	bh=ivWLfCcBXBkL/qNohL8sbSA9SuozOGDxvp7qPPHD6AU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tRWvXnOLj2nSLX/IKtPfQUpSJkivuki0IloT1c1OlwX/LK5VmcjHGgn1weJyeu+Oi1BOdPy0Hes6IjKkK2/5JNOq9SNYJ2hhFSZ2dBWkAlXYRvcfOGDKrFWwUaOc6tw12VcDn4sBEDX7/dTh/NYkoBUTsmWCydFvvnHY+uP8KMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mYqGRTG3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so45278495e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753260985; x=1753865785; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUMIaGBXBNy4LdI9Q+WzJyZ11csBDew2kVd8Pw7L2AQ=;
        b=mYqGRTG3v4mhl7vtF8ClMe4R6IiGIJOsp90xNxZX+2k+2MFyethG6uoGKbPPPXOFHf
         TBBmOGDQlZZPUgoY7aG7LyEMlxUAXq6vNVvE38VBsigd8W7zeQrUgEP62IHZb1nrb3+S
         YV//BbuYKLaErggeQuviM7dXgsjSn6ob7Ob8Bt6AtZ7SwzbUHg2QIkoi8iGgLRuXrsYV
         CRmtavQJ0DzPkbQyVlDXNc5Sc+Qo3SU/4ZwUakRBaRMFTqVgeMU7YJsRquf6w+lf9ipo
         EEFkwprlgjcq5/ItDfENnMZK8iqHSBvRa0YELkv+lw341Tvar7fyI2t5rAcOpsy98Emw
         wOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753260985; x=1753865785;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUMIaGBXBNy4LdI9Q+WzJyZ11csBDew2kVd8Pw7L2AQ=;
        b=ljYRyf1rpqGKrAYGG2liYsZnDmZC41Q8Dl5S/PD8zoPj4MlX7Ta5LuQRGb/Am2ZBgu
         gTnf+Jyu4swv65RbJI6rTlXIRNTZU+BDVYYT20UzlZP3I7/0ExStbWAT0FX7JAobEFg9
         y0mLbtqJFKLCbPf7vkr0ldmc+UcqmavdfHNM16sXGMVGTD0hrl6wdA5VOihaN7nPm4oz
         fT03Q2QnrJXeDT08TFBoLJ427Bo+XGyPlXrrMQKjCf1HchTTLAPex06kejOZOZ9zVDQP
         8f3G80kwGuq79wOZvN6mz2+OJajGfrG78P5K+BKQj7K6MxOE6ccP7J7gVY8kSzYRcf4t
         1TXQ==
X-Gm-Message-State: AOJu0YzUrm8HAE38o719rPTFS+CWJ7eWzP8M2jQZRWy+cU4MKIYM7dO5
	W0XWm7w0UjvgbiV5dggKJkfetnpuhFMyIpYbroWuVY7cWzTDGUaTN0lerwv6HANM7JEYwwvkS4b
	aG2X1
X-Gm-Gg: ASbGncuJ3J5T94tWAKuvEVCmD/1xrK23kS812P5g/VpdyjcKkdtaYPshFMEPd2Yu8Yn
	Pga5mNuP8KhuVBFGB9R204OZZIli/w2X1OJSiw209SfaFRo4MIGWZrKYwLTLwDkcgNTbZmpEG9e
	Pbpz/G2wPbr3O69cy77DSepaxEjm3xYYpHd6LBYDE7yZpauUae0l/fnb7Pci0lXZyH22saGXrtk
	gDvDatgqup0GIu2bdJxu9SUR+l8Y3tSwWD2eNY0ceQJrxm6hoSCVz/0LmLB9Q55zlIRIfGDzg+O
	fqn8PZQ3m4hTufB71gcsWSKnuXbo8Gj0CFYIFXthETY4MLMe87NzR2Eq4fikWuZ3bKQcHAQYuQ=
	=
X-Google-Smtp-Source: AGHT+IHJlnR02qiE/YujGCs3DOYev/UBPr0KVTL1q4gEqoe6Dtnp3Ws0Yguiu3Sgs2qeoYY3wbDwNw==
X-Received: by 2002:a05:6000:1885:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b768c98f5fmr1674241f8f.10.1753260984937;
        Wed, 23 Jul 2025 01:56:24 -0700 (PDT)
Received: from localhost ([2001:9e8:d59e:4100::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b762bb4f6csm5329650f8f.4.2025.07.23.01.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 10:56:24 +0200
Message-Id: <DBJB5CVQSU1E.QPXNUCPNJGNH@riscstar.com>
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: update examples
Cc: <linux-gpio@vger.kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Linus Walleij" <linus.walleij@linaro.org>
From: "Erik Schilling" <erik@riscstar.com>
X-Mailer: aerc 0.20.1
References: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
In-Reply-To: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>

On Wed Jul 23, 2025 at 10:16 AM CEST, Bartosz Golaszewski wrote:
> Here are two small updates to rust examples. Fix automatic formatting
> with rustfmt and unify the way examples import modules.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       bindings: rust: fix formatting in examples
>       bindings: rust: unify imports in examples
>
>  .../libgpiod/examples/buffered_event_lifetimes.rs  | 23 ++++++++++++----=
----
>  .../rust/libgpiod/examples/find_line_by_name.rs    | 13 +++++------
>  bindings/rust/libgpiod/examples/get_chip_info.rs   |  4 ++--
>  bindings/rust/libgpiod/examples/get_line_info.rs   | 10 ++++-----
>  bindings/rust/libgpiod/examples/get_line_value.rs  | 19 ++++++++++------
>  .../libgpiod/examples/get_multiple_line_values.rs  | 17 +++++++++------
>  .../examples/reconfigure_input_to_output.rs        | 25 +++++++++++++---=
------
>  .../rust/libgpiod/examples/toggle_line_value.rs    |  7 ++++--
>  .../examples/toggle_multiple_line_values.rs        |  7 ++++--
>  bindings/rust/libgpiod/examples/watch_line_info.rs |  6 +++---
>  .../rust/libgpiod/examples/watch_line_rising.rs    |  4 ++--
>  .../rust/libgpiod/examples/watch_line_value.rs     |  4 ++--
>  .../examples/watch_multiple_line_values.rs         |  4 ++--
>  13 files changed, 82 insertions(+), 61 deletions(-)
> ---
> base-commit: 74ca5ca5b71d281801a3353a3d7f0ff04a171c8a
> change-id: 20250722-rust-examples-imports-261e098f12f6
>
> Best regards,
> --=20
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Erik Wierich <erik@riscstar.com>

