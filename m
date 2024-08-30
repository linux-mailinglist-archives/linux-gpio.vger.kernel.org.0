Return-Path: <linux-gpio+bounces-9472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D2966B5D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 23:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF2D71F2122A
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 21:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCC9199FA4;
	Fri, 30 Aug 2024 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKgzM6KY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C761474C3
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725053946; cv=none; b=JyI8VdEpYQOJHgYM/lrEx//45Ay/at3qkH5iDyISrNFIK9uKoEVLnR9AnXP2l+UM5uxR9XsMcsTgDYHtH7w8QMFF9/phxZ6tGeNbIva4WKCuVwbATcNDEClxSkZn+xOw8MOp5PSnsLUzC/ZjuNvmwuVlFAAWXnM9bLAZA/yvmYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725053946; c=relaxed/simple;
	bh=tx3NN9PBaIcoL5lmof5VxsRYvG5MOAlKaCOGs63C74g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kinzz7NTllIiNaqUv+nd90pjmk5iWm/YnUtF2UTC7K7reXo2ufQugf5vbydPs5pu/VpxUFKoTc9+zE4rLBzIQmrDtbhI/2AhTxzPmx1m2lvD2eczrk6mi0TLDQq3R4J4lfSNgJjsCXshQWJl2GevUZ82lWuwn9yCZuw3pyFezN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKgzM6KY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5334879ba28so3186674e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725053942; x=1725658742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx3NN9PBaIcoL5lmof5VxsRYvG5MOAlKaCOGs63C74g=;
        b=EKgzM6KYjqZY16hYGtOuJFYBJZA0cyVA28rGkOp4p3XsjCErzXDb154mLzDLRTiEAS
         vNfkbG6D1JTni0ULEYrgRIUY+i2WuIlJRfjjaa6kBftPBHS94dsrlp94JSFLN6WzWkmu
         xEZS9nEdkW9z/E8cAkPr7HhCH/RoE3wifOrASemh1uyXzS/+wYT/3v+/RSZ1WsIKBpOI
         KsR3Dq/qHS10cMT+CRtiT0rCxnNKIPAj8iZ4r0u9DLhXlaUDcUcTNgcoD3mmD4W98WGC
         GpdChc38w2NfJ4CVlqaW5gSM9UdsEK/bIxTKgAykTrduL9+Spipp0nQdrD+mFkhdL+bc
         fmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725053942; x=1725658742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tx3NN9PBaIcoL5lmof5VxsRYvG5MOAlKaCOGs63C74g=;
        b=tCo+VwavjSLKNvHaRfU0aMEQ2VL+8fbpVd337Qff54mJFSRaUzVE/sV557jffkSbev
         VpyS16eR+qzv2NZopYAbLip0CRzJvmK1ZuhiUQFomi78E6h2EJLcbw5VnW9+b/zbtiCC
         Tmiaqj7z2D/prQgWUfeab+xhPPa4WB9HXq/XZu009yKMsr0opp+7Rtl/D4OQaAaoRoKt
         Zb42J6BqhQCp/702aRgVYU88MKCPj74+zydPfTUBB1ZTFouMCHdYmto8gFplThxCIDMK
         qGYL9GWkBp3YmZJXMr3/Mdnz9ThrOoX3VwCkormvQnOQ44nOrEES4Lffo30aleaPFA7P
         6gBw==
X-Forwarded-Encrypted: i=1; AJvYcCVCchdSecYdQ0lOW8Bb1PK5Mz7a/ztBFSMa6K3ykCOGyqovfQUipI3Kd11XCccu2MZPB9pTcn9RnRkm@vger.kernel.org
X-Gm-Message-State: AOJu0YzHx48MUulot54j6i1PhcoIoYnGdGZgxTk0AcgxKgiTkZBK+x/5
	O9eZ/GF5MYSX3VurK9eal0KJW9QSS9AK6OEdJwVMxOrtoBQFjkCkS+dcQz7I+0+RsWWNb4z80mA
	7qkqp+JhxZjQMlb8CSkQm6n0Ah01XxhM2bPDfCg==
X-Google-Smtp-Source: AGHT+IH+OfB/0bzliYjBTxa8MrImYSIVc+pu90B1XIZlcVmzyb5T1KIfQWW8TrCgOUK7OQkUdelaSDD6+CDq0Tcfi5c=
X-Received: by 2002:a05:6512:ba4:b0:533:4722:ebb0 with SMTP id
 2adb3069b0e04-53546afa222mr2795357e87.6.1725053941197; Fri, 30 Aug 2024
 14:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826074037.2313468-1-yujiaoliang@vivo.com>
In-Reply-To: <20240826074037.2313468-1-yujiaoliang@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Aug 2024 23:38:50 +0200
Message-ID: <CACRpkdZL1LFQApoQweA4-KuaDXX9CUirLNViwNHMjZmnW6EGeA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: nomadik: Use kmemdup_array instead of kmemdup
 for multiple allocation
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 9:40=E2=80=AFAM Yu Jiaoliang <yujiaoliang@vivo.com>=
 wrote:

> Let the kememdup_array() take care about multiplication and possible
> overflows.
>
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Patch applied!

Yours,
Linus Walleij

