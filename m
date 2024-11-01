Return-Path: <linux-gpio+bounces-12446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6589B8F46
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD8941C220F9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 10:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F1F17BEB8;
	Fri,  1 Nov 2024 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mkuld+cf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EBE17625C
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457312; cv=none; b=TnwxxpnhVUnIQRZZojleEA/+FnJrfJXvW2Mg3avayVVLsf164jhtNl7mx9eHGxkb2UhvaMePikYSTSB5qHVml6cLn8Dgwu2b58paW/2UKhtuobEKVaE9CRePVT36h5u2kPhbZjFVURD27fgLJeA/DbzgPfvnU+SjGqdTt/nP7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457312; c=relaxed/simple;
	bh=gUED0qC7Xj9Ccy7zGDMa9GopgP03+U78n6y1lYaHtWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuzVE5szWA0WKOXDr5UMTkldDEW01QnfMg6tyjuhB+1rRRsAh76P7q9jyQg61ByyL9e+hbqmLoVJDQl4E666ksKN+jAeZR4/6HWRI8gtKjSckMzOrywkIdX6YgujluNnwptwKp0c+OpG7IZpSqz+kvlkvNFp8s4cBudBwEgtrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mkuld+cf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3debdc09so13804921fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730457309; x=1731062109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUED0qC7Xj9Ccy7zGDMa9GopgP03+U78n6y1lYaHtWA=;
        b=Mkuld+cfx76etPlCWeKIeVypufqaOwbKv9SlFHznt9G1mImiKLPWeGWZM1tiXpqn1U
         o0IZG7ghwZ7MxLvDhEnKAOXEIrx6/Rr40tAF5EKNbfZiZEHCimj+S7fhEpj7fbVuTHoE
         6w+X8+7NTamUu++pZCq9ixU2qGPw11p6qad+Py4fBt+brh9wgMsb9GygevIgq0REZABD
         9Eddfyrir0t81eQx9oUMecMmoIhHlCgC9m+oh77KSmGfCZZT+cPpvQZRpiNXW6xNaN/i
         5Pjgg6LbcNdK3dolBt7+3M/7Xc5gK7JP++XrEvFsNkBDo+xX4eUd2EfLN3ivoFhKJY3j
         zN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730457309; x=1731062109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUED0qC7Xj9Ccy7zGDMa9GopgP03+U78n6y1lYaHtWA=;
        b=relG7J8iUuua2n2n/Ob4gO4qXC0JWXCfmzSSWSGgvkIw4rM4LhxC1+YtKwf9EZIWqJ
         6+6ydkzO5lvR9ZweR1DP/cxcwfiwyQ/I1XE5q3U5H+oEF/k/m/LZGFATkQmhsb6ns/3e
         wK7tEHGnfjeOwkjOzx/7HoumF1loWIMt0b8w04Rxx7foXYF5zhtQsGHnh42EUE9ZKIFC
         Udoy6AbFRosKK0niBr6r1EpXf7t83ddmlQY+yHqPlaM6Ua44d0ewJDxCzmAYSRBs3EPf
         NheHvulLv/DA25etMlP0hIo8uPPzplUisiYxjM0EuY7FAzsfHshBH5Lq/71uUZes6/MK
         i/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+d3rPVMzCG8csjxsVgpzitlN1NiyB0VHEbPipKK5oTo1j32f7SJrsUa8v7dCJ7fX6SvOBRAssMSPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFCv7+1o4KmhmzWu1RLsgLljDxtDj7H2ijH3Udj4/FMiYi8Hzh
	QSLM21hsLJK/ryaODoQSn7ScuRz1xINuIdtlcDl4WvErUHaXidCTE3bOz+VCbEii1NIZO9mJOUK
	MYD+79Aj4yZHa3vLqXCSw98LKxMQT7itdeMvpTg==
X-Google-Smtp-Source: AGHT+IHbg4e8vqd/Rt1x4u1P8xcePOvYSBmvkosXej4R5FzumYLF4sBYkWQAy5nsAEsijuo6ls6uMX8SKiqbocvwAIg=
X-Received: by 2002:a2e:751:0:b0:2fa:beb5:11cc with SMTP id
 38308e7fff4ca-2fdecc2c529mr27176451fa.40.1730457308592; Fri, 01 Nov 2024
 03:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031200842.22712-1-brgl@bgdev.pl>
In-Reply-To: <20241031200842.22712-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 11:34:57 +0100
Message-ID: <CACRpkdYTLOBtrhmRHjEu4b6tX8ROc6OHd=f1JAROVA9Rz1ngrA@mail.gmail.com>
Subject: Re: [PATCH] gpio: cdev: don't report GPIOs requested as interrupts as used
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 9:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GPIOs used as shared irqs can still be requested by user-space (or
> kernel drivers for that matter) yet we report them as used over the
> chardev ABI. Drop the test for FLAG_USED_AS_IRQ from
> gpio_desc_to_lineinfo().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I think at the time this was added to not let userspace meddle with
such GPIO lines since they were used for "something" in the kernel.
(Userspace as second-class citizen.)

But I guess this is fine:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

