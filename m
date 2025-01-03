Return-Path: <linux-gpio+bounces-14482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C4A00EE2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 21:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED8416417B
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 20:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6811BEF6C;
	Fri,  3 Jan 2025 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3P5F9h79"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027A1B6CF5
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735936902; cv=none; b=Yl3r4dJBOBY/sm/dbz5ciWFPJkR7MsbJ9uWmFHM53AQbPt3hHLuVkM2JxZd4naztH0qZDzHQ7Y9TJ9a/n4x02RwD8EhS9/QVZUOJij0uOoypygesv1YueIA8V+lrXOcxHgnpRheT0e5+sx9+L+HxxgiPRtE+ZpasuU0t7+kshwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735936902; c=relaxed/simple;
	bh=gXf96zYai8qp1sG5hrC46Ci+QBMBRzpANyI9zFZANdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnupF9/tdttpI9g02uBLB3VUOj3KVJApUiPBeCy/SujARBA6pYj4W9bxlWvii2fD/xP1JTG5oBfO2JJhxdHIJLTvfFILS+dS3gpcgA1QydpPnfvD3Nemm75iUy15bbrIFXN6UEp378s5djGXTLyGX8y+1p8RxaBEEX3nRheJwEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3P5F9h79; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-540201cfedbso13097579e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 12:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735936899; x=1736541699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXf96zYai8qp1sG5hrC46Ci+QBMBRzpANyI9zFZANdE=;
        b=3P5F9h79Cb9NxZnvEtYGMVcF6XIz2aRmd9XSjpJNuQnPKd9JKSe9owOQGwcfRCIwmL
         i02aTqXdfQtFlPP51Nqh7y8hIlkZOPjJ8jiW6mG3IBHlgyYNaGwDLv7Ynxeo/x9QKcs9
         y8wZyCnjpeGSlTHNTRaCncCBMoehFbDUtI5aO3ASVvggATvnzGvtdVr1A/GTEJ/BPBT2
         0eFfAU9n7QQsJvNqy6Mk7RzX+M1w6NtzksnvEUvINvCiov3lN8p9gDR1YkSEETpDcKFR
         ZC5lfOtCzUJ5LigEvzOFAS9eb/OezLO6Nbdxj735iT+8f55SLX8HoY14TYeKS2JXzxRE
         hdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735936899; x=1736541699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXf96zYai8qp1sG5hrC46Ci+QBMBRzpANyI9zFZANdE=;
        b=nVpUBmjlMf4TgwohAGn88yGS53o6DNeOeS0bipw4WpXYPzIWmTmJy2YNSX0Rnks3id
         k0HAuZ9PGNSWW2/upvtEWL4iBzTUGvYcwOOseYK2CwXMDoyvGwJw/uT3h2cCi5OG7zje
         oXgLf1ahc3LqbxMhXdY77x6Ec3i3b2rrjcapgBnGSBO4H0O54xgnGMc1tZNzQdhP73E0
         c3YPd5BnfdIpRns+s3mmLfsuQmcy3zWvIBzla1udP60vFXVqZ/Equ/4hNrkQA5Q+w2Ci
         CMcW9p2+og9E1YhO09EFcCiG0VzWCHwHcZftM/RnFymx0w0RBo0oc7chXakGE3nWRkI9
         lh0g==
X-Forwarded-Encrypted: i=1; AJvYcCX9DsQRVshPzdpW6ad/6f94xXewcnXsrCSP2si2c6vutFmyKoa6MtdDK8BUgF9CM8fNKOMeYlny98Ou@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+S7QNTdP4NOJE2uO2qIkky4OyA992b4qq3ZyFeM0NxWJ6UaF
	mnDxQgbwfBUK2gi3oiwnonMvheyAsQHxC8QhOr5Yyd800KDTZ+Z/JTqxFexLTSPCRH3oXcjkZan
	ODywxFQeJcZhuXGRANzgUdCF6JogeDQsg7OupSA==
X-Gm-Gg: ASbGncuZOrfTw7Hwwymupj9x5saAEF/yL8+9O7UDVrwFfW+zpPFymbJHZxGFo2Velrl
	EIh/K77uhNepaizhzrRPj/eRQj3m+oexdbIfp98pWthWLMqEK/zcWFAa7nHd6j8Q+3Jx4BQ==
X-Google-Smtp-Source: AGHT+IFOiOOaakTmeMBG5eqydIK5cqSCBF8tUVuiOD4SosMI2146lUP4JdfUohPnFyyIaa57hUCKGFAMF4ciB7oy1BU=
X-Received: by 2002:a05:6512:350e:b0:542:2991:e984 with SMTP id
 2adb3069b0e04-5422991e989mr10799402e87.9.1735936898655; Fri, 03 Jan 2025
 12:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217085302.835165-1-chensong_2000@189.cn> <ec5531e5-6fae-431e-bc58-73bb816d477d@189.cn>
In-Reply-To: <ec5531e5-6fae-431e-bc58-73bb816d477d@189.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Jan 2025 21:41:27 +0100
Message-ID: <CAMRc=McNWBNCbCsNPvqUHrMtwfveeMCy5am+yNxVKUficat_VA@mail.gmail.com>
Subject: Re: [PATCH RFC] drivers:gpio: introduce variants of gpiod_get_array
To: Song Chen <chensong_2000@189.cn>
Cc: linus.walleij@linaro.org, corbet@lwn.net, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 2:25=E2=80=AFAM Song Chen <chensong_2000@189.cn> wro=
te:
>
> Dear maintainers,
>
> It has been a while after this patch was sent. I'm not sure if i
> followed the idea suggested by Bart correctly, see [1], any comment will
> be appreciated.
>
> Best regards,
>
> Song
>
> [1]:https://lore.kernel.org/lkml/CAMRc=3DMfpwuMh-MH1UEHKky09iAs4g9=3DiGFP=
ptARXzoZrVS8hdQ@mail.gmail.com/
>

I've been meaning to respond and it fell off my radar. We typically
don't add new calls without users so I'd love to see this patch in
conjunction with a conversion of some driver to using it in order to
prove that the change makes sense.

Bart

