Return-Path: <linux-gpio+bounces-7300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B9901BF9
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 09:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F581C2192C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 07:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B37C28DBC;
	Mon, 10 Jun 2024 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DQmSOd6N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F44C224DD
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718005121; cv=none; b=OnhTrvTT+jtLuYE68htzwNt+90hNF2CA/HmGzCMInnenmwaJASAGMHJI2e96LzAhhw+W1D1TVYWEjCWcL1GBQFBCtwSc6M4LQyV1D1IAs7jCWKqZOc6UYKb8DFNwu7dQdSafuxx7qb3w+FIMV+bBps0qZJQ2bIISjbeXbsdbuic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718005121; c=relaxed/simple;
	bh=J3TJUg5+q7YP0MGTuE4DpuCVtIoec/4jlVQ+5HhQKFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdkUU/9YHtVJWm2dGQ4KR0AD+ouygYHHoSuCubMek5+gV7DzqXwDK/xuKqajL1y5UEPjcv66SNXvaFUCgURuyVs1ZBeA3hhbTISftSw6Aqfq7ONpK5FTZI+9zH3LC7Eyakb+IO2RP+8wczyGhuuAWtM00zexgfmmuAkqmLcUgQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DQmSOd6N; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4210aa012e5so38759655e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718005118; x=1718609918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3sXZnTrFx1FLNku3UarqNq102veh5s5DlicL0ytOPY=;
        b=DQmSOd6NrsPxmPI9wUvdC34r+48+kXctKUkQSLIt62iTcVnng2BBOajz00JROXCrIK
         H+UiCAAg3lnkwNCVIOtEbAHd7Fojb1VMTayHugyLaUtJJpUP+tfRVaxTHr5dUJV62B0G
         eLHT3Zz9S61VLepVcyBSsSR71apioNOFgs+jn9ZVEGn6HciNj4vbAT0un7OZ8Aigpb6t
         yYceJYG9ZWvaMIFKXfXoMoN9cgg2ZEhzyFupzvwjGQKMID7SVoDlMb1rFeOIF9MGiWS4
         zj/ZJPCjUDjgjW+ZeOZvqodl8leEvlBEYL9GBkFA02lZZCIcku+JFQ3LNCCMitzLGsw4
         MSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005118; x=1718609918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3sXZnTrFx1FLNku3UarqNq102veh5s5DlicL0ytOPY=;
        b=fBs6fRTCXmCkFc5/K9nJ/TiRgatNeBao6l67a1HuAYE/1C5sV81qjHxXOgrDQl5uat
         spw3yvgcW19XStJgUExB8T+kfN4+eOSsB2T1aiiohWHXEow+SDbeVyLpwIkz7kQow113
         CBvDZUv/1LxZWaj/NGy29waJxTrsjpXvSQcj2jpnVhnzMPhP5+LTxUAWIM7FOhpGxzmo
         i07KpW1MpXq2e16SYGZgb7ikaQVr6wZvo3PcoTlg2kUP6eMRkMRjdFJz/14qDZAWyLxx
         ppLpbQWRaEmXxcsNNoqRmfpubYfzmSj0w8KRPEcgsO3vL44bP1ICHHa+C4wvzlO1eHw4
         7EDg==
X-Forwarded-Encrypted: i=1; AJvYcCXZoQ5cuMUXNZh5h7mVHAf0J8wCI26gbhIFkPCCVa6/RfPU3uuH//VXNAqESYEKshzOM4itZTBXfpshwhX8xj2QeKtYPvpARSKLkQ==
X-Gm-Message-State: AOJu0YwJMfUJBiqiDroevCLTKIYRha7pN29LEctPplLAAHaa8rlPCRnP
	mGzUNdoYZRhuO/K3yQ3xdD6B7b3EU9JDiplDRiF2xtOea+nd/lXFdb33Om6lt9I=
X-Google-Smtp-Source: AGHT+IGv6yWdP8pzscvWRA8dl/BXTGiMUSwmqHfHi0M+GCIMctO8PARtwXxuupJU4okqHnTCWtagZQ==
X-Received: by 2002:a05:600c:3c94:b0:41a:b54a:9ad8 with SMTP id 5b1f17b1804b1-4216499c726mr75618785e9.0.1718005117749;
        Mon, 10 Jun 2024 00:38:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:b790:b49b:9038:8e99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421580fe371sm166778035e9.1.2024.06.10.00.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 00:38:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	Huichun Feng <foxhoundsk.tw@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	corbet@lwn.net,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	warthog618@gmail.com
Subject: Re: [PATCH v2] docs: gpio: prefer pread(2) for interrupt reading
Date: Mon, 10 Jun 2024 09:38:36 +0200
Message-ID: <171800510952.16671.14245266233040448666.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240609173728.2950808-1-foxhoundsk.tw@gmail.com>
References: <20240609173728.2950808-1-foxhoundsk.tw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Jun 2024 01:37:28 +0800, Huichun Feng wrote:
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
> 
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
> 
> [...]

Applied, thanks!

[1/1] docs: gpio: prefer pread(2) for interrupt reading
      commit: 7f1e45f4ae7671550e15354ef87194bccd99ecec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

