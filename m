Return-Path: <linux-gpio+bounces-13619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 173CA9E866F
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 17:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12D971635E4
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Dec 2024 16:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892777BB1D;
	Sun,  8 Dec 2024 16:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OS7lJW0K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923DB15C158
	for <linux-gpio@vger.kernel.org>; Sun,  8 Dec 2024 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675432; cv=none; b=Cr0m3Vhdv9jVrMaIm7L/x+L1MclgmvIghT4WJZ+G5JbqRROqb+IHMGi8xrE7qRsllcs1uaFw1cBj096+WJOPgW08dBRjKIVFQQmgWsLsVS1/9TUf49AxmiFCeh6CQGmvIXiWQb2FMSOP50UPWcXUEW+Mbi072NzWHqyWBzyRyhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675432; c=relaxed/simple;
	bh=OFDmGehoK600SvToI+7RLgjBAFQXs+mVcolPpCj+dNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsO/zo0PKNqj+Xx9r413kowUOpqqkJxrXuEKN4k1SIDoFNMgNv/YseZj0E2lrNnGUjngzEVXXn2cynozMl64wm0KgdFTidIPDTwcJ/wVjSykW4laslJwiwvRE5zSgtz+vsICfegaySIzHtrkUCHD5Y8tHKHaSh+Zgitf/+Cl4rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OS7lJW0K; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso686298566b.3
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2024 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675429; x=1734280229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=;
        b=OS7lJW0KQwPj/dpK1GsZlGQK16iHFjm/dbXHlyMetzafz2DYnsdy8vBj9qCJJT9MQL
         r1Qco8HEW68kiTVWGTw7+gOrzyMzM/kgyHS/vOZmr5cLxLilwaEQzIoR5WM5qsezSQCC
         defBDd+FhjdybNql+C6qk13L6f0giVSdbO1vvDEWFNpf/OCbPFHBUO6xneIbOe0ygXUt
         csd+/DAlQcm2rB5QCjNcMwtBV0AapOSgwDrV78pVpwyjKoRWFWTyP0mZ6Z2kDZj4O2Sn
         8QzRiQ+4qM8dxfwLD+7KMaMSgiafwcEIBO0IvDJgEnw/Pi3p/aXvmEj7pS0feJAzcSaS
         dKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675429; x=1734280229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qhusLfuIgsMbQqxPaQUwX3ow4Gf24/DeZxPYGalAiY=;
        b=nSfO7uTKj3vBPraGJ97JgwVSagroAChxd69aicga/sPPz51WwouOdDqJCm8NBdu7kO
         8TiGAuiaWV3OrmVt8JtaiiXJI8LbJIvh5TMXeTAi74UOHqaNZ2Kae9xwI2U/P66aERdW
         5RuoxBbeFGNqf/NmPGm6krxWOkomDaA1O/insBpMj2MwK6J3HHp9h16CLlLUJa6qUwgu
         zLfRZmMIb70H8o67O/7hzGkxfsUtq9DrnsBNX+RWu3tEU0jjmBdBFeNhx7yw3qma3AkJ
         auRbJw/mzJqOk3XOyd8xN07XJuQyleHnO72/5zFiaoL/2AWnl2aItTJxsxmu4LlBIqhd
         Amqw==
X-Forwarded-Encrypted: i=1; AJvYcCXfBn3aFPy617lykhfS80FDFEH6pqahazEudB2eE6b9U2+Zs5KKFOYrrZ1U+ziXIGxQNR/1U/oTTRH1@vger.kernel.org
X-Gm-Message-State: AOJu0YyTzY9ftclowzNMJrZ/EIwXBCvJ8x3/DvPJw9HBsxIB65Jx3LAz
	SuPr9uWTk00u0q/6LHeh6szUzBV2ajkyB9t2PuJ2lNE586Qz7swd7ECfj/CS+yc=
X-Gm-Gg: ASbGncuvQH6+xUOw/6X7scg5HHgdWSi90zNa0YnbVTUCR9HcNicS5nNriv+hnlkWo75
	7xKtD/TE8+yUUpYbCqUw+oHqNsQffX2Qd6maGvzTEcnM6hrQ9I9axOa8h6PTv4LW04uOy4c7VlU
	W2TmlA04kNtN7zlyfkNIkkw4L3U7aRkg6JkND8h2L8RTvrH0U9PfeH9ajPM3Jtrj/iLI2l8nwkR
	c5kQTWAxq2NTreQ3QFZIOsSK+r8PFUnSrPIZbCY5VICJVCdRkJLbVK9m5o=
X-Google-Smtp-Source: AGHT+IE7YDoN13k+KH8JOtiRLrAMtuSmlPV0i3qWniWezo/cHtHK2Sxr/2xiHf8TyJV2wCkaLPDXWg==
X-Received: by 2002:a17:907:8315:b0:aa6:7148:91f8 with SMTP id a640c23a62f3a-aa67148942dmr286404966b.4.1733675427547;
        Sun, 08 Dec 2024 08:30:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68a97498dsm5949966b.99.2024.12.08.08.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:30:27 -0800 (PST)
Message-ID: <022a34e4-2a9e-4cb8-8998-d5decc4d9fdb@tuxon.dev>
Date: Sun, 8 Dec 2024 18:30:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] ARM: dts: at91: Add sama7d65 pinmux
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <a8f880b89cd4470526a2955a0b6aaaaa24ba65b8.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a8f880b89cd4470526a2955a0b6aaaaa24ba65b8.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add sama7d65 pin descriptions.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

