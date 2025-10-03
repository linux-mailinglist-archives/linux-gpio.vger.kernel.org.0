Return-Path: <linux-gpio+bounces-26783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6D5BB6800
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 12:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B0B64E8AB6
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 10:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557812EB5A6;
	Fri,  3 Oct 2025 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VibDdP+u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C022EAB61
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488979; cv=none; b=Oo+wH1IsuKLMRWgrcyNGBz4mmMbpt+JIN/XcntkriJ7QONTA6FpZ4JwLBdHh19gmexQ2VsmRlEmXlPqrpC0eU2yisGEiw+Jk8RoZ2AvCaTe6IgHw3g1UXkXqfZqVxprA6aBEaBbi9yhn8jRA9cjTitpujcXfmDBwOWYtKZTom54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488979; c=relaxed/simple;
	bh=te5DAPEOj/cEY6XKUcLp0ddPfg3KhbuNfmsW55iR/YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXrmtHi9cH/8QBsTUBLRdTmTbgp5+K+2mjJShWbUdNa2ah8saGRKfW+CPqRzOEJ1pUGDCeBVCFt498GX/AE6reVBZT7rlB4qBNeQTh31QDQfSULg7YYGOI2X3OeFq7mFBQ047JevDdJPF8D8FS0G4HeIWWL5mpGYNiSKPGDs6DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VibDdP+u; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57e36125e8aso2004770e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Oct 2025 03:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759488976; x=1760093776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te5DAPEOj/cEY6XKUcLp0ddPfg3KhbuNfmsW55iR/YI=;
        b=VibDdP+uOuIhrl5no8vm5q0cbo+Lid7gD+esE1Wu+sSEoXEQoATvwqZCihNpnab7zI
         wrxrsooEhnGJocuOCTj5uK9vjNfiHaJ3/Y0HcXzbAdqRLjhJveVA3YOYIfXZ6zFeh++t
         5w30wJCV0ozNwuqQNCAeLQGIZ5IC0PksxuwuF+DnS+W9CePNIrbcmtlZDrzwNQSgcZIo
         Q8QdplqD2iMB5fpkj3YEL6qwBztti5/F09X0aQe1ySSlLkKD5aZX3VlgPgJ0iIrOl455
         01seSpLCacLYYGF+cUXWRCE1//QkkPeLzPK1gYXuewoNlkzQJj/P3n3f3EEAyA8kG97a
         xhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488976; x=1760093776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te5DAPEOj/cEY6XKUcLp0ddPfg3KhbuNfmsW55iR/YI=;
        b=UAVREywbstzUzgBQDGbj3jg5tPYpyGB6S943shnK2QVN5pjSX7mP+JEMhHflqSrk6X
         xHXwIQxmilV/nWk1TN1QT0SrcQ/DHDzDE/jk9dOIgqIsXkKWtHKoyOI6GRPpENKJZaKt
         /74pG5tHCP/ohqt2jJBnLvaQgcn0fSyyO9q8edwVsbH5seg3WwHo+jd/vNch9Z6TG8jT
         XvalIiR0dOIAg2ickPO1zJkcQ9pFhCdbhsFQJo3/5FiJi8QVO/K1RFBM/v3VLNzQJae4
         CvH04nj8eRswf4qZZ7A4qNaWB5NPWcnk5EEdOlkKSA0vO8uOSiin5s7Wc4Q0PkTfWfPV
         hyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFOA3NWUqfkD8JBlvVQdlJ+qUZ4/pyDtv1/nIpjXG/BN3H57fvLIkhVwjH04riuIzydge7o/pfKnrA@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtNlk5mqNjgWdNH/yM39skxOXCexA6o11RPopVPl+b4WfFRBQ
	/7skR3jh3RwaX3LIrjjfeYDjeewqFI3AGX5OD8JzYdu6EDoBMxkegYPKP0e98Ijm9wMrUEKiVyP
	pEYtREFS+BzApN+FbL7MUyBFD4mRV+nyZ4LYBOC0vZg==
X-Gm-Gg: ASbGncuhyWuwHqRvUk1kUocfm6MPiF0soSoFox2YmCISnGpdFxOpOHkhVTKZZDHiy//
	Bz7w76VZBDwWFfNymVENKN8R4aw4p/9/Rs1jpVk5Mt1uPByKWJzZ5QocScvOmJY61RBpSlM8Gc3
	xp4T8UW4kmapG9ajGDRLcb+33RvS1nX9vhIKsVz2k/N+Kdvz2bpfBa18FKgSYfuzxG8RcBzI5oJ
	d3SO8ssLhq6XjxsC6f2fBGK44IjdKMoYdi8iiq//G5HnZSJrNSLIsy8aZ5PHg==
X-Google-Smtp-Source: AGHT+IFiU0MN9oFDa1Ikp5HhcLAYNTyvSihwUsMlbYXnDWwlSzxFK2G3ZkO+ccPb0Mvvv+PkirvsKjnH+mfjQhaDv48=
X-Received: by 2002:a05:651c:2357:10b0:372:9780:a2b2 with SMTP id
 38308e7fff4ca-374c386133fmr5363621fa.39.1759488975942; Fri, 03 Oct 2025
 03:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-pinctrl-qcom-glymur-fixes-v1-0-426ea410aa94@linaro.org> <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
In-Reply-To: <20250919-pinctrl-qcom-glymur-fixes-v1-2-426ea410aa94@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 12:56:03 +0200
X-Gm-Features: AS18NWDueSWU7qdepgSCRftSEYr-_-nyt3yO-QZq5da38at0E2Itzjmkp-rYUwQ
Message-ID: <CAMRc=McL89znciy=Rtksk18zLJwRSdX-7YJ796YLV9cF4+L=Bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Fix the gpio and egpio pin functions
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 2:18=E2=80=AFPM Abel Vesa <abel.vesa@linaro.org> wr=
ote:
>
> Mark the gpio/egpio as GPIO specific pin functions, othewise
> the pin muxing generic framework will complain about the gpio
> being already requested by a different owner.
>
> Fixes: 87ebcd8baebf ("pinctrl: qcom: Add glymur pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

