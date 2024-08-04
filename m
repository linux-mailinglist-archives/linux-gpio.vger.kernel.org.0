Return-Path: <linux-gpio+bounces-8559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78180946DD2
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 11:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A91231C2093A
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C4A1F94A;
	Sun,  4 Aug 2024 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qtC3LEO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F5A23774
	for <linux-gpio@vger.kernel.org>; Sun,  4 Aug 2024 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722762589; cv=none; b=k1jTrjcNaU7odOs17AcyDWIzn77X1oXvNV4LAucVLu62fEzJVIfGo006V99Gk7M1061tb7pmxtJwh9RhaYqWQHJedkO84pHZJOAWU1yqlZj6/v9CgoaHZEYiJKg2mAR9xXCmc9gMwxO8hvZctigqbaiDZKQ7L0mqRuPJuh+v8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722762589; c=relaxed/simple;
	bh=msD+Pu+Q6D1xBrZhQ7xYLQP5vBlKSa93nvdA9bCO7Jg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l6USHjd4bS0IbA2SOUrKztob5FhWvy/hS8PUfZXaSalnwhGTOsx+2fKcalQTKn+coizA0A8wEKojB9MRLFIS8n2/fdMxWSgzf0jjyMrh6hrmRZpESNTUaDFUrZs+sDDGAgL+b1j0L7eerwPzgmrzpBRKLLR4qpd5vRM1JJ8lwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qtC3LEO7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-368380828d6so6458693f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2024 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722762586; x=1723367386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHLoWshexZhuP2J8+WGpm+0qtk9I2Aug6souXmLzt8E=;
        b=qtC3LEO7hADTBlKAjiicGaI85SYvsNPdTej84ruDwA0XRK/iZMDaJqLqDVa56mOWmw
         WjDxlx+LIZOgeS9WhopbUiBOgPApnoYkzXC2fMNAGmo5n+HvkFcYv4+IzzrV6ePaXSGl
         ED71YXCaVfL70QQ+nJDNqAcj+qPmzciGIG3JnfFbehOGaerUC8fxgaa8QUU5juHa6KHk
         1MBYpU6aA08ENWN/p7qlp2kkxWgERxSKVuAF9IF0Odxjk7ddZcHIlOj9HjBrbNMGqPjX
         3jvKgAO3RXOPZPVj6MVLtfaHG0yG6PHKU3P+IugiWjwh88FBZQiyMYJRL95bIu59GPAE
         nT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722762586; x=1723367386;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHLoWshexZhuP2J8+WGpm+0qtk9I2Aug6souXmLzt8E=;
        b=Za4nj+xg1FugUkWocGDubu//vz5Qaw9DTYb3N4sBMm552EtVOQCuOyUyO+7RWcoHv3
         F/QxVwn08PpzqzCivpKyFOaIf2/3B8frn5X3/c2gbQ1XvQVLWJd3beTB6GFUbFcmhLGF
         4VyZBV+z6MxKqf1ZJJy+RPaPLCxUUN4t9V48+eiu5wCr89Cjnq/+/KoYAtHU89ev/BQy
         xnUcbeFFyfzSAKNiI/DjHyMXxoZ9T1KnCmumflVo0T2ga5v/NDMK2CoUNdHen4lP9WIM
         0YnXrOEEhoWIdygyoC+ArGACFMxvFfibWaD251h0S4Sw8ObPhNUPJeOoLtPz6+QNL5Uz
         5LWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF9yFvHAWxIgukHnia9b3OTW9KaI6FsP3ceeB0sHd5jHl8QDB3td0Cm1hV4MTfKzIYpjgdBRKcjrzX8CSuCVDcDsKUFLxz7aNoXA==
X-Gm-Message-State: AOJu0YyZt6+RHf9oHiZj98GUAAjYYdA8P9n1j3I6zhkvfxqNGEYt7Ro1
	JNtQqLeoSOqBapUKGajJ9jlHWnKGKNTruif2Slmo6uYwaoPg17QMraC8lVM6iGGykp0ailkMhMV
	p
X-Google-Smtp-Source: AGHT+IHCO1fd/5h1ijS72pP957S/1fryoMWPBggf8fwYHEKJsA9djK2DDYTC7fOb8ySFt7DWWO/kBQ==
X-Received: by 2002:a5d:5c87:0:b0:36b:bd75:ed73 with SMTP id ffacd0b85a97d-36bbd75ef23mr5985987f8f.23.1722762585867;
        Sun, 04 Aug 2024 02:09:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd075100sm6244814f8f.105.2024.08.04.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 02:09:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240731191312.1710417-16-robh@kernel.org>
References: <20240731191312.1710417-16-robh@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: Use of_property_present()
Message-Id: <172276258438.8347.5786673357734721862.b4-ty@linaro.org>
Date: Sun, 04 Aug 2024 11:09:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Wed, 31 Jul 2024 13:12:54 -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Use of_property_present()
      https://git.kernel.org/pinctrl/samsung/c/aa85d45338692e8b29b0c023826c404c3e7113a6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


