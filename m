Return-Path: <linux-gpio+bounces-20420-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB205ABF11B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 12:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23D707A169E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685F025B1CB;
	Wed, 21 May 2025 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iqqGJS/B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781C25C71C
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822394; cv=none; b=pkxb/3sXFQ0nLpDXPRoUZ66aIxGGWhczEo4IMvTxjAvDtRgv1Bjo+nkgHdvRhikEak6d9LOK0tn2MKy2OssgmOAvNvu//q5lRlV7ZFJRqw+ClnHVFMVmbSquO32ixEQIzl+N0eZUxSJwLD0kMN6XxeRFmSO9dHIasFCH1HTRlh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822394; c=relaxed/simple;
	bh=30RzcsCoEyXgUjL24+dJHmPekPE8wlca3SQY/Kk/u60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzvjL0q0ulkycbO0idHmxDOdZhATcgSrVENqWW8y1/DC8aS9pcpXby4EIdVnCRdJhpo6+7kgcUBWsOgqBsGviFjtjrmx/c/JNYkJ4zrmYbV5zHvToM36tJeTw64LUQMN/sYLUMqBKy9jtPfeEBTvt1QttO6KNmXCslgAbwGfsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iqqGJS/B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a376da332aso2018153f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747822389; x=1748427189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOKdgzujWfm3KBSSP4/65E32YoCR5dzJaAcTw4JFX84=;
        b=iqqGJS/BaAtTWCAx1Uc3P8w7UlxEwpjQYKSeqbZy7p7bZtYwkhNy/FGzOygzouWmum
         TCntLmcqb9WfbUSn3S8g8LD0hFEo7XOu/aL1gPudRaeC5+9lgqYE+3LVzK+QHgovzmiR
         XwYWZjFvIM5sFJLAUMLksu/z3lrF9WVVg52KvGxqHOZWjizG5pItAvcDw7RBauVMqMEJ
         V7PXtx2L7dF2J42D7I1ClpENCOziuE+0VwDB0mO07FrytOqwhHaaLh+w/SVs7KW5ZmXU
         bX8/7Hp8fph3wIHWn7bv80CYBRo4ceveJsbpO6yE9tnNr5mqnX7ZPsv0w0mi/0uUq+XL
         OJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822389; x=1748427189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOKdgzujWfm3KBSSP4/65E32YoCR5dzJaAcTw4JFX84=;
        b=aGP4h64nW6nIjd33XhKFEucUcO9fqMqiNq+ccOW/1QHZT9NfUCXVXDaonIk7LvJTLn
         MajVGuGGFELXILThnMq64YDhYzl+AVwF2uqc3AHoyjhy2/Wmypz+1M4KN7fcwxpzs0VA
         znsbqHdVJ+GtORW4HpZ11otLmC/XR0nkaaNnB0+70jGJ4iA/zHkUfqe5ngmfwSMGZyB2
         PcT7apMV0jK7rcp7VDT/78LarIlbcsnxrVlPzzrUL0p1QW4tBrhd7qOqqv9fOVMHlTVM
         dgtKgYdmpMylIqimY212sFa3VTeQ6J602sLF/Y2YvicOzKTldOlplBpkJ+NM7EEIwIDK
         6mJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/8YMOAajBas0OhguSpeOKJOI7aF3DmdKToR5LRLN8KH8czraz5aKiQiRccQXMIBbBFpQIYF/HMfzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1QG/FHhvaucu4UDplMGgiLDavpbYizTS/JQUiXI5O588vemN/
	Cx6ZzManx5Tjq6L4pmW9QOrOkbxCcAVYsJ+/CxNqHTk+f2dLmK6afno17xFlAINpBIM=
X-Gm-Gg: ASbGncuUS7U73NzKo4/73Jv1xOZvrRFtO3ZsqoJENdwLa5QynMeBuY02xAcmutmHQm5
	pLmiHK3bcFgGRrkVHoFTO48KbSLy1TPS27j1+uewQpQHDjm29yWFcdLfowP9AJfDb6X+uj62Mw+
	Jnari39h7nHRwXUa2C+aoKZWS6w7q3BSKbKTH+VKV4ZrQSpdWtQtxFuuh81Aex4j/6+YjUzXcdl
	ypo6EuXL3O+wsny1uFneo4JRqz3QDFkQSho/32G4jc6+J2ZHmym83gLR4b8D3tGfWyiye51zjYu
	dOEpYeeY9jCV0xVeeF3rGw0ycx1xr+HYk1x1gCVCKOT46QERz4k=
X-Google-Smtp-Source: AGHT+IFmlF8vnuGHMp3RJ5/Djt0dpLEuHYOqlFd6utlbjkqYo15Y/8isMxsuHqmgv8Bsis1iZ+SoCA==
X-Received: by 2002:a05:6000:2083:b0:3a4:92fb:378a with SMTP id ffacd0b85a97d-3a492fb378cmr1081431f8f.12.1747822388568;
        Wed, 21 May 2025 03:13:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b545:3055:5b24:d6c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a37b0bbd1fsm4883523f8f.100.2025.05.21.03.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:13:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: davinci: select GPIOLIB_IRQCHIP
Date: Wed, 21 May 2025 12:13:07 +0200
Message-ID: <174782238505.74429.518130637718844568.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
References: <20250521072048.1053190-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 21 May 2025 15:20:48 +0800, Peng Fan (OSS) wrote:
> This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
> are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.
> 
> 

Applied, thanks!

[1/1] gpio: davinci: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/4347566404a0f01e9dc654a0b806a582ee63f68b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

