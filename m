Return-Path: <linux-gpio+bounces-9541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69E96841B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B9DF1C21405
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9D813BC26;
	Mon,  2 Sep 2024 10:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JLQzmGgI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C4713C83D
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271611; cv=none; b=WyloRSFac3gk/V/lGZEbh0k0xQzQPbyl74K0Yt5lWI0Wob1paWr4SkhsMshtZBjMgzOqnTbO8p5lnC5Qf2Ii+6hMCxXaVEOSl9VHFs9+pSL7NJXHv/E7v2g3/+wGndUK5q/2U5UsYJony7UKTZ8oNymluW12O4Wynp85JINJMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271611; c=relaxed/simple;
	bh=xHC9+V105/o/EOdedNzEZ3jckhc+wkU70EVFBg9kKUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibPblcW22hlm2/JD6Jk1IVB4HFo8gMVZSutvFZkWzjCVco9j0p9lRrqp+LRxHHkptv+9jEABXclZNeFvCGxG2cluWLy0xpjQAVJCsSmIQnB1ExOxQEveUTPJ96vABi6Kf65lJ7/URjw3VX76C9RgOyxZuagyDYwo3Pt2wPBD+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JLQzmGgI; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c25554ec1eso1012939a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725271608; x=1725876408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug3xziQjn22xcIDop1VjQ83IE8mzMitgA+gt00usHZ0=;
        b=JLQzmGgIh8hNqQy0u65Y47/dRSjsL4XlOAHlGe7a7lQM/mCDObNkKLAZYEN5PcZv9z
         /eHjN/0zwQJO/de70MQuI/9295pz+6Lw6dGuIRMGjyDhjX0qB7JlsWsOVni0wAl1MEUh
         XtgkGH2UEqOOskFliLMSnfK95D+yhgr9tekcglB0pXys6ZRbvTOJMxSPL1T1Es5REQlH
         +o89GGamQmCbpvV+kD8s7KhfNAo3Ii+Le7p2CmQUHqD9Cf67b28SGcFSD3Eemil69oem
         QsXuABQmIXwgy+xkOYiNXniDVLriIQFybGBH+YYbxUz0LMewwqcyMBE+T191OsThyMRw
         B0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271608; x=1725876408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug3xziQjn22xcIDop1VjQ83IE8mzMitgA+gt00usHZ0=;
        b=nhwk2UJt84pko2KeypLHN6XQsSPdM+aTUk8STOCbqQq2u1Oa+W1gAes0Jz45yEMaBy
         fcQlw0MkTt0Q9sikBWcKWT/3YimU42JK04xIv6lxIXMZ8NSkFWmrv6kJ7HoHWwql1FsY
         kGZQd+J01+0UK9N8wdT4A1oaEQwq2Zvl9QRxL9lHvds125lWpAWWYd2s9VijOssYRr20
         IL6R4VYn6fuzvuw4vLGY+xr5jV4yYrHLvoY2f2HNscjaVzfc8bFJ+FXcMOKVn6LzyEGm
         9J19V6kcUt2FFTFgbN/zeckWtPfl78M4CGtv1LqdvFHVvzbcctCmtZeYracf0Ye8jwTx
         uyYw==
X-Forwarded-Encrypted: i=1; AJvYcCUy/9CucLxDVro20HWXRH83c1IXGbuUErtgCo85u0GW+lqBb7ryPhzf2L7b3oFp1hX2AVKe9sdln5Pe@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPJT3AcfAjXVahuJyK6kI1hk3YILPYsQUvqu6cxt6jEexyl1f
	Zfiu2JkFojrNmy20swBo5RwaTut5BW7BHjyG788X68QRGXvYatjvrou586Ii1Pw=
X-Google-Smtp-Source: AGHT+IHWLSemu/Jhrhcm1G88R9PdtMbM2+2NYqA4c/4HvfOJXyUwYQuWEUoQyDtCbvnDk9ZtMguScg==
X-Received: by 2002:a05:6402:40ca:b0:5c2:112d:b744 with SMTP id 4fb4d7f45d1cf-5c21ed9fca6mr9718371a12.38.1725271607703;
        Mon, 02 Sep 2024 03:06:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a46esm5066636a12.3.2024.09.02.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:06:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Hongbo Li <lihongbo22@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH -next] gpio: Use IS_ERR_OR_NULL() helper function
Date: Mon,  2 Sep 2024 12:06:45 +0200
Message-ID: <172527160175.22894.8226113410059788945.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828122039.3697037-1-lihongbo22@huawei.com>
References: <20240828122039.3697037-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 20:20:39 +0800, Hongbo Li wrote:
> Use the IS_ERR_OR_NULL() helper instead of open-coding a
> NULL and an error pointer checks to simplify the code and
> improve readability.
> 
> No functional changes are intended.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: Use IS_ERR_OR_NULL() helper function
      commit: 15657d46b8b46d0b0d367d746e75e545bae52678

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

