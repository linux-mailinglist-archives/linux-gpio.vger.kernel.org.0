Return-Path: <linux-gpio+bounces-25602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8AB43EF3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E70D316F0E4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 14:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777F4321459;
	Thu,  4 Sep 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QGSnNXd8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC454337686
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996308; cv=none; b=Lu9nlwRu++WW6BZVAAqEgwAJDr3Vh7ohBL/YmErkVBajqklUs2Pni94/0hZcGE2unhuDt+AJ0xWKfxUAcbNyJ6OKyDq6odBz5zbVvSwt4U39yjejRZvbiWvQIRvvS0IzI9DrflpWe2dAolFyOs3BX09ZbtBwkKnVpZLyX78eMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996308; c=relaxed/simple;
	bh=z7pU301qN5RSzlZY8CDhBRBS3U4WTNApANa5rq8fplY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSf2Bxnmn7bNbV5H4RW+mtF7SMSFoetKwWq3osPNW5gNoNqPuo7jAm1wTK2ayev+FZKTOajv5pGaaAb8Jc3QVTkynfKA32jCvrkwLGRsqnwi4QzdthZI1CaR7TwLDQa4dIHVMl+Ay/6FdibC4VrI+YOysy4EJpqnG1x9/k6xypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QGSnNXd8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso9509325e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756996305; x=1757601105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NdywsOyjdkDiRe/+b+HSItb4HDB4ynduYkGNWZSwr8=;
        b=QGSnNXd829I69Zg+6GEnTdSXvn38Bh3gt1x860dTtkY/lXUfk25EVXGr1t4XRsuKki
         G5mnG7//BJ92zQAdS0XqVFKS91Y1FnezfmPVpvBtAdWRza5RAJsNvTltqIL2XggKkjvu
         WoS6MSgwESIYuTg0elNFZzVXaABlpfZR3+Ym0qy5liqYqmyfJxxzEhw/SxHm3Dvnywqk
         WxUqTeL9iZrTgFjqZX6Qckb2/QTrG6ZoAccfRiaadKB4rhBhNsA4/tbbT+/DPo6d8J3M
         c7RNKRRc1sXrjL6dDhC++SSRi+8IWP7q3ilwm/AwDNP9+ipwsXol24jFbrutFnDyWwif
         bTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996305; x=1757601105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NdywsOyjdkDiRe/+b+HSItb4HDB4ynduYkGNWZSwr8=;
        b=PBcKopMLdNX84c6wXxYZFMai8G8Ug8ZMCCzPlQ/W9AQ2UD4+zUD/DVWkT4UfEQRze0
         h77sg8xJ2sIjsxTslJBgIYlhHXLBXgXMRT+DRWj2pcn5MYnVmJvTk97vAyLo3Bo7EReY
         /4uHXAdc10MU++twZCyrnjmozBz8lIOar75Jme0H32GAAuslu8I+f+P2vvFfCnxhJfGx
         jFS8oDBqjbVxRXa80pYm2BU4QlYfnPzcHzzGvTYotJyBm2hnO5R/K0hq9MsirzDSCIJc
         3zmE3O8JxDmv9Iqo24LcS1pZGpxh3JX94D8RWUb7jRGROBoxvi8oZtBE58zJ6/WUPXYI
         S1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa8F2VDeJtN2j5ugEJPnirQrUW4awwlbcNssUtPNenxLzWjk9WM3mCXiGYVB/f8b1M0VLpeffz2Lt6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/3qjxoJWjN/tlAU/Amir1aer5WNe4/sB/SPYL4ahF4OE/AgPg
	Ij6zauJP8KZx5YGtD11aj0ARdzbNldv2LKq9fbA+XTKqkhMwqAjBvSRkd4eA7NYkecrfMZ9FWU1
	vOfhpRyU=
X-Gm-Gg: ASbGncvchKFAkZmNFUjqgOfU6Lz+6x0hAd6w0RV9PKuJjbQq5nTd4FyVG5cACKo6ky7
	J4718bPZz+nSFDsQuZjj189+22YktxF3TbICoM5yqeST0I07CZuD5LUzkvYXH4HlVobfUjN8cpg
	LXh0/z5d/Ja+RqpQu3wHnh9e/qAampHeZjmLIx/nq+C+v3u3rH3J3SS+OEBMn72FRXcQxhhUKrM
	uelrcju+tQERE5qlj2NUQPr7NjxCgyB3k/UkHUqsioDrKivsPCofhTSpmlC2+QFNCtG4e0u1+QR
	SGnXfRgp7Py1cCk7IojyODGKDlkS7ubAHtujkvUUOXqYKTYICNE8V8lNhkPQYmbN3v57eGcYhOX
	63nxvSjo/3yyEfp4TvHJj7jQ=
X-Google-Smtp-Source: AGHT+IFXvXdGc6f5H5pPzlrvLjHoiygtB9yAgkixLIkLuOxDxYYjkerLppwkC8XIDL7Kyt9fmkZJyQ==
X-Received: by 2002:a05:600c:1d24:b0:45d:cfa4:ce10 with SMTP id 5b1f17b1804b1-45dcfa4cf3dmr27357855e9.10.1756996304971;
        Thu, 04 Sep 2025 07:31:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d1319sm319642535e9.5.2025.09.04.07.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:31:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	warthog618@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: rm include dir when make clean
Date: Thu,  4 Sep 2025 16:31:30 +0200
Message-ID: <175699628268.79535.1530693991646063200.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903063621.2424-1-zhangjiao2@cmss.chinamobile.com>
References: <20250903063621.2424-1-zhangjiao2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 03 Sep 2025 14:36:20 +0800, zhangjiao2 wrote:
> rm include dir when make clean
> 
> 

Applied, thanks!

[1/1] tools: gpio: rm include dir when make clean
      https://git.kernel.org/brgl/linux/c/ed42d80f3bae89592fbb2ffaf8b6b2e720d53f6a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

