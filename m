Return-Path: <linux-gpio+bounces-23583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D4B0C50B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3B9B168BF2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 13:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926322D8791;
	Mon, 21 Jul 2025 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ePTKluWr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7308528C03B
	for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 13:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104054; cv=none; b=S9xudp+zeId89YnAFCRozEaCQOaFjcpYC7eKdc2CnSvHyGzodvCuGFbY30/gYER/cZvivWSrTFTtOAc/o/cpO7fY5HcZd5q1xZFv2aBH8Af17D/r9KQ6q7LHbP/yZyzHqh7NuKbhuc3/bwKetVIQcuhOXIE7tR6+hYeS940YAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104054; c=relaxed/simple;
	bh=AAgUQPJOJ2ZXjptXqQS7S1r3cQg0diBFryb7hKKIlsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBya3p9/p08dSy3IksE6D/1Fdl+HkPlwTqb2ENjd8TM7rwaNn/hUgxMJPHk0WdVWEWc2t7mdSy5J1WnD46YjYbyqOqvqeZR3sEq068NUJBmTFFpsmqNsoSaaKH54j4vB2lPnLLsnqnd0sNa8+/o0tL60S02nVzdFHp2lZshtznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ePTKluWr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a522224582so2137689f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jul 2025 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753104051; x=1753708851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JidLPoLRrCqL1DWqeAZQIsOVbFRZ1UTH9FsxLVg+oQY=;
        b=ePTKluWrJihVgPty/yWXo3vE2wzj+/d8Ut20MIbS33WAMQOudWxNlstC3ntyJ3i/BF
         n8R+VfXbMBbXJqQqFUJxgtJQFlfk0u7VTA9rgDvK32yDT08HpLK/N8Vb2f6WFfZCmQXk
         TqYKFcINNCyOD9FRvHh8Cna7oDGZXYfNXX9lOR4F5URLYR5qAs+31qTxyNbDgqME0XyA
         Iy+R3083Iy204oZ/KCGlebSi51RCx8/5oCnHC0LYwDB/v5GVk3WpVkiz35DzUn835CYe
         /d6QXqWWH4iJphRj/ZS+3rlxMVpOmXrmlno/larrQf9GY/ogb4O2UYYH1kD8prJWV2RE
         /UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753104051; x=1753708851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JidLPoLRrCqL1DWqeAZQIsOVbFRZ1UTH9FsxLVg+oQY=;
        b=DqyAp4Z3mijOv2OHV2AD59GMRyUIU3XVok1sHlnlvgm5tFuipoFLdHZa8rRnOX7y9t
         cEIS6N1mxT7BbKLeP6aiGiZQlwvVszmP4UPEydWtxyX9ylyRvFbfIRpvHjGrjAwFHx+Q
         k5sxyNvlIShLT0lbFQyHpokugf0tlqmXF2+1Oo3CSY39Akk+EXcfeHxWNHuR3X3B1yGY
         Tq7et1uYXpYOGQ+p9dGbCpCDm29DlgguG/qTZp8HBO4fSvjb/C49ikZ6+O48qWJo7FNH
         Cy1Vovq8kA9TI7Y/WQeY5Toi05lfdtTeotMZ1soWEYXR2efepybyds+4E7VjWfOpJUaO
         tWxg==
X-Forwarded-Encrypted: i=1; AJvYcCUAxZJ6bFmVM0ZZmnHfL4t2/defSpj5iL0a8MHMqGXF0E3R+YZdnQHEWqVi7DBaL2orNJuTlcCTD/Av@vger.kernel.org
X-Gm-Message-State: AOJu0YyMOd+2vtARWxdTx+aOEYNFk8MACIqTv8Sug38qGY+I8kQRCB3i
	zi/EIAe5GPHOtoAw1bFYK5lCDjgHFAvCPIE/eZutE4dfNdDKBDCTr24jP+cVM7hYXOI=
X-Gm-Gg: ASbGncsPzpkIBSsw0h6l4/+mgs9qB12jbyIPTtm4B6gH3wQLjKn4JiBXLJpo2UlUXfC
	OZYCZcefShTLvmsWkRqPUTDzr0iL6pyet+M2NNIqZovZNlAiVNaPSzTA3a8i7ZG355sQy/Jdr08
	KSzF/7byNUlyC6aRv4vt6K3WF7zsY5FkyTEkw935IHjyGWk52iZOpKy4JKzv1yeosLmEN2KmaUv
	ZR5ZagcrzhaBJHYb0cd5E/O6QUBa0cMect2cSuaD0hHZJZUbu7I7Yml5mfdcXO+TyUfrHJIvshU
	XbrBYy6JgUSDuP2b9MBqvbvefRVvP7TT6Uh9vFt/CfxPavw4TQyPvYisqqMSsMk0wT6wQaSo7MY
	L1rZaAD01ViqFE43NCpPwPg==
X-Google-Smtp-Source: AGHT+IEZFo3liljwd7GSk5zsWnnouqTr4gS7d/Kg46FSRGAqAKRhfoSVLV2kxV3NfoS3CFcnznMNrQ==
X-Received: by 2002:a05:6000:25c3:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3b60dd996d8mr16546087f8f.46.1753104050450;
        Mon, 21 Jul 2025 06:20:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a0b1:7516:7c6d:ded5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c298sm10445189f8f.76.2025.07.21.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:20:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik@riscstar.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] bindings: rust: make Settings:new_with_settings() crate-private
Date: Mon, 21 Jul 2025 15:20:43 +0200
Message-ID: <175309950626.52365.15946839889561178724.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>
References: <20250720-new-with-settings-crate-v1-1-a51392bd5b13@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 20 Jul 2025 08:16:21 +0200, Bartosz Golaszewski wrote:
> This function takes a libgpiod raw pointer as argument, is not
> documented and should not be part of the public API. Make it visible
> only within the libgpiod crate.
> 
> 

Applied, thanks!

[1/1] bindings: rust: make Settings:new_with_settings() crate-private
      commit: 92407a2cde683c8e04cd33b3150721d6a64d363f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

