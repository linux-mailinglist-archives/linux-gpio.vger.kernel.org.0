Return-Path: <linux-gpio+bounces-28569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D379C62D9E
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 09:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id CF6792417F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6139330FC1C;
	Mon, 17 Nov 2025 08:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2aSiXgsY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D7C8462
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 08:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366994; cv=none; b=Gur1TYDpiGOpT+teOTGEhztdPpO+7A4lFpzq6fgOx20v3nB0a84lknvWL6HIhuma7kMJZLATSSDag59OoiBM0j4XdPw1HIAp9/E6hTj9LPt8df00NI9hzGSDtIRYOlVs6Qi41NwkJv0rtJMgnw9xV5wNX1PKMcsAqWMHV/SeS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366994; c=relaxed/simple;
	bh=ninqvxmEiWCjjF1lMMzf20rBX/OIGRaQe0tlAt3D77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D9szBLGzkoqPcVCzcPLGgLuzrnNPlKO/5WlaUsA1tMN17DFVfV7GEyMVvtrqQprGwZ5y7u0f5SVHgVl/p3D529+bl2ZIBO+rdTQ0kWTFS4o2ZwScoG9Fvre/JizJ4t351gWXdpVgBXf4La/BTzXakLmsnZf2Fn9BFMfbwItuOjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2aSiXgsY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b38de7940so2246700f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 00:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763366989; x=1763971789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNxm1Zk4Zi5iMwgPXIHkY9mVE6bXlTiw5xwEVdHakhI=;
        b=2aSiXgsYhm1tWXzTXKXHGBOb9q/NicPR7jH4k300Jtb/Oq3BE/aTmbwFVmbjoYdpIY
         Wzq3vsDRCakzKBuJa/HvxQg8BlpoQjlQcF9P7/7K2cKakyjfemnzb48cKEBrL2iq1XcY
         duMpf57WSMfwGjQdu/nPDg1bpou6k8BOQzy821rjrh5dmJsT1YU4MbUNx8fVWQmgTB2X
         vMvOdjFe5UpwSNTLCkBXwFdaxeNp3gqGcvShnhNgDvkHDAG4vNVz9eOf/2nyRyfg8fb1
         HFEu39NgMEmfjb8NSuFKNLU0dsNsZrGByuNTq/T/7qmoNEz9ibsnBwe35jkTNXRLsZ0v
         n7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366989; x=1763971789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vNxm1Zk4Zi5iMwgPXIHkY9mVE6bXlTiw5xwEVdHakhI=;
        b=GRTT62C7gnBjsBKzhhJXMtc/XwNNpTILsTryltMWLPXXoPUO+MDUlciO5aE5elPwPA
         H8pDGwR4Lytk2xVuBbOE/xUBYdkQ8kRUtw0Inz6UiTSIF/aKcRbw6QvDAQ7Vxtjgj3Oo
         RNYStQmraJ4IZ/hj6QQF/J6dg05xklvSa4MB87itYclVx9IMdL6B2cyuBr7+1LWAz+eh
         Zqt67WZKVo+uJG9M6etiQk1u5YCIMrPNZD/aM9hiq8QvcDiSCdhRi/+Jnct1WECp+sli
         STzTzzRRqQ1/DZwKbXI6GpXNrm9JBiY3qbxttE78kJBQVoEQvdYVA7p7YmW9jRAJI7Lc
         lffA==
X-Forwarded-Encrypted: i=1; AJvYcCVqY/xlvBUierJuc2+wrvPfDUBEl9RvjdzS+Xm81+6/dR06/vuD8Yd27oPlkg1xw3Nn0Zr/zSxNFKNh@vger.kernel.org
X-Gm-Message-State: AOJu0YxkiIV1aFxTrwNWWFV8PE84IrA4VOoQuZiq3I7RvD1iImkcPTwt
	16dK0dv39N81Gg05Xfii9u0raRiphcosKnpVB8MjkZ6lGmyO7rGWBkqQu6X+eQzCBHQ=
X-Gm-Gg: ASbGnct3lNYrwcAAh2oLxEHiHpvZs/Z9V3bYzUz0E1oq3NkDLDgjuvtAojymW07nuVF
	Oa2sJCa5BGzl8tdo9AHc7IuOATsfwny+9zYkgdZBdaQFmaCSwOu0Jrq8iAAtVsnh6sjLgkmNzKq
	6RxFdFwv4Y/NHZ9KJQKsBBHLuE2fVPPDRc4YwEHCgI9Iiaj8JKJHf7PPX2sGSujjZC6fFajglRO
	nJgFDOF56WX0h0dj2dRYY2lS/GiAGRxF22UF3xdk+Km2I3ShvAUeJaU/qu5rszelGw7IKWk84GK
	px+oz1qDFxBOEezlHE7riQL5HnDQT/Cxf4dx0bct8vpKdquDdR6VC1jvtAxCHGCenpky3V/20FC
	6RJCnJfQEnonn4zfY/1+f/TkMChQT6vYuJCsZPMOSjYzTFajV7EY98NgOaF5n07qmZI7KzFbuun
	csTFL3boqlmxqP7eqm
X-Google-Smtp-Source: AGHT+IGxB3eOeXVcNz6toX4eGLbYLDjbtRbx13QMOeHyz7PYx+RatpHMrUUuguAaj3lbY/sFXy2fFw==
X-Received: by 2002:a05:6000:1842:b0:42b:55f3:6196 with SMTP id ffacd0b85a97d-42b5932342emr9693498f8f.4.1763366989274;
        Mon, 17 Nov 2025 00:09:49 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm25037608f8f.10.2025.11.17.00.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 00:09:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] dbus: manager: don't try to export the same chip twice
Date: Mon, 17 Nov 2025 09:09:43 +0100
Message-ID: <176336697449.19820.17623558208865688799.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114132957.33750-1-brgl@bgdev.pl>
References: <20251114132957.33750-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 14 Nov 2025 14:29:57 +0100, Bartosz Golaszewski wrote:
> It's possible to get a second bind event from udevd (for instance:
> manually triggered with `udevadm trigger -c bind`) on the same GPIO
> chip so it already existing in the hashmap may actually happen unlike
> what the comment in daemon.c states. We must not try to export the same
> chip twice as it will crash the gpio-manager on the subsequent
> assertion.
> 
> [...]

Applied, thanks!

[1/1] dbus: manager: don't try to export the same chip twice
      https://git.kernel.org/brgl/libgpiod/c/859b3c7106589831458962cb0eb06a0c5e1b679d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

