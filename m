Return-Path: <linux-gpio+bounces-10058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685C977E55
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 13:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96C57B22F1B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 11:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D321C330A;
	Fri, 13 Sep 2024 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nn+JiLY6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D331C175F
	for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2024 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726226129; cv=none; b=XvPhNrCcXqV3yeY3JhbJfimbrNahSB+bpoY9yJNHhyzjXw3IO+u0X/rvVXuCs//qEefCNcsR/BBoAy4MOucMb2SRtMDwrk5wdGGufXaCEuv8T0X4x0rKQO32Bd1P6NHndV6inKgylVfJfA84Mdkg0K0w/rSMqEL66C8EyR8GP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726226129; c=relaxed/simple;
	bh=QAKt0dqHIeTxbc4KJ5s1WHq4SqriQL6MS5+Nz7bawe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhrzmdzCaNCum3QM9WN/7uI3+AwG/uqY6O34dgNOxEE7se5v/9gctQOiF4BZClZjnMLkf6Twpr54g3SdKtDHxqDU8B1AbwCkh99eRM2erb0MWSJB+6nVG0H0N8sNlTK+NRLZiN+tcFqOUhe0PTyXnrLnl2H0Ihst2NIQnOKqr+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nn+JiLY6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so23941381fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Sep 2024 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726226125; x=1726830925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAKt0dqHIeTxbc4KJ5s1WHq4SqriQL6MS5+Nz7bawe8=;
        b=nn+JiLY6ArW+Bzgi2mp793WiMtT7KSBCZr3VpMUeSbZk1M0OwoEG95zm2Y+L2gnk7b
         67/aAnLwm1H+gLs4Lt8HzAObSqe83P2WlHnfBOYboDMrFXsZ6clfRKnjH3J1afLmEjqX
         ALO5+pNyHEyulesNIbLAZUC/jevZq6VvhvQnJaoKUDtRSkCAbrBb35bKuRChUja2LAtZ
         BmzxVHNc5omUgI5hQHzE6t3iX7o84WpKcsTen5w73kg0ARiqaiygkgJpOZeh0Vh9YPO3
         u5N5Veyy8nN/7+amgfKvGxAQIzn7XNnGueEhksZJI35v3I72KTKaYOWsF7cPJLgveDZ9
         ndpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726226125; x=1726830925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAKt0dqHIeTxbc4KJ5s1WHq4SqriQL6MS5+Nz7bawe8=;
        b=TKDhQZw7J3Jb2WPvNkEYNohPZJaCWQquN+RTW53dF9wH2qdaSB4uyim7LBlnELzpOO
         oH2R13PBxOYztkwTpo4z61RUDfy/LxOUGm00awUq044cirmK+DTM/4A+FXydXQuBt13k
         6e10N0Rr4XLbOq+eKYDeM2oWX7/C+5IH9vUSW7xXZ5jX+6hkFYPkK9tIXmuH7o9CBzdf
         pbebgNjaZsXMlaPiuJQTC3+3kzos9nnVn143KrmvbTG6mpEHIWFAp5vFrgzX5ES+rUqR
         jAG/mPrvjK0OTVXaurN3qPsGIOTwAA/yhaABe7KvIgkLg477QIxwx9RkXGhbm/VGjpJx
         83Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXb4niYcIEVCrFlhL6/jIVKnWLIOl0yzCbZPQ2Z4UvV+cO4E0THRjez8OMVanothBmWtnRSs6l0OhF2@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLbc59eWvQfp07d6izcRDLu8wogMnHqkw58SrRPE5z1ZNJ76n
	nsR4s2LjjXGWpIAYCrOZLUrAQsxAGjJidRzz9fQ/4NDYjDWJwidsuBLyYr/BVhbKk7OdUjQAIGn
	GmFrJaYsMzYT0hWnv1nux9UTVL+/OoWVmnXsXDg==
X-Google-Smtp-Source: AGHT+IGUb8hJGZ5u9lB5WYN3D9/KS5kOXjEGy9eXRXcK8+CUNTp+w1nX/TssvKGFMvRQGNYn3GESRZrhY2iwZhGJuhM=
X-Received: by 2002:a2e:bc03:0:b0:2f0:1a8f:4cd2 with SMTP id
 38308e7fff4ca-2f787f303e5mr35050231fa.33.1726226124465; Fri, 13 Sep 2024
 04:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902072859.583490-1-patrick.rudolph@9elements.com>
In-Reply-To: <20240902072859.583490-1-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Sep 2024 13:15:13 +0200
Message-ID: <CACRpkdaRRFfB_HQaYQCKtdqhy7Cx-AjdtQnJVACRO13z++eLmQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-cy8c95x0: Fix regcache
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Andy Shevchenko <andy@kernel.org>, naresh.solanki@9elements.com, 
	andy.shevchenko@gmail.com, broonie@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 9:30=E2=80=AFAM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> The size of the mux stride was of by one, which could result in
> invalid pin configuration on the device side or invalid state
> readings on the software side.
>
> While on it also update the code and:
> - Increase the mux stride size to 16
> - Align the virtual muxed regmap range to 16
> - Start the regmap window at the selector
> - Mark reserved registers as not-readable
>
> Fixes: 8670de9fae49 ("pinctrl: cy8c95x0: Use regmap ranges")
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

I was waiting for a follow-up fixing Andy's small remarks but now I just
applied this and fixed up the nits myself.

Yours,
Linus Walleij

