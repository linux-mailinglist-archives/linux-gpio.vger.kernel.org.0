Return-Path: <linux-gpio+bounces-15996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67AA35B66
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03D1616D335
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D46256C62;
	Fri, 14 Feb 2025 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jezb1I0M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74C42AAF
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528447; cv=none; b=IufHJZJOhFQZZFzerR5YTBMTtpuRn/li42v3QMwDgBNq7m7+3uSu9TggkEWuwvpk8rfGmqVkuUVNZ+6nQpnNTeimYUF0PQa+ZSIXlPeO2BR02S8uadJQRIv6bwh5mN8WidBXu/QH0r+O5p2bzK1uuC8BDteR/PgEMAeUFHAfjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528447; c=relaxed/simple;
	bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsmAaPN1uq9D+NzfyHcaOGVMfnGINu6wm/eLoi5qqfiDIXbHlJnK3YeujImgwAkYQ09LAipR9Xmcy+DxaNqGO2PPW8Q7rwbIsN+OwkJLXPgeJTOZXaCHbiqR3zkWiE7aD0+WAivlFPGbKxZqtA5keS/z2JGepbLt+SyHs6XOjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jezb1I0M; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30761be8fa7so19340681fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739528443; x=1740133243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
        b=Jezb1I0M2617sN0MnAeELG7DWdbODlFft9t6Nr8KMJG78nUyvWKUU8krBSe63ZGGNR
         xPtCsOxZ0bJjSpTf0q0EKmFpRDi2+LwNV8f7JxbsX/iOecFylb2Pp4EX3Nb9irLERdsM
         M87AgZhkDrCz+GibkLUeDhh88GvJ/neRFY9YeT4KNqQTVdB2Q7qLSURTsL8K7QS5vC33
         9lIuO2+XTtsApbP8MiAVTLn8EOACTRzWYXNw7tfNJLzmHGigdYTxa7owR38X2R5JrOVE
         zjGNhKSJho7wygY3pC2gn3Axpcpn1U3X9P3kyF5lQm9VgcPkQdi9MqWaFUy0Y1z6UUzg
         /VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528443; x=1740133243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
        b=LeKJeM/WiP3m9uqHS9otzgdo1o5u79mXgPB0aJ8wwOWtOGP9o6BXQfjjn2AQiOot+d
         pn8R/3pp/md6OCRjhklis0MuRj4fkBecsBGxqERlD+0oHGctLD+4bKX7Pkf42cZJfvd+
         rbLqyEuZGNBPQxAmbSZ34d5aMmyz/ZYVMPZ2mGTOgpSZouGfNCw78bGPaLoKQ1JIVyqp
         YQTWY8te+GMX+mQPk0k08ogaaOFmSveoU5rEyRs0F8iphGpuZUOBFRmf8APDdu9JV6Ig
         /dBQJ8EaiWb0vAbHiDsk0tfegKXtZS7CFK2ygkZIZKQZ4esiCPJwoULyTk0Gh/Nonxu6
         zojA==
X-Forwarded-Encrypted: i=1; AJvYcCXD56461tycp8EQXXa21dShCgoXQWxhlLa8dY2g4HcyqRkrNXWa+E2GN5B5SutNr7ElMxxUAG7LqSL1@vger.kernel.org
X-Gm-Message-State: AOJu0YzkuA0ns8Dx+bUAfq2w2C/rtx2VDUydpNhYl8nWL7iR8A6Oxzjl
	TPE0cq5KTSaSlFD4LykkMOgzD2dznFb4gGA9RYFhOK6OQXjN5bSnyAHrnuUkBhoh9GVpV6RJxVT
	hPI05wGCQ+fEcd4QhtF9CGUPySr631v4Z8nOcbw==
X-Gm-Gg: ASbGncvIsK0tjfSFGZpO96VnTHm5yp4hLQRHoL1ptqamaTh7gxYFaU6EUbtDuUla715
	iZL0EIfNNe87zZnH9gIoFVz/oS4f78ZLc7jwXa/rJRk3TzQZ5Zgct5Wxv/SxW4YzbxwVMx1fN
X-Google-Smtp-Source: AGHT+IGxEKSdYAC3wifyGNgk5Eh89epo8lJDj6yQU/T/HzKQmZRPC1uyCtKYApqXa99y+vDHCBVSpmZfESb33W2+lF8=
X-Received: by 2002:a2e:a7ca:0:b0:308:f860:7e8 with SMTP id
 38308e7fff4ca-30903669b5bmr38024031fa.20.1739528443454; Fri, 14 Feb 2025
 02:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org> <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:20:31 +0100
X-Gm-Features: AWEUYZlN87XktebbarRKF7Naij4xj70q78-i9U_Bkah2OKeETlLFl7lqa7kEoVU
Message-ID: <CACRpkdbG-cS59TbB36=OrZ0MfXPdDPSpPEA8U_L_iMOgNZK70w@mail.gmail.com>
Subject: Re: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:38=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> From: Dang Huynh <danct12@riseup.net>
>
> It looks like both 8917 and 8937 are the same except for one pin
> "wsa_reset".
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Is this something I can just apply to the pinctrl tree?

Yours,
Linus Walleij

