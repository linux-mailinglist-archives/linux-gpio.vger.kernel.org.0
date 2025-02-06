Return-Path: <linux-gpio+bounces-15483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36958A2B18A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C856D169AD3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4F319DF53;
	Thu,  6 Feb 2025 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CH4Zibz3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE204239587
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867575; cv=none; b=Ckncx4Q2i0CYqNZX9HRF+8bbQM1xxGD/ZkoTSh8RFh28inbIgldKygquTtgQtexE67FKfhAKsgckOY6DLCcJYQYx4BIMVj249+ZD8MJ79j1WSqT7e8NXhQVwl6NHnOAD7BFxHE0O1XYwqsyEAZ76yv9k6TzL2U0uF4fWvEdIeJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867575; c=relaxed/simple;
	bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVW2smjODfJ/QJ7oYRwkiJnVq1ZycVVGzSp1MXwc6KjATqpPcopoZRQz3KLbpNkmWX24zAyTYkYniS+apORNfI8X1gGsE7yjkGeaQpIyDF7oMrjXYk/xTfYwos+B3ioCohbW3wIUsV9YHDvUHzUBCtkbhax0ZfqX4aX4XBdEg5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CH4Zibz3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-543e49a10f5so1409143e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738867572; x=1739472372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=CH4Zibz3rE/F8+bMJiLzPz9S648Z2CCcv89XgbX1wwyiN6yPAERszqO6a5iBq7Z/D2
         cBdLYbFcA3laP1BPi8GqdgP4tKrvkBp0UlNaVBYUQKxKm+3FQ7kzyQ4I08q1+9wCffGq
         yX+CW3LVwHS/ifU6xvcAAHXEhpf9I3AFY4R7uLqnrHCHS++ZPjE5PXQWVztZjDGbJ6vV
         obSK705XFKPpSXCcq5DhCmaQ/Mchv21LOwNQDFmwO37qKgUGhjcFWyPcBSMcfARY1omi
         MzCVbXw/IUlFoMt+DvqHRiNTGPedgW9SrMeR4H7sR+8P/6+vezHA80xcbaORMqKpd9c2
         YC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867572; x=1739472372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0zr8OoINeTGs7g0sjgckyXehEfeKe5nFPFZvgr4A7s=;
        b=Thlv1zOJP6RlBfPdtc6uxRPS5iOuJgD16vHetOC85sxaJZ6U5PMpqOFKXNDwNjRkYY
         x+ZR4N4t8evyMqHI9lJryrtMfM926bQ2m/S6hsNt1QeJx0pSow+Pv9SdrmYVrH+qMR60
         JXOp7Vt5P96VfBxDO6pzo6zCs7Ldt/P3cV8fBmqXHlwWiKl8mr0oyhnaZ3R77khmCxLx
         6iyp2UbTkCcA1ZCG6TSfGbB4Zn+dX/yVyu+/7PeJUe8wEg2TqgcXyhp+AbpSucJfeLSz
         LxZCthd0YN0z45PT9OL0f1+nS9hijjGouyZ4rb+iVBnHOrI6o+8CgnveUTz91LmuFqrV
         DgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlA5wWLH4Id/0DGbtj9N2B+CFY99TcxlsT71uvmby9EyDvG6scEu4a9iRCg7FBpx7Yq6ZWCvn6FXKq@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNIRUtULuZ1voAMNK2jlDQyPHhWzs9gUnqCBxeXZf98B4hmQH
	NYAxCZGnsaoGXPcznnTrpa8BcAN1TSbYdhyda/QoGGNIwxSGfjNngbMuSh+9dJYwRiY8V+D42LR
	Wz8ez29vMRNoI/6uoi1xeDkLVmJo4ua4LZLTppg==
X-Gm-Gg: ASbGnctSHoubCR4h1nXzlzm/m/adk57XtRe8GxKjrvw9366qBrjRreQJmnQpTbC3Tth
	F1DPYXOOoNJs6NkNY75lEiuu4O9nZc9H2l50Gi08kQIwmSCEOGuL2oSWKwJPZYBb6wgUX/5I=
X-Google-Smtp-Source: AGHT+IHBXbEvo18HjmPufvQO4GaXJoRqBewEyheRHSK0Q9zbSI8UBYUsHoznNfcnvv1UkIJfoaGthv9VJSF8FinRDdA=
X-Received: by 2002:a05:651c:150c:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-307e57bfe60mr399971fa.2.1738867572121; Thu, 06 Feb 2025
 10:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080902.1864382-1-raag.jadav@intel.com> <20250203080902.1864382-7-raag.jadav@intel.com>
In-Reply-To: <20250203080902.1864382-7-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:46:01 +0100
X-Gm-Features: AWEUYZk4bNNQBgH3TVFhlaeZ56ai3rTQMhsJjvQoZClT9barbrFQxRtMdamD3iI
Message-ID: <CACRpkdbDOH4gRcJFLeqhg1Aj3BR_SC0_1Odbi4vs-Oi70rTZ9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] pinctrl: cherryview: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, 
	mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	dmitry.torokhov@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	sre@kernel.org, jic23@kernel.org, przemyslaw.kitszel@intel.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:09=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> wr=
ote:

> Convert to use devm_kmemdup_array() which is more robust.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

