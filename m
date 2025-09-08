Return-Path: <linux-gpio+bounces-25724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E96B4853F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 09:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B4F57AC776
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 07:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D472E764C;
	Mon,  8 Sep 2025 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m+fUp8Bn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E272E88B0
	for <linux-gpio@vger.kernel.org>; Mon,  8 Sep 2025 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316608; cv=none; b=QyiSlTcrtso5Cnl0qYGhnz8nL+YdaC82SBgcCw48i5EzpcpzCQNewbYVhk9NHCDrUyCjMTcLge4BS+9egwoDAmW3BeQlbRF0/hWHIoME7beXrPF30b1WGOrxHvfapl8ozMOOgitcHFNuQsN7ZM6x1J2knVNTwbSW33OgWhaGdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316608; c=relaxed/simple;
	bh=0eG9qADrqMv6HJdF54g9V5ReakSStmKor2OzewLVTQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgw76DUWHYsLid73iFYAtnnK3ITjsPG54Pl9mPmYH8NrK0BQn+v7yUJ4YOgz1f0MkTGUJ8zPx/hFLy70ZhgjaWTD8mzK0X7/0AfbD1b4qt/VfGvxXAw+PZ4UeW9OqO3D46rQR+A2LQ5YoEnVRsx6PJ/ITITNKJ7zyt7dwmCfkts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m+fUp8Bn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45de1084868so5360635e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Sep 2025 00:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757316603; x=1757921403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5cCKqsB8NTNxllQCaAlAfgnw0J/mR79ywtHmHmoFbU=;
        b=m+fUp8BnLZTUSuKxnXO+j8pUQbDDGeXAsQxTPiH213QjwZ9X8/bFBLnK3SZ1BsIijD
         v9H1n6XpEIBMy7L+i9/D3rndf6r3c5ok2GpSBdPPGoBnFvjIb0NhdM83aoxw782NX2kt
         q18cKuVqao6stfoxMfPnQVm+FbqObAFhx6YUBJ+LdAkpL/WYMbOQzpJS5HuaxGBF+8Il
         qIG+x/TVmIc08GIkXwh+iBtFNChhlNfSefZhupsyAx+M5xzOnDYLR+jlq0cvLF6LDHin
         DrUAKHpBrxClWtfgbiWOAh0IVJOBIQRafzdNvJTUaBNkdtAtXNhxJ8B5uInZ2Hzj6BOq
         x97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757316603; x=1757921403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5cCKqsB8NTNxllQCaAlAfgnw0J/mR79ywtHmHmoFbU=;
        b=Vz+RuhMVspxAB57cDX+uHFwfZo7o1t1V9Ks8A/jaRf1R+ohl8yxl+uv4B0QkkYno8f
         UTGGG2ofce9HUHJBGI+XDyzNKhyWMxu/PQeaxn8vlzhJmvUG7CESq6Rhtk22j6oHbVUF
         WgCwN4Jvt0uq+IktRGGZdtwto+8yFr2Vg9Tkwv93pf46/DFpjZ81Bm8T+/wB1p6O+BtD
         bSdbuddDcXhH4yP5gV+BrEIv/O1lrAH8Gw/q4SIQFhhWSKdxJ7CwhwHQP6rJZfsUu4Ef
         sqeBAVHDXVrbS6Nq1n9w6lHkLqztRVRamoxJbwT9IqatNhSxveY0+PiRr5+IcohfwIrs
         rq1g==
X-Gm-Message-State: AOJu0YwKXH/lJgAo3ag7uINFkcumNJCvYGs/xR4/CXAWZxHx+dY83+kJ
	lmy/YcCeKMKclFoLrMw8HzGq2mpIaIhtcQRLO+ylhYS89chH5qMGmGRMwMtKLaAij8x0KXpLEcX
	6fEr9
X-Gm-Gg: ASbGncu5CXHlz2Qld3F6UirKpWJCCt9+ANbDowJQQHJC5W00uqkkUIUfzJtmMJ8IYEe
	x7fFco0ehCnSDTyWbvZVIONqEp4SPG1nlf29UOwrjzdODOeDe2ps2u4goA+8b78Yztqqp+FJDfG
	iE8bhowR//ploVNSMv4JMsIeD5K0zNrhKwEMnqnTt2JaCg/KLpzYl6kGGiPaLrMd+tAXNEtnFhz
	zURbD79u5lY/Gv7o7G0xanejojUf8nJfQd1QuL5A9tasWyLR//2ZUphmGz8+7SMUYmqZkogUpPv
	r16uWs8s4rYJ0QxltiV3oKFKJfuOrUAsJfShu23yYlmV7bNmLbitMkq3WoP/kyjBPmgCRwgiDy2
	mX2m1aCZgjW25Umn+ibXL94MqN6KSrsVBrVv/ohCOtsilfg==
X-Google-Smtp-Source: AGHT+IENS+vQ2e14VhrTmpHDG+Y13pSyzMz4uaujcIJ22ceqAgurGEHRxrva323AOjvsdYrrA9SJUw==
X-Received: by 2002:a05:600c:468a:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45ddde8bc12mr57819175e9.10.1757316603116;
        Mon, 08 Sep 2025 00:30:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5cdc:d980:b6fb:1eb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd3aadbcesm157351705e9.17.2025.09.08.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:30:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: Re: [libgpiod][PATCH] bindings: python: parse non-tuple Iterable keys
Date: Mon,  8 Sep 2025 09:30:01 +0200
Message-ID: <175731659709.46335.6376694071161489311.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902123905.6491-1-vfazio@gmail.com>
References: <20250902123905.6491-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 02 Sep 2025 07:39:05 -0500, Vincent Fazio wrote:
> When `chip.request_lines` was modified to allow `Iterable`s instead of
> only `tuple`s, the code that checked for duplicate line entries in the
> `config` argument was not updated to account for the expanded types.
> 
> If the `config` argument had a key that was not a `tuple`, `str`, or
> `int`, a `TypeError` would be raised when resolving the line offset.
> 
> [...]

Applied, thanks!

[1/1] bindings: python: parse non-tuple Iterable keys
      https://git.kernel.org/brgl/libgpiod/c/1f2ba0deabb8bf79e8bcef849f839eea63303e57

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

