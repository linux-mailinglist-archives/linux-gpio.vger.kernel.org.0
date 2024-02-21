Return-Path: <linux-gpio+bounces-3542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A485D1F8
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 09:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54AE91F272CF
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 08:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A893B79F;
	Wed, 21 Feb 2024 08:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFZe0RjD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6C3B2AD
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708502553; cv=none; b=fuA/uYWBsiMajVExwJ3NELvBY3JjS7ThXgLvz0JFFE+ua8i/NqrSQp4bY3kJNa2Ux54FTRbP6lk9Iw6kg42Kqktey9pPQs0kEWySsrGP3CC8sEXdHqLUMRB+Ld2a77zkWBU8pm1h2iPqjU/+oUFoQpOl9s94uro4Y+Hrm5spjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708502553; c=relaxed/simple;
	bh=aXXA5wE26iTBRgLyo53Ck7qjjGy0Lh1LoQcMiP5/WfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb023m95VvS7CN/4ydd1VM4JniER5jmRI9TgqDw3++j47wybNnlSY965BftkBlBG9jhT2d4/+ik1UkVGRCGBnkkxtZ0MAkgthcM/M6H2t2M0bjHfm77LFtfwvqE2Gp6fLGCt6I80hRbSwSZi+Y6BeC1P0IpkvPE/7CoZEpmBhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFZe0RjD; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so4956148276.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 00:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708502551; x=1709107351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXXA5wE26iTBRgLyo53Ck7qjjGy0Lh1LoQcMiP5/WfU=;
        b=iFZe0RjDQq4TVfAohbPAfQ75xKk89Jd/kVLBFE7te7L16Ntf8eeYOZci3MFBzHkPEk
         RewbvvZvEy6GymdjNtoFf9egfZzYwtZ3S7eGyu8PIovtd/Kqn0Kt6zAnz2EYpbB5Pxbd
         Jln1HbYCaWPVYdGirv/DX696ROtg1c1R3dtVvJ1lZsvxiVRh3wnVByJpS/u4IPOTP4mk
         RFdlxfTbLSUmmbTxO+MCNk6CbK5bR5CBynkcdylldOOA3u0zrkg3IRIET4VUK6rMFG4B
         qTdCyHViyy0W/+6YDJ45d8+HgvfkSI9xq2oS8ObuFZkdr3bgBreSEY2XpG+pLYoKx+XT
         +raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708502551; x=1709107351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXXA5wE26iTBRgLyo53Ck7qjjGy0Lh1LoQcMiP5/WfU=;
        b=RQ4JxAtLiQnlPbpUAyHC0jkNVvYbiRAVuiXiLd0gKNVtkHSh/xqM8zOy/3wuJq6PEW
         DnCjM0PWzX9x56hJMm7wfmjaViLzYXsSaBSsLU7HEt8/0vfO2WPpZGgLwIDS91b+argA
         DtGl036KZLwssKJkuakJgvB1RlkifjPPPWLnFnImYFn3XzasK8qhaFLbs6OzZhpoIlWf
         lfDl4FNiFB5Fex8VQsO75rpuhYtgyrAv1CCT7Jc8IfW9XUCB9lG814/XUNHnvtUwGI/k
         3e6NO1GxmVuEgBLwBr/GSX2IPoe0Ev8G6hEh2GRBliiozoRH+03wAy6xhqV0AuBZUpbZ
         RX/g==
X-Gm-Message-State: AOJu0YwTlkE+r/JgfqCF5UPZuTHsNfm7+3dsMUad5XfUFN2fAK/ddTap
	hAF+Rh/scFTYGBzZgjnZhuf9x3V3qewPoLITpYRq99xvHMEFuEK37KBFLelzO3CvOVs/wz8Oe8E
	mxWoURbiP5LQgnMeL6O98N4eejBy+u2XOrLVrIUGeku+CLJG9
X-Google-Smtp-Source: AGHT+IHOu+lEk3QXT3JPTa9WAsERKwUgQjv1LIaXMHSgtFqbEMujQEjxOsq8X15+TTcbYj3Qf/+ogQASWM3tqrhXQ7E=
X-Received: by 2002:a25:d08e:0:b0:dcb:d94e:be49 with SMTP id
 h136-20020a25d08e000000b00dcbd94ebe49mr16023927ybg.57.1708502550856; Wed, 21
 Feb 2024 00:02:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220232328.1881707-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240220232328.1881707-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 09:02:19 +0100
Message-ID: <CACRpkdb6PSe=nJU+MFq28UX2qMiDGOGGZEJAP4QDFAteorwmGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mmio: Support 64-bit BE access
To: andy.shevchenko@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 12:23=E2=80=AFAM <andy.shevchenko@gmail.com> wrote:

> Use ioread64be()/iowrite64be() for 64-bit BE access.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Obviously correct, thanks for fixing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

