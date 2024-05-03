Return-Path: <linux-gpio+bounces-6032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4278BA82E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 09:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0065E1F222A1
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 07:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8871482FA;
	Fri,  3 May 2024 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5JhXjhu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6F147C7F
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714723086; cv=none; b=WhFlIyDRJMAKOXqvTEs93BV09r/smpHLutiue9UPvhrks07r6mp8GQ9TMALxHHMDr71bTWMH63sOGYZFvu6q69KVtDkqdikjRRFppRoDBb/kxDRSKT8kImLbyefVKNAbds8/iZPrdJol/lC+8bvjGoFUmDuep3N5TWH92aW8kAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714723086; c=relaxed/simple;
	bh=9lds1dTNJm20KO2gDxu3lgrciPV698y5y+f6AzLSwyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzjopa3guE/isZCtgbbg13Ggshaj4yX6uBvqo70oYnex3uM/ZMVdNAlCmGjtc2c6MOB8VDg5AJx+apCL4YIgYFXyXD+hqSx1j6UqaLRlImT7Etv6yPXMdN/pLG77UZd8jqWKyPJ/bRebNXnYbkm8mVdIWMxhibUSoKzg+LoSR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5JhXjhu; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de45385a1b4so8278642276.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 May 2024 00:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714723084; x=1715327884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lds1dTNJm20KO2gDxu3lgrciPV698y5y+f6AzLSwyE=;
        b=K5JhXjhucB4znLF+uB/FGtrBnpkQ6Ed1SqK6TBeAL/h9zDvnt3Ht35b5qknF/ut0Lz
         Egr0k1YMgX4ZyYmbJSeSczilgscglEImgPLM175CZ+on0CiQrtiC95KJRFWRSylzk/bO
         pMopCT3MEWyq5DbQLX6b6mSfeyqmvUDJsorft1j4otZ18uyCSmvkE3/E0/rxc1i+Y/J4
         WAPAmcypM76lvsEn0mBU5LyGMS2rYkuJDOE0xevaEOjzEk0rD3/se15RzZMktNWGu+wv
         lhQKCHW7Uy7DSVBHx7lqWF47lgoQUFP5CCXO5Hr+EI3LhMBozgQLtc36O8HIWmgaM3rX
         1flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714723084; x=1715327884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lds1dTNJm20KO2gDxu3lgrciPV698y5y+f6AzLSwyE=;
        b=DEgcestJigq5dz429gbQPpW2A8SnNNFNpGKcbpuSypwhsk/ExsnzcMXJXXiE0nopw1
         gNfgFKWCDYOdH7cEIG2bKHz1KPdnE7c9wJl8v299N/FLh1KKOq6D8aFBU59udd9Zaoay
         xmeYohCFZo7111tkLWVhEHzyYdPnoxI7QjFaKnAUUyys+Dgk0rqqlVXETxTxYvKNDvpw
         NzpDgrYkJ1HKDlmSZo+gPY4aMOl2Cu03zw3P+ljuRFDZU1xWDNlDeukUt1Wh5tRJrrDi
         xYtzIAG6FGDWq4k7Ock9clIE+4P5gnCzl8SGGmYeoMpfNU0KqqWbAAaUaQA55bDAKk+n
         TaKA==
X-Forwarded-Encrypted: i=1; AJvYcCUc/i/eW5qth9Pkj2LCWhjPCCGL5XL2o14T6SvtoLlbdr0SuLY/QHvoxyJqrdC2pgoq2D53+u3HpEQQp6ZVf+5tlPyJF5mbxlQqWQ==
X-Gm-Message-State: AOJu0YxjGbNORA7tSsgD2483t502c6RvUG+tTMErVvMTjRW+EYh3Y+Gk
	nk2ZGXQWtHeBRGq5Q9L57s8avJ1WujHbY6x7jrO2qZZ7aWFcduJq4gEJozPuFrGQquv5J694ZDm
	1oexIDpL+dEWt3Vt4vd2vO9cmtVOpCLdDhfgygw==
X-Google-Smtp-Source: AGHT+IEG4nOciPICYFkjWxdsB7yxrB7cRVj6SjUMBpSK0kxFtgIH4MKqI3NxijFyX2wkk8IVPl+GECzNHLPUJ6D97IM=
X-Received: by 2002:a25:cec5:0:b0:de5:6a82:49dd with SMTP id
 x188-20020a25cec5000000b00de56a8249ddmr2210883ybe.13.1714723083855; Fri, 03
 May 2024 00:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424185039.1707812-1-opendmb@gmail.com> <20240424185039.1707812-2-opendmb@gmail.com>
In-Reply-To: <20240424185039.1707812-2-opendmb@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:57:53 +0200
Message-ID: <CACRpkdZKdnDqDMnWFaZwwVW1BqcOMa8qFiu-aUbQa7UnXFtcnQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: brcmstb: add gpio-ranges
To: Doug Berger <opendmb@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 8:51=E2=80=AFPM Doug Berger <opendmb@gmail.com> wro=
te:

> Add optional gpio-ranges device-tree property to the Broadcom
> Set-Top-Box GPIO controller.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

