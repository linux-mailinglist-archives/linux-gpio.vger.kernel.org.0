Return-Path: <linux-gpio+bounces-5157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A489BB15
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 11:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096501F215A2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 09:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473F73AC10;
	Mon,  8 Apr 2024 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yM//TDSF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6213BB22
	for <linux-gpio@vger.kernel.org>; Mon,  8 Apr 2024 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712566929; cv=none; b=l65nfjyRHaRSvpZQUfrN3wUzO2LAmCXNYJEgNbH5pqHtEQ+sgtzPHwRqVQPTolnK5ik7D/DQJIwb3Fcg0+Iwccx/sRdjj3y4/FjPlM6xta0YYda75gJPQGlrlFW9FaMQr7gIBTnn1bMRMSVTKdmWIsy5XvS+cpdeP1RPYEEapts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712566929; c=relaxed/simple;
	bh=7xPMrFI/gyFjTUx5A7y2NdHWs4xZ8ue1cqn6vR40vdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOynYGTwVykxa6WUWWo5sgmIbBlhQ6xTo8I/OX+BMFCA+0V671uBw3p6bSipZredShXkkt3pepRg4BJeJHG4sNh921eGYVtsFXlklRKxRdVbrjUY+rGsSvoCMuOYlFQsOY2yTVahH+O+bv61sF1q0JAxYDtfAsW4HaWengG1mF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yM//TDSF; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-615053a5252so37075037b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Apr 2024 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712566926; x=1713171726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xPMrFI/gyFjTUx5A7y2NdHWs4xZ8ue1cqn6vR40vdg=;
        b=yM//TDSFPLrJbDhf39ffhiXUisjePh2gIFJikk2K73YeQxREJcTs3vvWA3SpdJ7VtE
         oF+UYei5IFJL4ciWbi8ESixiMxgMzoi5hc+yFlK0cD37s4DNpAfGDU9qzQZR9t8CbtFx
         0N69QvHhttUVv0+/oQDkk4uUeTnE0qgrz23yYrG81+DPMrOYNQ9zB+y7phuvlybkdmf3
         opWXsIuv6yBOeV5x6+f2wSzZn5A2gNSejJv/76taztV3WR88359sNYAPQrRvl+50VT0w
         Y54MVX9dWghXZmNnAvIMRfdkANx8hVm5e+WguDLk5AaT2kba+CYoQtxZ/GA3rgPjqmmK
         RSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712566926; x=1713171726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xPMrFI/gyFjTUx5A7y2NdHWs4xZ8ue1cqn6vR40vdg=;
        b=EIWPImKZG3Pbn57MlHKwuWnh+EHQBKO4zIAk739e2PbkNczp/9M9sbHoJgkA5yKf2F
         M07dOA05q/y8AA3WDF9YOIdWiV9qkjsh60H5sqeW5xq99A1lGeFrPL4a33aT7xl51Xzi
         AOzwozIs4tib3Yb+BMCt3kszVLq3T0fTCAqrCgjvYGh1wIC43qRz/2ar3XxssZr3iNYU
         akV6PQiyE2aaS6Sdlfu2SFtN7c+/QCwEw7FWj+6+Yua5l4Rqmymaox7zNHq7fw2rqNSW
         8s2Z3QtorXnNGq4TaPnSnJGzSBzjqyzh6JDGs/exhznD5lgtHJpJDVQkibMJFJblTt09
         uJqw==
X-Gm-Message-State: AOJu0YwaW3G5hLUq7tLNwjywME82rvAKqAVYh6EmF6EGmENZfCcpAzmI
	NEb4TbiTjjOXEXu30Lb1qGHNKQclP85GLJGTgLnVpvTwpTR2H/7uDrnm5csI8aPRwE9agvfsHVs
	yxmfPpcO9NPdwhkShZKB+7Myb6siF4uXA0S7M4w==
X-Google-Smtp-Source: AGHT+IExSWl3nfOMn6PwYK5x7uaI/mPDHLM0NTtTo1iyqQrxqItBVUOGNQwHpO7aYClLqRNhrqfbxPrAsWWtcY/yPJM=
X-Received: by 2002:a25:ab2f:0:b0:ddd:7a62:59b0 with SMTP id
 u44-20020a25ab2f000000b00ddd7a6259b0mr6021036ybi.15.1712566926488; Mon, 08
 Apr 2024 02:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404193521.3581399-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240404193521.3581399-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Apr 2024 11:01:55 +0200
Message-ID: <CACRpkdZtm1HuopG+9fOrKioG5PqUgc5kW4mM9ovfw1efaA_0gg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Use DEFINE_SHOW_STORE_ATTRIBUTE() helper
 for debugfs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 9:35=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use DEFINE_SHOW_STORE_ATTRIBUTE() helper for read-write file to reduce so=
me
> duplicated code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

