Return-Path: <linux-gpio+bounces-17855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E27A6BAFC
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 13:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36343B5ACE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749E0227EB4;
	Fri, 21 Mar 2025 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fMnk5s2c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EFB225797
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560984; cv=none; b=SXZfiPeH+Sif+kL8n06al4OoKRNvewk94+9TRanwxFk4T84YQKV2CtzKNeOjHsqw+ijwiJx1UJ7p9PIDifw56vNev3pFiHVk6IlmHqLirZTFxXW1lRZPZuiwbAkh0yyPcvicaHiOo9mNHCN/9/ul0j/qmviLr8fe+A1Jb6I8J3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560984; c=relaxed/simple;
	bh=eBQn892UZG+jcWZElqAh1wPIVMeJ5i+Xu+1Q2pde8hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxFb8y4BxtuyhGqgZtEAUcSA+Zb22mShRgiqCdbi9ePMpvWPdti5h5yauZQXzPb68f8mdv4sTogfmJDyqwht3tBTwlalzvxMMlc7J7lv6GKxq29XVlZrnUFY8sVf4tbTn2xF4xNtrbihxcafJxydIMuAD4/0B2S/DCo14u6EKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fMnk5s2c; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30beedb99c9so19208271fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742560980; x=1743165780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twviCGxAniHlC3WUcKtYW6Ox7Z/6C3imNQV4imugJhg=;
        b=fMnk5s2cYeSWsJq9AI7BdBlKtXh72hzsnhoBT6TaXHxtLYh4ulpF4vr5Mob06uWFPJ
         sbB1/Fch+EoJOkWdjntHrbibbKieBf7h3VU0mQMgNX76PrRsGRa93J0O6GGz2Tcd21tQ
         4pzkbeu+SEUDLobsYhGxXMD9PYtKsQaE9TSpmhpYUtmUDroHdsVj7zyDjbKkWq1CSDPj
         ISPnxfwb5nlpVAGHV1NttL6AGa9qMx745GrfSjXo0N7yi+HJG4sd5gEwICbIQlBi5CIX
         d7ChuUAXDrQrQXVF1GfoFWZxWIqFCyFY9Es9G765DCqQxW7BD4EFOCUPEgaGBxD1H7/B
         67xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560980; x=1743165780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twviCGxAniHlC3WUcKtYW6Ox7Z/6C3imNQV4imugJhg=;
        b=UuSi7zx3vwe/gG3QzbOcqwGU4ATDSnI3HTk+IcP6u6TjQPX84dBXXVxlLfHqIn8NSU
         Mq6NW2xEo/k2wH18H0YnZkira/+dPvvoJnwQg6rd6cq07lb39+PvGw8LOQrO12y+HBts
         9atkeUMjSc19tI16iKgUICli3/VLMFqOk0Xvkn/uduDx5Bu52Vw+IbUCANUWjTorMN9b
         JRqLQNFZtaUryvm81yqA3qEY7JEWcWE33H0AWKEqF2B3U7YWK4oygw1IoH3vrYxLq3pO
         4jywUapRxOQOVJaUQ0rZtROZPHfOScUti53/W1RD13DlAxQr8ew3l59vmRSoIDHcVc3X
         WtIw==
X-Gm-Message-State: AOJu0Yx3a3pLFL11O2RDKqt52yV3OMQ/x/73U6t9bqD6vPDuehxQwp+E
	Zxhwq783ZqSdekSazxHIir5b8ymfXHM3cRsY4FGtyNRaH5JmThhGMTBYh6q8V9IVbH3VTUshatl
	6xN0I3b94etbp28y8g8x19ED6RBTP7+hHCGprvA==
X-Gm-Gg: ASbGncsQFoyuyomDf3O/niTcK6KO33rjh3HzNWGsZttQi6iYT9oEoSfsUQOQ+bBZ+2s
	o2AUouTotEqA/i2eT9Ga20w/Wlc32csOGP21tp5/kmK+SH9j8kNkv8qrFNXO3LG8pqNe64gFOgM
	dM8EhR8ZgcT8jm02SCcGR1p/d9QzCPqCQNKZcxC0HNfK/dZye9gb/TL2oW7w==
X-Google-Smtp-Source: AGHT+IF6bDeViMRm+F3GDiSCI8KFfXh2g6OPn8L/1naZxiDI5aTUCMM4Tf4b22Rl4qKBrOf4W2YTckl4OUZpJhc4CRs=
X-Received: by 2002:a2e:a78a:0:b0:30c:4610:9e9e with SMTP id
 38308e7fff4ca-30d7e2d9f69mr12592721fa.35.1742560980286; Fri, 21 Mar 2025
 05:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315164123.1855142-1-koichiro.den@canonical.com>
 <20250315164123.1855142-5-koichiro.den@canonical.com> <CAMRc=MdOSsakJm4H5=cqVzdKDrrMFO2t-wKVWRCU83saozepxQ@mail.gmail.com>
 <6mcl34zdx37gjh3a3y4lc5kgb2vv5notvs355oewiwogpgg5g7@jcuukymbifnm>
 <CAMRc=McpqUsEsMSfwo+WrzWdaW6YnMbptpj3fAoS-JfVhSm9mQ@mail.gmail.com> <oneoncbyv3iwb54kvjvmerv4xxhixgeqp44ubeikvy4yst3az3@g5c7uxgkonbx>
In-Reply-To: <oneoncbyv3iwb54kvjvmerv4xxhixgeqp44ubeikvy4yst3az3@g5c7uxgkonbx>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 13:42:49 +0100
X-Gm-Features: AQ5f1Joi-n_6xI1YtplWveFaMKn6awkhJ4yLQwNvEy4Q5RoMmSRTfRJNj-KZBzk
Message-ID: <CAMRc=Mfg1aNUQ+HeJurEH15+6e8dhmDS480SLOcmwOGP1u+iyg@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] gpio: aggregator: introduce basic configfs interface
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 1:33=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
>
> Actually I wasn't aware of [1]. So let me summarize: does this match what
> you have in mind?
>
>   Before this patch series:
>   * forwarder:        gpiochip_fwd_* + gpio_fwd_*
>   * sysfs interface:  new_device/delete_device + aggr_*
>   * platform device:  gpio_aggregator_*
>   * module init/exit: gpio_aggregator_*
>
>   After this patch series:
>   * common utils:     gpio_aggregator_*
>   * forwarder:        gpio_forwarder_*

Best don't change it in this series unless you touch the code. If you
do, then yes, gpio_forwarder_ works.

>   * configfs:         gpio_aggregator_*
>   * sysfs interface:  new_device/delete_device     <-- _Unchanged_

Do change this one to also use the gpio_aggregator_ prefix.

>   * platform device:  gpio_aggregator_*            <-- _Unchanged_
>   * module init/exit: gpio_aggregator_*            <-- _Unchanged_
>
> Thanks,
>
> Koichiro
>
> >
> > Bartosz
> >
> > [1] https://lore.kernel.org/all/20250317-aaeon-up-board-pinctrl-support=
-v2-0-36126e30aa62@bootlin.com/

Bartosz

