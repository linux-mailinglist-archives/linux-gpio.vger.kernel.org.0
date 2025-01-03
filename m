Return-Path: <linux-gpio+bounces-14476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599CDA00C12
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 17:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3649F162895
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB941FA8F3;
	Fri,  3 Jan 2025 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="meeg92BF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901491CCB4B
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735921735; cv=none; b=Ws6tBQ0+7hBvwQ1kypEklOrF/G+p9x9hkPgo3UGDKV7Mzdl1Ex4myE0wUwJz8IW5A65ubVgzmXxmdzuonxzbHR2idEFOJAGz6eRMya8yKZo2tLPjBqbJ6F6faH+4zDYroF7UgqwGjLbUfXSVwCCQb4rt5moCy8NyuVMLI2AlYuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735921735; c=relaxed/simple;
	bh=C3nfBJw85EvBhz8Y0GzNe8HwUMGRIMF0Uht0OubzqRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkH2Y1za/lMIDBCsoLLdYkBLfuo/wp4gSRZgFoR1KL/lDBgctkRb9a2LOlyCyqBLuqVL+barKoO7GNRjvbKxq/mV80RVaKvbaC3UA9YpIVEqMQmZsvrV+jToniR39N3SkLQ//nWMQO86zYfm1p001A/cPk+VecBv+W/mVkUfmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=meeg92BF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so6887591f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 08:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735921732; x=1736526532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b70fvMmV4aKmD1b8uPyIlOLVz3Hcjf4j/ZS4fUtKGMs=;
        b=meeg92BF/2tIMug6evqEnulPaRlYdVZRb2n71XIp4evbbC/NAA9p17Bl5JpWM+QG+x
         Ljx9iZshIKHxx7JAnqEc0RmY6gtD+FafUICwtoPR4Ft3m5Yo+eq8VDQOOZTUeD5+qTXT
         kLY12HVNGAW77ZqMLmTbAFm3QPjBEHG2BpD3CjikYbuVD1w0sr3ic+faH97VVaWrf/5I
         05z4pFvbMfYM/5uDIvAdbXcViioklDlIGmF9vBitjasnYwBZpx2/oQ3dTRE0SybymSCI
         8AvpOp1jqFrCZS6fKFUVJF3GMtQsJwj68g3i230toSt2N9wcZM9TGcFGY7hKv6zwKgCr
         b06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735921732; x=1736526532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b70fvMmV4aKmD1b8uPyIlOLVz3Hcjf4j/ZS4fUtKGMs=;
        b=Y8zqT0HBrblYu9WptGNkDbV1vdCn7YvBiyq0VJ1ax4zQxvlEOadzJOHA96hxi6T1l4
         +c0bOJgRUchnZuUv/OmTKmUfOglweeDJxe/X59sDpXDAURa4bk9tflWnegx/MAimSAgy
         pq79ZwsaVJ4u34st9RFwCyTiXaQydnTqpMiOO/wSlP0gg8/PZkleh1PkBN2JE0PSyGbi
         d2G9qdCi0nBv0zsgouD+fPY+n0Ogzc5b25HQ86+YmTt6mfowVwHSgI8OFaCsX1rmdzPk
         lKX4j7X3Pf0OLmxuUnYAwTOh4E8TBh0MpF3XlGL1VUtJj0N5BD1h3AdnPyTgULPeK29d
         W3Ww==
X-Gm-Message-State: AOJu0Ywq3rZLtQz5kDSeS0o59gomOI1YsteIqg24fEbtiswx2q6aq3vY
	jgvtLZUzhju9/1x2QXg9r6Q1gHd1ohpVWdeuJ+XGESnG64cjiwQ+OOOax4TxroR0vkVCAt+zgrO
	D
X-Gm-Gg: ASbGncupJ8+2Q2gPZV1Tfv8mFvcAVa/SlrvB6vEq/HttxeawwJ47W+s+J630Mm3M9yV
	SSl218p3KodID9zqVN+9yaIIUvlxDUG7nyRnSJL8kt/zM5CGfGuyeUCG0b4d29l0H4hRn2qTu8Y
	e8c8LKmqEAGjmSk5nKdbIBvgE6BwDY04VlAaeyBujRGomDpDWGCvsPT3UmIXzJC6eIJGPB/ItNW
	JyST/ZwMqQ5VmUMcjQ7Ey2IIR8nt2yeMXBt/1eruCpcPwAocXFdm+Gq
X-Google-Smtp-Source: AGHT+IFqaTOt0P+koGV9oGQodGKk02jCYtaLNDbh4BcFcFudP5wUsl9nhsNVDcM9p15QTjS8JW44qQ==
X-Received: by 2002:a05:6000:188e:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38a223fd52dmr36269331f8f.51.1735921731683;
        Fri, 03 Jan 2025 08:28:51 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2e17:369c:dc82:262e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b207sm519468305e9.32.2025.01.03.08.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:28:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] gpio: sim, virtuser: minor usability enhancements
Date: Fri,  3 Jan 2025 17:28:49 +0100
Message-ID: <173592172752.218872.9485472765451363107.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250103141829.430662-1-koichiro.den@canonical.com>
References: <20250103141829.430662-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 03 Jan 2025 23:18:25 +0900, Koichiro Den wrote:
> This is just a minor usability enhancement proposal and some bug fixes for
> gpio-virtuser and gpio-sim.
> 
> Koichiro Den (4):
>   gpio: virtuser: fix missing lookup table cleanups
>   gpio: virtuser: fix handling of multiple conn_ids in lookup table
>   gpio: virtuser: lock up configfs that an instantiated device depends on
>   gpio: sim: lock up configfs that an instantiated device depends on
> 
> [...]

Applied, thanks!

[1/4] gpio: virtuser: fix missing lookup table cleanups
      commit: a619cba8c69c434258ff4101d463322cd63e1bdc
[2/4] gpio: virtuser: fix handling of multiple conn_ids in lookup table
      commit: 656cc2e892f128b03ea9ef19bd11d70f71d5472b
[3/4] gpio: virtuser: lock up configfs that an instantiated device depends on
      commit: c7c434c1dba955005f5161dae73f09c0a922cfa7
[4/4] gpio: sim: lock up configfs that an instantiated device depends on
      commit: 8bd76b3d3f3af7ac2898b6a27ad90c444fec418f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

