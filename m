Return-Path: <linux-gpio+bounces-10636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CA98BFD1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 16:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454AB1C23D31
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 14:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA6B1C68B4;
	Tue,  1 Oct 2024 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9PUZspV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1096C1C32FD
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792661; cv=none; b=S6q46CD5Pq4RJPQlss9X4r5ylA+sLemZoGm+Se7j89HS8QxG5B6Ie2phtp0+ora0tlylJQTJ5fIRcAZ2sJGZMMRheDjGgn101vqb1z1mWnIt979UephnkSAylBfVhsgY5m3RR3Xx4wvJLbEJS9D0pFkhpPTjT2e3K9sJCo949Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792661; c=relaxed/simple;
	bh=l5BM5b5k2TCeltBEWllLsPAl1pVOeHprS9AfvY9vl3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bg9NxrT+Vw6NM1IXu9AmLYXJ06LeKeNM4Bs5sLNndbynI3qLrEhRgTI0//dQ/rCj53CcVFGPoBatFwQP/KGNmRGYDeZNNshMhT/VJ26Hqtwn5hna3ondr12wm+aVlklhmGDKslrxVfZ0/5BcefJtjPN1Uk9cJFytREa2ySqVG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9PUZspV; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398e33155fso3616723e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727792658; x=1728397458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5BM5b5k2TCeltBEWllLsPAl1pVOeHprS9AfvY9vl3M=;
        b=D9PUZspVorhQtsRqfM5wsx/gttEoAbJ81qsgaxxtysDkPGiodxQz8tX82vPdKVbeh3
         UHeKYdcWoeO4nXam/lPEgxs2G/CnBJxblUOAhvopKeKQUw3rxSudWwT5WqZwt+U2g2mm
         G/QBEXgpXTVoEm50FBllIsX3RM9EifxGZGMIFfnspvCTeegjANensnwRotenaT8YzyZh
         ODbH+bxye3rkhybmVKjo1RJAsPfprhgTXaKLBzqcrwP+n23ZCv8zY8F2ELOaDkmiMu/T
         B0YLrawa8BOmi4AnKVhe9f2YLkRh7+1aVsgSXEGAqTqNUN0roRI2CsjRCsa8PMR0aQWK
         UWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792658; x=1728397458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5BM5b5k2TCeltBEWllLsPAl1pVOeHprS9AfvY9vl3M=;
        b=e61Z+MZ4hwlTmMIiYjzBKpGwOGOM5KIcjCO4zAlJlVAIK0cViS5xe4WmyKdKAyS+pA
         +dCuuIUkF1rLMP9LTnkHmZVOxWPaiwrElGXTDrAmjQN4xSep6nC6Iuq2AlE0hSlmahIN
         bYJ9iILhkOy0Bgvf+2DZvKQoKz5jassFMeRA89HymovQxQIr462yQWHl+d6lefFo4Z4U
         cvD5jHaCYmYqJtF3ZnY82MV2e3aGshrIRHOIXw0/WRaZFJ2TY2pE/7UQvmvNGvV0sixH
         SFtXPdRk4LaHEmEIcI2JECE0tb1zOCTVR2P5pRhRUx4qtw90tZZ5OqadC4Lr5DLJDmJw
         RvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRIrYWdKLqpvHFjMg4Vuv4YrmJTEhUaS9wWwoeAF26RoBoNcAyutDHVd7WjN2h2xldRBpwSqwz1/bs@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHkh4e35vRB4Zv1T2yL95TS6/qokmqhbB8SOaM116dQT7zMci
	B0NMUNHj72kd1vkp+3JwMG6tVqxcPFKgmdlVNJ2ggLfTg0pQsAQx3NZX1DSNgYJCh1mn8Nnv1PY
	TCEbwmW56HoZJW1+e2JoCr5n/KDUW0DLApOGIpA==
X-Google-Smtp-Source: AGHT+IGh+SAH0HiND+WOSGwD/VcAkilCZpxlY30ljLulS1hHuVO95SRQIQeLKJV15FnjaJtEFiG6shIsDh0YJ3psq+g=
X-Received: by 2002:a05:6512:39c7:b0:539:918c:512c with SMTP id
 2adb3069b0e04-539918c5352mr4435735e87.57.1727792658142; Tue, 01 Oct 2024
 07:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240920154508.1618410-1-ivo.ivanov.ivanov1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 16:24:07 +0200
Message-ID: <CACRpkdYoVnG6dSpawFvkj-2KthNKWnfo8h_icx+-5_JLoHVDcw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Add minimal Exynos8895 SoC and SM-G950F support
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 5:45=E2=80=AFPM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:

> This series adds initial SoC support for the Exynos 8895 SoC and also
> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
> dreamlte.

The pinctrl stuff looks OK to me but I expect Krzysztof to queue it up
and send me a pull request, he keeps the order around the Exynos
pin control code and bindings.

Yours,
Linus Walleij

