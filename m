Return-Path: <linux-gpio+bounces-23452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CEAB09D30
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C23F11896AC7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23D02BDC2C;
	Fri, 18 Jul 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LF+KcaSa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D96029E101
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825396; cv=none; b=Hzeyk5o9qpOU9r96VpBUL5mLHpgib9RklWDtIcM7TQXV78W6ic1Py8bFhf0qwfGw6ur4exgJCtqxVYN1zBDICfOB1nbADc6SAXvy9O5h+favkWUJ6F1GLCVCq5jrxQ+bKyKdpaSkn1e+HLmW73aJTZ8X4lbAfrXkvYUfFPVG8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825396; c=relaxed/simple;
	bh=9ojAwmVyzkyjw/JHV/oncADnzoHfQo87GI9xPiP44Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iszCchLpTcTbo/95c+LQ4N3fBqhpt6HZIqwbfajJB+8i6y12rtWozM8m42wrt+jML8ezLKkjlilCrQR2KL/0LC/CPf2xSPoTyIKynhl17dXZqSE9Bx/ULnrRYIYWDrbWLcQSvaaqH7W//U+DVeXH1Mm9MhlYJvVoE+SyY1L9JFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LF+KcaSa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so1274613f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825391; x=1753430191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckV+jtDuK4a1URfzEn0Dotj11VNsvgXwo2gZXZRoU4Y=;
        b=LF+KcaSaky8plZ9KXwProCpxRm0KFClyIE+rAaT6EzT8VnnLRnhBFu52Jza2oxZOzf
         oH4S2uSbC1HGRygvc7VYgRpkT/JNumOBpxsp6R5fdH1gmN+MlcfJaf93K9nI9ijRvucg
         Y580faLAgpUfaJoM6KIZKyWQ7wRvdL70QQTbHU58rsmsIlIUbwr5oyZTpUN9L/xIDpHS
         dComYsGF0qH4Knz5RtkGH/z3H8EbqdHDIffm52sxxjjrR/niY2+iruY1T2JSb48mSFf4
         WXsahzJVuIl5uKRZ7/qkH6g8gYm3xopbweGGWzLcASdOUYTUYjhfLZcmStYue72rxBiL
         h1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825391; x=1753430191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckV+jtDuK4a1URfzEn0Dotj11VNsvgXwo2gZXZRoU4Y=;
        b=q7j/tBxlVLOfSHX9Anyokj6gh+MS7FvKLQ0V27+eLqqnGHzEXOWPcBKQXiOXQIboq/
         T02cxC3YH63DKCPkoSH5BXQfpFdbh+NvZvRoeHLaUaATaM0TGATtnJDPBEZdCqD3gD5V
         1MT/ee4icVzLu0eKH26U966gAlo7xK2n4dweM8sfWTVaDZHhZhDe9Mms5tb/LQkJy+fM
         rQ06jqn05YMv/wAU1seKkBOik0KwiduEAE7xXSoxXG5U6/9+1Qqu0+ydVWYRA55hery9
         b6mSb9bg4cxFKyMbacqNsKwklH4ZmRgPiIrCLj0A6Y1DMGMOJQHD+YooPSW1NLLuqeFw
         I7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX/YDdlv/neWmHTTY43KVZ9qbjpqlZyVL8AdJU9lMLM3ijY0VgCY+Sok0hX8Z81LYwDDMzMkIgnpq4h@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdCcG4UMBS6G2TiuRndCte3go1ZJH5dhYA9ejskUQzJMq9vwS
	wrn+hGlbTw0qOYqqOLUaM/P4jgcQsPd+7e82ksInbWWXA2beV6rTvIocj0BhbislZUc=
X-Gm-Gg: ASbGncusWFoPpBL/j3hCl7M0ztlCGYpyRGSuxuO1005ID0eh34SFnMo2D4BON4NM6s6
	b5kJujLOQY7nVfnRx/qBMy/YSuy/Y1WcBN9tgTJhSwT3/t4ko7LZg2zz9CWJd9Oxxi+gA2fc/lW
	a/pNWtihYdjJbWieYuJJ8gPMZqTde7WanDltC1PqYQre48Ghvbyf3nzKqvK2gpCt1Dju7sXvlgQ
	idVpecLS8sOsiIX6aW4GhwMqFLK+Igt5QsW4Qew9j/lmygwNMJpY7K6OnSaBrzM/9uGYfk0Wkc2
	RdP0mpEPW4J9RvUazy3lkGxip+jbK8XdjIZLA9CUEhyABXEf/zMEKm7QW8/R2Ga2hVM+7VDa0xB
	JZuTz7GL4pHDcru4D3Ksu
X-Google-Smtp-Source: AGHT+IHHfzVdB75isJbxOE4IprChk5aDxsZwB9rMG28675J8E1GR5pJQu+Z+X8Cs4aMgYfRSrfTMdw==
X-Received: by 2002:a05:6000:2484:b0:3b5:f8d5:5dba with SMTP id ffacd0b85a97d-3b60e51c90emr6903564f8f.30.1752825391521;
        Fri, 18 Jul 2025 00:56:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: fsl,qoriq-gpio: Add missing mpc8xxx compatibles
Date: Fri, 18 Jul 2025 09:56:00 +0200
Message-ID: <175282531517.45055.4508674496903135144.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202941.3013390-1-robh@kernel.org>
References: <20250714202941.3013390-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:29:40 -0500, Rob Herring (Arm) wrote:
> The fsl,mpc8349-gpio, fsl,mpc8572-gpio, and fsl,mpc8610-gpio compatibles
> are already documented in fsl,qoriq-gpio.yaml. Add the additional
> compatibles that use fsl,mpc8349-gpio as a fallback. With that,
> the 8xxx_gpio.txt binding document is redundant and can be removed.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: Add missing mpc8xxx compatibles
      https://git.kernel.org/brgl/linux/c/1a17da5b6bcab1d46aeb83a3e6f3904b1b1940a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

