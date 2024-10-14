Return-Path: <linux-gpio+bounces-11285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87599C36B
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F34B1C21ABC
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC0315990E;
	Mon, 14 Oct 2024 08:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wao6WulG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD553158D6A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894720; cv=none; b=c36lAPomUckncTvhOmhsIBHh76xkC8ztImgHYpZ8H281ZLU4HGetTHKvInH3goUvOt2TQTu+dc8fMBRKYxmDZW5Ljah0iCh9co2y0c9nNng6JGA6J2u6GpBnGk/GE7y9LAbpXmPYniAG2I4lDBmEEz0MiLHafP7Iz9f/hoOpB0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894720; c=relaxed/simple;
	bh=HOQuL05aTcz38UQAXd6dFnZM0C3Y3Fs1xb6v+HFs2rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=he+oVGxCSS8JG8RiZP44Tn8AV5VCTJAdhU8udoXQ6fvyK0s3OIwFQ4Zo9RHoyrXwZyC1PDUSs3h+myxiHSiOD96v2PfWQKTGzyuyY86OxiV9yOJUjYUNofHS6tS33P6CP2HmMibc0wCc2acRVLA0Am4IgmfFloeASoAqLBAQSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Wao6WulG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d518f9abcso2120319f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2024 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728894717; x=1729499517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnqEt7xHoA/xDc8TV9q3o1UbtE0Cr8uGVizTXc1c8c8=;
        b=Wao6WulGa/RU9eFMHjos9HqE6IVyuZ30AoThee+rH1AojU+kjg2w5scjTX1cHDv8nz
         UoXZTd0qCZTSLrp2jOGmNqTCh0sLjb4JOn9HFZtAbedYMFDQuzIEQyaymPukHZ5xdzx6
         s77B0nvYifBlGXfVqjfLPQxDYk91+QqDMYSSR3iZ1Q7ulBvL4wp5NvOWOVWXHFZGHuPc
         twmIHpemfCbNzidHoHR1EH6V2EQRtsn6I5tBhDXXo98s8P/bHabCj2DVgJ7RMPKzExVd
         lP3/VTKtq1rG11Sg9NzmgXA6Gkj369oycyydxuC/gl2Kx6WMwZ+GgpZyaQhlJ0qGwQFQ
         0q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894717; x=1729499517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnqEt7xHoA/xDc8TV9q3o1UbtE0Cr8uGVizTXc1c8c8=;
        b=MhFRMkAFp27sAgraVt4mat/BdnCjenOXwbrYEYD4/6/HGeOWJc46tzi8SV5vkhJ5nH
         7otqOt9/3B7rcCLTcXnkK7Lehhs6dA7m5furG5PuhZ55vLjyeJIiNwGZWn4wP6wMTq1m
         mKYScIy3wtVcQjH+X2HLAXGrPfact0Z0O+n/1z+cU81wbPvZDAaDH1ndxGkBjb2nwme5
         LN1ZJ24x1qsE/D8rE7sWI093zm39S7ONPAORNEK1lm7g2ny+jHIyqgZ6qjuIAYJXF1Yr
         T5IY37iE1U4B0lABIEmo7IfSNg6b5scCxsfG+ST43kkV24wrDL4xrwjESF4HHJFci1xL
         oxMA==
X-Forwarded-Encrypted: i=1; AJvYcCXn6NuMX8Yl1c0NaGYdDYwC41YTRCgYDfyu4c1HO8pwSM4SJeMBSvi9bcYBdXprWkTSqcn70J2oPwAo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ozwv5qTwHEoUepsfEpfeZqL4s7Og44Li42tdOSAdxRkktA0y
	3R0A7SXDmOQkz6VQrVOAzZjl/3vtR85pLvcvkGbxKXJus1nneuH5BL6YMto8jug=
X-Google-Smtp-Source: AGHT+IFypyDVPNB7GTsY0jbyqffL/WpbjaCVbT/mDxbT4wDXJ36Piix6XrL6ax+D9xuwuNyBr5Jfcg==
X-Received: by 2002:adf:a306:0:b0:374:c92e:f69f with SMTP id ffacd0b85a97d-37d551b473bmr7205594f8f.16.1728894717195;
        Mon, 14 Oct 2024 01:31:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:de54:ebb2:31be:53a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ed69dsm10737698f8f.92.2024.10.14.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:31:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH] gpio: vf610: use generic device_get_match_data()
Date: Mon, 14 Oct 2024 10:31:36 +0200
Message-ID: <172889468798.57095.6447484996457464693.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007102549.34926-1-brgl@bgdev.pl>
References: <20241007102549.34926-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Oct 2024 12:25:49 +0200, Bartosz Golaszewski wrote:
> There's no need to use the OF-specific variant to get the match data.
> Switch to using device_get_match_data() and with that remove the of.h
> include. Also remove of_irq.h as none of its interfaces is used here and
> order the includes in alphabetical order.
> 
> 

Applied, thanks!

[1/1] gpio: vf610: use generic device_get_match_data()
      commit: 1b35c124f961b355dafb1906c591191bd0b37417

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

