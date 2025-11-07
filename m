Return-Path: <linux-gpio+bounces-28243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17CDC3F9E7
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 12:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D7A3A5D59
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 11:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00FA310782;
	Fri,  7 Nov 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVv4kHIN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1529F2F6596
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513322; cv=none; b=lSHUFgTaFO8D4tAfxWkJNQXfqjQ4VxvVjkAm2kBLe1xQHZmvbigWrm6A8uog0WIj8+VhM0IF2o3q6pg93tGja9m2PqGjD2a6FfNm3h2b8LCb2hB64O2xV2Gjsoc2Bf58ygXXu/6HswAdKnbsVkkXBcOqSlON9QPmurKJewnAprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513322; c=relaxed/simple;
	bh=oIe/oaHgQwNjBV5UTPEvhpn/AHX5Js+8Yh8l+CiK11M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTyawNGetAemcd53vUpR8ce3C4ifnaioAjmbjRibvdSxtwLptWsp2sNp3u2iZ9octJR8T7ZX4iillHfrc/utYOKnehtAmjv86cNd4bE3D0/WpwcFyByNO4ZuCI99Is/0/xe2elyo24wN33iKTRohfHX9lMzWk92UKxUa4iw9Bx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVv4kHIN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64034284521so1001238a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 03:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762513319; x=1763118119; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oIe/oaHgQwNjBV5UTPEvhpn/AHX5Js+8Yh8l+CiK11M=;
        b=rVv4kHINydsSw5IBxFuk3qlNgHkvkBkaRPEzwdK24tH5a2QD1M34a+wWmKgUxem+al
         6SwFEPxUslc+5/VIhjUll2mPf0VetI3ofBq+up8ZnNr0reeN8vr1OPgIhjRKDVS2u7dK
         HDOE6yBjg9WdwELGArqjSgOHHIE5qsMLKDdmnZ+H/rrDsKQh6jcolioUP94DZ050CAzV
         RF91F5TXTZrhulKybVlkP3YUn6L+4m4+f2rJjHwKUV/0tlDjiC0NJMWrK5XlSt5HPxva
         NCho4CJj9t7Yaxnbx4rDgXtn1v+BPJtjd/1GksYbTbx7pjSktOrdh5ASMagsOSgKx0U7
         tJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513319; x=1763118119;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIe/oaHgQwNjBV5UTPEvhpn/AHX5Js+8Yh8l+CiK11M=;
        b=t7eoHX1V8eK8VcoRf3TDbPPC8OwR9DehuC/O0/GmLD4EjLGgIS6QOKqHCnFh/IPeSV
         CCYMAp/0llJhY6lSfIt6xsWEmAYonQUrUuKOwXH39S9/sF3URb86LF9bdU8oOFWfBpVS
         MU3wXzLbnA1BSoXIL81V92VNFmCMtDODuNe1XXsHLyuH9uGL9QGGuSc0+UurQ1n0mmDt
         J+22+HYbdOTo+T8z4PL9lA1RnnSLMw6CwXQIozDtygP3AKGvC5oJ0UBzgEAR7LMSb6Fo
         4bV+HjXYok2de4TO3JbdbeYZwIj9tJxme6OOjba1EBkGWaY7hqGmkCq/iNq0nZZBYAKd
         kVfw==
X-Forwarded-Encrypted: i=1; AJvYcCWnJczesciTWKGoqW5hWdVLtP8J/+3yfiqRNOytN13wl1niQuqUAt1Y5IM7GTQAaJg+mbYtHOU+vplc@vger.kernel.org
X-Gm-Message-State: AOJu0YxY23EtujiBEH84owIIxv67iSlp9IM0D5aOmfpzNm8itSuvNT0c
	w9Byx8Yuxs3YTmHOXpaM4/p+CLCrKbmW4Y5HVBZBCWTs4245Vfnn3ER00SqVXqMPTmQ=
X-Gm-Gg: ASbGncuZQF2+KA7s1gvrJ8htj5v8pLwEBsA4gXpomMyMogbFCBVuflpoysY2R3UGMuJ
	XbXOamVvqaHEQKBEJmOCGzQaZ/czKIBIG/ziyPsUkwIPNyRHwbZC4pPT4ReP7PmCPLyeQ6C0FNa
	bRSUvx7w8eUgV7yQrwl3gSpqvfNWj9amydJv6qTbS0d6NaioqYt+oQOS+nLepZj3RTBuYEHnLzf
	u13ZGRVAqohbwUdYMXrdyL5gRhgPhcLaNmjQiW35iUaI2brU5opkQq6hEut3yF/BYZ0zaM9Dux3
	Yf+0SuJS15W+j+9uD0tld0tWSwzwpJ4k6CMm2mTuFcx9cgQHeBoo5fsMGVfH/lACxu5kFSRXbdr
	m0IgDJkKWGL6z9vE59cXk882R+jpSEyztdEqYFfMKT86bXmzjz+uA0bvY+ncw/8BBHp5ljyLPQe
	LXWkP5J1hBn7QnOoM9CSPXMyI1hBxZXdyMzw==
X-Google-Smtp-Source: AGHT+IFk0e/C96dMXnjyE1xo1+GSR/mT2N99AaE/c44DQdiQ046jLT2uBYcSUl46ZYSZfSsKq3vwBA==
X-Received: by 2002:a05:6402:1d55:b0:640:980c:a952 with SMTP id 4fb4d7f45d1cf-6413eed163dmr2286341a12.11.1762513319349;
        Fri, 07 Nov 2025 03:01:59 -0800 (PST)
Received: from [172.20.148.133] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a7esm3841624a12.7.2025.11.07.03.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:01:59 -0800 (PST)
Message-ID: <729dcf73a1c3d03ca2b22dd278cb0bc502b6b7d5.camel@linaro.org>
Subject: Re: [PATCH v3 02/20] dt-bindings: mfd: samsung,s2mps11: split
 s2mpg10 into separate file
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,  Lee Jones <lee@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Fri, 07 Nov 2025 11:01:58 +0000
In-Reply-To: <20251104-armored-vehement-boar-55bde4@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-2-b8b96b79e058@linaro.org>
	 <20251104-armored-vehement-boar-55bde4@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Thanks for your review.

On Tue, 2025-11-04 at 09:26 +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 03, 2025 at 07:14:41PM +0000, Andr=C3=A9 Draszik wrote:
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg10-pmic
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/clock/samsung,s2mps11.yaml
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Child node describing clock provider.
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 regulators:
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 List of child nodes that specify the re=
gulators.
> > +
> > +=C2=A0 system-power-controller: true
> > +
> > +=C2=A0 wakeup-source: true
> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - interrupts
> > +=C2=A0 - regulators
> > +
> > +additionalProperties: false
>=20
> You need a complete example here.

Patch 7 adds / updates the example for these to the ACPM binding. I can ext=
end that
example, but I'd prefer to keep it there to give it a bit more context. Add=
ing an
example here would duplicate things.

Do you agree to that approach?

Thanks,
Andre


