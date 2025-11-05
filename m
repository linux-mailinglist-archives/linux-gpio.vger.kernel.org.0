Return-Path: <linux-gpio+bounces-28119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64EC35D82
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 14:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FBCF4F281B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 13:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D751731CA7F;
	Wed,  5 Nov 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgc+qPbc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A531813F
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762349290; cv=none; b=gjDANirbe9iG85H/H829o7aUtbIVxTSQTnnZODqDMqgZZUBw3SquQoUiq0TSIh1/vUe5KrTwH98eOh0FufUrFwLMGUvFjXTu5Venw3/JZd73GnnyhLGo81FqBfmr6HeUMjYMCKiFSpg/wu7tFZxtmzEWcy6zpgkNJiB66XpCub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762349290; c=relaxed/simple;
	bh=4Rvz086RQXFSFc6WQEGb0sqvVLV8SfpNGQ9nWE5laec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeDAehJFQlDmslNausL8E93y0lDNucChJiYmZBi+OQ6u7Fxm41jNKq6BRStxyV0lygxqMvuhup2S53kf1h+mrivJX54/p/fGpH+xDGQ/NWWcQLRqH5pwS1Pj1dOSD1ridSdnMtu25ng1DjF5RvdY/ip6Sq2ko3vxQbVX40235vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgc+qPbc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b727f452fffso44754066b.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 05:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349287; x=1762954087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Rvz086RQXFSFc6WQEGb0sqvVLV8SfpNGQ9nWE5laec=;
        b=kgc+qPbckYzyL3k6IH2RAOVIr2rEVjeC5niFND+OR430MaIO3i3O7TbQfPoA+flMOk
         l7xaM8RxxOF3wDjAYRimZTnvvvzilX7LqUkrOl4Kvxi+a/L8GomFZLBe2VJ2uFuemUff
         8gqo1bFU/RxXv/5k0vpjN6UtK/yY7TgoKGnp6J/KGoXIQpjRJpSFxwuRyyVFUh11K3JH
         kqOc06QVRtA1TnVQGS0rj39xHC1rA1/ZPX96hWxAqhxhRWG1AcNGL87f0TM7H8vceUFQ
         ePMRoTvVm0xUl2GXsdEh28hZibF5ZZBNTWARE3ZisPFpVbgIAXRkbY36IBcZs3K1fPDa
         QWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349287; x=1762954087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Rvz086RQXFSFc6WQEGb0sqvVLV8SfpNGQ9nWE5laec=;
        b=RcEue+12cWedGictCnEdg1oqqGeRDRbakwG/5mxSCaT4CqT5lYaJUOIY00PqSJQ0VS
         g+5eaQwOFD3hynYqktqu7BHWjwO409+gSzZ+YH26SUqXgk+LJLxxwE9T5b8Ih42ZVRrP
         oq29QoTnJYaatFOhq+OXRFFKj4Md7bX6/WP3yYXT19SqpnfcWcUL4LQoVb/UlqRzELcJ
         XGYPm4jc9dG2QBaF0U1FnOlNZI0nCvB7k7kqI41rHGwqJOHKwqFSJHJsNaJmeOBC4dTb
         ETDiiDrgBqIBc1cGY8hdeatalfz5UHyDXFdjS7AmI+IhjaJs7g7Uw5UZNqco955UudaV
         S0dw==
X-Forwarded-Encrypted: i=1; AJvYcCVwNltjW6zPw7aph6g3u5pl45FsO6GaPToBEaD8ePLeQR8ZuXSFTTqTR6+7Ti0/QOKXIOtRdP5JimE5@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZzF1GU96MCJDqMYquQMOR/qNx9/M8STdi0oEm+qbD+OCtARD
	Jp9kkOlnbZ0RebtD/QlXpoTW/AIbM9re92uy1r2j5VpFgRSy4Q+ABvSn
X-Gm-Gg: ASbGncsnaHmBbEUe3HClc3+XLaTdwV4sefaz1DWwW0dmSoxGYjrIXGLdIjmt9JufjZr
	9pcQF82jtjqXfBlrIOGtkL4U1WIEE8BLnLjPzBc3s8OBXU4PRQCCimBYPxUn5I4wfdfp80MgH42
	QAzi1WTmklemCk81mEmtRnhnQWM3Hx8cddDicSRwgF6FvJjai8a3kwde+yec8IevWoNi0oXNwEZ
	RiIbP2tMfIQ65LbxA6glT6EYIVnuVuibNjtzjpo6prznhbfQmR5dKlLj3fOQmkfPTJZvN0x0t8t
	Z2kj24g3YW8I+XN06AsjyFFmVjLJo6+wrVzUg0+NaZT1zk6LkJsHhzRwfL7qJ64ijnmYWdDqp9i
	0iKd3pbTpl3077f3jjTNLBq6rfAuraujBzyrh05p0WLaFst4K7A2v/QJIxORyaykgI09RTmZHM0
	tJ4/gsMYtwPgEBn7W0lBoHXSsQuhsL4ZIHhW19G9ceJPW0YjnBSFMVpWPOG9qVRpyUDiza9p6FW
	YM=
X-Google-Smtp-Source: AGHT+IFM721P9Xgz9zOF328JaoanXeTi0/muw8L0qkZo/yHkrkZLPf6InYFepquvkNdtMAFB74Ux6w==
X-Received: by 2002:a17:907:3c8d:b0:b70:b9b6:9a94 with SMTP id a640c23a62f3a-b726323d57bmr352421566b.23.1762349287068;
        Wed, 05 Nov 2025 05:28:07 -0800 (PST)
Received: from ?IPV6:2001:9e8:f106:5b01:5cbf:5078:e623:8643? ([2001:9e8:f106:5b01:5cbf:5078:e623:8643])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e26d1sm478254466b.35.2025.11.05.05.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 05:28:06 -0800 (PST)
Message-ID: <3897d941-4cc2-4332-90fe-f575eadc6e48@gmail.com>
Date: Wed, 5 Nov 2025 14:28:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpio: add gpio-line-mux driver
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Richard <thomas.richard@bootlin.com>
References: <20251105103607.393353-1-jelonek.jonas@gmail.com>
 <20251105103607.393353-3-jelonek.jonas@gmail.com>
 <CAMRc=MdQLN5s+MpkLUF2Ggc4vYo30zOXrA=8qkGmXvu7N3JjeA@mail.gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CAMRc=MdQLN5s+MpkLUF2Ggc4vYo30zOXrA=8qkGmXvu7N3JjeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 05.11.25 14:15, Bartosz Golaszewski wrote:
> Hi Jonas!
>
> This looks good, I'm ready to queue it but I'm afraid the consumer
> label "shared" will logically conflict with the work I'm doing on the
> shared GPIO support[1] as the shared GPIOs will appear as proxy
> devices containing the name "shared". Do you see any problem with
> changing the label to "gpio-mux"? I can even change it myself when
> applying.

Sorry for the noise, I misunderstood your text a bit. It's just about the label.
I'm fine with this and you can adjust it. Thanks!

> Bartosz
>
> [1] https://lore.kernel.org/all/20251029-gpio-shared-v3-0-71c568acf47c@linaro.org/

Best,
Jonas

