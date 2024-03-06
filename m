Return-Path: <linux-gpio+bounces-4167-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2428736E9
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 13:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC171F231A7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Mar 2024 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87D512D208;
	Wed,  6 Mar 2024 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTA/taUD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0A84FAC
	for <linux-gpio@vger.kernel.org>; Wed,  6 Mar 2024 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709729484; cv=none; b=cKUCjhLQyof2mNqttdtEc78SlwaXo8/4iO29xEDgl4dsg3Q2ve8YlGFbxz3IsHml/fCVEMSIJsZUCbTqelEVlbyN+nUXywCi7m6yA87yKeG4e1cVBlTRfLXudQkXjJEsyxCyiJdmKHjC4NrD+bTaUuypFNEtTdevLFL83eiQ96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709729484; c=relaxed/simple;
	bh=o2BZavsoHilApJIye2i6sE0vbVlVAbix7AsibeZI/T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOC1RgTB+RIoSSJ45qiyw3T9xBaTKvLvjf97Z4ng+miikazqcyLDTvVDoJJGuwJi0zbYm0ZYv6gaDCNbLEwOWnX3eZkQKq/3Rl+z05TAKj4aI90APkd7Wx7rLdQ4rjplDL9B/G+Uz45DH8HFQSddEvE+Gy9YSRVX33D/5kUPdkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTA/taUD; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607c5679842so69146917b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Mar 2024 04:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709729482; x=1710334282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhi2mQr6cY8VLdI/IRl3bAL9UXcUBxcmlwCsmS2g2tc=;
        b=UTA/taUDcbVsNwWgW3ro/85lTamavjEOlsE8aXZe7flSy1gX05Cm+rt1hYzNX1dDdx
         zYpOu3O5ly2syw446Gzv33Gq8RGKLBByHvHvQiTfxhVgQy0fqSNJlZOq4ROkBI/NQHyK
         WUKs6fwLZ8qwpOJPimXiSBuwsktsVL4+U9ybt8YHzgFfDwlRe2nOiIQStfZXVn5Db598
         d8/JQvu+tgOMN42bN3JvHqQKlti9OvPt+NyPgImc+ZC8M70x6awAAgwaE8sLcu8DSOYn
         +endF/zuylDPGP6NxjzktcpX9/CLi/F8CXZ7Kq8Qq9VmWsSBlj6pjml3y4dJtzlhMr0e
         EVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709729482; x=1710334282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhi2mQr6cY8VLdI/IRl3bAL9UXcUBxcmlwCsmS2g2tc=;
        b=kMaR47i6al0cjqaT9icl5KhdiA+Ov62PIbb13wFdLE2M0hFAvwbeT10iAqRcg1CegU
         Vy66v79JA/odcH5rzLRoRcMf5r96FUNTH8vASX1EERipQu3zdv83Y4/x5M+3Ad7Tfcc8
         JcJfulHfkozkNZe9Hc7gV2qn+04A5eDE7erp0V6lFO/4sIgS/KG42sWTRDyvsLhlTtIf
         y/CRVKkFN/ZniHXmVPs3kzN0rZLY31BNXbhVZmJvLv1wzYjL1hr4GKy9FQ09RuMq9glk
         ms+uWZ3p7KUvCyzzK4VaDjKmMLwUk2yJaEV+g7FaNg1hn0vzuLdQCz0kTp/XV/JcEvA/
         m9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeBVIkOesr/gz8qw1eEor+hDTYdMNmxJvabmNvAof2OFTAb4VwrmE4s+A6WzZ7MlssXR++75oP8U/spBJUwHXfwCeQfqQ96W82sA==
X-Gm-Message-State: AOJu0YxlYf9PhOjjXb50oLbl5eIJYFueKZl8VXYdeqFigJQjY2mxnmcp
	Cqq3z8/tr+M28XYey6fHn4JvUtOa8/ZJ/ZbPkQFK08AohJo9+IODZi8gPI0GqSKjOx6Hwf+C8ky
	OeFA6IPKNfk4x1fwkrVEQYgDScoaW/OSAzCQZAA==
X-Google-Smtp-Source: AGHT+IGBU3NJreERbqwtkrS6U6bYeNoprvCDJRKpJlExHsRqNwHoWab/JkZuiCHz9EyhMS0M1P8EYawP1F5oHZY2B2Y=
X-Received: by 2002:a5b:d41:0:b0:dc7:4bab:c390 with SMTP id
 f1-20020a5b0d41000000b00dc74babc390mr11816495ybr.61.1709729480620; Wed, 06
 Mar 2024 04:51:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-fix-nomadik-gpio-v2-1-e5d1fbdc3f5c@linaro.org> <CAHp75Vc2+wx=82kx1qMsXH3uWX4tMdDEMXLm=MqB869-=bcGeg@mail.gmail.com>
In-Reply-To: <CAHp75Vc2+wx=82kx1qMsXH3uWX4tMdDEMXLm=MqB869-=bcGeg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Mar 2024 13:51:09 +0100
Message-ID: <CACRpkdZCXE6VBa3f7asSNYF7Esn5nHnxf0QJfibT7TcfSE52FQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: nomadik: Back out some managed resources
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 12:20=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Mar 6, 2024 at 12:09=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > Several commits introduce managed resources (devm_*) into the
> > nmk_gpio_populate_chip() function.
> >
> > This isn't always working because when called from the Nomadik pin
> > control driver we just want to populate some states for the device as
> > the same states are used by the pin control driver.
> >
> > Some managed resources such as devm_kzalloc() etc will work, as the
> > passed in platform device will be used for lifecycle management,
> > but in some cases where we used the looked-up platform device
> > for the GPIO block, this will cause problems for the combined
> > pin control and GPIO driver, because it adds managed resources
> > to the GPIO device before it is probed, which is something that
> > the device core will not accept, and all of the GPIO blocks will
> > refuse to probe:
> >
> > platform 8012e000.gpio: Resources present before probing
> > platform 8012e080.gpio: Resources present before probing
> > (...)
> >
> > Fix this by not tying any managed resources to the looked-up
> > gpio_pdev/gpio_dev device, let's just live with the fact that
> > these need imperative resource management for now.
> >
> > Drop in some notes and use a local *dev variable to clarify the
> > code.
>
> LGTM, some minor remarks below.
>
> ...
>
> > Cc: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Note, you can put Cc:s after --- line and it won't go to the commit
> message while Cc to the respective people.

Yeah old habit, actually b4 handles it fine by recording the
recipients only in the cover letter.

> > +               dev_dbg(dev, "populate: using default ngpio (%d)\n", ng=
pio);
>
> While at it %d --> %u.
(...)
> > +               dev_err(dev, "failed getting reset control: %ld\n",
> >                         PTR_ERR(reset));
>
> Also possible %pe.

Fixed them both when applying! Thanks!

Yours,
Linus Walleij

