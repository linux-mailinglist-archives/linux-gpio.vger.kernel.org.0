Return-Path: <linux-gpio+bounces-8698-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B294DE43
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2024 21:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64C89B21291
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Aug 2024 19:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABD213B5A6;
	Sat, 10 Aug 2024 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GSU6Ieor"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB845C14
	for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2024 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723318437; cv=none; b=dJCxJ8aNdoqKtTZ7n2i5dB6hLS0MPQUZPjJDOeHuc0xQ528Zw81DlZbqJZtVcXSNQONZBRFHm1dUJRn4bXWGjbTrukPs790evae3eszTlPbHyWgSk19pRlvyzy3zUw0eqbmkp2GWoEVnQy5okURlnNm52ekkNzQuSVLZuqeqmr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723318437; c=relaxed/simple;
	bh=uS7kuTth5Gi0txrcxus7eDZiFeWkr94qLJsPs0pMWT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mum+8+5lK4nkTuxQ17qcH20WrTDtpi1Iwnw+pAQqPVmlAxhbq/bc2lKxZPwZwxPuc45lqLRqqNmTX4LfaAwp+EuxaNsO87YOA73V8vziFCueNta+mP23QDtVPUchYgfTgzp914/dcvmTfHsGNrGuT78bEBQw7fG6qLJr1erPTYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GSU6Ieor; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3684e8220f9so1729054f8f.1
        for <linux-gpio@vger.kernel.org>; Sat, 10 Aug 2024 12:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723318434; x=1723923234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWxErkwV88mNdLnqLG46bRp9mJagvADdkYHKQJjbHr0=;
        b=GSU6Ieorp5SnNM6Senfi/zM4oTQ8eDM5SJakWQlFEcKyaaedq+ohTAybEe/urvm/kL
         LHmYc0u+5/rDnBBQHHnEBO8i+tpVJCHPI5k8h246QnCdJeBHW2dSKoS1omOIYYsjI5ZI
         X/f+rolqEQGy3DRVG5bu73j3jbTH+YFPK1fTFqvGGcjT1AoMfqwVIDvcPw1Nn/4zqI1f
         RZ4WW0WV1vhXozkz76I5Y7BDkBsP1KBLPCpcsGGDOmF/tVppZzbzAqjWaIkt/EHQQktD
         QyMh4YERbFiwCUDh/AByx40Cuf1NnwPwYtqRrleRYpFbwEvbPt/VI8YzSZJZNLiRFprR
         obXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723318434; x=1723923234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWxErkwV88mNdLnqLG46bRp9mJagvADdkYHKQJjbHr0=;
        b=rsB037zm8o52gTMSQ6E6i3y2JO1eZze6P9/nTmKuZeiIkBs81jfeIKpLsd/n7w8hPJ
         s0iN6ZZimJCl5IzS3S95rgOwt0+KI9TPdn5HZiSG2IYJkJK2t1m9zf6it9lHnUDjNLP5
         MgcDBULIxzfkqKiUvpJYZxBdOI0IQ10DeX1FHySc32vQ3BikWil04nUgCvEpB8mRCrJ7
         +zwDirfyhoiMe9FFQcdjfMrJh/8yFIhlDPkFFMgKu1inYsA/B1Wy4YMQIuyhTAa/vTVm
         nLkHVibTs6+hsFxpQml08B8PHA6MdatCt29IuqRbsAvMumKbIsQnpaF1qRdjCxAqHzgj
         54dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSOjkUnNb2/y7HmRoT123Ml2dmftMkSSJ4zGYChVzn88QsX+bfILVkJ3KUp9HN0LGTs70G7Wx0rjgfasbRmmTa+SyE06NgrpT7QQ==
X-Gm-Message-State: AOJu0Yyw18zMfi3D2v/DcjBGomyN5UeOFg2J/uce4gJm4LODyTtNfDNV
	11ltJUNBEAC/G817IgnHuFW8pbfPtrCpEx69+uyFILkQV8XWj5fqQBH16E24aSk=
X-Google-Smtp-Source: AGHT+IFYB2SyMPqpA/wUEs0CCCwXxydnmVu+bRpHDFW6Nu8KGRs9akzdD+gI6ho23cphgUAHz33pqg==
X-Received: by 2002:a5d:5982:0:b0:366:eadc:573f with SMTP id ffacd0b85a97d-36d281fd0bemr8334017f8f.27.1723318433830;
        Sat, 10 Aug 2024 12:33:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2a08:ed5c:1f55:659c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c36bb07sm3200288f8f.5.2024.08.10.12.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 12:33:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Keerthy <j-keerthy@ti.com>,
	Jared McArthur <j-mcarthur@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/1] dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property
Date: Sat, 10 Aug 2024 21:33:51 +0200
Message-ID: <172331842973.5054.2650724478798968340.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809154638.394091-1-j-mcarthur@ti.com>
References: <20240809154638.394091-1-j-mcarthur@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 09 Aug 2024 10:46:37 -0500, Jared McArthur wrote:
> This patch adds the gpio-reserved-ranges property to
> gpio-davinci.yaml. This allows davinci gpio controllers (compatible
> fields: "ti,keystone-gpio", "ti,am654-gpio", and "ti,dm6441-gpio") to
> use the gpio-reserved-ranges property.
> 
> This property will prevent users from trying to access gpios that
> don't exist.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: gpio-davinci: Add the gpio-reserved-ranges property
      commit: 789ce0f6028f9e68fc27f6748acefbd2e23f4716

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

