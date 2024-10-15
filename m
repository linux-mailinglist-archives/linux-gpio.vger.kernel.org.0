Return-Path: <linux-gpio+bounces-11388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6EA99FADC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 00:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F001C22535
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 22:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2981B1B0F22;
	Tue, 15 Oct 2024 22:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfhpCdzr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5771B0F25
	for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729029931; cv=none; b=LXi4NHJB1UYefo39YVue9id7sBqjJqQhWZrfjOeU7zNPJjPhkgg+Z74iGrIABG5rmUhWsjfHfZ92gASTO/swz7xGBMVpgZIjrGI6qT7SL6OWclb/qF19Zrpjz0h8UXbSwYhpkdlfgEUICYTt/jHdtOZw1xIfLwUBFcOAglKXYAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729029931; c=relaxed/simple;
	bh=q33cEmI/j84F+eXCAHRSsIHqTE0TQm7aU/4/N7XJsL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dY3xNR+d6mkl/3F6Gn1hF8heufEt/0AyiPDM20CzWePt/eFOkWdllGW2yuGQi1Tky0BSWLS+0qqO/EfdfsMtXlnYX6aaVfX6MFEjiSySf4SVjmqXs2RmM+BEkRZa1Xv6kXvxLYt2xzWGR8E13lOicwYn4/yVHZRLe6WiDI9HeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfhpCdzr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb599aac99so19607691fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2024 15:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729029928; x=1729634728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q33cEmI/j84F+eXCAHRSsIHqTE0TQm7aU/4/N7XJsL0=;
        b=KfhpCdzrWkxQsJlXwDHL2l1iSTt4QFn9IqMrKbHx4RgT9mB9ckH94d/oj+sAkaNBdl
         od1sLwtU5iHjDd0KE3C2YoEzXcHbocZDKAVl2wVYMVUMdYDzGenl0K04V+8FZS9Hxkbu
         RYvTibzbBSyWQy7cckY5rsgFO3iv6fLd7ezFPTLdaVgLGYH6xKx4YHql7hF/ydZQs550
         oiCaH+C1DsuSEAtFfs6HJG/2HL1rrwpAjPpX/FFASAMCFpI3SLjqgZ/gq7Dnb7e4avG1
         6ooqNnPCevlAOxZ3XyK9eR2NaYeyHbDxG++vfu52cwgnwq2C1PAmE1vn6tUXgiS2/Jk8
         B/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729029928; x=1729634728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q33cEmI/j84F+eXCAHRSsIHqTE0TQm7aU/4/N7XJsL0=;
        b=P3K3h/GxAddYgnLIWRXhDJIwQvwKNwtLFiI6/UxtnFsDebvUz8yEoysI7WNoUdFpoV
         tM+iml6Fuyim2E3vC5miTSS00o+2V4o8l58XmQiCUzOiHbjQiGgWJEzlAeWXIJCMZbCY
         YVLXdRiiliZZATqg74p/fPULu1h5guH6i1vcj0j9bV95VCMRozztKyBRgy+t5peZZ+kN
         G7M9OE6bX6eCjYQj0/YWIsEGhLBLDZLNwNVSpvXptJbGoAciamzkUMPbDckoYaYdPw7R
         OVOsR86iQB5hjwTysM3IRlKmMY7p6hpo9W6d196cI4niCSDZuH4EbKMPy8bsBrN7qnCu
         UNdA==
X-Forwarded-Encrypted: i=1; AJvYcCVeXPjg6MU8L3vRZRTnNwpBihtr4T7HlSMTR4a3fOwsu5bRO8MNGXxVQyCPknXAf2WRJtuGey0Lu61U@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvb8ziUPY1FH0//HNMJUYmXOWjGnOGr9D0h78SUW5JTpuKbeB
	/KIQRg/qdggpLqXZuKSZzhf7satEaN5toMFDreXmSPm4kcKLST5Cg8UDDGwpNd4URdyLrp+fDxM
	xRgr7/E+wczHXbT5FscZ8uJVrvUOt2fWWZPgQlw==
X-Google-Smtp-Source: AGHT+IF03cb3/7b9UM1fIbkFJy1dyGBVueuDgpgdJXRaUwxue/1nc38avBYoxfonEVSvewytqHLGzNb6oa/GzyRjyF4=
X-Received: by 2002:a05:651c:2220:b0:2fa:d4c1:3b71 with SMTP id
 38308e7fff4ca-2fb3f1b40a4mr57294191fa.19.1729029928322; Tue, 15 Oct 2024
 15:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org> <20241013-en7581-pinctrl-v6-2-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-2-2048e2d099c2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 00:05:17 +0200
Message-ID: <CACRpkdZzfHaf6+6qJ4yKACpbYd1=j-mPbZ-YX4Ku881rp-qFyg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2024 at 12:08=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:

> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

