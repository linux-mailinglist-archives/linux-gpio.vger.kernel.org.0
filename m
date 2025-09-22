Return-Path: <linux-gpio+bounces-26458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8EB91A33
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D4962A5185
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5771F8ADD;
	Mon, 22 Sep 2025 14:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xmDGy+ST"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF11E47CA
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550865; cv=none; b=ATLS/TlGZJ++6TqpKU5QVsLEoxlGSD+m/kTlTM1FcJMN/ZbM81N5Vlc4oJunFt1cVav7wrnppkca0/b3iwL49O5Z7Ztq9EsDq90KMeQrAA9WMyONSXb1l3FsJBitPq5ORQZRIz8zy5RFvSGuJaCvLMaiZ7T+1Hn2NxIcPde4Pbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550865; c=relaxed/simple;
	bh=ug0zAAEr5kbnK08BBV4RWvp/VJgoebn0vXwAlF1IdfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUztMe24m+qcfCgziWRKo2Q8LXR2RRF3po/ShnNs/NboOWvQ9wZAqnbYii/X8Nyu0ODCxt8hScwssS50tBoJIcL0Vp2pO/PePYOv/B5N+EI00hQ6HzswKlV85tT7Va5676OMEy9+xvkFPMmwzY6L3XzO7DWwinwuIXkMMiQion8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xmDGy+ST; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57bf912cbf6so1785363e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758550862; x=1759155662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug0zAAEr5kbnK08BBV4RWvp/VJgoebn0vXwAlF1IdfQ=;
        b=xmDGy+STUmXvdAJZ0LPjBV1yp4IwEktn7OtJPwqszQGAibeAm50CKoYPBSFDur6O5k
         YxgwbAzPbvlH17GdsSgow65hWx7+QQbk/ydzLml3jOScoZyeDOG4JEPy0L2Suu5AFVGJ
         pOW2VEF/PGAVH0iVvunzOleqiTKo2VTEcWdq8k16ndTSmuYjB/YwouiTdPQTb+2OcYjD
         vGgyTpj0TCpKNXPjXtJLKpeo7ln+JUULrnpOUP1vhsKR4UC12JT8l69KH9BQLE2bBMdV
         JMX98k6kQba0kM4u2GF/jEWhUlzOdQdS78ZV73oplEKcupAak60k75nA1BClFMwmJ8LY
         pnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550862; x=1759155662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug0zAAEr5kbnK08BBV4RWvp/VJgoebn0vXwAlF1IdfQ=;
        b=JqntshA3/O9eY9je5jLU0tCTD0o/Urr8b7GdNNefbPWfvcSLb0rGdPMgm4AOuceXyV
         mcRJVOvSXuyQAq5YYmO3SxCx8Tt0rU9vtc4NB4TaxsNd4uUjxtPiodJNwCY7J/mpqmtF
         VzKKgk/EWfzX0YEnGdsN05JLTP3B+U+NyZAGMK6ZwBiJeFdN6MW6Dmphik6Immx8J2Ty
         rSx9D+8fHmQwgLp88PmnkZ6q5VFOe+15vPGvx6Oe/pIWBHEl207N9Ex7Al1aToNizI5Z
         dsvDUzly6neV/Yl6RvFjpIvxdyM8MQEXrJR8xlItd3kiJ+9C5a8m3XHIl3/SuMicnT78
         Nppw==
X-Forwarded-Encrypted: i=1; AJvYcCXW/FExyjCJSSjgLqmd+L0Nrx+SjYuDzNO1udQAAYu4RL9JNQxoytfkUlWUQ6Za63yGokiCgnMB1qZl@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXhXjQAKhbKwTpVqXO1aHARKhRRi2t8lb7U48Kalthoc2ppNX
	/VNysaF6c2nSsVI9iKk1e8JYfTLC7FZaEoWNCAxVAz8wYT0ZB0A43NjdTboCO0eVckKxVQUiJc0
	eJbfynHL/D1f2yvxWoOUPueFpr7wAUxiuB0JpgYxrVw==
X-Gm-Gg: ASbGncukrHbacxdTKr4YcbxpaW+4Rsi9Q5t/TlAlAP2RMMl6hf2HjdosBbG26E2wTel
	emL6fQCYRVgdv1ng9NbkBc/amjnF3iRI+5o8FJ/V4F/KPyt878L9ZY5sO8e4sZf0HBQ/bk4CfeR
	6dyRcFvlQaS3EbYd0LmhP45FQkzSLicUD8oz9rHjDOaSswA0KF/g0EePjq4wA4FYfVDihlV+olT
	ehEc7rY0hTsGg2hPnTFjGaGWKLs5PAZEV0HfA==
X-Google-Smtp-Source: AGHT+IH7ov3L6MY+/rmciyf47ro1aYeL/sC/ClPN8jzfMPrPzjD7iBzVpIdeYJWjKJ4AasrYgahlFBVLjb5jrV6WEng=
X-Received: by 2002:a05:6512:2305:b0:560:9993:f14d with SMTP id
 2adb3069b0e04-579e1b68f17mr5336192e87.3.1758550862286; Mon, 22 Sep 2025
 07:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org> <20250919-rda8810pl-mmc-v1-6-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-6-d4f08a05ba4d@mainlining.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:20:50 +0200
X-Gm-Features: AS18NWCnht0SxyHuFtw_GctfcVE1YPQlre0zCChnlr1t9VjjDpuBjNY-9qJgvpY
Message-ID: <CAMRc=Meh5WJ_C1wMjAk9CzFW729QfX_Fbq5diZ99GtsR43k8ag@mail.gmail.com>
Subject: Re: [PATCH 06/10] gpio: rda: Make direction register unreadable
To: dang.huynh@mainlining.org
Cc: Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 8:49=E2=80=AFPM Dang Huynh via B4 Relay
<devnull+dang.huynh.mainlining.org@kernel.org> wrote:
>
> From: Dang Huynh <dang.huynh@mainlining.org>
>
> The register doesn't like to be read and would cause all the input
> to be switched to output.
>
> This causes the SD Card Detect GPIO to misbehaves in the OS and/or
> may cause hardware to malfunction.
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---

I have responded to you already[1]. The commit message is still
sub-par. Don't say "the register doesn't like", say: "Reading the X
register causes Y to happen. In order to remedy it, do Z." You haven't
answered my question: what will happen to existing users of this
driver?

Also: you have not bumped the series version to v2, that makes
tracking the changes hard.

Bartosz

[1] https://lore.kernel.org/all/CAMRc=3DMeHQf_Oa2DRR0T7tum-Tuk3qPh5r5gimxGY=
3EXTyvoKZQ@mail.gmail.com/

