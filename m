Return-Path: <linux-gpio+bounces-3483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9FF85B57E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 09:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433B91C22222
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 08:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5B25CDEE;
	Tue, 20 Feb 2024 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eziz/zho"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3355D460
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708418338; cv=none; b=WKsOtDPIKOs25ZskTB4fwHGkobz5FHFxW56CH3Pqkg97ksj0qzmMhtYvi13h9BNn+y9fuchwjGSWvtgnFQXmgRFDx1R4EgHF5v6IUbwZcAYby0QD016EIZkhfsGflZkZ6WLhW7PNJtKaLBOCcnCP0fwq/WMpece+BWUNF4O40iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708418338; c=relaxed/simple;
	bh=xaQQvYpzmBVHnCracW1/zWSt6cgfuwxk6XJIuCevoKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8eYcmVvi/HIQ7hexE5StHtgnJO5dyWal3dimwXI6BRgqVF4bUDf6RXRAi8YoraAc/dLaiAT2dCdzFXRtBHGCdh3OtAMlMeXPSAkxo7gn8wWIpz7r+89xvp6ulUihfPHkkm0NswvGm1cV6A4JHGLHe65xswAXA0oG4x6Rwpz+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eziz/zho; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso4843410276.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 00:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708418335; x=1709023135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaQQvYpzmBVHnCracW1/zWSt6cgfuwxk6XJIuCevoKo=;
        b=eziz/zhouO07dAp2r1xXi+RG/aEiEh8pdV+07MwbXl4BWTattvvPJe3YohtHQOPnl8
         823bE3VxU3wFxlKF/RWMqO3uVxT6elzrXUd3ZGX64Od7GdzPv+mh3H8EzHoJGvGAxwBA
         X4z47iX5AOYnh0HtJ/b9Am1qQlI/RTarO3hVxdCySD6/RJZR+7+J+RodCC35wNkpm+zD
         XbfdQpljkO6+zTtB+QdiMo2MdqydrDapLBNmMYDUk97BfI0RJjwZHem0QHSVBOWXXvZR
         CUD2olAhdfh9r/8wtfaH3XJsZt3vIT/4xl3TJLJNUxd9dy/cIhf++kKfiBpYIAJzbWxv
         Cwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418335; x=1709023135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaQQvYpzmBVHnCracW1/zWSt6cgfuwxk6XJIuCevoKo=;
        b=JDEwGYosAoEIzEJQ+gwwGdNt/bbrcU/emZodDzVSpTKw4jvxIxx4mHEVdQVlutAn4+
         l7tiaIUiTmY9bDyk0OMiy8UTZwLexCtgLdLYnP+rWQYacbZM6dm2Sc1IR1wNRbL1hRkD
         GocFYR10aJMj8eJG8Yt/UpSkxZkuxYZZSBuhhG5sh9Y4Tb+hMNEU7yEsG2yFjMY0QHxj
         GI4qH4TcAvxR+DwtqDlzRPzWNeVRHHfIMWReqv0j1rHlWj4r2IfesPc/m0GMmnfhMUvq
         ar/B2REt4XlEzIJxb8gprt+laCr1KBo7nVM5uGQVnFfT9Lt/kGJz42BbiLM4YlJR3QpE
         VWgg==
X-Forwarded-Encrypted: i=1; AJvYcCUcmN1bl/dufVsAmQqGuw0Mjy/5ZDIbk1ixCSpaxoJNls0rFulDVTw9UEZ+lJFslrlEFjM8Nk08Tz5rrFWTRT9Ea3DCuI0kDEwLnw==
X-Gm-Message-State: AOJu0Yw5uSVTKQQyL4vZZh31nMtTiVOPfzoTjAuGv2mHHiFDJ316Hq/v
	kGV3ahKmMFTQYJcvr9P56iJ6oJL6YdjUpDdWmel1WO9skrGekEP6iTb6K6+baWNY5tWV163YFo7
	9spyte80ocO5SOrkAkggYh3SKe4eH/bipYg/9QA==
X-Google-Smtp-Source: AGHT+IENmsrAW3hNZ65FtN4Wch6Ui7UqnKl8CYVsXo+LBVt7opEcneA5tQP/7szbzlwQuVHBwtF33xDyl73OiskgVQo=
X-Received: by 2002:a25:83c4:0:b0:dcd:59e4:620c with SMTP id
 v4-20020a2583c4000000b00dcd59e4620cmr12705446ybm.49.1708418335046; Tue, 20
 Feb 2024 00:38:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240220045230.2852640-1-swboyd@chromium.org>
In-Reply-To: <20240220045230.2852640-1-swboyd@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Feb 2024 09:38:43 +0100
Message-ID: <CACRpkdY0DE-XxPO3vj34zmMvGj-sfGrjkkwGLuCKFdj=ksMJAA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Add ChromeOS EC GPIO driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:52=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:

> The ChromeOS embedded controller (EC) supports setting the state of
> GPIOs when the system is unlocked, and getting the state of GPIOs in all
> cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> expander. Add a driver to get and set the GPIOs on the EC through the
> host command interface.
>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: <linux-gpio@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

