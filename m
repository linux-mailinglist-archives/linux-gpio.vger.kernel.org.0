Return-Path: <linux-gpio+bounces-12394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9B9B8260
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 19:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 728692816D8
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 18:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327081C8FA2;
	Thu, 31 Oct 2024 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fvRK0isW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181481A2645
	for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398494; cv=none; b=XkKNHHlFuI6KemHGFV8NTmTzH181eiCEri+azXHrvNurG/po3uTyL9yspcAEczb0Y1TYCLhRagFis/+O7G0+rbr2RjeJumTF1EiIKaIY40bI3OpeSjBAX710fxqc/1TeQyyzuGMc8NsW+57CbwhNz5dKq++I94avM7z4hf9qD/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398494; c=relaxed/simple;
	bh=fVXxH3uBhLx68jCuOgJTQk7fgL4A+60cqFP1MG+HJyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NdqoISMTYVAKr9Rvca055yE0htSzrVXZz7Ug6OG/zB9TdcK1nlA/didAkGUsvOqadvmhEAfxAT4/eYMG0i5EZgKS9Xji0yz2JF4Rnk4r7kp+bn+DOXSpHQDcvGFNneaVEeHCuB/inOwSIlsmmWIShvzVN2IeKPcIDX35chr4tmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fvRK0isW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so883533f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2024 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730398490; x=1731003290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeFpEHFHfpGBGYB1sz2iNr/2iBtEDbUpDXaO5B2mMhE=;
        b=fvRK0isWRvR3nOuuIZ89iChx1wZ6d9q3ka4AHMLKNETu7V4ZMiIWQi7jWP8VTki8g5
         87no/+vOfpHbhYHwETbVsb/r9pa0Na+lPlIfqb/LzzOcOWHGBunhyNK57RZdmGl2ZZay
         CMJzafS7eJzoGbmEev9fw+q15ZpL2lPBtMnWz2LeG7L281Qic8F/9ezQvuidO+uuNnp0
         2UOpRK8H7sSZyqerY3aiuJF3jvwmlPdHaTPXfDvhCFIOaLbwKN6Gs1DUs9/ZHRNz+F64
         Zxld/5pCQ+xbJXGwCDRisgasbfOmM1VOxydO89D3iIddIewuBrt5v0NJJA5GV29ADB39
         H5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398490; x=1731003290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeFpEHFHfpGBGYB1sz2iNr/2iBtEDbUpDXaO5B2mMhE=;
        b=dQsqTsY91U+VyOslK3eqUTqHwWBakyov1qY3Z9xrSSVd7JYQ6D33NkZQXDYd+ZXnSE
         NvF/n2pe20HCMUpBKUwrwPR4VWbKqjeYEcwrOJXOgUBEi2JgyLBU0TY5GISqSe39m09H
         Z3xVKUyB80IjInrHHgSNIfQ55oV4Ekn/NfzXngagkeAniiFlfUTxEjwpUMzrvpjedMah
         HqKShk560d5RBy8kAG2MBsG+TJfxgM1vEqN4WYLCoT9MwDr1YlIwlaeQjUm/GknI00hV
         JMkAXZ9Fmsmdd5Ztz0AsuRWdWsCSXaYN65e7rCKzB1YqZzveYxbdgXapZ9xnTADN17aI
         3XSw==
X-Forwarded-Encrypted: i=1; AJvYcCWiEoJg8x6CnLPsZUeqbifD/OlcnprHDEwCHxDIfECVILqYMrFqw9vinTWW9tEgoqqRtAH99B9vmgcu@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJA7bMqQ6YReI6hudXIlYmR9S5DAT4WGbIWTJQLpOZc64n6qV
	H05HPlo+/K8+PraH8NWl//6+MHU5pAgyXQlVrmLUD+zNvB3iiCj7ppf5cEuuO5OMWjVRTiaPifT
	d
X-Google-Smtp-Source: AGHT+IGg5nWNAJIfZu80/NKZyGNqXVwvsR9j+8I1NeIORf6Ki6+KKz0Y6Tf7elXmQnNgXyi1Ghzb0A==
X-Received: by 2002:a5d:5988:0:b0:37d:30e7:3865 with SMTP id ffacd0b85a97d-381be7d63e0mr3539014f8f.34.1730398490361;
        Thu, 31 Oct 2024 11:14:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f39e:5519:d578:740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c2bsm2862243f8f.23.2024.10.31.11.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 11:14:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] gpiolib: fix debugfs newline separators
Date: Thu, 31 Oct 2024 19:14:48 +0100
Message-ID: <173039848170.5875.4216141172708807860.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028125000.24051-1-johan+linaro@kernel.org>
References: <20241028125000.24051-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 28 Oct 2024 13:49:57 +0100, Johan Hovold wrote:
> I've noticed this before on some systems but never got around to looking
> into why the gpio debugfs newline separators are sometimes missing.
> 
> On recent Qualcomm machines with 10+ gpio chips this can get really
> annoying when a third of the separators are missing (e.g. when verifying
> pin settings). Hence the CC stable tag.
> 
> [...]

Applied, thanks!

[1/3] gpiolib: fix debugfs newline separators
      commit: 3e8b7238b427e05498034c240451af5f5495afda
[2/3] gpiolib: fix debugfs dangling chip separator
      commit: 604888f8c3d01fddd9366161efc65cb3182831f1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

