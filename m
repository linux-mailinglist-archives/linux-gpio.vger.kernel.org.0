Return-Path: <linux-gpio+bounces-28350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C3C4D2B4
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 11:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 356E53B9576
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 10:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF8E34FF64;
	Tue, 11 Nov 2025 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C53NiIEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0999534F472
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857807; cv=none; b=ivJF6zzzRz578/+OW5b+ID6bQx0/ah+e+fyM6QkfWxSpFPkgiOMXHRQc1J8p0LXI/BqtICwQGyyNjKKV2M8bfjSwDTalvVbxDS9EdHc0TsvUa3CJyfppET2RW/WeN3VbpboMz+G63PK9/YAvKf8ov3xF3Tpz3WHJujIp50YQ7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857807; c=relaxed/simple;
	bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmXMV2E65jRi3aMNiknDDAblBXrMYqGGQZ7vGpmpdD9OzFJkQdWyUKZq0ZBNHQs2G4M5Myumt4MapujF8BrbSjg3FuKlsj031rHjQJSrwAcO7o+bWRFvoLB915HbDryTVmHaD5ityBYNYyaQn9AEWJ+5q8IwAeIojjQn72EFLh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C53NiIEy; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78802ac2296so10683317b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 02:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857804; x=1763462604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
        b=C53NiIEy6+OE3sWwhigESKCaB9aZBDoeFlaqT3RMCLORlSpkHTg50jTkTRl6nYW3gx
         rYKSJxcfLXfuk8ySghcQ7PG63/fJiRXSmd1ClPhya/uEkS0AgsGl023phv2FQXgaAFgs
         t3+IXo3rxBYryZBq76ax77QYYLOI507Uy0Ryuoa73+4rSRaPLUYrVqZZIRfChidxc1XR
         FWOh4ThDObYIEU4GdruMOoI9cS5q5Ht/x5lKKW2yebjNyGEHmI+Zrgn5EMF8m96v+dFl
         J7aM7/HCNdg+5yYDEsy8eZjpiH7QpLdERyPeBAp94FFeLB+8YeceYl8aydSYC72BJNT9
         nG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857804; x=1763462604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
        b=nOM3mc4Ly1JxrM4UEGmOZNEnUTUO07z1wrHQI5qkdl7TNlYZMQ9s6VwaP4NTY328J5
         +XGNw3EDB+SiStcVdqmz052sd1kXuKpG6YERKieVP3J549P/eAm/QkIncA4WkDxWyozM
         WWh9FQu67k8mglR7TCzG3YovACyvx9c+uVL0R5pP3onnnlmIAHfyG5cofREHBj8nVVIf
         Tg4HJIQ0MHTHWtJccRFTBH7/F6TE1DkBOwezh6AJOpaJd68evmofdnu+BvyZ/0HXYRRW
         jZymNZDoiHWYnhbzPqJdp9ee8WQ/+5ZfGIIeuj0E4y4QWfiVOe1uXDYER8HPcy4GD8U7
         kbVg==
X-Forwarded-Encrypted: i=1; AJvYcCW/SCOb3xoPUF+LCFr2Y5FhKfrkrcdQmBDm3gNjfHBH6v0VBi31nQqNl5oAQJHnDTXy+sjEQfno9+C2@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMZrGwI5f2E6DO41ktSAvOX1G/sz5KYIR6sqDkW1I+3IriW6y
	u21qEUwID+pBgvIH8ucUfSkirTRTXJ7Kc/UcyMJMoJQuJQf1Ym4Ett73wf/G7n6mPWeWQ2dAQYt
	CgST78vgWkq7eVIkKZSORyCiQhJEWk9MtfSH+wb5PtA==
X-Gm-Gg: ASbGncstteZ85UYOEOBHrWALCos9XXSxrjhPX2w20D5NeYXIYOfJppbBojcNIdG+BcQ
	AuQXnTJTFrBTLZsD0RP6tTZHstXmwpc7vaEUBC6z24pHHpQ1XQPKWADTv1aIb283wMAE4gD+awo
	AIn/5duQ9BC1ce8vYcHMkn1lltDuZgK0CfSGO9KxZoSEQbK5JABF9p0LRkYIgtOs5Z7bYw2SKiE
	cSuBQ15iwgbCEo0xhh9IdDpe9VM3vy5nR3iA8yFfB4p4J9hsGmhcYffwmBkWqBMVOcfcfg=
X-Google-Smtp-Source: AGHT+IEzf7RfCe+CUiwe51rQWA4HYxWkXb8u+xLvSy8sgIDasS0jY0uVlkjQd1JySagC9Zi6HIYv6L+HM/XcKpRnSaA=
X-Received: by 2002:a05:690c:3341:b0:785:c08c:d39d with SMTP id
 00721157ae682-787d54504b5mr104136687b3.57.1762857803858; Tue, 11 Nov 2025
 02:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:43:07 +0100
X-Gm-Features: AWmQ_blT5oSFL37n1q5J1-YrABo5OT0VdTa69W3o0jcai3WIlfGp5Mqx5NECKoo
Message-ID: <CACRpkdYH01pOnXs-jH5mzfT+THtHcQDoCKB02hkGaxf02nm96g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a virtual GPIO proxy driver which arbitrates access to a single
> shared GPIO by multiple users. It works together with the core shared
> GPIO support from GPIOLIB and functions by acquiring a reference to a
> shared GPIO descriptor exposed by gpiolib-shared and making sure that
> the state of the GPIO stays consistent.
>
> In general: if there's only one user at the moment: allow it to do
> anything as if this was a normal GPIO (in essence: just propagate calls
> to the underlying real hardware driver). If there are more users: don't
> allow to change the direction set by the initial user, allow to change
> configuration options but warn about possible conflicts and finally:
> treat the output-high value as a reference counted, logical "GPIO
> enabled" setting, meaning: the GPIO value is set to high when the first
> user requests it to be high and back to low once the last user stops
> "voting" for high.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With same reasoning as for 3/10:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

