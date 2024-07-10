Return-Path: <linux-gpio+bounces-8165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E720192D167
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 14:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2495E1C213C7
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2024 12:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A731922E5;
	Wed, 10 Jul 2024 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j0dMtNAf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B15190074
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720613886; cv=none; b=H4PrWYyT14us0T2EnGmXr2659XQiUN171PSKBKCtKCDu1sgkEmLtbyGZkUU1Cjo1m/LEbXWC8KZDg4pnQ/nScNSCk7RGl+b2JmEmuabQJgUTA7sdZxE9cDdvwGAJOMM4nBIBP0EsxZHvHIO9OPtG37xSrKHkdBTekRx0N54Co0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720613886; c=relaxed/simple;
	bh=FKo/K1VSevgT1kqfr6Wf2OJjV9CNzfKMHv6LZyf57Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnnUHVnS4/HptxFNw3Fx7jZG/cteMKsfZB3O6v4b4UzIT+1IbKX/jKnfQqnB0vTcl8voDETgOtFJYJ5iUOM8p9fyrkFXHU/mT9LXgcpIMToFE7rX3D/H3d2DJbl9ocapkBxP08R1NA3yNE/OIicVMFsA/W1Jbg/7RZ0Gbp9Sc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=j0dMtNAf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367e50f71bbso446104f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jul 2024 05:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720613884; x=1721218684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/8pMMHSXBlTGnflwKPolD6eXWXrrXR5fKDvq9SAPrE=;
        b=j0dMtNAfhcmRPGpo2f1j+eFJD3JVbytfZIWLtowVWiJAT/Qaw8bweW0B5dz6vwWxiA
         1/AQ78xydPT0R97KOBOYdiN7CuBlEEmiZBK3DhFHxzhyaAirSlIhVyBPUMKVflacOPrw
         eQ0dpZQt9VA651r6jvMIQ/nzpO8nwIEP8weBfzJSxaIdI0oZwFINO2T8tHjHKp1sd9dN
         ptYxWuHCUzw401DEl6MdH4oysvCkAMhP5MQqk24VEj7cZvXBtnsYEjYyvQFtrMSE9Uy8
         313iq0lslQ4qkoeRbsoiWmmS2lwY3H5feCSHxo58PBgUwRSCHlDE9BTM2yM8bolsMw8f
         1quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720613884; x=1721218684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/8pMMHSXBlTGnflwKPolD6eXWXrrXR5fKDvq9SAPrE=;
        b=AQljt8RN7Zo9NKu3MIfs+S6yuoF7JGLIqzlaOdAOXlYhLpCn8e60YL3jNKH9f0Dfuz
         UKUZsgralxPYhlU3rN+AH4bkfU0Pwnrc0UBqYys3JQLs0OldOt6hnDNb8k+niR/sm8vU
         J5NrscRa34Khj0AmhRYjy4VtEcNSwo4gIqTwhMQWOVih2QLMqvmr+lkZJxxoGoh992lg
         V3/vCWp9spy10v2kxE5pKfARWvBVd+lb8ofKrB4K38Iw2tz29c2oWvXJOk6yx2kgb1Y0
         o8cDSK/Pms0cv+b6Fvv03AFlkPCZtQJRvNRnCiBb5HoUF7tYI4x7+vRs5/NJz0m8lJaR
         wzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOx01Xx+U4VyiMV8j3mrIzkF6+uaGf1iv3GJYJdXi+DcTvvgilVNjDJZ1SF/zSVYoPuTNc2QXpfb6KSFwswUY5It/Zso2N8TTO2g==
X-Gm-Message-State: AOJu0YxGEVI8AizxeAnsSlsjXEBFihEoi/X6uTk6L4zF0uklSpEpBeTZ
	B1vV9fKB3FAvmIYWmaQQeXvl/k65eZhsbqI33i/j9AxDdnuRbIyyxIkOlzgLWKM=
X-Google-Smtp-Source: AGHT+IHk3Oe2Tphyw/knDnElbIxyRbcJCQCAlp4hzYadpjISwaJU8fcvfIPj0dweiTCIu6/Xt7QmVw==
X-Received: by 2002:a5d:4349:0:b0:360:89a3:5293 with SMTP id ffacd0b85a97d-367ce5df8c1mr3229870f8f.0.1720613883651;
        Wed, 10 Jul 2024 05:18:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5d33:75a6:b07c:5579])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84798sm5160571f8f.38.2024.07.10.05.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:18:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: virtuser: actually use the "trimmed" local variable
Date: Wed, 10 Jul 2024 14:18:01 +0200
Message-ID: <172061387941.25630.17691925679100572305.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709151235.90523-1-brgl@bgdev.pl>
References: <20240709151235.90523-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 09 Jul 2024 17:12:34 +0200, Bartosz Golaszewski wrote:
> This variable is set with the intention of being passed to the
> subsequent strcmp() but something went wrong and it was left unused. Use
> it now.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: actually use the "trimmed" local variable
      commit: 1d8267bcbb7aa2176365299ad57e067f73b5174d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

