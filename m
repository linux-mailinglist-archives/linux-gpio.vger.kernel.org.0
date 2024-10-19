Return-Path: <linux-gpio+bounces-11688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3EB9A502F
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 19:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E617281FF6
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Oct 2024 17:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF2E18E352;
	Sat, 19 Oct 2024 17:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ulnQaaOF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BA18A922
	for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729360686; cv=none; b=S8BLcneXelzcLagAXeoN4b2/SQaF7aQMAdKXSO5QLDbaBW8fpUBQKDkJZfO5PetP23g6foAbZGH4D5VizuCINrjS21tMJf5FKMsmRfzgE0f7RIeEBwbJ5M78bknH4BghWscS0BCDFDJi0uVWVLJnFGsEklJKspx4JSEcek7izmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729360686; c=relaxed/simple;
	bh=bTuSZ7B616zwAjWUrl6HkX193kEb5yY+13nfGZx0Onk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFl9XsTdMCleG6PzPjUgXJWHzdSUU4iPpZXB8HC+7emVTXd8K6ceDc8zt0l9jeQS+dObvEoagYpLWoLpwGhOy5fZXD+sDngbq42TZ/0jRfzPfc6G1GDzCT9Di7q2+bxPXEfjZk9Yr9ljOqVviAEnkmj03wTW3mcT+10U1pN9V+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ulnQaaOF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539d9fffea1so3171774e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 19 Oct 2024 10:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729360682; x=1729965482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTuSZ7B616zwAjWUrl6HkX193kEb5yY+13nfGZx0Onk=;
        b=ulnQaaOF/b3CBo2IMKc7+RGUmE7WhegAcQ+l8pIV6nHkhBhAVAH4A496zMv71ednOB
         Tyil8S4tRDmScpqpRDnyv+hnv8iHtbaxDRyCj6OGOWU2ybuYOueD+YfZ/uSMz0Tkk86E
         JppPs6b+sePPEKsYp3Oxy4H7mtEzMGbNLDQ7kOF7amjP923zSOIFUAWit1nHhAt6p7N5
         ChRc5v7gJoyCE2HpSxImZLBO7OVPAm1GMJ5ixbrtezdCzL7WRaBIFSNXv/RbGUMYM05i
         dLP+0tp6oLdSRGP/UBFwU6/p/aXpA+9a9NnJ1X60mf97eVfJxaBZB4lRr2MeFWAvlOBy
         kNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729360682; x=1729965482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTuSZ7B616zwAjWUrl6HkX193kEb5yY+13nfGZx0Onk=;
        b=QxVzg+0oO0GcCh/oqe+lOd4ITHlV8oFPp60+PFgHjogse7+5uV4okmFIZ1dw+9f9zG
         52TMwOTVw1SyfUcEfnQetYSv+qT3lcSahnlBRqi7BbxzIcMIUkwDgL+cuhYMe/IL0sFR
         kJURNTaPc64VXMR3gWfCoBdvwKfZ8gJrHLeBmwl7DQmpdOHfZuzAW9uGJAsPcdQmQUUa
         up062ypJRnZ/t0M8SFiL8i6gNJQbcj7GG8vsFY2DW8Cetl9yBmxyu4boYOso2KST4cw6
         JZdH6GZOpghj7KlHJhXzej9vibhUo4DppxVD/5404F97I0XNGPLu7B9BU8kYHZGx4Y1x
         Fi3g==
X-Gm-Message-State: AOJu0YxnvwNeXiO/ux4ldxqcqvvrzDtCq3xXlMRoDHhJf0YXUHQVZABl
	baSFW+BcnZ+WjFFGPvxOzUg17Fcz9QF27vj12lewa3J3OSe0pCAfphJC2Dd8tIM1PB8Gw8kprZC
	WP7tfHcOfzUMvwWsTwxnAI33OJdrBGpvCy0Gekw==
X-Google-Smtp-Source: AGHT+IEgcKi99o+gzupQqujbmTEX5OumoY+uR+jfZY3sAZI6Yl7MUiohG/7HVRqMPVCUxQBY1d3p9KOHoISxL09kfEc=
X-Received: by 2002:a05:6512:2212:b0:536:7a88:6185 with SMTP id
 2adb3069b0e04-53a1521915fmr3513946e87.15.1729360681894; Sat, 19 Oct 2024
 10:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017150835.105676-1-brgl@bgdev.pl>
In-Reply-To: <20241017150835.105676-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Oct 2024 19:57:50 +0200
Message-ID: <CACRpkdZCZOBctG3=joKo6Ojq=nR41vYTHjZ1AKGagtBFD=-rDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: 74x164: shrink code
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Use managed helpers to drop the goto label from probe() and shrink the
> remove() callback.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

