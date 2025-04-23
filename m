Return-Path: <linux-gpio+bounces-19187-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DBA983F6
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 10:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD2B3AF679
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 08:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C0426B2DF;
	Wed, 23 Apr 2025 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckBh+lOx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB7A255229
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397581; cv=none; b=KjB1hpoWgmlK8O4gPsLynJUkDU4QHtedpA6YVEOmESPUPzBVvyLIBBW484fgg2fUinf8o2PFKl3cIk3ccrX9z6irIVerFZmH4rp3ilN3ZMe/geGR0JleIA03xZhb8ko3ibCs/NlkIHytBL35hngJVvN8fRgwRU5jfPx+ykF6OHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397581; c=relaxed/simple;
	bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD2RzYroUuMqmD6BGK+1p7GnMgDfNX/BLM/LgotWypp4z3+SwiS1JUUqnsCfOyRSmnof1El/YITTa0zvqcDCPqWo0fyKa24UEilB5H1aOJws1BBbFC0qF7xK7IuAWDAMhLXF/UTtknHrh07NcuFyOJ3vsdelmCaEsuFyn9QJhDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckBh+lOx; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b166fa41bso6735740e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397577; x=1746002377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=ckBh+lOxNwBZ8KeFyLBDbbEqYs9mXUgi0OsWzs+ALI6xvUSFcyOhn6zKqs8BIFci5m
         zGrvwOrbsl/JOmBeFTziO7lRv4DbaDipvdzLJ8yFTd/TUYy3ac6fGFDti8vFyfQBUgOB
         kMvx9mKf4YFb5MZPY8WJjLnQ3tUBh4OWoYpRulNCCneovQM40qimNnDlzzanfM/byWd6
         Q8VWvrzcgRrlWX4WDSoRHcpBkLPU4IB8iCyhHsbNaHY8dTpoaCD3VXvu3Kwomjl1qIXa
         CyulGC/2iqTUxYNYBS/DIAliu9vQ3L5fcY7ngT++jLbxlSp2hlWxdmLekMJd+Q85V4Ug
         q8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397577; x=1746002377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=uARmc90oFWIjIddUEBQpDw8KU9+WiEuTUB4uRGdotIhAOZOhAbmlyu35O59g27XHOc
         LPGM6gFu8X9FpUT5+TFBW4R7ph4l6+sJAp370zYzHGdKh7x4jNB2cYAg8wC0LqqpmTR7
         MwmsaGcstdxbcYDyVMoBhbhqEJGPzNERXhMvJKf9fjmQ4du+5wKGvXxtoWijvqfwib7r
         1Wdc0tahPjc/hOhT2KPte64fYZVUPBRmLRNEJ1L2RgUStxK3w+YWtdUEgpL3YnSGKXvI
         gB6ZRqTMwQlvxXV4EYP1deWX4iOJscUDYnxwQ+ursm6nDik6H4hE5Vafl3cG7W0Tb3ZZ
         Tuew==
X-Forwarded-Encrypted: i=1; AJvYcCV4LwFny69XUCnRF9Fz5wlbEfhCc5lVTQhVcVs/OfS+rYaaRZfDg2/FShkSlWsncfUhJcrAfeNjehPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tijxoWE+i6MaqUwsfftXOyuKrKTeRUdzY8YvS/qTnpPE/IOq
	TgXCBjUQvZn4FpJSgxqZ8OZkjbnxDsvA7rzLUZrRb00BgoJSIdPFXGTYRPQC5KI6ep4cA97S/Cl
	oA1X3b+mq66SO1fGqKlSjjmtKNpX+N3bUxwTeiw==
X-Gm-Gg: ASbGnctzyhOhdmxTn/nGBqWU7qxt8A4BmYSGz4t7nB9X1Rs9QPswxejvwPH0FwcSPep
	/i6qiCz4bJDhTF7fOi6212YfuBY67AZmMwkGFGOWlsIa6BoidXiLLW+u4ADI1OTsq+Zhl0q3zCf
	6d9+WDV6/ocQrJw0RJcv69Yg==
X-Google-Smtp-Source: AGHT+IFZTOoQ/SIoYXTZQ5HrYq6ViTZKpu7Uh98dkIsdaRSVIhl5RakX+3hvzmtcTmlbY+w9Vf4quwvNHMW9rpoPCBY=
X-Received: by 2002:a05:6512:3d8f:b0:54b:f10:fe46 with SMTP id
 2adb3069b0e04-54d6e633c8cmr4512868e87.25.1745397577343; Wed, 23 Apr 2025
 01:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:39:25 +0200
X-Gm-Features: ATxdqUHd2AvWX21KS5yncubJtaT0PJGEz4DTRXuWL1cWY2BMp_E6mT4BPCkdw64
Message-ID: <CACRpkdZpHHvbu41xkK2n8-Hzf0euU14T6F42hXLsM277LJA29g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:15=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> SpacemiT K1 pinctrl requires two clocks in order to be functional,
> also one reset line from hardware persepective.
>
> In this series, adding clock property in dt-binding, and activate
> them in the driver. But for reset, making it optional for now.
>
> For DT part patch, I plan to submit after clock driver merged.
> This may result dtb warnings in this version due to the mising
> clock property in pinctrl dt node.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Patches applied!

Yours,
Linus Walleij

