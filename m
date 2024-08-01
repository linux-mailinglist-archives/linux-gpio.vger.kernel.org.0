Return-Path: <linux-gpio+bounces-8505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 254519445B0
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 09:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C302C1F2410C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 07:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633C516D9BD;
	Thu,  1 Aug 2024 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FU1jtMSU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8A13C8F6
	for <linux-gpio@vger.kernel.org>; Thu,  1 Aug 2024 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498064; cv=none; b=ZdorBkYhfOEvri3q1XJ4n6JXQhC0XkiiWiMGMOs8ZLiDDdq6HwnT/RD/qeu7TQjG+tFPvUEQCcCTJlNT8oVkBDIF4nSgneFHKNwr2N0SGLQ2Eb9JuTSi8MU1t6KZ6F9TLQpcmoCmPpqOhTKWHMiXove8Rs/DAua6q8ms8ZNGax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498064; c=relaxed/simple;
	bh=krH7ypeUqN8jDA6yfuVAcTiknvkYEg2mDdvvRTl469I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btW+pj1HTEEQ2gYkgnnotqdfXysd4GwCGAcXZSzwedsdcAXUuDgnaAQlkqhEMWbjtO2d/BYrbix+gDAsB8LRGrW+FalhJQfampzjSuqe+04wVD/alL0y4enjA0xxf0qXYOWQeHS1nXjW8tlPO5KepIhHaAagETQ5dXFDrGdWy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FU1jtMSU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428141be2ddso43324555e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Aug 2024 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722498061; x=1723102861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm3f85uhokoCwnyo8e4JOWvdJx2L5ag+T89tC7r1kfY=;
        b=FU1jtMSUQDP5TT+cYrUfzPjGj4ms6TGBCiN8CM0N9HWXQoPmkqjl0AG3inyXAFyWk1
         HmX+hTP2HYa7q5LVYIbcUeq90J1XFYKgWWd1HeHzf4+7OKYywzUURDyqBAesswwg1uva
         VR3mbFChFdWWVTfW9Lf6he76zPpMfVtSg/nLO5nV2s/+rYfl1lDw/1jwBWjeKuz9Ji3k
         I6ejCRfHPdDpwbHz7bycYUpzMMix9cUGPiZH8FPDFgjnUHqEp8Yg8mnnZUvk6B5NwPDF
         kl9podO0HZdBf0kJxa6cCR2WLoX2O9J5eEx3Z1mqVdb3cCJot2ZfrBcQLRh+uwBWpJwK
         J4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722498061; x=1723102861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm3f85uhokoCwnyo8e4JOWvdJx2L5ag+T89tC7r1kfY=;
        b=o2wRyuMR2k5KPSGUj9vqdIDu27LWE2X7BquE0PY5IE/tZSSxLlITC7p9kP/ntas97u
         1MFgI1Wd+ba7hpmQUVANbi+LW1uOt1DImNJFq19aL96tuGdSX197xaYlDxnQLSN/ktsp
         ygDOehGnMmAZt+aKzcrVcNWQiqJFd+0YOcH5uWHEh5iMgXUBxbuAEkR/oLpCh4keJG4I
         LAFGiqiAns+Mz4OxYlVanO+654ZQWIPOrY3vDoKf5ozZSCso4tIw04veNym3l591mRIC
         l0FE+FgtCktO46aEqW+psuYx7O2BPUylALkT6cVnJo84zKO8ceJrrWJoVUDxkc8+6wZZ
         rjHA==
X-Forwarded-Encrypted: i=1; AJvYcCVkoMvpGCurBh1zP6MaQWyTU0ev55Hn8zAlDJzvYBUpIPkVWUO2VpUqbULyxgk2s9lZaz/TLoqqYeCNR7+ot97GxRg5DS54stDdJg==
X-Gm-Message-State: AOJu0YxjoldiBe9of5cd++Gspwkm8Tcet6ZLdpD/BA7j43tftZH/sI4v
	3N/B7SFF+jTXTOZceBZePshdUz1x21ts80MDqX8X+utaQTuVoInvAs2FHTj5JjE=
X-Google-Smtp-Source: AGHT+IHQHaSYh2jUxkcP/pLad2DAnJ0RUYC8hEpaSIH/fQUOuBzUH5+9XYCdQVAxwK5OOIu75I3Wkg==
X-Received: by 2002:a05:600c:1551:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-428a99e36a9mr11537895e9.6.1722498060379;
        Thu, 01 Aug 2024 00:41:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9895:bf13:f4de:f316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42824af5410sm63708005e9.1.2024.08.01.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 00:41:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Use of_property_present()
Date: Thu,  1 Aug 2024 09:40:58 +0200
Message-ID: <172249805624.7809.3439731825920419370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731191312.1710417-3-robh@kernel.org>
References: <20240731191312.1710417-3-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 31 Jul 2024 13:12:41 -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: Use of_property_present()
      commit: b034a90b2745e43b4a85b56dc5fd7a6fa1a21f31

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

