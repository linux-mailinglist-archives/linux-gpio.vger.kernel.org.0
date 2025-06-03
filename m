Return-Path: <linux-gpio+bounces-20929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F28ACCB93
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jun 2025 18:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26DB01894EE6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jun 2025 16:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410A1DE2A5;
	Tue,  3 Jun 2025 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bxl6+Lk6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7421C700C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Jun 2025 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748969892; cv=none; b=RmkpHWldWUMiNmeGZoGC/inh5eFeMNx+xWkFDP+TUEwR7+bIVJvxIPv9Y/FGmyYGJdyZvy0egUwKWwdlh2j1R9d8/IQG+cf1UpiONw3BC20EJX0aUq/g1jm3Z5mfDyZJPs24GBToD2lu7NOTNqYp/4Ene/MTd3+WLzdPldYhhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748969892; c=relaxed/simple;
	bh=SxQffaLk/ePO4XTLj3gEDwIUy+EKQ+WAilz+k5puzrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqdoD3STm6MdP1mVvlnRSzDb1C6fmvKVR/UGzLQMr8OVnyJMVNPqL5dWhtZ89pJOZFnlwR+4SzbnehLefqM9ow70tajhqkiEVrqqanuAVwKJ/Z/0MJCamuVLllVKhy6faV5vfr0pXgz3om94TcOFuwZgGyHuDa7UmOPFxXsoMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bxl6+Lk6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2079664f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Jun 2025 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748969888; x=1749574688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccNoqzH2YREcHSo+qZPIJIJ2z7NNAiIydtbHimyTh7M=;
        b=Bxl6+Lk6xR2WrMHZprlY3tQUZVyxhM0fUvK39ZRUvmHzq55PcU/+hYODn34MhhpRyC
         A3ulZzgsOCI2G2aCc1UjqD1YpYegw29R3knXLkTS8297/eBHYeBoAKtgKjgCXAyQgdqk
         6BRnKuwmQyzSocuXvBQ0/TO8bkRO5q6lhtbN1qbJ9zSzOf9fuRYYkVTTsRmJcmrdH3nj
         TtDFbg9yyRzDsp2YeNalcmdNdv39vq9+zvcJRPkQ2wtbwGClRQ3SOPWtWdfvZRvG6dem
         ax4ard0VJB3w6AMKugAMgEQbWyrw5s3fBWl8haS+dm7sX0gH8JaRIt+pWgf4H3dGeeu0
         NPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748969888; x=1749574688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccNoqzH2YREcHSo+qZPIJIJ2z7NNAiIydtbHimyTh7M=;
        b=X48jCawtTV4FfhJupraJxQs0hNbfChEKarApsOuED8fjYUdjTGfTmHHHAQrg72zefk
         ratMiFGaMvok3HG3cO2Jh4tQRh5MzUYy3uR05cGwQvClJaPqLcx/W/6pqHPaDofopQEa
         dZjfnJ7hfJN40dKkKw0aYCjO8OTe50v5l6i5MGONZoflfWXeHKVsZzO3nMjTRPKYqJo1
         dhPjnAnJQaFc+de8PMJhuJTtfQAudl8JLa2jDXxJI2KWKOI/Io8VvF9wSqMDcyYeHlUd
         mlQhsL7I6sdpYAlHfXQhzdPnKfhzRVc4V6NtSsyORoK1Mk39I7w1YcwH4jXkONUh7rbZ
         0poA==
X-Forwarded-Encrypted: i=1; AJvYcCWTpBLgnZly70tBMy8iTb3xtOtY33RGdcysXifvEdcGDLkviOtIL4buD2yn9kjyhQNJrG8CFjR3jqv/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3qi5s1Xuy6CQ5XQJgDve6uEEZB0m9oQzjNZdnDS3WL6EMbxx
	5V5HyS4YzVniaZ4zdX5WfX2dGeVeH43hpvgg2qbtmsyhPlnkGSyPpcHWAF7WILHHxio=
X-Gm-Gg: ASbGncuS1pAsfVt0tvnKPNzwFPg10PbD8fmOnPLFMgiWYAwWePIK/koqwn3l0FcK560
	XjksMAZW5xK3/9YaxlsRyQWQ4maexwsS/w59rzILQxQV4I+qXvMgJ9QWirX8KkFpRLW4/R1W88H
	xrZnuyIf4pPt7Gjgl++n+gEqNu7rs55Fxv5ONy51FXklUKUQ1v6M+eaJluFKdULPQEmsDdyMEUo
	fs5FegsLEbcVrgCBriuWl+Zo384QgMpz6hiF2tUxHEpZQ1CFyCmadkT7nlbyB9vDFi18QlgvBt4
	0nEJLZXq0RGhCGTy3UnjmlFisHreEZ/h0AdEewdSYML3zTK/sGc=
X-Google-Smtp-Source: AGHT+IHBMtdTlIwGsVoBtWlaaVinaFgRNiieu2/fV6dtyLyqYjcqrDNsPAhVGLXR00LdonQ8SiXr+Q==
X-Received: by 2002:a05:6000:3106:b0:3a4:d9fa:f1ea with SMTP id ffacd0b85a97d-3a4f89a7e5amr13578275f8f.7.1748969888511;
        Tue, 03 Jun 2025 09:58:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e7f5:7d2:143b:1b26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c8b4sm19243499f8f.36.2025.06.03.09.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 09:58:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod] build: drop python3-config check from configure.ac
Date: Tue,  3 Jun 2025 18:58:06 +0200
Message-ID: <174896988148.96138.10990602570346671235.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530112440.124178-1-m.heidelberg@cab.de>
References: <20250530112440.124178-1-m.heidelberg@cab.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 30 May 2025 13:24:40 +0200, Markus Heidelberg wrote:
> Since commit b7ba732e ("treewide: libgpiod v2 implementation")
> autotools are no longer used to build the Python bindings and thus
> python3-config is unused.
> 
> 

Applied, thanks!

[1/1] build: drop python3-config check from configure.ac
      commit: 088c66ef20662b76eebf03e71f11196a5ae14b33

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

