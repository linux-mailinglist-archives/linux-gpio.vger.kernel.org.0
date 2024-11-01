Return-Path: <linux-gpio+bounces-12450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA929B9086
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 12:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBFCA1F222DD
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 11:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9FA19C566;
	Fri,  1 Nov 2024 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quxGSHir"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05736189B8E
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 11:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461403; cv=none; b=Cl0bVQv61cJuQO5TzPyOyaMMakZOHS7h4nsc+4zAIf6xL/LMkGnK4PZ0+xIX52gGzbvgM8yse7oQMfp3D1b6aWE3LudZz476zEAjNldSDXH516a0ANbQSEdsHqdsErKUl1hinypTgMpQWLf7ns4g6FnFc5ABEmZTwjiMLzPfNmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461403; c=relaxed/simple;
	bh=ejnaxXfkFR1mx1gosXLwrAzWZwBuh9w3wjb0UDx/6k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQbgm9us3hSu3myDNnZg7cqVD0QzNq0Cyzi/KqFMvPv25QmRdCwTiTJEvMacawU8tg/Q8XJVwZNWIGXw+g/du+6L/Ab2Q7dUYSZPOF9U1MaoqYhwwd7k82qAHJazFIVQmzqfmuWGrr/jHsv6lsm1rPOejSdNHgtikedndHuOONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quxGSHir; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb587d0436so22408471fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Nov 2024 04:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730461399; x=1731066199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc6DrwJirW1KyNI/G8M3hiy++zlPl8jIuYP6tkaB8YU=;
        b=quxGSHirNc32SE2Yu/Dm26dZpwHs5uRp5vCB7rqp9NBGHUJoreSIlBBA77LTURtAwT
         HAODPqodrZGb/X8QjD17AVeg9PZh1xYPUapiAtMrpqkUx73xhbRHStUmvDQ11B7RneSY
         rDxvZ3TJy8h6wMzUnY3Kjy+WsMG3hn4Yv8l1yP5TUPIWh8+bT6wiyLy26H97n5P8G1Wv
         XYViA+tqWeqNZG9F3UZkfXsMfbUvy4FeMgs0HHJOpSrjOb4Aa5gH4BYSHf4Bw5i4tCn2
         cGfFL2cL8UCwMAvANeAcWSw7YWtokanmjF3VqaxuLX9JiD866JBR3HlRWhesWv7VKYHw
         PVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730461399; x=1731066199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jc6DrwJirW1KyNI/G8M3hiy++zlPl8jIuYP6tkaB8YU=;
        b=TdKgMbL0uacv1q9AYwxKQOoayPVw4D7IdDQrbtWtnqSBOYCB0maKk5e+fMba9xus2U
         P8v+sv+zNWOKf2zD+9n6ifzq7VI4HvfGp+t9rAESP1PJxiDuAQ6uo2e1rMEvhRYP8N3V
         VvJCrmb1bIuXOsugRJ7IzEwXZAfqM4BArCD+zkedYtJSLNama/Dsn+a7y7709nDY7xJv
         KYtbxX/du4rFWo9V3hrDDYdTZxPCUFomU3GkZGYgDm0Eyu0YyW8F2rEjBg4Fv+zLzX+o
         D0XvavaB0MRWOmmZdp/+d87+XYkcwb5xoJOtwb8uA5wBlXCYgNNgSxM16A2LNoNV4Xkv
         bn5A==
X-Gm-Message-State: AOJu0YxVRipe3cZ8E07h+1dEGLnGqigc6DOWvzTEDvKmcXEzIOmW3h/l
	c8m+44ZBCIt3BYhvFC2fyu6qrrPJ4rnprndsl4bmttrSea+vmItGl1Uiy0AxwVtjoIiZOMGvC6u
	2g2XFAWwdVq5Ihy7xcLJnXAOrzigUEIw4bhPnwff52BNul4i8
X-Google-Smtp-Source: AGHT+IFSj0jWDqnqg/upxIiuFELJsmZBEQV6BzbiN76nsYTrNguwjWYWeJ/UGxsSwZdxz4PKoGzJw6BjPYyXsSL73+k=
X-Received: by 2002:a05:651c:549:b0:2fa:c913:936 with SMTP id
 38308e7fff4ca-2fedb796367mr18977751fa.1.1730461398952; Fri, 01 Nov 2024
 04:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZySrvXpFANlXrnh2@black.fi.intel.com>
In-Reply-To: <ZySrvXpFANlXrnh2@black.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:43:07 +0100
Message-ID: <CACRpkdaDBsRGntbq4wyEFxA+-ffpQN=MbAhUsoWbp2MO8SK2MA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.13-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Nov 1, 2024 at 11:21=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> One of the tiniest PR for Intel pin control drivers, only two changes the=
re
> which were in the Linux Next for some time without reported issues. Pleas=
e,
> pull for v6.13-rc1 (next cycle).
(...)
> The following changes since commit 42f7652d3eb527d03665b09edac47f85fb6009=
24:
>
>   Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

Does this require stuff from rc4 or can you send it based on rc1?

I know we added some ACPI ID or so for rc4 but ... that's only
required at runtime right? Are there hard compile-time or
textual dependencies?

Yours,
Linus Walleij

