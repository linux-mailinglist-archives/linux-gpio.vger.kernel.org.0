Return-Path: <linux-gpio+bounces-11840-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF39AC6C1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 11:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC48628648D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 09:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF8B199384;
	Wed, 23 Oct 2024 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfciqWTS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8081586FE;
	Wed, 23 Oct 2024 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729676268; cv=none; b=MFH+aj8Er4wgGjhWcnuIYpCS+dnMudktKKoxJi6MoqeSZB2yUhI7o2ksVD3hLJzrW/hALjjksn/amIx58ny8Mc9I+NMgrJIZo5VQfR1jAB7iI/kbNHkIdmG5YeEkyKYZeegs7ZoQJyE+eX5EUkH04xmuVWPssHMTQSNjwOJucHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729676268; c=relaxed/simple;
	bh=eKHkaNfVW95RqBjaVbuk+1RTrbIoLjh24DVEysWLzBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdr7kTk8rMB8tvvhH2psjoxicb4nP4JiIpV6y7Lc+GxUoQYfwJZQrN4chIUBsi7Fd9r9/5M5AlBXvkvoMF8BcWkKVbDz1gRfKYB+DxfdYZnJKfl6xsaeOSqNhijE2KJSjyWdndgmKLOM/AdreGi13IJWnkDoC1iSOlT9wszQ7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfciqWTS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cf3e36a76so64570705ad.0;
        Wed, 23 Oct 2024 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729676266; x=1730281066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=;
        b=VfciqWTSR19zu/RS6pPWvhWyBNXik7LoOmntk/B9/oZ5fRhZvpVPAhZgj5AzcyS1YV
         Fkqan92jYPzoAnH2+R6pwrls6cYM6nDgG+SHejthE9vAs8IQdGP++Frh4Ol3sTaQvxqD
         ylLp5CBG08MAYPJm5K3N3+lbjiiVxQog4xje4WrKGingvqmCRWdw2I4CweEaZZc4P/5a
         poL10RZA58BRffoEQ/64layOWBnHS81qMcxMSCG4SsGsHI64iVA9OJVphCNuw5DRFTXy
         4Ca+LvqlOZgSdSFT8gKpTtZHP4GZgR2Bs12RFy5xbZcc2NKyKA6HKAEct3iqruhBCTG0
         edpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729676266; x=1730281066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICmxhOxf3rIdsIFy95QRYT4rZHpdER7Q9+r8wV6MVMs=;
        b=kXknRIqckA6A1HHeCgJyEnuQlg6XADn8wZ64gihCam9P2SXXqOuWfhg+wqCcOSCxMV
         xp60FqIbTGeF6Wp0KNt3HRu4w+7zu65S+03W1J7SHUakop3HGv30Pvh96Im+KTdAu6v4
         GFZfSZ+w5fDSez39fOtoXItfylnPcjKvLgd10MOZuKO+h7ji+vNPVMTmJY31gIrZjEMx
         mMASkofYwgMAC1nY0ou7OuqOJOGWeUM+Eb7xssFMfCzOzAv+cdAK4hDZrWUVPmsI0oxv
         BDpRG2PC6+/vt7BtLr+S+fpvavuWmEL09l5JXY00X8DdRQ8j+yQRnnTZmWjosgCHIuKE
         AvNw==
X-Forwarded-Encrypted: i=1; AJvYcCUcfFlRJBLRxsi1Uzv+HmBTOwzuYUBXBZ4lbnm+LDdgZcdBFkbUT9PbrW/Cnekxd/BpPsozU9v/hXKpScovW4o=@vger.kernel.org, AJvYcCUwKFiZdFsja/AWshP9SfTjwvbYt/cJqePXifwLPOWT23FIqGENvk/ocfLomiQBAUEHrAfIydkYrfF1Hw==@vger.kernel.org, AJvYcCVl8y3pjUw3MPaIi9+6xKhycfZrQbXLYPykeLeaSlM0uwc2WG2YrUa/pfep+qh61YrKAymCAW+WeXJi@vger.kernel.org, AJvYcCXGJcr++IprIiwIWmc3iBi6DJFU7n7bBquVb2LYpuuEVGHKDPWlplOJDYytq+79oKXLcPYZJSbuTWMZPudu@vger.kernel.org
X-Gm-Message-State: AOJu0YycB4RIBkDFUtiO7JZQkvFEYCTY98iw0UixfOIO9XcZOAHMChm3
	1Ep77OV/32Ko0DaFwaZh6hfuBj+FTfHftUQRDjw9JtnrYUpYzwfq
X-Google-Smtp-Source: AGHT+IEbaEkENgj6TpE1xbgPBOJYfC4icJXGN8eoL/sRAMsaGVBxN5nGzC43ba8GaiTlcpdMpQDopA==
X-Received: by 2002:a17:902:d4c6:b0:20b:b079:5b7a with SMTP id d9443c01a7336-20fab2dbb0amr16681175ad.50.1729676266411;
        Wed, 23 Oct 2024 02:37:46 -0700 (PDT)
Received: from [172.20.10.6] ([121.202.106.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f3302sm54066435ad.250.2024.10.23.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 02:37:46 -0700 (PDT)
Message-ID: <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
Date: Wed, 23 Oct 2024 17:37:40 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20241023044423.18294-1-towinchenmi@gmail.com>
 <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 23/10/2024 17:05, Linus Walleij wrote:
> On Wed, Oct 23, 2024 at 6:44 AM Nick Chan <towinchenmi@gmail.com> wrote:
> 
>> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
>> iPod touches and Apple TVs.
> 
> This is a good and important series. FWIW:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Are patches not getting applied since you resend them?
This series along with the watchdog reset delay series mentioned in the
cover letter have not been applied.

> 
> Yours,
> Linus Walleij

Nick Chan

