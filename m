Return-Path: <linux-gpio+bounces-12694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD09C1772
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 09:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6BAE1F23463
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2024 08:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADAD1D0F69;
	Fri,  8 Nov 2024 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BF77jXdG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AFE1C3F03
	for <linux-gpio@vger.kernel.org>; Fri,  8 Nov 2024 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053218; cv=none; b=s4rWKeEdEmKNC4TGcG8AWrnet7Rq3UwXQyXP9iYhlVfNvqt7bFd587bhKAG+8/ZLsfHbmGI8obHHScjAytGQ7150BqnGhuTntY0imw66Q1W5xO7Ju+uSbwBZlvW26vWhpAzU9glPX4Wa0d7U+wKlbhh+AnGSl5HBgr8DtTeq4hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053218; c=relaxed/simple;
	bh=FcZP0o3PSmNumtKGO1ItgMWJ55M55pvygKyoPpk9axQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z61QUxCTMWekBsj0WqX505DMRuaJ7Kl2RTXazxhBNNyisEJtB4a3+JepK/1h5bKYkPz6IaIt/RRMX3s1k+aTUiTGgcxGJv0sJFjl/qoaZXLv0dcj4DG4XnC5OhkOCW+p4ANAuPzSRkaDpEHeggJGgDAXG9RU/yBNw5TyzxUoUdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BF77jXdG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb599aac99so18930561fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2024 00:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731053214; x=1731658014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcZP0o3PSmNumtKGO1ItgMWJ55M55pvygKyoPpk9axQ=;
        b=BF77jXdGM/E9hr4mO5nKkSms4Fo94BCnH2IZz7/p0h4MF18Kv0nxEegISeyKDw7o1e
         Px9JaeACwPK/hU10///qDmXOabcUQKJbgAHup6FkEGbFbVACyIhtoZPkYeq4R0giPfXs
         JSm+Ez3QRd8ewauj0TaHjFZwWQ6EpXCB8hypXkHF7P5nnQIrmNENdwUSUM/yGMBqwovN
         SYSXMA47nizkDYcW8JawnqYnUt1lH/mmVKvuvK7zkdxE+XpiX55qs7avtCy2MKD4BKn5
         4sQxG4r0Eit+MGdin/EgEhjQXwEHa/2dsfElz4KuRv4ZJhoN8+rlHSTFhCc4i/6TzA3C
         qFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053214; x=1731658014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcZP0o3PSmNumtKGO1ItgMWJ55M55pvygKyoPpk9axQ=;
        b=ryKgEwK6NtLqzOz7vqEX8GzUOBRDDqGWbVkgJT05BVt5PQEOHXwQmexoQ7L+oHLfq/
         LlpJpTm0EwtRGUC4ZjKcE60n3r5oWNnI4HHrS7bVXn815OpTYfTGlvDsp7SnESAjUGob
         EDjhcIVKgm6PtoYlS4KgG+dykID2N4YLTdVodZF93hy9YmQOEejJtuFLeeWfn9jMjLrD
         oAWgFSVzYQ/Jxx7vGx67yLkRiZxrmiifpXfVwQzSyUGk9VvgeDzO1T/y8czqRSi0hmTO
         OfNMrwSJIVdXio3uEPeNQYSjonGOcpvSx6Xh0BCaRtTlYyC2n6+5doREQYRRHteHT11r
         h3ew==
X-Forwarded-Encrypted: i=1; AJvYcCVpiSpnGZaX0T7rCUgKdx5A4nmneWNlvdBTuTsyWkEjAboVuJlCgCkUZmLhOihyUqCPQJFh9zwGecMu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9hPcCK4Mc3k7xy6RLT0AjMJQo3EAtwZgKjoQ5snbqIfg4Zcg0
	upCEXD2i65y7bcAskzWlybBpnP4vQ+yBG2p7eMAt6AzMiDd1enEqCv1M3J1kqc5UvdcvSFHULGJ
	48w8zy9jN1L0c6Ui0Gg9FM2FAwbN/zE4dGcCmPA==
X-Google-Smtp-Source: AGHT+IHwi4PwmyQyG/lANiqFNPWg55NWKh714pI2y79atgBsJL4Lz22ORZxxpFfE7bWCRIAG4Z7yTBnCOgDUxjCiJmo=
X-Received: by 2002:a05:651c:991:b0:2fa:c4d4:ec44 with SMTP id
 38308e7fff4ca-2ff202230e0mr9679541fa.28.1731053213879; Fri, 08 Nov 2024
 00:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org> <20241031-msm8917-v2-1-8a075faa89b1@mainlining.org>
In-Reply-To: <20241031-msm8917-v2-1-8a075faa89b1@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:06:42 +0100
Message-ID: <CACRpkdbtNomOHe=Jd+0Xfm1sr9=DzvGSy6uS7jxZm4Mri8Bb3A@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: pinctrl: qcom,pmic-gpio: add PM8937
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
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:19=E2=80=AFAM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> Document the 8 GPIOs found on PM8937. It has holes on
> 3,4 and 6 pins.
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Patch applied for v6.13.

(So we cut the patch pile and you will not have to reiterate this once you
rebase your work on v6.13-rc1...)

Yours,
Linus Walleij

