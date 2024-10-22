Return-Path: <linux-gpio+bounces-11738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7F9A9AA0
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BDD61C2215F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 07:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27B9148FE6;
	Tue, 22 Oct 2024 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xsBfgaHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41991487E9
	for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581238; cv=none; b=nLaIYQ7uQRq1bcO8goYDakybjp1l/bxvWcrb0AlKG9klH6umlKjTZORxDkSiYSsUuSCarnI85K6wqNXv5Ccl/r9ZYOhCXfDdacwU3kqK3sBQbMqT/sHrdU/jx5CGfQqvvf6PVUS6iP/2HXGP0A0IK1U41ZAcDGn8dH0mLPm2490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581238; c=relaxed/simple;
	bh=M68uSLnvJSaWRdyBgND1P3SC445qvbbnOOZ+7soi7SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShYNDAsIQhjQ9W84y+hvcWqkYtgE39DYGQQL+HTa2b0Xn6xYbyIztdrLVNp3Xs2j91Wiqk7FBWCIFzpz/qRzzANcnERwAFGYfqcoN+bh/uMW2P0EUTCqOzQg9chds3sSyW7RrI8Ue08ytbH/ThUUtNw7dUUcBi/a9r/JDtnVk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xsBfgaHr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so3680633f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Oct 2024 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729581235; x=1730186035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu7/6biP0r///L+Czeg5+6U/oTA7jDzuwpELtMKnMrs=;
        b=xsBfgaHroHXg70Zj+Sn+drSXOqltVcIqDMr1YvBT7ovcJEXjsp856nMU3CvMqJVRTp
         ZxTnAcKPAET32708QJmN6CDBeZnxdZHJBCzmN2PVMm4mUrwBLrtBSnLLJ+xXKlo7CZUF
         L5TawfIAog03yC9QYG5TYjnFlKANiIfBJOFH/+VUt6c2NbRhP8OT3/uaupU8UJss9Ikl
         qCcPX58WUtOru5NMlkh+rF/vSdK9qB5sXvk/iT2R/Ij+PdCVvLbjxxshemRNF5ZIMecG
         nmtOsIoiripfpmZ+HYlFCs8bZjXgzQ2am6vT0wWIuEdBxPwLqKEIW5A0/P53YE853ual
         0rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581235; x=1730186035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uu7/6biP0r///L+Czeg5+6U/oTA7jDzuwpELtMKnMrs=;
        b=oGjYeHs+YldK0VzuLNLUaVKqj7ryCRXMtiwR0pbo4+SBfYaa2nnB/4xQqim5jbK0aV
         bfN6Aw+0iYaE5nF7PWotDYD7g/rXkBxDDhMq1rujdY9pUlzZT7D2mo5rtprLlS3wIK6e
         Y9ZJkTFJeohB2bw+FLLPNfdSIF781vbAPzjIPeCIzrNBnMTN9eyR+mCzVeVNb3plsIgb
         OX35b4/WsEVgHuSiMWiLWeJGQm4VltTRdrf8QlrPbVW60W1FUz009StqUusu0g1H/Qk7
         QiDxEyublDC/4TYIbPmW9eu0LPgmj4aVmZEG0oJM020wvolZVWcbxyamDbixTbZBU+Bm
         sP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkLud7st00c0CcfJATL/DTFkPy1li6GB1x1SaWlMtA8Zbd8ZlN2lPhTaklsYsg5pT3jCccHeZRzFXm@vger.kernel.org
X-Gm-Message-State: AOJu0YyihVvODbggkXt5UD4PrfIia62wGEhhTmaTmK2NNqgv8P/HvVl8
	kQe2ynMHKZQ8jcSX+Cry9Pds3Y/2RuaHq4LkCYNqmwLJWt0G/9dq1rtVV6NTOpY=
X-Google-Smtp-Source: AGHT+IEsABVAJqJe/8IcrnXKLJC1wZG/HV5NwbiM9/5GqjkeVIBM90CoxKU2R4T3WOtPIV0inuCfvg==
X-Received: by 2002:a5d:5e10:0:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-37ed2b7afc9mr7498252f8f.8.1729581234903;
        Tue, 22 Oct 2024 00:13:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c8b:c7e5:66f5:b8f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4ae36sm5955801f8f.43.2024.10.22.00.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:13:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add a keyword entry for the GPIO subsystem
Date: Tue, 22 Oct 2024 09:13:51 +0200
Message-ID: <172958121345.18422.7642446863562220364.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017071835.19069-1-brgl@bgdev.pl>
References: <20241017071835.19069-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 17 Oct 2024 09:18:35 +0200, Bartosz Golaszewski wrote:
> Every now and then - despite being clearly documented as deprecated -
> the legacy GPIO API is being used in some new drivers in the kernel. Add
> a keyword pattern matching the unwanted functions so that I get Cc'ed
> anytime they're being used and get the chance to object.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add a keyword entry for the GPIO subsystem
      commit: 7e336a6c15ec7675adc1b376ca176ab013642098

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

