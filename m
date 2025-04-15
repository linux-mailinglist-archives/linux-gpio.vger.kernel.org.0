Return-Path: <linux-gpio+bounces-18827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F05A896BC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C4B37A35CA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738112820D5;
	Tue, 15 Apr 2025 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4HB4EZL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98964288CAC
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705884; cv=none; b=eh82sBlUTE69sb5kHYr9amjMN+cIxwteZzlwloeVTPF3F8/z25C9MTEv0G2BRL5emVFWNV44U5BAEJbNdo0pHjyoqhP6qAyGYG5wMJy1QTnrW+KG48TztnirbY5INeYLbOj2AILxctaLRpfRskxSLYc8F3eFVTNQT09Wn6pUgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705884; c=relaxed/simple;
	bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USWOzLqdVqnqqW+tEUSV0u/P33FtPIUV695fGOVDw3FUxDDYd6z7JYkms9HCe9xMHUS8c8v1c5ZcaAtKTSxpl8ctYi5RGndp/ZCpZyky/KRZEWO6nZ8zAffH7szZLX8qwMrXXT4phQvYN6TXKMHLpXjsCHkEUie/4E79bYo7OCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4HB4EZL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549963b5551so6219023e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705881; x=1745310681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
        b=w4HB4EZLK9bYTT/phsvkrqF14jJR1Ing0Abx1PGo4AIfXIzUn/i2/TSb6nXIi5tv56
         ZCRkJLLZVQAh4WVRePVPo03DKxBWMDenyzhGT1Ah6yuy3aukMSs8TT2wa1F4VMFZNgys
         UHLzPzbNPqxX8sRmtfI09uRjqBwOi6kNIQZWKPOQU7J2RjR59B0JdfAso2ERx+Sv4G3d
         B+hCk44TqIj26d65rhpHsAcRxqz+Ha97XdpokhgHE0Q34ShcN3O79CYGTVaKfWh2lNsp
         NipN2X6z++liSXiYZMtGB6PtMTsUGqUid1hdQKi0pHX9UYv7oP1Su/J4S7eAIV983MMs
         +c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705881; x=1745310681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGTQ61IkoM056vi86kWymU/PNLuo6lfyrF+/X5Qi5ps=;
        b=T2Vcq3Zyb1np0G8MeajnUZ7DWTkkC7czO3++CkVTzzl7013ffrKB1x+I8Ok9kZxXYe
         psuPWmW6ioZQ1MILvFaxsEJ7kdbEq/MN6qIF0gahJ6T/WUa54X6Ihjf9uX06D8lQPlXL
         TlkeHSMVJL4VJTnTJ7MmRXkIgI+g3vEt2/w2G8ERQKaFchlxxrViVQtl6ZSMXflaM9A8
         X0y5HY/WS8M/AQCUJV5QLAHoa+jdj6rCAo0+SR6eDZ1KY+f9LhC99t9L92p1IdLGaggV
         YspZQaIM6QajeBcTU3yABdfkEAJ2nCD0J+W3QPatxEjTWX0kAh75D8jF4+n7xur83kN7
         dmEg==
X-Forwarded-Encrypted: i=1; AJvYcCUSZ27IDaZwX5gyMqO2Ck89n4YcNT09avFyIoIMT3BNeOhm8y1nWfFs4rc1WXGz3augenfywssl+EHS@vger.kernel.org
X-Gm-Message-State: AOJu0YzXI5cLio00LPEnGM98Ddgm5QBYCxnQiIFCmM9d2JBHUW4EY+hq
	+P5k187a1HJm70LCD3mLFQ7ga4wiOjDczrcDaGsRhUQiT1h/oHvyQc30VLwVoAF5XBFwvGyrLPG
	zdumsQFx/uoVyZKKiGaNqFUOKKILQ9iUzvVuxQA==
X-Gm-Gg: ASbGnct8027cGVcMFT0WGaw9SseRPGOvqxK6Gkje+hZ+/l/5EBlRNq7irGpQHPaa2BD
	b+9wAVVSTs6MhXZsj6I/dMKKODs0H6487oIy3mIv+snBQ70z53c462gdp0B32+eLwVZW/au1Hqy
	3Va2bF2SRshAU+Gg3hLJYgxQ==
X-Google-Smtp-Source: AGHT+IHD1bKQe2Mn+6xEULr//Xzasxy/d9khfqWn+UjN2VWJgAl9VuhBCbnmnHHLrAApVzeC5eCCITcOA2lzCH4tom8=
X-Received: by 2002:a05:6512:2305:b0:549:8f06:8239 with SMTP id
 2adb3069b0e04-54d452e160emr5021750e87.51.1744705880800; Tue, 15 Apr 2025
 01:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:31:09 +0200
X-Gm-Features: ATxdqUFSm_t0Z-MhiOZk0J9emOXPp3yGfQ0b0Vs1DgJrJxq1RyyCd_nIwV8m5GE
Message-ID: <CACRpkdYdoZ7q6x89emeo3wtJpDOvA3N6Re3PF_XyCJT4jF=GmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwmon: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:16=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the hwmon drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

