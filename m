Return-Path: <linux-gpio+bounces-23451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64FB09D33
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5471D172996
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703882BDC11;
	Fri, 18 Jul 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LmK9Wy/v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E50F29CB52
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825396; cv=none; b=ZqOfIK6As5EUBcqe4eL/Ucc8GsV1rVS3Mx3Ge0qM6VIHxHnNdN/G8RYJMgELbf0aWU/4lnmqnrDnDSVxqr3+2ELeiE8dw9FmqrG6/2WaRLJdjsddeV61SdcWmPR7JUgytvijlFGkwzWdYGNmii/8Sos0wSmYFlwhrTPFZHE4m30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825396; c=relaxed/simple;
	bh=PwuTsPsOI9bcEcs74QRkQaUqtP5pEnUywVzKLkjeu0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHkH4VaSUv6W3h18y+MdhgWcOWZeAzNfrrDvaCb8XwpYrzYwYYN7VlvF3ikeoqOL3a3Hm62+Nv0V6KmqChF0lYLW8PMn4aCq6Ans7yoU2FLkY7kcjA94SlY4T8TYioe8qbz0HfXzY+iyWphmN88JNyKdbWqoh2WmD+g1d8Edwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LmK9Wy/v; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54690d369so1446230f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825393; x=1753430193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=LmK9Wy/vWSfdoQaFT8qg83f4PRZFbiHGkso/yZKVBgPP4PaEBTqm7Uf65DSPCkjne6
         oiocn+uJ/AbMPNUGCPhlD+Gbtho83/Zv9mb9EroK5/eZMDNIUJc6atRBPllWHmHypLpB
         kzTy5nvTWMy2iZwOTIwQ2ARXB9vLCQkfzSpdY6kFjRU8RH/9BQ3PgwmVp/ANXpHkcf97
         G5OjlImsCBQ6tSWaYW5WPyV5KSEI7fg+5Dv7H4PXmEtfn1xX8fLgOUeO2i1Ymrv0I1YH
         Kw6msFj+m7684x2Lpvbe8mzNxUD5tPzpM3/20b1Lqgzghil2rpzQz5zey0e9G29M82Fn
         bEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825393; x=1753430193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=SrRmiJehYpUkl5hMSv3S7/tzIcGJV9CU4JyVAcV6Bl3J9fPTOCTYeJ5UB0ZTIeBZbe
         mZQCC2sH+TsM7KBUj3bst8kJ84Oe3Moy3ox9/AnE8bffw5HY5ZaPVr3oAhBCHw8fraY1
         UIlVDZdTb1vGHd1anNGyARPhCjNz12Y4BwLk9bNxT26/sdEcHM8hdAnGfFL2zLy5P/vb
         Kd+fAnxQERN+gKWHXnIcWdma3/m8iYwUpOV7eh/e2Urr+1X4FN03e0mo97Y7P5CIh2h/
         didHT1wXHVKdUDt1LIBpt2dupK57LdnFD100acciIbmio+POYe+BT9ARsgke7ZJRAoFZ
         mlCw==
X-Forwarded-Encrypted: i=1; AJvYcCVq/0/bAPh2JhSMHJL2P2DMLzm07kCUnxyzc2lI7gnG37QbH5PrSiCHpdqB5w+1FrXnux7ax/3cM1YJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgHgj0BuQQrTVqR88735D75F5z+/G/VxYVaOAR1jGC0BDKfWe9
	tbEZz+xKQQVKBFvxWId7g6/MRcuhY/mpGjcVrs9vBAEmUXfLeRT7ylpyVA7rSSFpXe8=
X-Gm-Gg: ASbGncsr2hq1gkuV/L3eADzTtg8pqQ8Pwz0hn6swf5Wsgiler7gbtw17RTgm9qCcBVM
	luCJeBrYbYWr5O8jmnhl/+pAqjadPRJ9WYQt1SEuzL3mFix2uW2ivQTfQlraEnejg/H/0i0KovM
	xEaZJ0Sr6NzVXqbIEt63wb60b6wWUKVPbo0dpVhMl772RWm5FEYK7CkbbqoVabIW0G5Mu7kM8/4
	wdMdiX71NeRW0ZXcwdGS/RR5QI1WjQUvhEmGQSL4mFJPNGuSHaL7LBsUXZre44JbZxl60aaj0rC
	j8q6Ji0wmCEw3RnARvzWY270hblbSqRDCalCaycXs4KNLKq3RN/ZescpiOOtec4rzoJLXzTLnXe
	1+c9BJUP5WNdPGvh23G3u
X-Google-Smtp-Source: AGHT+IFR7z0xrtW7kV+L/PWsVn19Mve34KO13llGmq0De9UTBvi6IEowVSVAnjHLfBTTi45HhGu+EQ==
X-Received: by 2002:a05:6000:1a85:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3b60e4f2c6amr7520566f8f.38.1752825392621;
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Date: Fri, 18 Jul 2025 09:56:01 +0200
Message-ID: <175282531516.45055.8482528409833116992.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>
References: <20250714201959.2983482-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:19:51 -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Create a trivial GPIO schema
      https://git.kernel.org/brgl/linux/c/2ace85b5bbd065a4e037970154854dc2b41d7b31

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

