Return-Path: <linux-gpio+bounces-29426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F3CB44F8
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 00:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84AFE30DC7E3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 23:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C932223B62C;
	Wed, 10 Dec 2025 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5SKOzhn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AED2D3750
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 23:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765410411; cv=none; b=GCopvup0ndbS2ijGt7hz37ydzvHVWqXFuU0ncB+DsTo17wwDWqwHIjUuT+oeNvXTQhqWjy2rEcwmMj4QHOzsKeqTkQSd7fWcEXotSOh0qIlQ2q49AQKKK6eOPUgQbn3U90lbo9WqQHXa2X9E2pTy4LRL4DgforHtENo2ISvLFQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765410411; c=relaxed/simple;
	bh=omLt6+8G6tr0mAJbf93D0mClPuEzsdO4MIROF0xDArs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ko91q2ZyFt+SsitsbreT2S3MDS4QoH57F/0hlsQCdEHtfhml+prlHe0gt8u00TYUwwBE+zBA8n9mkvmEaFyvrjli0wWNPxYD/NxYFF8DZENZ0CXzSTDkz17KjyzOJhZUXX2JyfC2dERGYyD9Dwp3wjHo0+tl0UksU0ZmCVcv2RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5SKOzhn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C43C4CEF1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765410410;
	bh=omLt6+8G6tr0mAJbf93D0mClPuEzsdO4MIROF0xDArs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l5SKOzhn7FPufpCvTEh7bnHSxuWWUXLa0L1cXkn1z/bqnSllxUatm2NZgFoMBOhpX
	 /kWVJcsvhndP+P+/TpodGzZqOuLl4HSvJNiGjr3GhcuH/0/vMghloLN6KLnaUn+HRI
	 9+LGtihsrY8FG1T7r5j5fW4151seAx7a11I53sx1BnVthHZjyvJR7RbB2jxe3rZRPJ
	 GWNlj7Uf/nl90WKfOsxfGAqUUslWhQIWXuyvHQf0njaYhDwamrWg51kfbf96a1rmtY
	 b4zVtR7Pj5l54l+ez930P20uPB6eX8wsp1e10Q2PdgsPRNGsxwvd+3ffNiuhSMNCEb
	 mRcRxtk9QOfwQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78a712cfbc0so4604197b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 15:46:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVC/o1VtEjqB3xDZpAjphBNPwBxV7lMFVpMHo1j+M7HW5DpVEvzPQm3dREtA1iKLVjNkK6K9vyfS0yQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MXzKzjHGfLB57TXcW4t3f4j8BpLMi+Lp7wNifpmZwZx4D6TY
	IRJlZ0d/BAqLu7yNfP4l7v+Sc0AW/n7m4dPuACER1+EYHJDSQMm1rb+P6WfxT+v9FVLTE8onQ2y
	epMjL+g9+VyXda7nnLOpfJtnfAuqB/sA=
X-Google-Smtp-Source: AGHT+IFzTtXvwm11fubh6opQRAYyQCuEtEDhPLIIsr7IqAHtJHKITmK0gOJ3Z6ec3f8WnOvP1jd+8n0TMfcUQl5akoo=
X-Received: by 2002:a05:690c:7449:b0:787:f0b2:8dbf with SMTP id
 00721157ae682-78ca645ff63mr37547197b3.66.1765410409801; Wed, 10 Dec 2025
 15:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com> <20251204-ltc4283-support-v4-3-db0197fd7984@analog.com>
In-Reply-To: <20251204-ltc4283-support-v4-3-db0197fd7984@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 00:46:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLnE4apeEn_rJrmPWSPzRgCYGaDsbBfys5c2aEhGFMKMuQ@mail.gmail.com>
X-Gm-Features: AQt7F2pe1woED57sitXThFq2yIEohqX4fsaZuYJ61m2slCnm2Fr7MBKXKNVJsQA
Message-ID: <CAD++jLnE4apeEn_rJrmPWSPzRgCYGaDsbBfys5c2aEhGFMKMuQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 5:14=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

