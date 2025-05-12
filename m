Return-Path: <linux-gpio+bounces-19973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D0AB3CB2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 17:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F46119E2D9B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 15:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E385623BCF7;
	Mon, 12 May 2025 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OV8qbHvj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93EB66E
	for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065053; cv=none; b=rWK8fA+0j8++cGyNATHZex+O7jJA3slDQ4g1wDkQiy7CCknFilMK5vHeLVGzB9c1dN30CwWHSVzqjyIB2EPra4Lhg66gSRaMeLxrXoUw04kNuG/R7h4ivcSXKjx4Z/oXuuCVXpdXHYQ5xKCzu7JgK7iEMXDjCOTnOehyLPds2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065053; c=relaxed/simple;
	bh=g04ojqJSgO5fmCKDjJblgC5ZqP751lCrvJ/UA1FmmJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kc78ycajXUVM6mHkefd7B5+CBzkLzMtOl9UkE0Yp91yQ7/MLU3NTiEVGUQsuquaNFCkEpZfnTSThe9Lgv4aLmXRp8EgQll6w7wwRKamnCL/HlfDAihm7ogAiOi/Lapwqc3hXzluBfF+jQYxhUUShOrHm5CFKnk+Ba76MSGWus9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OV8qbHvj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edb40f357so31726085e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 May 2025 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747065050; x=1747669850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgal0nArzlA/5FhTbdC2bKf0czreUrrpYhFqhZV62dY=;
        b=OV8qbHvje2Tr90X4hTfyTegTYBi5HLrdtixLJz88Vx8VbIzTsR0tURhE9TACfmYtqS
         8RF+sKhxvkhqF9mjkCam6GBbwyS5yUvAYWg4vAPxD9B3q0xWFyRu+pHpuQDcj9P/MNNo
         4pebljuWxH+Pg1NYJnACRfMm3UUvjkmC0YpJHOGlHWUFHDGsYHooDeq1ZM5QRFqUZMO5
         feSCqK7pyq+cDrGPM6SN9E9ksvqTKCGH2P76n007bNpNYCvawQ0O+/7wgfYVte8kgvWL
         U4b4OCS2+AoUADp9KpaHbJwXviJ7uyXNi2iEVWdcWnGvJ7suK52BAaNxKjr2eRQ1CIcc
         tlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065050; x=1747669850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgal0nArzlA/5FhTbdC2bKf0czreUrrpYhFqhZV62dY=;
        b=aJJCLYIQLRKOjlSMXwVRq3fbCzejDR2sK4RA89WKUesPmccL5Nz4KGMUUngpbC/6dn
         bCWB5dNs+CJ6GDWySRkJ+sgJBe3JzybroseSEAwdFkitaKD8L8G5udGEMtlgZWIXt6gO
         iTfogSqz07zSEzd9w4UQC+cX+bkjJoV0bMwXwdxjOIt+r0DuNApDY731gxjy3d9ed2EU
         kuL6d4Ixf7s1LR+1t6juHLw5Riwzu/KXqqFHgdZpgNqDOpkwe4PFqqpJyL3TBwhhVxLB
         w6Rof2BH74JMo24ahgG5qa6qQ7MDOpUkXCA5q8QGBULhUQQb412n3Hwc7xXOsqkIq9mt
         T7ew==
X-Forwarded-Encrypted: i=1; AJvYcCXpSokJO6L25Augfv+JDVKbMKXIxCqxdb4V+1TFDZqczljli8zGVVDFJkHoVpaatXTsxpwvHBf97Wn0@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWLcxIhatga9UPnbeHz5Na5A+fnukTylOIXgMwZaEFQg0kZ1U
	QSZngedL0gDyB/dxSA1E3q35Zzl4V7nU3zSeExTX1k2uh2K2bmUQ7f2muLQ+OHc=
X-Gm-Gg: ASbGnct1KdjiAlxmkJJu7USJDLwOIAJ8lr0Y0FgHcX7N2B605GMalNIKZW824NQUX+u
	WKW0dg+nWz9bDg+5aUFEaWvkmnuWldgoVyalQAkY05leINFjoqpofx6/QF4n4yityZJ21T7cuU3
	GjRr9luWnZy+VMhvwq9XRvvFPpM89/nlUuSatMsfjVgmXZwUBlvECi10mVqDG8cWLgFYRCgEAjv
	QdX/8R//aLuzLgN6K464VVfglAJT5UGujKhf+gWBB1YGKil9+rnVgkoMyrOdaoOsPV6yswAbEe2
	vWR8fZnvD0O6V26rwazXQcjt2xTn/KPXpCc2OURMwwnwWTFoUGNNstgji87Ok7ST+K3ZJC7JO+d
	RJTqHXt51hOf59P0cxLsnbD7N
X-Google-Smtp-Source: AGHT+IFNsW5+O59HSqMycKUWIsHWCl2KtZenWg03LyVBqJ/RJXz1dJUqh7GeQ5WUQwN2fy2P3TFvMg==
X-Received: by 2002:a05:600c:8207:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442d6ddcf2dmr111987515e9.27.1747065049729;
        Mon, 12 May 2025 08:50:49 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442dc6f1a51sm97931075e9.22.2025.05.12.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:50:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer
Date: Mon, 12 May 2025 17:50:47 +0200
Message-ID: <174706502332.6905.5544454633711754338.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424212234.5313-2-wsa+renesas@sang-engineering.com>
References: <20250424212234.5313-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 24 Apr 2025 23:22:23 +0200, Wolfram Sang wrote:
> This was forgotten when the analyzer went upstream.
> 
> 

Nobody is taking it so let me queue it with other GPIO fixes.

[1/1] MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer
      https://git.kernel.org/brgl/linux/c/579cb52ecd46ce0351fc3d40882ebdb60332a0bc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

