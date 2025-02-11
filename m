Return-Path: <linux-gpio+bounces-15733-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2056A30B89
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C01B5188CD01
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98ED41FCF7C;
	Tue, 11 Feb 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PE/3qSKl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11561F1527
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276098; cv=none; b=coc/f/E9TS+QoXjhSfFrFlS8mizTkDWTTQARYVukx03mBKdU6VoA4bTTpQP2F03MZAizvnAGrqePe2V0AqL5pOfndEVoDfWqJZn3NbmhekRF6jPkqQvJh9brktcS+8YpofjGiOAcOHrWpMiYsmkkCYlzkcEFi5XZavyG5r46I2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276098; c=relaxed/simple;
	bh=KoBAQUYwR5uzA2s9bY8gQVzsd9y+37Yc6uv97ajAYjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7O/XR5l+Yd+1PyqmNO47kcXDh1XZgp1L9Tq7why1SpQfMInG3E2xeFjjLFnhKHVDT5zOeZyXSACyOmZ1FlH7BLDpNYSs+97a2rlNSK0+Bs76ZSMpjb9GkF/wlXoByuxtjiHjewsN7v82khGV7JC71c0MvVB4+GMvTLQjB9FQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PE/3qSKl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450f2959f7so1630843e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739276095; x=1739880895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoBAQUYwR5uzA2s9bY8gQVzsd9y+37Yc6uv97ajAYjs=;
        b=PE/3qSKl9k2O0tJtUtbIzgi/4wRDHrcb9LRWgvVle01be5fbB2hsORwLLjlX4C/pCJ
         3rfeTVpBE8KTBnE01dgddNa943ZBKf0H5GzcPkGHYrKv9Fiwuiv+HtKLLJo1vskTMC2E
         M2/vS5W6iqYnQaoar//640qAETtsCwxjsyttGpApGIpn00zM7sEJOvu5ajD8CFOJxt0m
         SuLcbjgQDBk2M5X/FO1TjyRIBMvC7hYzazG1en/4AlIlg44mNWOqCnkTi3ECj7Yjemc7
         w7yVSeXV+OYp+koyORuE+NvqTQolBIirztjjXrHi8l2xMvARROZ91frBxXgAeb8OIBxZ
         uCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739276095; x=1739880895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoBAQUYwR5uzA2s9bY8gQVzsd9y+37Yc6uv97ajAYjs=;
        b=Kt2Z4T8fA6Jf2ErIQEEv4MtDRozz2UDjZn+HgQa8/vSpTII9L3zdQ3m+zwVLI4i49E
         RCvtPRWS/uibAPqW8DqwW9rEJyEfDgFJ6vSvmOVlP8f+CoqsGK6GfR1gBZPwT9hHzm6Q
         DZ/lNHTmbKLywZZfzWH18fpJpTMIYkeBQ+ZgS8cw/Yn8HpiSRz4YYN/LKhoNjLqCeKrS
         HC7/rBwj+2dLpy+QU1sBk1jqLcIsLjUE51WhMmLEJJCqdG3gGPyO5evsd6DGlkOvcuw1
         64PQZi/pOAkEtLjr6IKWO4bBknKV9SfDOudr8UzBPhUWrA+Hs6FJMRFdbbZav7uzbhXG
         hq9w==
X-Gm-Message-State: AOJu0Yy4FV9/vIY6PMAf3rkzJ1RXgTjPqTYCS0vdSJUEBFHD7YulyRAr
	/9H/qhdVQ4oIvT1lCTfVDRNbMpHNo6ctW8UBXeGvdoDZU+mgg5uH54XSCUTAspK9EXbWrvf1f3K
	j4a/mZjqk0scEX1Flo83fXqYmSu4luNnUc9nR4g==
X-Gm-Gg: ASbGncsnWd4cSBKrEn0xY2b6ZNbkJYzzFyVBtmC5OVUs/f+J6aTqpplAYVYNt19uTLH
	ssFC3oz9UQ8j9p7pcTWtOGstVn0wmpDlYveVVJcBs2zLx7lwtdQ8Z9l+zyAMyiS8AaE2rmsUvJ2
	2Kc+kGmHCgMfa2tdpYVvKXLS0dJnc=
X-Google-Smtp-Source: AGHT+IGMlBwsHWpN5ZHugnho/cUO93OkiLNqrfglXFAMJihQ0C2r5RFH6Nq3LBPqEwxD9kQo4LQSqkBGwU6xjP23yJk=
X-Received: by 2002:ac2:5f03:0:b0:545:d72:95e5 with SMTP id
 2adb3069b0e04-5450d7296dcmr1805743e87.7.1739276094864; Tue, 11 Feb 2025
 04:14:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
In-Reply-To: <Z6nHVEB85AQE-rQE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:14:44 +0100
X-Gm-Features: AWEUYZmd14xxwv2f3Za0-tlPv2ZYAcDtQNVzG18jo30eeAGCCNTr8q_IBCJOg-k
Message-ID: <CAMRc=MdT9A1ctGy747dwJ0TEbr3bfApu0xM=6iSnAdSe5CrZvw@mail.gmail.com>
Subject: Re: small brainstorm for the problem I have
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Koichiro Den <koichiro.den@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 10:31=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
>
> I have a device that uses SPI bitbang (which is physically represented by=
 bunch
> of GPIOs). I want to have a driver of that device to use SPI GPIO driver,=
 but...
>
> 1) SPI GPIO has an established DT schema and hardcoded GPIO line names in=
 the
> driver.
>
> 2) The firmware for the device uses already some names for the GPIO lines=
 that
> not compatible with SPI GPIO schema.
>
> So, what would be the best approach here?
>
> I was thinking about the following:
> 1) Use GPIO aggregator to fake the chip that will provide necessary names=
.
>
> 2) Hack the GPIO library to add a quirk for this specific device to trans=
late
> the line names.
>
> 3) ...your variant...
>

I would go with #1 of course - as it has the least impact on the
kernel - but setting the names is not yet available upstream. I'm
Cc'ing Koichiro Den who's working on adding support for it.

Bart

