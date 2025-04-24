Return-Path: <linux-gpio+bounces-19233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED321A9A2B2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E7AD443F91
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 06:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F1E1E7C12;
	Thu, 24 Apr 2025 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpAcP0ul"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C218E1F
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477805; cv=none; b=Ed/b9WTAuRaJjDhbXX0mIlLAVbne3gFe8NculVNECjN5+VOBLnsoIhuGhbfKNGfHHXjDQ0oM6I9XLfXI9Xghcqaf9SHgns4WrlAKnas6QEBDQefNkhKYoDWBcHf+/8oUvjnqccvkpg4H4LXt1O4t46uxSfpk106NL65m2BDSEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477805; c=relaxed/simple;
	bh=KaDurauswI188KUjZ3KNQvsryIeiaUhlpIHOyWF2O0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRdt6GkyN61a9yi1+abyuYom/eBtPRBHW/IntvG9GD0d/U3tNhOB54JZNvjjMklkR3PXrCX1D953/2xLzdlfvCZE3ZiYqIl4cScai3Qfa7n5WpqEjpQyk+n3wJSoO9T8WSdv3nCaL7yvwSNxJb4sScaDvIjaOd9iUhCQYNNM8p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpAcP0ul; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so1242305a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 23:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745477802; x=1746082602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kzVv79whvRhzEeD6JG5Yuqa4/y4qdCf+2FXelQG1Yg=;
        b=QpAcP0ull37osyzz0lwmfHbM6xwEU6yYa1hORanq77BXJc36z1RgOTaQPsXD2k8122
         bO9/CqpUcrK07DTpAeexhlaDBbeOJyKUw+CkmrSztl0By8FCn28+32swlC6BAzjGd3uK
         Ju36Alpzn+KeDeAWQQSpT1vF9VInhuMsLBu6BhSXifDq9h+wT9J5Ve+UDwg+9WWiP4mQ
         3wucdPs4KneMVdSxlJ6/VilaaWKpUrutOSJdEjVu8dZA+zPVsSPTpCSx5/hN759fXjyx
         Aq6TqNJWgzbWmJK7s6fRO1BFovKuMhhfCobqB6YeJ1JWgGul3Mk2vZ+i91oQU8wPqLyi
         DJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745477802; x=1746082602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kzVv79whvRhzEeD6JG5Yuqa4/y4qdCf+2FXelQG1Yg=;
        b=YNl5WCHV8aNBOgTIdqkSNYb3Mbre3T1cMLoPjHvgeTQrnpCR31WQ0WJQJP3iQLY2S5
         Nv4PhKCQ3ilCbSkSfay5j87uEuoEVtWRH7h/4ZdtT2wISuanBe8McCluqq3P/QVuvI4V
         2/Zi8ck2rj2g85d+uYYb8RPWqMuXGb8JUckJRU6fjkHAOFwELwG1fcblT5tcl7vMgASK
         sIgkDgHSEcsagwEG1pZr0kewe3BqJsilswjhAax9Jy8U5C1dX9iaGBeiRSC3ilhOgJsv
         0VIDhlK6DjgyrAaWbY9QAAtHuUw4dFYzfRJ8aTxWUkgCiMj3alpTViGO/eGzkILIOESC
         ajLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnc4MERWq4X6tvgNyniICccRUuV2GqvC5/tOlHOwhKUU84RGwq6mn7Q2qKfa49NwM00ID/bJh/ZJoU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8JoVo7DI+KT13k++LRZ7uc2bvLsyypxwIjJ9K+1sOhnKqfxH
	15uPWuCrr33aEpDEZ2vUIkgxnjAYlW0COQ3nZW2D6bUk1zmxSdhBM2QG5NCP1sQ=
X-Gm-Gg: ASbGncs/o/2Mgg6WRMWYeDrYtgf947ChSHz5Se0apCPj8R6u5DA4I3WBnUHmN4IpE3Z
	HGxuz3htnI/KZxDUj2lh/g4N8Bc1Gu4ONl6nP30AIg7muDUj4fF3T3/pxh7hqvVi7UQkF4L2WpK
	d4hGdk2e69I5Y2o0fTKDzoH3AQ875ZRZ+OCC8zJJ/KULAUvmdNslL8ELu5IodxmH7lzVfFsv2Pj
	atJODib4rujItNQVXu8LF/sQdDOG5INvOT3EuDMIvU8G2WjVYflv2KVixlEeQt8x4bJ51ilmlkt
	MylR+m4NThImv27Go3I++UnX6uwsiUJBycI/vw==
X-Google-Smtp-Source: AGHT+IHGr9cBdHuxjSZWLqVT9rmChGPepYhM4CQE7w0ih4cdp+SrjuSnVfBVqnG9DIEOEXWf/Vdtbw==
X-Received: by 2002:a05:6402:254b:b0:5f4:c499:54e8 with SMTP id 4fb4d7f45d1cf-5f6de697effmr1551743a12.15.1745477802488;
        Wed, 23 Apr 2025 23:56:42 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6ed9e0936sm674611a12.71.2025.04.23.23.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:56:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 09:56:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Message-ID: <aAngqFUPUxJfHhXJ@linaro.org>
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>

On 25-04-24 10:17:10, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
> 
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
> 
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Nitpick: in commit subject, fix spelling of definition.

With that fixed, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

