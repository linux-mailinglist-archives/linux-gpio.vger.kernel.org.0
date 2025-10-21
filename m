Return-Path: <linux-gpio+bounces-27370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7570BF6724
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A1B23B279C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5869032B999;
	Tue, 21 Oct 2025 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RL+4kPXj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8832E6A9
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049386; cv=none; b=Atgy8CIJSuBZjg/C6jpLi2KJn5iG0hXYtBtTqu972vs7BDuERgnxhGCBV4qlJGkw2J5JvB2mRWA1eiZedtcaWChYeEeubJe/HrvFlxviBjuNkBlpHLtOVPF6eZ8rgZjSt8MEqXWtVKPvUYfwxtCkXUm1xg/tMvB9TN60Z3USgTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049386; c=relaxed/simple;
	bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCV2FkIjUi9qbMABhwNpev+sxvTEe3hXFIZFAwGi7XnmfnXtMIF2DUB6XqZv9snH7Hvvgalb5iy5cYFxLtCjXPWb03DClLq2ONAwx+LwDCEQhqe9roI3i5/kJanukEPBH09zkmQwv4gvnuGgramb6s3F2l4U+TopQmMHaSWaGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RL+4kPXj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57b35e176dbso6817461e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761049379; x=1761654179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
        b=RL+4kPXjFsX0wXlPPiJ5544+gQZ4r6l666llWohriyz3njEhG3+oC5Qtxesk6esIe+
         P5XMRnaAbbKBi6THsgxTO8jRGzCy+Zme7OrYvEmw0i7n6NgGBfYbkLr2Z64Q2o5s4YJn
         xOrrIeSlLDuGUQZ2Fxb//x0joj6sP/BxA1YaMNayXomt2cuw3FghGC+v1Pz3nyQbHcq9
         6w/j/hayOEZYQUP+DARX+J/TWA4CXbDFy5mFspNwqkZKhvSBkNo5SUx+e89J62CiWdGJ
         BcGdXW7qHf5aGjMloBUKX6wVuo3w+hg18Qo7+2KEzuFQ6MAgzrMm1X72FHz49SJw8C30
         JKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049379; x=1761654179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
        b=R+2zqfdDGijLhk5ycug6d+M8WUzREF3nJbhhAZf9syRyBlzum85Ne935w38Oxv/t6r
         KVmnvOF/VC7RYDy0o+t/Wiqcg2O/YQjRwAImHaPBLqq1Zk5hwAc32uLzQWJyflhJhwh1
         DtfodQbz6uEbY9JrjZLpy5u5wrNCeG17SnCdUXMh0T0TsF/S8QDeZvYMxoMgY1+Y6+ds
         UO2bE9GUCQBDfPdP2VftkhtOL97XwjlTJainLKUmfMpXMNWCYX+ybPjDAIPuxPNlXeNn
         UuRxKUS4190yHThhbrKUsnzEb8j3d7w2S8VepFohaPvnNvLbFljh2hP4D5PayRBOxA6l
         fUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzVuVw1h11PmlOCH7HIY1GZ9Y4G36GystV9I02uxqtJPXdlOH4AXV1DGcqLAcDCSgUbc42Z0ebGzxt@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxZ4Mak+QZtSk09GFZsql8QD3142GYp3aqF5Ty63ad2U9WY59
	wsOpdLRGVjcNf+s+HGbIvmz8J1HaQa/k51SNLTpsLJYpm06Mt6OB6E2BNLYGSaKpVxrvNfnkRLK
	NrVu/blJ8iCKhI8HsldHx8KNGiVWppsO3YZp9KT7vwg==
X-Gm-Gg: ASbGnctkigqu8qNIdDocdQ5kzGqpypYOBVNnQawH+/YnruikLbqmjCRPtavWlh3hnG2
	uC475JxmoukEH5KbHHTWqTk3QhirG/tRCJYMR+AJmlv9pLDQj/TVvcV+0+EA8tlhIhxIrdklJA/
	kWf7nCi3T/GCxDcaT8TFoKqwxXgHlcQn4mTX4/gZtYaKZoTk4udFPS6wzCco6VhFxz4qR9PZgM3
	EWsvurhnbCsDond45Q7NApml8SQTFaZediBQdo3H/fTCQD49q+KSW8yQXM0/TfyemTLTd3ynCFI
	17frTlE6C4c0ZTBcSjW0t8lW1ws=
X-Google-Smtp-Source: AGHT+IFwqbCzl1LvRrGVBsJkNxyTepKCymSn3z4xLOoxxtlzHnxQDfI8sBh0KLELngrOm4B0AY63u0QkMaZ4C4nL/Tc=
X-Received: by 2002:a05:6512:6d0:b0:585:1ca7:1b7b with SMTP id
 2adb3069b0e04-591d853530amr5944540e87.31.1761049378748; Tue, 21 Oct 2025
 05:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com> <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
In-Reply-To: <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:22:46 +0200
X-Gm-Features: AS18NWBF0GY_y5H5_yrBjx5aMTjq-BCBKISyHH-S44AO8cdbNH0Bf9m_yOfn5F8
Message-ID: <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 2:20=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> >
> > And with the implementation this series proposes it would mean that
> > the perst signal will go high after the first endpoint pwrctl driver
> > sets it to high and only go down once the last driver sets it to low.
> > The only thing I'm not sure about is the synchronization between the
> > endpoints - how do we wait for all of them to be powered-up before
> > calling the last gpiod_set_value()?
> >
>
> That will be handled by the pwrctrl core. Not today, but in the coming da=
ys.
>

But is this the right approach or are you doing it this way *because*
there's no support for enable-counted GPIOs as of yet?

Bart

