Return-Path: <linux-gpio+bounces-22807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C885BAF9665
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 17:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0F0F7BB603
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE7628FAA8;
	Fri,  4 Jul 2025 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dINeEi1k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449423A58E
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641883; cv=none; b=ISaUDU62sjeI6YcPfG37oBjag25xWNyC8BDzJufgFt9pWk+BrwYG/lQgwkhHu4qwH1rlb8SFQ/4YWYVMnoqsXVHrptbNTCZ+s0b8a3daFo5zmYi/3w2XhPWpVp+o48iHfa/Bed8B0djDU0x8909glkzDa54Z5KmkUTgIM1+p+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641883; c=relaxed/simple;
	bh=5waSe9JNG3bmoZ4Dl76hVYYd3LVFKdDlnURf+9XosaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HG4Eza7POgoZqcDELmYd2zvULKyyOUb8j2j7o6GotZEUqMlXfHbLq85CEZtl8RW4cH+i/jQVeah96xV1nNacpRiKlv8fg5tTH8XarH3e4q/dSdPn1wZDuRbxF9Ne0mYnakdqGpOfvu69ReU9ME4L0N2nOLnAD/dxl+dPldICsYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dINeEi1k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a575a988f9so641839f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 08:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641879; x=1752246679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0fTEoeFH2CCKRZ2GxYERj8nq+92LKFVKj9HqnOJJLg=;
        b=dINeEi1kgZWQgFEYAJ5FVwmFBPT5EzLOv33qfoPmv7r4IE0mgMMTfMsGwcRyuRe61K
         FMkjIBZSJIecG2RitvoOimj6hMLBTAIV1TaS5zpnBYcGTdxIi3lr8/Up6IzFeh1D2qja
         39f4WyarFFq255vcCosZ+jh7p++fRISzDvr1ZTaGDlZnF8iivGDatb1CKjKpbUkvJlh7
         yu08I2szKq4Gx4MvWFPB27Ys/njhieh/zhJjsYoPaL/at6nIkKl0INB+XBIUPMr8fldA
         /pefZShXVZnyVxYycrUDATLgiTbIU2NNQ5i4XxlIBUsOoN01fRuT23OGkjx3QerUwVZ5
         1HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641879; x=1752246679;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0fTEoeFH2CCKRZ2GxYERj8nq+92LKFVKj9HqnOJJLg=;
        b=DJAv6z/CUQCVsty+nQoDgh/qw2v0BxDkkDGF0CVqdMfu/98Oq7BIG/DTFPFV6q8XMU
         +MY/gBBbJiO6jP7W2MtuxAaA+HpNd5iVG/Xtye8lXgdnrN3PqB0ONXuXZggYs544q1Wk
         0+s4ZLM/rsI2CRFZyGzuAoiq00CTLHhhyCxVccIupX+Pc9PYfBa5phNO6ZtRGfcMD1VQ
         CJvOQ6CjPVHFGy4Bn9hXq/DW2qHaIk3H6nZRpcXIcGMfOzhm9bGYn75aFTRh+hTzahDY
         X9DffHD21YfTSkO+1L/xWHik+QcP3O/0tUWSQMT1l1KgN0jq2c9+f7IdcK7tn26wgi7t
         cTTw==
X-Forwarded-Encrypted: i=1; AJvYcCWRuS5K84yNNy8odYiqzFaQEkcuqQX2mfO/6nnsHgaA3gaOfMY9O9cyZvXenG6y2QCzhzwRMbbIIity@vger.kernel.org
X-Gm-Message-State: AOJu0YyNEavjoQ5NY9wcaso4qnvNsBhKh71FkABXwKKrFQ8Mrge/yW7n
	8L25tvcIrXRb8MBvnSAv4sC0CdOhf9BYkssHdht/xoUEbhrIzkggRTpgQqxT6fzNdWM=
X-Gm-Gg: ASbGncsAvCxq+c/f6OaIqvCZHDXscb/fTuFARBcjtvEBN3FVWO+7/JF9+CCUh864XFq
	MEXeQTHD3qQROinShPC021rkBmDW2W5ii7IvaJO2GpYogEET7DklchK7Nfzj8hrd7yqYrikm8TH
	jAHu/iRrisN00Dojn+8P+F55N/z/JJ+sg55+bP1j/eQgNrbi9bl89pSwMB4Z2fM3TwFWShCUF0W
	RbyKBmryzDZtKO0BU4vXFC8ZnpN7wyLJTPE1tSc1IYX4F/zEqJMNomd9I7pRnB9DWwvkNxDcFXq
	efpvI4+SYRfRhAnTMXrJ/S9aBasb+h4c61bUs/Cl3xa2mvJjrCLgpfQ/Cy3DTXLNcKfS/3UpyNn
	JekyEFug=
X-Google-Smtp-Source: AGHT+IEK4aTwZb/t+iBAfYaNAla4w2TjyMyeRG101P7FjyngDibQMih+NwFX/4yVby7V0AceGcPGpg==
X-Received: by 2002:a05:6000:1a8c:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b4964dc1famr2429125f8f.37.1751641879342;
        Fri, 04 Jul 2025 08:11:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470e928aesm2675416f8f.44.2025.07.04.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:11:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6
 pinctrl
Message-Id: <175164187861.2868628.1382846991470897290.b4-ty@linaro.org>
Date: Fri, 04 Jul 2025 17:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Tue, 27 May 2025 13:23:27 +0800, Xianwei Zhao wrote:
> In some Amlogic SoCs, to save register space or due to some
> abnormal arrangements, two sets of pins share one mux register.
> A group starting from pin0 is the main pin group, which acquires
> the register address through DTS and has management permissions,
> but the register bit offset is undetermined.
> Another GPIO group as a subordinate group. Some pins mux use share
> register and bit offset from bit0 . But this group do not have
> register management permissions.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.17/arm64-dt)

[4/6] dts: arm64: amlogic: add S7 pinctrl node
      https://git.kernel.org/amlogic/c/9291207753c733dcd9f1c08749950323f7f071e8
[5/6] dts: arm64: amlogic: add S7D pinctrl node
      https://git.kernel.org/amlogic/c/bd42a25d696e0d5ccc9e27de388d4ca9ff52f710
[6/6] dts: arm64: amlogic: add S6 pinctrl node
      https://git.kernel.org/amlogic/c/fb183c8d7a5a90cdee953701d8a5b92642a2e917

These changes has been applied on the intermediate git tree [1].

The v6.17/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


