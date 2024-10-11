Return-Path: <linux-gpio+bounces-11213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B399ACFB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18291F21F96
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FEA1D0DC8;
	Fri, 11 Oct 2024 19:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoX0Lv4W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949CB1D0B94
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675828; cv=none; b=RzZp11GKAN3+8Dgps1WQIoKRA0BNejXtyFrImoxiZy7mNXpUpDBdmYF5Pj0/U2Nmbdy26y+1LVY6mewG0j7m5v8wDXrSQs614fFXdpNSoeaR9oF2bBjdclamVC5WeMMqHxrCDkVJ9woSA/bYlaXrb65rt1e5PWGSBK38qKUA2LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675828; c=relaxed/simple;
	bh=zWOx92++/7bfOB6x6NXdvsuBhuAhVm/tjlM2nESJgmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6YJdEOQJD8wazNN26cPDBgJbFVGnxzjQqId1yoaDJdN1l0TQ4h0u9d6kfTstS+SH1xuGG1dH8B6CqgfWfk6+tw50bwRlJjAvNjc9OR3B02ROUHCtq7LZNWpUhp0BiZA/WkaAP4dk0921s+m5Rk3+l+cUPc51FMuvJe4wsgKYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoX0Lv4W; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6dbc9a60480so22362747b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675825; x=1729280625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWOx92++/7bfOB6x6NXdvsuBhuAhVm/tjlM2nESJgmg=;
        b=GoX0Lv4Worncm2a1tM5JvLy+XWtB3HyQbjJhpTz8zNc8RhJABQjwHNVd5i+0SE+qJq
         MWLVAiO5UfhpyZEYSXG3Yy6XgSMWI3XEIJXW44a+VNwAuqJE0IklDDcBojJjXuERqCMu
         BmyWsQgJRby8c1v9Id+fcv85lxiX5uPUZ9E4zrW1UBYqYnDI1gRaErNBSqextCFp/D4b
         yfaTWXAcN4dhxPHiBjJwoLJFolOssc2R2L7WVK1hlsMZf/AH0EHB3Ig7bBs0YXYQORoH
         IONW6iRHinI+aZtzPc6WTHs1+48PBLRFIKIaKfyffo2M4NvRMCSu/oGWyibnxPGcF08p
         16cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675825; x=1729280625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWOx92++/7bfOB6x6NXdvsuBhuAhVm/tjlM2nESJgmg=;
        b=rVhKHCfbV15/6DNr3uwQLIIicVY+X/Q0v9Jk8k9NrcPPGOjQBqzXaeMnaVAiydqE7e
         sThJLHTn8J9jxMQWzqJvRWzEWz96X2BfvnTXytR1B6MKq9ErlTkHr/rtNTiOMTIly4SY
         Nnk8whGsTwBPmxx8P+0H9ho9WKRDhfeUBJwD/D6RWf69SP2mR/glcmm8AtaYiSNSQNJT
         9+4sXbALllUGwPp1eaGjOp8nmY8M4+znIYmtBJT5khZMDvG+OjoS1YCwDmmWtl/o8U05
         Fg0LgWG3eLU7BkNTacwG1uvaGz5RM5U6wdZNotnPI2KkqNQzMCkVxqe9IurOLHLAQQ0u
         D7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlqjUUawqtLr7ka5ikK7wTXj74NaJz3WzLnaoyX9IVY/I4D8T2yJJnR3JMOqUKO6OV2q0sBhmSCYAx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LWXudUJ9MgxYDT8fQNZd07e1KcjavlU3YnpwgOvwcQWwvMtb
	RdLCYUffOTL8NlLY+mM97heRLJP10+qRIKjETScTm5xtWJKDxpMk/NRvW94IZ3yID+wDg4m6v7H
	sZlKYu6cMIq6SwrvdqIxb5xjkOyr5/CBlkvecSQ==
X-Google-Smtp-Source: AGHT+IHYsc9YoslA4IuZ9ez7etb2ZcXLeoXZg0qc0jkLAIKQ2R3IBViSJnK8GUmsMFqJ+6zsd9Etb395QYWFVm1KNLU=
X-Received: by 2002:a05:690c:6783:b0:6e3:2be1:a2dc with SMTP id
 00721157ae682-6e3479b94c4mr35124167b3.11.1728675825704; Fri, 11 Oct 2024
 12:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007103440.38416-1-brgl@bgdev.pl>
In-Reply-To: <20241007103440.38416-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:43:13 +0200
Message-ID: <CACRpkdZYtJo1fshOPvX=3USxbs1CdTBbbkgMBfFpZVsNyozTdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: davinci: allow building the module with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 12:34=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Make it possible to build the module when COMPILE_TEST is enabled for
> better build coverage. Stop using of_match_ptr() to avoid build warnings.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

