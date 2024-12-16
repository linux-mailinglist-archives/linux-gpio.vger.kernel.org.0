Return-Path: <linux-gpio+bounces-13907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14989F2E30
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 11:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3FB1638DE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 10:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426AD20371E;
	Mon, 16 Dec 2024 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpHF1bso"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F852036FC
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734345225; cv=none; b=sWYhMQvGmU+rie93tbR6imF/w32LvDyHE5pP6NvBoHen7/84u2QFhYkbbmjf1Tmib5l1qmdjEIkgHQb2QiaRyA3DGplsxC7DgKfjIIYm9F+x0gosbNyeMtOe2SppI+X9/JIpAzEEsWc7812Gcqc8XjqWnpky8KaYsY4XNsDfrW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734345225; c=relaxed/simple;
	bh=PYwh9Ejzktqnk/4b3X6HTET4UjWYpwtQYwse3ElACjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADn9VgnXBnKS8rGheJlp5lqpkrAVc9d9qM2V+RO3QjNUPnThzHXiir0/BRJQXgxh0XJ0bhYLFkDB0Vrwh1Cw8IRc6MN8s7BaMXJrhOPRz8kfJ8+9WGDbOS+5PuLrEzdnMpgmpamOPFJ5fL/1JG0LccPyR5NXhidnzsmP3rErcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpHF1bso; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3002c324e7eso45081561fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734345221; x=1734950021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81rR1eTM9HElymQ2hIkXvkfh84mtbQHR8oN+z/vprns=;
        b=dpHF1bsoXY5M3b7MlnEpOGGHghGom+pSsXU1kbrqQrbtRIs8cx1uhnSzks/KNBTRHJ
         DDh91QvjfyewUjLrjskEBJ1MnZb4EWytNTwFvF4ODS+gBeWYtv5f6ftxVKezxH8bfUxr
         YwSSlNMwi+ALqQRPr5fvgsaZqy/faIRKD0R7AXaJrYOii8bd2oIPpIsA57IDTmvJjAV6
         X2Edqs0XGJwYI9T137tVGg+7dXjgn0dccJ+iscBzpZHBVLieHIvhQ1uxRb7jEvLX4xQ9
         bXpsY8++GJ/vOCrO8STHTESfFnmuiZYksPnnwJz6E0lyh9iKp6Lh2y3MC2ArjmDHftQ2
         oZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345221; x=1734950021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81rR1eTM9HElymQ2hIkXvkfh84mtbQHR8oN+z/vprns=;
        b=Lnwj2hDosaHye8KKi37gn4+fYGr6QfmXeOBLQNqb6NHe1De2WAg8cDp73i0PKd+pRw
         xPE3jCeLvNRGPC5wKYaVTo1bE3Q5zIKbsx8DMvj/kRHswpxCVnHsW7x7mvJCatQGpt2A
         tVO8hP/UDTBJQcn23GzZydYbAnvpeWebZOt7POOhv8kD5PWjy7rjE+YTsAUBHpZ7oEKV
         vwdOjU9+3nXeHUJCKubddet1NMJzyYG/C2o86DRNUZ/YxQuCdhISbAbSOOXnUjwfCpjE
         foVKG/PznfKP3079NKkXgd5l6Eqlk8sCFKsyb2Q7mmE7YBD8Lo+DHMYBRbyrU5qFED5G
         k8uA==
X-Forwarded-Encrypted: i=1; AJvYcCUqvHuriWSEx0f2yJx/LA07flYz02p2mjAKzo1ivblsCroTONCKGxF7nG9UtS51jhKv33A2hI/P1pzN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3B3dDCt4WfsmSChSBjz7x+qmjfIbVHHOzjPNyk5QKxgv2iNRq
	oNIaOeflKlDsYZnIBZxX8CSRN0UR6jUu0YhldvP87UFcOF2UVIsS0FUwennUgKl0knCJG8/t2GU
	QH3D5FcnSC6jIQ/NfOHZ2PlYT/z1J8NvjaXsxiA==
X-Gm-Gg: ASbGncvH9fYUaRjCBqLTT1umuY11svvmD3YI6+dzsspsXbh4XZUwm1DUlnYdIwAdsvw
	1K+TaTxq57lLAszxeN3MUNeSKH4UypTSwTWWH
X-Google-Smtp-Source: AGHT+IEUf3iLQlaHwj+huKVEu7Rf6ZfMRHEmd0RkbAiajFtXRNVDdgnZzJS2Enw8KLsa6+/B9ivQKuoEjmBWCEUg1Qo=
X-Received: by 2002:a05:6512:230b:b0:540:3561:969d with SMTP id
 2adb3069b0e04-54099b7188fmr3706580e87.49.1734345221514; Mon, 16 Dec 2024
 02:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
In-Reply-To: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2024 11:33:30 +0100
Message-ID: <CACRpkdZ-ZEiGMUPObHU=kw=OUADrRGtxgMc-QC3EaBevp-Shng@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] Add MSM8917/PM8937/Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Dang Huynh <danct12@riseup.net>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 12:15=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> This patch series add support for MSM8917 soc with PM8937 and
> Xiaomi Redmi 5A (riva).
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>
(...)
>       dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl
(...)
>       pinctrl: qcom: Add MSM8917 tlmm pinctrl driver

Is it possible for me to apply these two patches in isolation?

I want to make sure the patches get moving.

Yours,
Linus Walleij

