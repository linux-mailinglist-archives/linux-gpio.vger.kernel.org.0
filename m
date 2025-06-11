Return-Path: <linux-gpio+bounces-21334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0FAD4E26
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 308BE189E162
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C8323ABAA;
	Wed, 11 Jun 2025 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYVNdO+i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884A23909F
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629994; cv=none; b=HVXHtfVRVOq+mIY3FT9pyY+ItM7kb3uWdm040WOEgmFnMVGbJIRZtsdM8ruqW8XHFQrMxzns7RSdSPab2FvEnCWgJZOXmxzku/OD7J6qYh9AgT8IqEMD1JnWtZgZfra27U8Xe5J1iGczh2emF7pAbIVX4GHd1/5N3kGw/k86DsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629994; c=relaxed/simple;
	bh=qfEUwgfs8vRpgtFT6DpPGWVWSexunSrndMuCTODb5B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuKgregyXmUQCl9eLjfBBQ86WJuQamptOTq6GHeRn4wjRqeAiFkkDkPLr9yRYYt45RGdITwcBXW60ch8v+lQURP2/AHpLuH2AgsLN0cT6o1NBhlMJjdASRlq09j2mjW/YPXGEP9cYwyLZHMX3P685zbXKdPh2mitt9KH5GAid8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYVNdO+i; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3292aad800aso6779631fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629991; x=1750234791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfEUwgfs8vRpgtFT6DpPGWVWSexunSrndMuCTODb5B0=;
        b=cYVNdO+iBdl7lFMYlxtfN3cSTEVVMVaI4VXuurg1wbafBjDKKbhAOadS921d7tg8gQ
         DD2vxM8qy82aVZmh9wSumw63PIm7F7B18WKOWzc3xv0ta9ojIM8JWZ5F+j9/Rp+plNPu
         /cUGrv3JoaXbmMnMuBCxQjZN1v65VeKPbdHnaVrWhQbhRscCpR0ITa1KEwrfWKfPUcfT
         uOwXpxS5i49I5MeOVMY/7J54JakACT/+ikgbo5PCNMzDa60mH2awotXbL3SCvJ6OjoyT
         45wr++dXJOd1gI6NSaTF+NofC/NdZi94zcgrJHs/Pq8xdkpHevhcXSOu+XFUc8emp+zr
         qPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629991; x=1750234791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfEUwgfs8vRpgtFT6DpPGWVWSexunSrndMuCTODb5B0=;
        b=kOrYgmHprcHmEHL59J1onvzHpy0aHYGyz53sf+FStSvUcX8yGy2/+zaEOSrODFIs4d
         aUpxh2mKiCD3HK2Koy9nI5g5dWnV0u65pZprfjYLyTnhDQxaPo48JoAdd1EbbohuG+Sf
         5w3UX7PheFwrIRZLywXamW6abl4h0O6g74vWGCs87sBJbnIP29lEdlMonma1So0p9gF6
         rtaKVqiodvmqOhlpSk4KdZDcrH/9gPNcJzOvB8N+qQvu+CWQrdYgXq+lrsZq5PxILbCy
         t3/peDgngrEYF0ezQU4wNfGtI9M/pjYfhY+LBaW7N2NIc1yKuXFhj+FaGr+ljgdDFou/
         y5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsYwVYRb3GBYQGMhXtuH+/a0r4r6YjKCxfvk3cOpsiwqWH10ugX2+VmErzJ6OQ4sfj6WwE5jwvNwiv@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqtJdDajSuC9HuvzBRvwbkmdHMnzUYzkRQRPOwR+XdKAWf5kJ
	h2m1VRi2mTcAwhxo5SLS7erPkStpoUHxxhljWFBQ9govj1bqfs+Qvlhg5Czg6vX0LT6u/QaTWnY
	cy27C0mGzgEF/FvB1I4u20NpXuxilRlFQgCh9Rz0Vsw==
X-Gm-Gg: ASbGncuW9v+Stde84nTzX3o3kna2gOEvw/30AwMsfYVPucs5OWwIcyhB+vsmGGJyWtW
	NGZzLSj8WYutJ0sGuK5owWScn6NzL+4rIpLA+OxqGPxu5ZKQnwsdTtxbLFlo71qmsBnH1EdCg/2
	+zULRtFIVX7zEUJEbZnNyOJJtwut29ujJjw1UP4KE8Fy0=
X-Google-Smtp-Source: AGHT+IHMZdJely4795VVqLoqRl1qPfYOegXZSf4UrsBrU8j8RAFr7w66QnA5RzWCaH6Axcj2yuZ77PCteBpaqPt4wsg=
X-Received: by 2002:a2e:bc1b:0:b0:329:1712:c38d with SMTP id
 38308e7fff4ca-32b210d2a46mr7710411fa.5.1749629990615; Wed, 11 Jun 2025
 01:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-6-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-6-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:19:39 +0200
X-Gm-Features: AX0GCFvuCs6DGvWhnNuDcjCtZslMdeUGWlm892-ZR1vsS36yJHrr9-BCVMHj3P4
Message-ID: <CACRpkdZOT+SCqMvEv6QsUAPxQ8ZrFv8-ho-NLjmjSC3s_Cw3AQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 06/15] gpio: sysfs: remove the mockdev pointer
 from struct gpio_device
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The usage of the mockdev pointer in struct gpio_device is limited to the
> GPIO sysfs code. There's no reason to keep it in this top-level
> structure. Create a separate structure containing the reference to the
> GPIO device and the dummy class device that will be passed to
> device_create_with_groups(). The !gdev->mockdev checks can be removed as
> long as we make sure that all operations on the GPIO class are protected
> with the sysfs lock.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Much better like this!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

