Return-Path: <linux-gpio+bounces-21007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE245ACE16E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9F871776A7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD7018B47E;
	Wed,  4 Jun 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myovsk6y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB461AA1DA
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050815; cv=none; b=edttuFz7mKWl05lKeyUbwdjfIqfGIiKnQjaJ0lGm6hOc01YU8T5+xH5dPuUhVOjzHfrkeGezMKe6dvoxordPrcilMUvJ0sz2kQqkj7KmjcAKiq+igTZfonfBSNkCAS6FRetmO6+eIu2mkE+wqhzHGYQ2VFuk4J7Neygh0rSahxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050815; c=relaxed/simple;
	bh=ydc41CzZQexP8/Sacr0EAJ3wMyyt4S73arwwMKvXBWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P3RpYbMwS1sxPxDKEMbW6eQwPakaKBXALhJg6FMFBzD/lKWRuZnlwSXEVVmjqDPFL6Y1VpqkbqDVvfY1rq4VFZxgzccnev5JO4Vx2z5TkMRqUu3H+vIMHQYvQe0HKl//oCZ4LooVdyuNeh3HAplBfC75Y97cNNrtXjoJAGU6ubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myovsk6y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so226375e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050812; x=1749655612; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ydc41CzZQexP8/Sacr0EAJ3wMyyt4S73arwwMKvXBWQ=;
        b=myovsk6y0eaUHN1jjmHRGQB9M6ZIgguzKGKAqkcCe9z3Rs5hR1mIissMVdo1ISx3b3
         vAnxjBWmHfqk1kwzeJGPU31+h3i+dTpSfPctX+b3agToNoClRmduwyvSWe7YYML963Oo
         060mfrGxdY7/beWFCPRIeLJom30qSmdy2Nj+63ZZY02iGSJmyYUDi6bSK3p5ePpHfriF
         mU6Ufh2AdEFJ+jt3nsHUbjqxxEQJswSK9o8sxxUDrMGZsOcMW7cTsNlI7ThdB3KTBrK6
         KeDK4gJerLmRl3SlvDHsMXSSg9sI7BPDTo2tG4ilzbk+FhtluOKtqb+Ms6oSnkKpIx4j
         Dfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050812; x=1749655612;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydc41CzZQexP8/Sacr0EAJ3wMyyt4S73arwwMKvXBWQ=;
        b=BZTjNHaUooVzqtp6K/KyvPugjcgGDM2sdtQzWgAX7otszjHjgwKhZgMEoZCaX5QVVP
         bc288ilhJuowx6JtAENfttKDJd9jofeSSGFRw/Jv3Jsr4Zi5t/s8RQAelzQHAH1ehbms
         w8RmINHZC+7hqFuO2Hqihv32WUFPXzwYR64dv1H083Wb9X67YjBbYjRCy3023p3W2taz
         hwSDI8c3IlEesuKVNVABo8yOALKovVrg0rrtp0zoePdf1mIH033z/A4AZiwPZgvnDsOB
         1a3y4O8evGkIt5jya2pu8G/u++KA2cQ2sz8kVSrC+77GwVJ+uLF276zweq6KJT+3d3eU
         jNfg==
X-Forwarded-Encrypted: i=1; AJvYcCW4TM1pVpl97TTb1zalyFPV2/eXVNC3tLGUVzux+zAUU+ULjS+K9x/Mrfv0itswm+FfN2hwTSuFFHZu@vger.kernel.org
X-Gm-Message-State: AOJu0YzuE27L4m+1cLNCxpub6BRmYL9gbwdFTAZlNNoLW8RUYHU/P8NE
	lxiTfgnJhblMg7DCbRUpKHNyIyCWC0D6xsDmHFcQi08Nv5FHMZytBniUBAFaPSLFuu8=
X-Gm-Gg: ASbGnct8pYr810OeyA/HFGgLruAthRFNwhnX4R/ktyEn7rHzTzBy4xxlSaPLl3+P908
	H7JxqnnTO5DwwjGG7/vmLAE1Rw5XPwqy4d8o/tShWhkC8N7tux6iATzKkWsuBGtJfwjllkLNKbF
	/cBunP5vdX9BajQGTCWlaxqZ9FOqlZwtvl+SdfQqvWR6QJEhNI11EFwbwfDjL/rBzSuT2o58CXQ
	9Sirz6hnBDnLQB1WQa6ub6O5hkxQTEVlswI5BaKZhsvK1nOnnz9JwzJry6Fbxtus3BKGkYwpo4i
	IReuNxTHalt6s0+vLbFUybVDruxYnWtW8pLXZtZBeOZHs1EoS4pbOiU=
X-Google-Smtp-Source: AGHT+IEiwU1KAlbeFjdqPSk2zSDfPInt5xOQP3jHIbi9KVFJaCIn7u8JF88wihm+L69YbxxZtvGJmw==
X-Received: by 2002:a05:600c:8b6d:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-451efed66f4mr33677765e9.16.1749050812086;
        Wed, 04 Jun 2025 08:26:52 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a526057278sm280787f8f.63.2025.06.04.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:26:51 -0700 (PDT)
Message-ID: <963bbf8db71efc0d729bb9141c133df2c56881fc.camel@linaro.org>
Subject: Re: [PATCH 06/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 04 Jun 2025 16:26:50 +0100
In-Reply-To: <20250604-s2mpg1x-regulators-v1-6-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
	 <20250604-s2mpg1x-regulators-v1-6-6038740f49ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-04 at 16:25 +0100, Andr=C3=A9 Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.
>=20
> The interface for both is the ACPM firmware protocol, so update the
> example here to describe the connection for both.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> =C2=A0.../bindings/firmware/google,gs101-acpm-ipc.yaml=C2=A0=C2=A0 | 40 +=
+++++++++++++++++++--
> =C2=A01 file changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml
> b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
> index 62a3a7dac5bd250a7f216c72f3315cd9632d93e1..408cf84e426b80b6c06e69fda=
87d0f8bfc61498d 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -36,6 +36,15 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg10-p=
mic
> =C2=A0
> +=C2=A0 pmic2:
> +=C2=A0=C2=A0=C2=A0 description: Child node describing the sub PMIC.
> +=C2=A0=C2=A0=C2=A0 type: object
> +=C2=A0=C2=A0=C2=A0 additionalProperties: true
> +
> +=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const: samsung,s2mpg11-pmic
> +

Since we have two PMICs here, but can not use the 'reg' property (as the
addressing is based on software, i.e. the ACPM firmware), I've opted
for 'pmic' (existing) and 'pmic2' (new) as nodenames.

Maybe 'pmic-main' and 'pmic-sub' would be more appropriate, but 'pmic' is a
bit more standard I believe. I'm open for better suggestions :-)=20

Cheers,
Andre'

