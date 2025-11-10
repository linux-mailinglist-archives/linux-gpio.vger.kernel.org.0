Return-Path: <linux-gpio+bounces-28332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 514FAC49ACC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 00:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F9BA349A7D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AE12F7471;
	Mon, 10 Nov 2025 23:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6+UtSP0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5008D26E706
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762815615; cv=none; b=SxAcd0yyUzT+CCBduVCnsqv3t6+dRfS6sh1TFFNA76MjVHoaEYVkvcmSe0AUHX79XwTamd+11rXjZquUowwcU4lO7bGwWm9iJd9s4AlHDojTigf6Ump6RSN4ukz81L2/NsLC8MO03YGN3Ud9OgMe+dgASo25I3XFZ4QJ7kD7yWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762815615; c=relaxed/simple;
	bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvnhB7xtvQSrAYszYsDUZqgKeY+yiKzHYT447+hCbftbnJYasExF7vFrDWYRTpO1CEaUgbkZkdjw74Q+Fu1yLlnKxGU40TwyamGH8fccvyHKzU5TGaxvj0SI0f/Wd9xvPwfWkGi4voWFBfWEbhyO8+UH7YfQKCIpF4uQCg9YyNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6+UtSP0; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-640e065991dso2430377d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 15:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815612; x=1763420412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
        b=L6+UtSP0evWjXL1jvVkWwadBiRytM2dX0PWXrVibM1Op9Ckonp9NiCk4rZInynhf+Z
         CDUERdDkJcP9u+bdEHNfEcQjblTwjYrBdIoQCJxsQ38T0HnqGSWak7ePtDhkTnlSa2q/
         jKRSJujgerDq2htTZJQ6AKTbTHagttmIaKJTd49eKOWCo0Z5rrflDC37aDchLzdrgrNu
         2rN9uT5kgTND4EVg1L0K4aTexywCVGPGQz7crBb/K/2OMkTXo80ACSZz2kOqETyjpYG+
         8m2y45DhZBse7CCIwfQbH3Ap7+qHVrchrWvgcUYm6LM+23tg0jDpznvf7VifaNGAqoc/
         08Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815612; x=1763420412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
        b=dnYqONmn/jnyNJVWnhTE8ZSAryC6ep8uMLX39PBf8mG13c0KI0ZPKEzkrsFAmQClu1
         uEYh3LXRb7HVTfyDc2iTEAO0AI+eO4I5gBFueUVTcMWmGWoYf47IopJkLBp2XNAIqb1O
         8xat37UwIgn0ajn37DCYui+vCcsVxcvNM7XVVkaBd0jqQgWRt5GwhYzuGX5IaHLnYpDj
         MgKGLC5F2LlPMqMHaRT1gzv0zuENAtJV14JCBU1iUaCO4K3fz+SXaoEv2SrhvVQ/A8xS
         2i1NcDxtZLk70bEZLmMm9aOHJOSimDXD3+kvygRmwdDkBBi1qUsxUmH3yDF+xBwbDXT0
         T7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCX89tIyJ+gPBt4QjdpXWowmKvQi59eE5HObeW+lwD7ixcLzfQOgy79jST4m1WZ6Nj1XgJ2zZS9w4U5X@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJZB0ejdfukE/rnbhslBHlFItYIT0GyYBUt4tyGETB/66vZ80
	ZNFwgB4HGu0G0zECC/DWFAnY0T0Ls5Zth78GTGwOKKoNNbdYWfGAePiv97JVoD7Fm/Z0LZeOm1/
	n+4ZMBqnu7AsArmB8XfwOdFvCvlrMxwajy0YHZpTVzQ==
X-Gm-Gg: ASbGncvFhLqg3n2VcOQugvsjoGPuzauSr85EVCh4OZgfwQuuda2tdYu/wL8ppgkv8lL
	VqAQjONjdaZO5I7wcV0CGtp9f0Jz49xih3GJiuXdn76FYHzWFM52M8Wya31j9FGxtWEYUjMA+Q1
	Y8SEOhVOoJtyPzFQC8Vld89ByUOZd9jZjd4l9ahlmvIYuQCYcmw1sD62yHOYLftKf6LzhGfXpEp
	FVjkbxgMqrhpeMXPhWo58+4npf4l2Z8WbiwKXKgcaY3G+JXy82IJ657pk3aDZ83u51cs6YmWgsK
	M6H85A==
X-Google-Smtp-Source: AGHT+IF8ly9VGsM78kkecljV7QbSku7Ug4S6qy5rbzWNA7QZtQnG4yF7xb8sJiiWVsPr6iJZaHBVJJja0GkrFNx95t8=
X-Received: by 2002:a05:690e:d41:b0:63f:a3bf:b7ff with SMTP id
 956f58d0204a3-640d4521905mr8009773d50.2.1762815612050; Mon, 10 Nov 2025
 15:00:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
In-Reply-To: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:59:21 +0100
X-Gm-Features: AWmQ_bnOOnJKFTCi7QK6iL3YzdjswL_EdXBkwAsVR9l7bqs8icN9mSLR-Gbon98
Message-ID: <CACRpkdZcqM5JzvoTUk+cAFrtvQjHdRiaV0MF8ZipPTWxfqBxZg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: handle semaphore acquisition when
 handling pinctrl/pinmux
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 11:50=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> When a GPIO RIF configuration is in semaphore mode, and the semaphore
> hasn't been taken before configuring the GPIO, the write operations
> silently fail.
>
> To avoid a silent fail when applying a pinctrl, if the pins that are
> being configured are in semaphore mode, take the semaphore. Note that
> there is no proper release of the RIF semaphore yet for pinctrl.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Patch applied.

Yours,
Linus Walleij

