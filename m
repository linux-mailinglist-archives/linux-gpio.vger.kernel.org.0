Return-Path: <linux-gpio+bounces-12697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53D9C1789
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C589C283CE5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C351D5CE0;
	Fri,  8 Nov 2024 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDfDMZsc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E791D356C
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053349; cv=none; b=jg83dsPNAnfAnP2NoT3NhmmsnijkL6gMYR27jt0AYs9bPtpG6VB6D0CKIGP0RbCxIqmbc+BtUTdsfKGYwVGb9LX0/++V25ag/1s+7+wGXR7VNz0RD+MPLqGm8LO4YHC2hr2+n7IZsJ/bbXmx3+5L3Zh4+tq6UadnolQ4Zx2ulDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053349; c=relaxed/simple;
	bh=G9Z7xx9wUle37htzOFI0joTWlzfhv2aXAeez5YH7IZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWq9raeVNx9XzX31rOoMesQvRzJV09lELrRbnOA6Gicq2+l08eaypx5oiQ//yTKi1sU296DW7HXNVESfR6b8Jp3lScogppAYCislduAIFBXiw0lIlO1Mx8xuvaZmSDm0X9SMblTigdDv+FKBLh4s5c3SNPwUI98UVmzoFB4mFGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gDfDMZsc; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so15593521fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731053345; x=1731658145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9Z7xx9wUle37htzOFI0joTWlzfhv2aXAeez5YH7IZg=;
        b=gDfDMZsc/rmQTR8GkAm2GQjLPVA76RZd56HY1vbpuTZMFuKi0nPDy+5+rtTH7D6c4G
         XclK8OpyFqfQ635pBPD1VA2y+w8PtyaPYe4kwXX8/LvlFdb+sgY0kMSX1JQzNhlDSX5O
         AroVCYJKswjBwsztSgSF5yi7ERQeUMztNU89BM2YWcx/n7RJFKjG5v9nBEGSpVpMVG3L
         FH85ljAM+UxhrNr4J3vh55MI99dqzaXWqIEanj0Mselsc//CjDkxAdbnP2ODus/5loCT
         oXQUxZ1QGdyFb5sQkAAXia0SgYM4YCMN9ihtgzGfR8XqHkYe+p0tVlVJPC1PLNlghDAM
         c+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053345; x=1731658145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9Z7xx9wUle37htzOFI0joTWlzfhv2aXAeez5YH7IZg=;
        b=rvXzR5SFURODPj8p/7ZHl7ZrcX6ll2RfQTrv0HZm4k+xDYOmztsMQcjRA1z/ZC0Or/
         qcFgwZMUkLA2q8qisCTqzBNNlJFAtUri/P8eyR4gxDEuvrI5n9RoMaEsRwNpVst0yyaI
         hK6SNFhgT5ojraeql+TWz498ddcY8+3DxrMNQ4pIwdn8BTYEx59qFxF/lrLIe8MLsVgO
         Q5BypRzdJYW4j0+6epyIk6jff9xi1z227SJCt5PJVzjYv2iVH5ZG/ZHd0F+xxcn80ioE
         lselR16QRQNHwFHf1O0HUxDjqgIDi/DdiA+UNIdLxeauzSgF8hiOwQA2sfz23ntg2vEh
         i1SA==
X-Forwarded-Encrypted: i=1; AJvYcCWhFBYhH4Uw6MwyIM8xXFIHJnnfV7tDmVYjw0fREUcaOTNUdCNZHSi3lHvGNOwKQlTgTH1rwLF16gKk@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5ovxkTp0VQqfZuNlOlrU+7EAFMCcrHXEXGW+Nm2pZYA2ScXX
	Pwc1K+bwHgwX4/jwxwCDTHenQq3XL/hxSE7n4BnYOeZD0dS7XwsPzOAiUtU11ynwM2l7Jh3btra
	mJnClaDJpjUgsmPKE8/Xqq9IG98jlQHHI9foViw==
X-Google-Smtp-Source: AGHT+IF0UB7o0vuS6Bty4AeOnjqYdCjSMRlYLH8+QDSVbXDnav7cLaan9vUhNYyE5wm0llxN2dvFNKermU2/At8KL/Y=
X-Received: by 2002:a05:651c:b06:b0:2fa:cc86:f217 with SMTP id
 38308e7fff4ca-2ff20307f42mr8533711fa.35.1731053345351; Fri, 08 Nov 2024
 00:09:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org> <20241031-msm8917-v2-4-8a075faa89b1@mainlining.org>
In-Reply-To: <20241031-msm8917-v2-4-8a075faa89b1@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:08:54 +0100
Message-ID: <CACRpkdZ8YFfpqmgoahXBk9b88CGKm6Ny0Am4vvUf1ekUz0bEng@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:19=E2=80=AFAM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> The PM8937 provides 4 MPPs.
> Add a compatible to support them.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Patch applied for v6.13.

Yours,
Linus Walleij

