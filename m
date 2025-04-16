Return-Path: <linux-gpio+bounces-18927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5CA8B421
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 10:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4AAC7AED00
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 08:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731AF22FE05;
	Wed, 16 Apr 2025 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKL4q0VZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4A22D7BC
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792959; cv=none; b=s/DcqPJbSZTpIX5HWjduuetHI/9nHWaW/JvQcjtnIkXt6MvkSulLzV4/M8kXA1SL6Q7zvFbLRXr6NdzcgysxBNNRHxZPVGtT/QTunUo34B3wx1ER4VBVULouE4ah/cEvMrV4prfBjYydqvg916yx7FdP+CX9g9qW+bGa2cs/0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792959; c=relaxed/simple;
	bh=emU1ztpEHcPDJ3TesqEI0D74SFuoQkpyh55PmfPn1VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXBo8ICeYFMt/RtCi4wFG1Hyq0+Kdy2tNkGo2ghABtt9OuhuC8UZgtekXwn7uh3tMimxxHf/Se4drg8NPRJxEji1rfvMSw9vPCvG1lDuzUfoRlHeoGYi6b0a283at0nhuQlxHTrMo9u6G8RxhhMZw86HjsjKMFguh0InuK6aap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKL4q0VZ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso63943231fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792955; x=1745397755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emU1ztpEHcPDJ3TesqEI0D74SFuoQkpyh55PmfPn1VE=;
        b=MKL4q0VZ53nnCRoQy5sY1rQ/sGoX3wOMcC4SIYjQEwGCYhhRRDigzzB7GA0e3nMl7C
         Ggx6TT/wK0M4N5c2NWsOMgiDMSz1hgMqqgFYm2GL0kdwvlCjF8VEwzM3x8sDIg4NFfrN
         aUfKYEgrxrtJxKX7MiD+BN4c36ozksBJQ5Xi6FEDYcYdU04WfiTtCKGrvr2zQthTNLcE
         0baL57HICUBnetiwla62FISfOISaj6A96fFvz49GzxGpbI+npweyTrvWqTzrYe9N/JxV
         HGonTmKifn2YdqhdKYtXnqFtk439e6BmuKtz1FVmt2DjQ4ZT5AP9pnE0s8LWYPhZk27d
         vi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792955; x=1745397755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emU1ztpEHcPDJ3TesqEI0D74SFuoQkpyh55PmfPn1VE=;
        b=cHFQ7OJ2DX1Ua9YFqEvlA/z/KpHu8YxVpgsnNh+oOnYVQHRbqpdIjqnzNWdiFzUSU5
         ZJjxe+8+hKz3ZSDW0iTyesomaNSdqJGkY25s3nFMi6FBq87nQJx/1sviUSdfvMkgfG2O
         2eCBs+lCfbdV1UFGJp0KjyqaBvGNhQyWapKez3EzqsRRoeKs1Gtj3+Y16uPOkbY828B4
         Rpg0FKm4GtczMiyVhXzEroY3EunkXQzfSSMHdLdV3Hx9sWkhRGtBFP2nIIIkCGCasVZg
         dSBIc+VkKWI7RZ67KIStVfQThv1vq+kLYYncMmXFe3AGzzZovN9yUMir6rNkZpaGw4PT
         Mpcg==
X-Forwarded-Encrypted: i=1; AJvYcCWSP51OILovVxW6RR744eivFzLOOay02ww7hGx7WvsFgcKnER1aEO1Yr1lvuy4rvuCwSWvk4Lu+tHbQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTGg3wx4wq1W5D9QPxCtIhBv/mA6Vnkql49mZS/vZ7Cq84IQ7
	cNyzzzRAiDiKGBgaiY+HdK8oqFVujb7sziYVCR6eDql6j+Mh/58DfDCJXBUlMr9QwB01v+kigv+
	KoaNyV84ZWFd4kyIAqJb0zTbLmlsMqetIsufLnA==
X-Gm-Gg: ASbGncv2L0SggQULa3CVtnwcgqA2TQ2TbEGIPRMnhNSbO6rJ+28CuXw79AqLw0k5Hqf
	ooIgqNYLwHzOyJQ3Z1PukLhaeelrZOx37NdvMf4BQnbMLkmVDGK6s1C72kO2SExHDnSXPn3nn4K
	qwmoW+wmujlhZGHnADWdi0Ug==
X-Google-Smtp-Source: AGHT+IG3vfJgDVatBWZn8CTY/EFP1pLWKS59uhKTgG+BQpORL3g5bmdKhrAO9ol2IZnTNVf832lwVZxuCek+mvzQcrs=
X-Received: by 2002:a05:651c:b0b:b0:30d:e104:b592 with SMTP id
 38308e7fff4ca-3107f73a75cmr2464581fa.38.1744792955305; Wed, 16 Apr 2025
 01:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:42:24 +0200
X-Gm-Features: ATxdqUFlkXxMm9jeA4EPLA5TxpwlyriYzwentOxHys1CKD_0gGXtuyJkG1m0nHg
Message-ID: <CACRpkdYBn6v6ou9VpB9hDRcLQ=_-d4T-LU1v+_p96XT4SH2EVQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] gpiolib: Move validate_desc() and Co upper in the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Move validate_desc() and Co upper in the code to be able to use
> in the further changes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

