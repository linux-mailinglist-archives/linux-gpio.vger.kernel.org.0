Return-Path: <linux-gpio+bounces-20277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3188ABB734
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 10:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C968B18974C0
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 08:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C25269D11;
	Mon, 19 May 2025 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LBIzuo8R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57849269CF1
	for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643273; cv=none; b=q1f9m7crJCO/LTF+yxHxyYe1vAX8BCYbzgYgKqoG5llzbJsm4r+8xBSXOvuhzlDzl1ILFbPyJZ/IeQrZ7h6Ril6WPQsVLlISW0E709uZ4cM3qMBLXLKVvIz8ipmObyipVKbzCba3iPcZTU4WfPfPk0lQrPKSuo8RegkPxlSPLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643273; c=relaxed/simple;
	bh=z3GOOWslze767ZXUnyiXmcPnSLnDPCM4xD6CmiyIW54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgYGF2HW7whUtg+T4nrE1sqAClm3///CYMqeAB+oQzf4O72YxREKLnzM/xl+v/Cl+dps6udyqJOEUhBapyjgOADNdao2JznP1WMKNG3eD2FnRpdIOiksNZK7ydrQ9cs9z70ZKwcdSYBUBnWZjtcqkM//Y2XSr691JVaBo6tga30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LBIzuo8R; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-327e9bee7e9so40576021fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 May 2025 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747643269; x=1748248069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3GOOWslze767ZXUnyiXmcPnSLnDPCM4xD6CmiyIW54=;
        b=LBIzuo8RsO2DqFL+UrwEWqlL0KSV6+tC5Jx77sEjCuKUXEiJsQ8YXGJLMCnvyLO2Xd
         +2NjnPimOt1a74VS37x0kpF5M6gzWsTufmY/5DTJbfji4d1aiBfwYKKhOZA9rS06PoQJ
         wl95GBt58g61F71lPmfXLgpdiJSAaHGif7Q2AN3F8ryanqZGA6FXgewFD2TZDGMES9Tn
         2v+SzCi8bojs8IDq1djyCiEEHMckE9RJB1ySOc6ahjVzZs03o1G5Gwz6a66OjfgsCNf3
         dQA/Sjwtin8exCgDXMus7n/WHAnO3csvYtWwD3Nt5Xiord52Q+yjdCqRBWths4f5Xc5q
         QI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643269; x=1748248069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3GOOWslze767ZXUnyiXmcPnSLnDPCM4xD6CmiyIW54=;
        b=SUFrzacQiIjAK9YQsXOVypQojMbIR4R/6xAJZP7ZVypUpAkD5Om3hdNf71xZD+0pT7
         XiR2zTLxFazHV2nbAzJr3uA8nl0K7BBLN/BoYiBmuhXENapdis6a121tKqd0pcIKsjyA
         5plWfzQRLFviXowXCrwY42hy2F5Yyf/yQs08UcX/y1dHoG0FaZVDG7ThdxTR+9agBK6X
         N5483aYbRKJZMnEx3740fqkfS/8wDUMle3WjSGWoGlqKhKrwv7Wm32+k1RT5o+2ujfbB
         yZ/R8k4zeLvwc/HvJYazKWKL6CcuX/op7R+VH7VALySYwNs2ZY2hXPyoc66u0D7Sspcj
         3hRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4baf1xbb8BzIKlAf49SHYCiuBjWGHl2TE9o70xgYVlDNjC0k0OP4jmNktRgkbA2N8Nlj0MtDNyZD7@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFI1nzTTZBUOzGkm3iMIXcsNHy8CIQbOVjEc0b77b5E6GPvxD
	Q7WdAo3UKTaNCsAF0E+8ngC5ik3qw76qQYvEVvuwy74nK0fG+Fim07eCPiLEfr2zhv85tibhgMg
	xRNUy1F760yaF7olAzEfmNzD/rY0slf34UTSXbkwmTpYSQIt35Ura
X-Gm-Gg: ASbGncu1yyyxxSMYnbBxX9gIlqLn7NYmuKiwFW8Gq+AHpmzlgXIiJJi9RDemW8RhnQI
	uciOmYmRyADF3j6B5rwWTBRKajVCYcsGbYlsmwRcd9VyQeEdJLh/YsOJFPsTK4x9OX/mKWLtrVp
	JRK8rMvpfvRlQ5oiPiKIVVZdMvP9Z6r/O0NOH6yUMjh2WHBNvta3NCKY39JYrFzvLgOKKkPIzaM
	A==
X-Google-Smtp-Source: AGHT+IHkWo3T4fmnBPXjA9hhOFnYmSmUwbX5sPEWAwMYvh43Bud56lnIHt6z8iNgiDx10hwY4T/0DDuc6HSnlwQftFM=
X-Received: by 2002:a05:651c:41d4:b0:30b:b956:53bd with SMTP id
 38308e7fff4ca-328076ef3cemr30688951fa.4.1747643269217; Mon, 19 May 2025
 01:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519041850.13095-1-chalianis1@gmail.com>
In-Reply-To: <20250519041850.13095-1-chalianis1@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 10:27:38 +0200
X-Gm-Features: AX0GCFunzpV0XliXViisGLif-SfxEjisRlfKg_vdkE0KlhLaS0oVW17eNx19MOA
Message-ID: <CAMRc=MexsDgNRkHtP65t9qe=mR0COMCb+6A5XRqnU3Q7FQOPZg@mail.gmail.com>
Subject: Re: [PATCH] gpiochip: expose gpiochip set data to be able to use it
 with a an usb gpio expander for example.
To: chalianis1@gmail.com
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:18=E2=80=AFAM <chalianis1@gmail.com> wrote:
>
> From: Anis Chali <chalianis1@gmail.com>
>
> Signed-off-by: Anis Chali <chalianis1@gmail.com>
> ---

I will definitely need a more elaborate explanation of what you're
trying to do and why. We don't export symbols that have no users in
the kernel so I would at least expect a second patch adding it.

Bart

