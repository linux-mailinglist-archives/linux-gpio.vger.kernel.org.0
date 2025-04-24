Return-Path: <linux-gpio+bounces-19257-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D0DA9A728
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2192018899C6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F6B221FDD;
	Thu, 24 Apr 2025 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvCaxswi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F3221F15
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484828; cv=none; b=TQlw6yTD62vw2iiYKgkZwbpnTHh7Dfr3BiuWz0kkVUKsn0rbTnZPD7dNkeXSYJhWJb9GI/1yV4Nkhg78/t2NpVu7boZX7UY9Pvuyvpbzif3e9eMyldJvcOBR4h7KVO7dS+gftcCo6d0org9TpVUaIJuafVdPjmtejpt6a9gugXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484828; c=relaxed/simple;
	bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShHAiU/kZUjrSzy91RE4PkPXLRsrKzfIweBxEt8zSRy0eKo5ztSKTLK4ZNpCG4RD16MWP8qZJmEf1QpYmuG3NlGsni69HgzbAcADxxkE+IXj1XN4BH6aum+tpjeuYllxNkVsmzKdeN8oRsu3G7iYV24cDpcEDAZpKtmRNCG1vAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvCaxswi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf1d48843so7029481fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484825; x=1746089625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
        b=CvCaxswiLWI9EWxjlYacWQSjYqixaun6Uebo8yEX+S9Fzg9jw2/i9eW2VZj8tRkq2Q
         aKHFkTVugP5IqnNVbskjLhRk+R4PxlSMa8kRtE5Es3R/GdR0wTfywYpUvrcSyNVM73sL
         Azl4qw+psqkmkBsXg2O60snci/PnFROUOuNAz2BLTdHj3DHappVZqh8uX7wU5+3T7okw
         5NyFrncugigoDs7gcF7W1a3Fm5o/TeCYhxCi6VtvE4mAjwUd7Lb08Tmnoh65Pv65MVUx
         yHs5/l/Jt4vIqS1x8JmaYeExe5mMdSspIuY9864Dd5ptxSAoZ3Nludy5D7XjL3NCOjPd
         QNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484825; x=1746089625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
        b=aLUsgXc1tHhzYj7TTfFtXYTDLZafVnMQlw0EZ7Gm0nYYmcUYU762qme6meX/libBMc
         AbghqyzBQSkHLv9GAWBkWjsHU7eBzxMqeWKHgiKnr1r0NdCfaEaKlRFwJF6zOXWpDXRx
         4e9hfM5D+lBDSYCL7XQvASqCJ0BMa+Mq+WnXKZQoQTb8OvMiTkPeUhjVsAK08rNFwOqG
         mp/DwbvTcgjLndUP1DRiBlcy6ACadj0TG/g88Q3LVsy4eKDpoIyA8kAgqegkalue4jiY
         ldw08NUNT2CX3FT90GxRfvv6PWkJxFdNRPzjSq1A6nCq/GvOdTUAu7KLRQ52fdHaIoXT
         hLKA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDX4oIvwnZbTPU31YtZacSTYSUBKaYZ1zvMqpWSHQcXa393C83WMgpV2HMTEiuR4FBv2vcKhqp927@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWedurBlcXUgygB55T/pu/2bFjD2jt4lwz4n984ILTtyfwHg8
	N1rVKqjXOHBsaM91ZZEXkRGzWYZ/ZrWFymA2XVZ7Rfiw5hyiSb+n+eCemDMHJpHSfd7U3lsfUMz
	FZ6+56RH3d0hF9OMAOfcGSHl0W5xIah6cCkEsmw==
X-Gm-Gg: ASbGncsO1T/6xfLMg1OvUdjSlzeEN42r5Zi49GwjAWaKI2RbpdTWvfU9d5O7SZBbWLz
	qiuUeTNgz8aKlS6uTzrslPRkVBpzV5F+cIW84LUQ48MSkrWt/EliXbFkcEuI92OvwolS01LgEIY
	wLmXeymuwct6eXHmeTvzy0XA==
X-Google-Smtp-Source: AGHT+IFd6o2V1cDvfxchwTZEaDmypkAJ0u4hlPv2if9D2Y7a8wVhtGISsPpquAIRqMziQ60KxwoTpx35yBhShkFLhuw=
X-Received: by 2002:a05:651c:993:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-3179bf49914mr6039361fa.0.1745484823463; Thu, 24 Apr 2025
 01:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:53:32 +0200
X-Gm-Features: ATxdqUH1x92NvEG1VXzt3NjeT_OyAU-iOFZq_KwpZ_kjnPdsk-aLLUsyLsYPhSY
Message-ID: <CACRpkdbMzKOkrxmWUuC-ORHg5gBdkmwrsbp4daA0aGnNs07bxA@mail.gmail.com>
Subject: Re: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

