Return-Path: <linux-gpio+bounces-25657-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4506EB45154
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DED1C22D4F
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882B23002C4;
	Fri,  5 Sep 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvGA6D0u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897392FD1A4
	for <linux-gpio@vger.kernel.org>; Fri,  5 Sep 2025 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060847; cv=none; b=QB+TBIHRdBQr4nQ7YunFmtXixZr9vIk/GS24wKQA7M6BBaVU1k9DIrp9Oammaa+GMLYR5tK0xXaQ5p7pGt9TRzp2xQBXZPcLAbUC8MVtUR7JxIskEmRgRDssM6k+TeAbqporMka/etvpPEOB4kBuTzqsB3sZ7UxWze/MjV0/Gak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060847; c=relaxed/simple;
	bh=d50XR8Ek68VTj9Ma+5BQ3aLpOanjEBi3fnEwSp3JWkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sng2yTe1EKkKV/eojrM2C9qJ+zT5iR/OaZDpwrq8jS80A/f+7I1hmBYdUEp5HFrOE1zNgNcGnkjFh2EEQY4x+z1+LpVF5/a/Ntaqophs2YrEgHnTiWxC1ojAgc4kUK7M9AeAxdT/7REh4anfX580mDtJvzLKiIeytAyZ+LM+wqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvGA6D0u; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3381df3b950so7250721fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Sep 2025 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757060844; x=1757665644; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=;
        b=SvGA6D0uVQm5pmqxH8ROsR+E56/nhRsvEE464sXzpMbmHp8sr8pRUS9W1i58RljsZT
         gI4mh+JRiA9hYhBcCW1hVICfWpkeVHDrOlZYH1glJYvVpoVorEyHjOCoIV38OYcM8ALZ
         Gkl8Pd1hzTc8KKRzMw82wSq1k+dkutsdp6n3CYyAQFohFIxrR1Wd/yl5JLh85ryYnRsd
         /kPlH/aTjG0AzaZg+gD1BUNTfLhD56upb2wbx8p/TJr87DKHq/IcqHtd7ERG9hD8lEDc
         QxeKsAdYz3xaYuOOhrdtBrnBbIjLEH02rqvbblPj5Gla7Nhw0db6t3yP3Z2+v5YwM8TQ
         bbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757060844; x=1757665644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HT51jpt+Z9rLQOZ4eY3k4SmSZF2os0NLvUCHbQ66xmE=;
        b=gwzdI6Adu3Uvr5iQK2CgEZAVuTnSdn6nXcAMCzNqQBaR4pUhqu+A5ZUZrHf7/8hs9M
         iJl8/yfj5JXsak/noQdL8IXVQnUtNovZV1UA2HhRE4UbuHqZMkNCWb5V83w8xQpP7eT9
         rGAO5Bm4yFVVzFfBieS+RzK97lzcCceX+XglPt1ZVovZidSm3v+9oiOBwdsgryYcVPAo
         x87j0ODJkpmAmG9GsEDL2decik8BYZj3lEkaqRCBmuczr+ZDGULpR+QIEdLv+O0jM+RG
         EgzACQVhqaOjQpGMBWIs/YN+Ru8hcctpBvA8kOhf7QnKcFG3HtPPhRMUBd5MHEONvXHX
         43OA==
X-Forwarded-Encrypted: i=1; AJvYcCXWzEb9/u8SBz9lVw866CiH4/QHanoDzZUEbKAGrQCoraC+xkJeqgd23wVsx/BMkFABYgA1H6i/Esb7@vger.kernel.org
X-Gm-Message-State: AOJu0YzBsqho0m9090OwC24PkXfs/hnlDCzBE+WXVwAVIjaFLxiDLXnf
	gTZTE4QtXITCmtg6t2zNzczIymHox/1AybwWB+vZPrAE2pj26cAMCrVEKNzZ4B3zhC2FWWTPcR3
	g5wSXFRKe7a5igsOa42DUijTXEVuDIr5ABmn9jgD9OQ==
X-Gm-Gg: ASbGnct3lLlXI10xgmfQhOy8px3gjSu5IE+Z9C7WEw68fZ73ur+2XkjZtFgfdySFJ5X
	apbJkJqFrvskBKPL2DYlyPVuQ5eQOc3Rh5/feIYvWNs0R4XCIhws4jVuPxUaRTkvaBN0GX2PluX
	apZZu3X0Kvgc0uKMbMTnnSnZmiKj8fSGPqX9mrqNf86Qj1jRU4SLg5Mahy309YhLUt8w7mYIjZM
	8GMZ48=
X-Google-Smtp-Source: AGHT+IHgClXJUzKdm6E0qr03i75G/PjSbG8pXmI/SkiwOzOUXWPeDlRcSIjt3v/vZ2+YkFRuc2QKV+aPlIPjoSHluJM=
X-Received: by 2002:a05:651c:198a:b0:339:1b5e:17b1 with SMTP id
 38308e7fff4ca-3391b5e19femr3818851fa.38.1757060843564; Fri, 05 Sep 2025
 01:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753039612.git.dan.carpenter@linaro.org> <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
In-Reply-To: <6f732f53-7e00-4f0d-82a3-480bc81497bd@sabinyo.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 10:27:12 +0200
X-Gm-Features: Ac12FXyee60oY8WOLdfjOHFd8MRN0v_dxWT060-4JQvkwWFEV5hFh8euv1Jxz9o
Message-ID: <CACRpkdZ9EHoHiKit+T-ur0xDKMEoN_=TydzTfoggNBQGdra2bQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/7] pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 9:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> In SCMI the value of the pin is just another configuration option.  Add
> this as an option in the pin_config_param enum and creating a mapping to
> SCMI_PIN_INPUT_VALUE in pinctrl_scmi_map_pinconf_type()
>
> Since this is an RFC patch, I'm going to comment that I think the SCMI
> pinctrl driver misuses the PIN_CONFIG_OUTPUT enum.  It should be for
> enabling and disabling output on pins which can serve as both input and
> output.  Enabling it is supposed to write a 1 and disabling it is
> supposed to write a 0 but we use that side effect to write 1s and 0s.  I
> did't change this because it would break userspace but I'd like to add a
> PIN_CONFIG_OUTPUT_VALUE enum as well and use that in the GPIO driver.
> But in this patchset I just use PIN_CONFIG_OUTPUT.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I tweaked this patch around a bit and applied: removed the second comment
in the commit message and wrote the docs to be more generic since
in the future other things than SCMI might want to use this
config option.

Yours,
Linus Walleij

