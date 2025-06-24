Return-Path: <linux-gpio+bounces-22091-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A8AE6FA2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 21:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232C417719F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 19:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410CA253359;
	Tue, 24 Jun 2025 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nW1QyYAg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AAC3074BB
	for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793632; cv=none; b=qQznf1UbGpCWH3zcA/HVJQns9k6+FiRpUqiBQXZvr8dDefg7AiuTXbGNvb3Sm2k/CpuMMLcoO5y2FD+d1NKPogLnjMcg1+w2Us2YefxzClZETit2HrqRAF57K5Mble3Aq12liUNw2Wf36J8Oa4pz9gmb43EM0nDXsojY5LOx+S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793632; c=relaxed/simple;
	bh=RgseiNL4xvtb+kSI8k8aKXYWnQct2A/yQxTRMzMTBK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oATMe9wQt6zMAm8PlmuU+N54NAfunloN/CuMujj+hHnWGFoPFLI8f2QFt2jNFt3P+B38ApiUh7NwLfRFEwtpuq4hxqEjdBE5uSKbltbR6IQPGf01fWfT4A1IRjgSElElgEwwTAz65RTRF02mMJ3pBRI7qo5nEKhybdhfjmAavOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nW1QyYAg; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b43846e8cso7737821fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jun 2025 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793628; x=1751398428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgseiNL4xvtb+kSI8k8aKXYWnQct2A/yQxTRMzMTBK4=;
        b=nW1QyYAgaAlml33xZDPc4eGWwH6SyJvjst6i7fN5AqmnZKHhvuTlTweXQd8vM3noTi
         gqUaqjNyiR/NgGVxQAB/JuglHPD+GzCY2s/RnatsqM0noXZ5HARLKdwu41o3riUws+WU
         LBptUb7sCLr09+A/Ph+TvgjaTzZiitsL6KSeUHUc9qV/mPWF+J80bV0ZrxaEH+0u1AKt
         W2n1Vb1JmtZomRlaytL8SoPdYDkSzE1GTm4eAbQ+oKDv20NlIdlsP94tuJT65ki+D1D1
         SrB0Z1sUarnu7VC3chQHDF1V8fjvw5pVo8uOcXXC7JWnzl0Y/o/i32QX9JBxW3C/2DwK
         ZVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793628; x=1751398428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgseiNL4xvtb+kSI8k8aKXYWnQct2A/yQxTRMzMTBK4=;
        b=bhKUxnJUA7gVgf63TLMQa2eSLPSTxKFG6zi2UqGn09eK5n0eWOHfhS3/Gig8qvws1P
         9FoeqO62c+xAim+wiy2WHkViz92/+aadZjDwvsluOadC5xcsZPNShFTLcbntK9O2aDsO
         g02rL3gAj2M0NjNCewG8WcYeF9ctjEe4m2z77ackO7mxKGjWYeP2i1tRXMF7mzKlD38i
         UOp/vkiwE+1woW/cott+ztlPHmJYuK0YyiJmBavQqDPJwwBs9xmInco+133n4lBvNVf8
         dCP0SiFejjfaVUmZ4fi4Mgy/73LTiuhDrbWnackdBpAAHHcGwtaceJ/+/wFWius4hSCX
         EcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUxVzbW9biluUF1BDWGUjM5gcQaumlBr5b0uymGFC6ELJ1CXoLXAW3xXdlQaMYgHs0onoTVxZIsSbL@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYi4siRY/DjHn6UBeNbh+zhanQwdBHqXCuYxToVI/CGJlEMF5
	pVPLIpiHCLRLkX5Elrf8a9Wecze5aUN3FerUNI7rKJxZDvItUkOHEvGRiTIz4BQ7kXkd7PYIYe0
	YZC6kPEJbQksJLDjeLtbva45dAi594WiFYnZRoBQNeg==
X-Gm-Gg: ASbGncsrHMxd/aVYnzDbVrSnptet1kS/VD44xaxVop5uP+IFgCCUm7po0OFIV3+JubE
	sumaqbUg8+3r+5W7yeJBAhO2Tb9yrj4g7uXnREQrz+aa+rXSrSrsDdVx2JZZMgeXrHSfDmOhTkU
	iZrnfqNZooW3451rJ7PttYjRCxnuZOaQ9d2ycLuVuCuK0=
X-Google-Smtp-Source: AGHT+IE+bxYIyuJMqpkxoh79XW+22rye1okeR/P8QXw1HMjiNPaRsz9kT4xlc/bQbdb4WxO7oPAcNeoNHJl3BaMancE=
X-Received: by 2002:a2e:a552:0:b0:32c:bc69:e921 with SMTP id
 38308e7fff4ca-32cc649f481mr80321fa.9.1750793628527; Tue, 24 Jun 2025 12:33:48
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org> <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-4-d592793f8964@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:33:36 +0200
X-Gm-Features: AX0GCFtlvzaIjpNNAu1m_g9IoQS1etZ2n88hEJISU_S5woZgvnQy4k4SmPLO_Zw
Message-ID: <CACRpkdan+5xY6RUbGb1r8OmaB3-xSj_MGGq0oONevqBGay8NYg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] gpio: sysfs: don't use driver data in sysfs
 callbacks for line attributes
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Currently each exported GPIO is represented in sysfs as a separate class
> device. This allows us to simply use dev_get_drvdata() to retrieve the
> pointer passed to device_create_with_groups() from sysfs ops callbacks.
>
> However, we're preparing to add a parallel set of per-line sysfs
> attributes that will live inside the associated gpiochip group. They are
> not registered as class devices and so have the parent device passed as
> argument to their callbacks (the GPIO chip class device).
>
> Put the attribute structs inside the GPIO descriptor data and
> dereference the relevant ones using container_of() in the callbacks.
> This way, we'll be able to reuse the same code for both the legacy and
> new GPIO attributes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

