Return-Path: <linux-gpio+bounces-23178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F2B0238E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 20:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D799586704
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 18:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6402D2F2C75;
	Fri, 11 Jul 2025 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WoHqdOg7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD52F271F
	for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752258242; cv=none; b=bGQZXNzwmX+nHUD8vxTMl2x5ZONWnepw9TJta/viI8vjnMHQkDplo2ORWnAk20q5CQ3BUDzqG0/dl/XwzGJCzaTlwkYDS0VcowqyMqbw1/gPCrLcaCwfoWEmxz+t4ApoIgL3nIPequU0mnSuQUsRRS3e/AsgSmeS54l/YknPlgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752258242; c=relaxed/simple;
	bh=oqnpzafFV0ZoAjP9+YkXIuQgzQ7Z2BnDR3jdUDfSn1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3c2EtpqypF43MaEte9SS6vnTjit01W+hkBkAZcmo3oSBy1VhPwsEZSPAisFc2HIrky1UK8OIVvCn9a81K7rPTSZVEvVZ9Csxy45C0RiMiG7YE3Y9Gk+AptP5XBz2SJO2E9a7SFnWzAcnqf1s6qY+srEUe8bnyqwP0SXo4yv6mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WoHqdOg7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso21048811fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jul 2025 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752258238; x=1752863038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jn9f3mToefJGhAX3nWeu5w3wYZCnJamomvhjD+Ab1ts=;
        b=WoHqdOg76g00mtNGc9b6mI0r8aUJGHSi/kYqVz3FrcupjrccaiUA5E81IOhiSNG1DS
         DLOLJj05TSt77p1GeeTXxr9G7XXwsKmTy8wbas1cYl1PxEnhR9TqSpAORx054LeQCvMq
         cquUu8MAw2D1CblyKwDcaeKBzE8tIsYqLUQht4J51PuY5L14IDVKK/hD2Gg2JaIQcqtT
         QmM2XQ5/HFiU8G91SFF1z93mV/IaHcalFlT1hEJhIilbL4rgm1eVPW+JrmTFvCZWJW/N
         gDs4Yn0ISsIdz8vEo5U3PqeflH3xamUoMoW4snzw6NTBR38aeOGU+bArfbAw7WbZ0zPr
         HF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752258238; x=1752863038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn9f3mToefJGhAX3nWeu5w3wYZCnJamomvhjD+Ab1ts=;
        b=inrNaU2IEdjJmqVqj/RJ9D5Cvux4xhvecHYUazx4nsKva2mxipRn29Et4hFTkADOKV
         LMSrHe7490of4mJfq6FYaMHbooPk9/kwt0TeAzpQfzpX4BJ68T01JcK1MBNIqQTXAd96
         127CzQn+TofEJp8TruKVd0QPLIUcgrX8hp70fCHAYD+2Acz1CHFn2o4IL8wOY1cJG8YP
         gaCRhBjpVi0QQ7EwgnkTItAm/2/CGaKkMOmX9a9e1Bxa+iL/vsIy0S9qHHJ8JcCK8MfH
         zchw97gAPtyIa1ErHusJ6RPEU5cp/DguAZ1+cM5CSeAQu+nK1+LozWOT3y220mWedqya
         Y5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Gi2xsJe4SvAPloJNq8iBUtX/y3WznyFR0mVuF1hdpELN6tfl4HJlgjOnBTgdT1lVuR4ar8jq7Ij8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JOrKQ5IT46GL5Va14fcXMQ/GANHk9hRy/Z+UI/2Vpaxj3mzy
	8fZxbjRhSGCQ0cPOcEYWr4DOuIefJCNkoiX9T08ZmDsfRoeuJ7v9L8IwJDxUl+jMSuYcnIVnIVa
	JkSIJy/JvxHW1aEuHifvPb/IXVmMqj32jYbhN957JVA==
X-Gm-Gg: ASbGncvhcduQXCMCh+cA+aiQyuKCxR1koD4zYvBcK6QegPfuJgm36wKVUFIOkOQ/SNQ
	1xYrHLHvuWcFthSCoBunofg2LePjL5QekrNVevM/jMh4rkzpDeWCqwjXE7OOtHlE/X1tdydIC/Z
	4i3/FDXyoUfcpMByKClH5vWANVzWhiRAl61SPEwBaWHLjRAqnY+5qYvjbvkznEP5Y4XVEgoFLA0
	UxBpi0=
X-Google-Smtp-Source: AGHT+IGtCjuAm6H1PqMHwvBz6rzeqlA0wEu1fJowmdiyHYt3WhUGaKpgqvny6J1SrAMvLEx6RSED9oPi9oqyZbgq9O4=
X-Received: by 2002:a05:651c:1118:10b0:32b:47be:e1a5 with SMTP id
 38308e7fff4ca-3305359ff3emr9390161fa.39.1752258238428; Fri, 11 Jul 2025
 11:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:23:46 +0200
X-Gm-Features: Ac12FXyyCEbHvtTkJzK2mrQiawaykksuUjl6fIr0994V2EB5IcqiLGuqcPuxELA
Message-ID: <CACRpkdbUo21S-GPPrTpwhExVqm=XbE+juQfVo=VddOks79La2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add support for PM7550 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:46=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Luca Weiss (5):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
>       dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
>       dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550 support
>       pinctrl: qcom: spmi: Add PM7550
>       arm64: dts: qcom: Add PM7550 PMIC

Patches 3 & 4 applied to the pinctrl tree.

Yours,
Linus Walleij

