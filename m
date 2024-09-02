Return-Path: <linux-gpio+bounces-9557-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C681A9684C6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CE631F2351F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55D513D529;
	Mon,  2 Sep 2024 10:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bhainmWD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638013B5A1
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273344; cv=none; b=OFolS+FFgWiJBruztLvNvGY/wXyefYPX6L+TMFnmRzdGZGFlypO38x+5tfezkLTMchls4ryrIxE2FOYu3lzZUpVUno9PujHxUTbU9bg27V6IthjDrBrBF6As6eXGNFdmbyWWXtvdhI/y47fegBFS6SKINvSwMY7aI0GT+lwenI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273344; c=relaxed/simple;
	bh=2pcHemRxMEGsR6Nd2qYsiBCv1Z8klqu64hI/oWG4l2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WeaNxJXRpR3K7DUlN7w34wuqSWLnrr0YiAEmTEIvA1cxes/xwe45FADVxOOx9xkj4i+f4rRhtCI1xdMYicWsZFXVZM2BIKaoLyGiUxt6OdAFTtLZ/zuRGlmz/Um8Jh3F7y+XMklLe69rvG5PgVrsG/S065FNjJAL4bKQ3IdVToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bhainmWD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bbd16fca8so23631645e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725273342; x=1725878142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE/14MdbLC4vxzXLe44lleI/1CtRw0spgNwM7IUzL4M=;
        b=bhainmWDmqb7LfpcrY+b7FhrYoXEPXPa/xgCVBNgCCGMjYqL4zpXzYnGfw2Evfq30z
         jZSNnJYjzCcazPMqeq1N9qjPAxqQUE7d1LdRDWG93YrKooHF0eEV3n4hWPGp5/T8R6Ib
         fJ//XmPwhOTd4Pzq+HZKFis5VV/lpPEr2kYby+vPRSXthB82wW/3D3ojgFZuQCASeJho
         MycalRcafNMa8OC32uDmXNbHSGFnO/FOL+fFzgXiBhKAlEYOF+yapLtA8zVOPvYMpSED
         pCjFmfoJIqfv+1rC8IUNJbchWCog5SalHEVG2KDmvCKmgww7NHTEaLo6wt17tzdCkh2m
         EjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273342; x=1725878142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE/14MdbLC4vxzXLe44lleI/1CtRw0spgNwM7IUzL4M=;
        b=qn0IpaHVS/eCILOydLUny7kA08DxUuOmSV8hGsnjoW9mf8vyXYOKMwzK0cl/vv6IRq
         EUP1TyhYhBs27Uz6LeFT4FgLqs538dDiZE4WqB5fsHdzQFKELEt8I6YxlimQYAFT/8Xr
         TvG5ycwYwLSFGMQdP90AsCtPMOZwUGudInlpWDj4oYzzLIX1DguXUI/zN/ROUeWnoiMt
         hPkpTTyBGKmk0N8X7BC9f9mCUsEZZ5ciIEExCJcB252xeiCg1UAeqPeCa44ZfKe9fXQi
         ZhHTonOJXz+ugVAg7irrd2Um9PqzYnCt8nKFZAML1ASNnxYBKlZ/2EZEpMDIte49Hhpl
         Cq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8gL07FjJ70EpGGuhuGzjzrQ6gen9G19oXrGwC4lMiu9cjxLW6Hk6bE157P0w1qx05Wu7feRsKYRwc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq68yp4pyEVSQRhwhjvp9o06uF08owHTZ2Cc2Pj5Z4+sIyJrFd
	VgV+kCIsVFwp2XJ5t9y06vpY6mVJmW743Qs8aZRsw5JcqSqp8pOkeQPbrGw5+L8=
X-Google-Smtp-Source: AGHT+IHk07l4+f7lrJq38Oncb+g3mW7ieoi/jIKouYwFP4SdUSoaEdFixBoaJvVJoezr/ZiTy5ESjg==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id 5b1f17b1804b1-42bb029371cmr107114295e9.9.1725273341175;
        Mon, 02 Sep 2024 03:35:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb9593c32sm120407775e9.48.2024.09.02.03.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:35:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Martyn Welch <martyn.welch@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@collabora.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mpc8xxx: Add wake on GPIO support
Date: Mon,  2 Sep 2024 12:35:39 +0200
Message-ID: <172527332394.26048.3193181837780714395.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820143328.1987442-1-martyn.welch@collabora.com>
References: <20240820143328.1987442-1-martyn.welch@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 20 Aug 2024 15:33:27 +0100, Martyn Welch wrote:
> The mpc8xxx GPIO can generate an interrupt on state change. This
> interrupt can be used to wake up the device from its sleep state if
> enabled to do so. Add required support to the driver so that the GPIO
> can be used in this way.
> 
> In order for the GPIO to actually function in this way, it is necessary
> to also set the GPIO bit in the RCPM. This can be done via the device
> tree fsl,rcpm-wakeup property.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpc8xxx: Add wake on GPIO support
      commit: 520aa57ad7222806ebdfd05b8de07bccd0156cf8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

