Return-Path: <linux-gpio+bounces-30089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3ECEFB72
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 06:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A051300DC8A
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 05:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD2E26FA5A;
	Sat,  3 Jan 2026 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+kqM7Vu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567AE221FCC
	for <linux-gpio@vger.kernel.org>; Sat,  3 Jan 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419733; cv=none; b=LfFWThrIOoHl6AFecU0VCaU+KigvobzF3Dyx+IG16QvLf06oPnc1BKbBVqzjaxUxcMkvoA0bOKjspFoq/YiDQmqb7X+evA/X61Ty7xMBOd6T+IwK9tQeyPYx8lBRFgbWZ/E7OLVEnIKf13tw0ZQrXuC2ftp221lWqGIkF67NXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419733; c=relaxed/simple;
	bh=3073OMvs0/LjEg4wr9mG+ncYvQgejlGvftaRsNqKdQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2KHUD4Z2Iv8ymqkQFWZzb49QVGuGjXOOkZp4YwEStsO9dq06lvFqFvucPoOPBCO5lO1abbeLBSogMBHt66gqt/hZqsSJAABcg9DlnbWzkKUJJwas+Ng56aDirZY7WLlc1DqLOPtWo26da8Il+x70aPyUUuRvcUk3DH3gaarV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+kqM7Vu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc3056afso6828768f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 21:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767419730; x=1768024530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3073OMvs0/LjEg4wr9mG+ncYvQgejlGvftaRsNqKdQs=;
        b=J+kqM7VuDohgXrxd7lR0e+wM8kyPNyNEaGS5Lz4WeHSirtVEiESBLdKpTjlSRn+YnW
         m9DjtzH/UrfWqt7je+tew61V71iFTpoy8wveUlhAOgQb7uP6dHkt+khvseylqwhHICrp
         mmp6at4TYAATsexL0XC23eTaZyEIJIUZFKWeTLNC6jeR6FDAjTBAMla111MfvCzz8dUD
         k73S2RHTBRluZ5YzqhduAdrX8BjksTWS64oxr5zMkJpVq+kGroF7I76Xl5zekIwG/93o
         O17lUOqaw5i1kNbMBye78zxE4VHUHFQtPG2NGHTFbOhnC6kiQoOvkZ7g80RAog6pgYpz
         In5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419730; x=1768024530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3073OMvs0/LjEg4wr9mG+ncYvQgejlGvftaRsNqKdQs=;
        b=iPAgVbYOUFk/ER+DvX0bD/VPkatsmf8wIx9ZRp8Li0Qs8CwY56SSae6NvpK4Tny2Zd
         JfWfXU/A3O7gWXlJ5CClhkmRi0CI/uZYmmYCwisLwloV/Oda/2aQ7hgwgHpRoiMyuAzc
         JM1NSO41+myW44TeVeHy33Vn0KBX37WeDG6HvREYntEq8F8j3QrFJHM2rScBxg9qXPA2
         4HNhUGFv6DoCkC/r//iCcIy8R14dw2zGesU9EUQrC4pSO0bSzYHP4uJrmUX3k1STeeyX
         ZAb1or87ZG9zsrNsrGlw686e4z6drrgGpAfP2bzo0YtapHiAdRZI5FVgDvDurli2t1Ur
         5xZw==
X-Forwarded-Encrypted: i=1; AJvYcCX6z11mS65Bz6giI5ZSaZBFjbuOGxo+4DAdZ30fb9yWPBkebovTuDxrpCxh5evqrtLX4WMjhbfm1LMe@vger.kernel.org
X-Gm-Message-State: AOJu0YyjSkTifQ1bCk3pYqXUBlp07vQZDOc302Ej4PP666AMTvGniVGc
	zZ603corErUijCSZ4H4dCws+lpYA3MgVEZLXkTMip6G3usdrsQCwGEO1
X-Gm-Gg: AY/fxX6RtrI7mKN/Z63VvgPUjmpZgi06gjnxHGSr4zu2D8GhG82LrHC4QDfyuAK4C1c
	LCgRkFRP+mkQI0glE3cojw3JP16xG9XwfKzbLE2MSNTQHzQX7sL8rNVFbltOGzNQiOCcCteFuFh
	QMQFosc5QEYnVRPen+7AzSCIOLqihy+R/9plkKAIgYiu2E6aU5NXEjdNf3bpE+AQTIuN9BK1BLJ
	imC7HoQXikF1rz6uMYLhnP/aUw6ErzwK8F8V6QV3/1wuzQshJTeRWNKMaf1gehJ5a2gT+AzWy5+
	oG6NxnjY9iyQHJDJOcTFoaodCKynhcSpag48+NNtpxn3ZZYo6mpxJRiL/z+G5zw/e3mvN/0O6gC
	EMBabWwd+BDgl4vWDdfPens2khjxRXGdxoKJjtFezoFYETy+0GM9af8jLfslcqkEG5Xo/xhVngA
	hJ8MyGwx5o2d4Nmhxlsd05Z+dU0jTbXzSgJMAHxaVK7poE3Y9dMMGoR6HiqrT1uYB1
X-Google-Smtp-Source: AGHT+IFDlUycpHh35Bxl9zkKufMif2HIaPtEr71It/NuTPMJMkB/txx1IFoOyyH3seAcSTAkGZqUKg==
X-Received: by 2002:a05:600c:3b07:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d195917d2mr509496085e9.35.1767419729438;
        Fri, 02 Jan 2026 21:55:29 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be5a555sm10532405e9.4.2026.01.02.21.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:55:28 -0800 (PST)
Date: Sat, 3 Jan 2026 05:55:27 +0000
From: Stafford Horne <shorne@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
Message-ID: <aVivT0ruGpwdBO7L@antec>
References: <20251217080843.70621-1-shorne@gmail.com>
 <20251217080843.70621-2-shorne@gmail.com>
 <20251218-muzzle-diploma-25832f4af271@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-muzzle-diploma-25832f4af271@spud>

On Thu, Dec 18, 2025 at 12:55:07AM +0000, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Thanks,

 -Stafford

