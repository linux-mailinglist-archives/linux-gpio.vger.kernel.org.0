Return-Path: <linux-gpio+bounces-26782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56CBB67FC
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 12:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DC53B1415
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E582EB843;
	Fri,  3 Oct 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yJQobbHs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF026E16F
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488951; cv=none; b=TclzMTE5DdR7QF5UoBoYmOPZ0Dz+CwX3t+ZD3KMMu0Mp07dSMF97IizYpnaXz+UJUOSw0vfZLLY4TL1pcdn6iN5Ik7pIxN1YgIKJpI9MEa3WxM8QTECE/yF3FWPuR8k1Hp9u7qt4GiEn1a8gbqfFIxXVFeeHTkdH+jA2P9QYlW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488951; c=relaxed/simple;
	bh=KChLKSNNxImhmb85Mo/OCLoDmoiyuSxlxjqr9/wUHno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eUvHG75YL/itqjdwr4JZpq+cSF+XOK4r6jJ7lg+lv8laT8UpaTniyHXPjRYS7uf8LLuBjZpSD+7scSLHAX2jhvMCnoeVs5Vxiw6kifovxFNkinODktmgvQLnswNiE/Zuvy6fk+d38CTHP1cx8WNTxBIYry3KENbfukTVPz3dcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yJQobbHs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso2897922e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Oct 2025 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759488947; x=1760093747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KChLKSNNxImhmb85Mo/OCLoDmoiyuSxlxjqr9/wUHno=;
        b=yJQobbHsF+Nyb4RPYgZr0NJ8omtIWZu0ESZxpaPEJ5O0eZtAoE6/LFCd4vmK86M/WG
         mYl/e7IdYmKEjHAJ0hafKhyh7E8fde6npBr08kV3K6cOq85IvXtfqsA3tkN/H0AtsHfd
         t+iNJ5nzyikfGed9kayawce/D8p34EH7RmD8SoYDZbxy9RVy7Fx0O8HNciU4PSSg+5BR
         y3A+EscyVsHK5+yCD3Xr8emxPvkF/4FY0gyVHRgEsGZRe1lyU21GhKfP7OAGxiEU9Z6A
         TBnoO2rDirBg2hyA4GFDrsH/KWOxiGpwRZ38+SHNoa74yU3lP721V0D7tpJqBkmioMtK
         FEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488947; x=1760093747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KChLKSNNxImhmb85Mo/OCLoDmoiyuSxlxjqr9/wUHno=;
        b=UG/6bNd8hZm8ymafgihucloB558kKQlsUMmVpuzb8ngDo7FrbAv27rEcewl/+UUYkT
         +R8QAjnoC9D+QUBKGi9x2jks8FxFCYvmPU7uDcVtySBhuP/2pya8LP8TKwiyOBztXyed
         uGlQi2zW88LnoDJNlM1lrA3aPhhflOgCpFkXicvCvsuxabKUCVKefVe2NNSS1w5+eaoW
         rIRo9s+RFqeXDnWi+tT08d5hEJ4VeEHIvbodgCxNTzw9Fph5YLY0t6P/+d91WsLEdXhT
         AZOCwE0P/aGbxLrssUEIdQX7MNOSOI5j/Nj5p89as+CyMJ/vB2ua3cteVEIpb6i6juXK
         MzMg==
X-Forwarded-Encrypted: i=1; AJvYcCUyL6Sxm6Ep2wfwK28zBX+gzKRine7MHG6WAO2BqF91tN3UNfsBfv2iuchJ3KkQtp1mHZsMH8PvjmO9@vger.kernel.org
X-Gm-Message-State: AOJu0YygKteKpLAMVzJyG3YHk26AbSiEiisIJ7x2mo7hpYFkrCcebmtw
	Cg+jq3T4r048wd8zOQX6Uyfm8AWwWSe6VL8Oq65v6Ln6nW4wJsYK84D6vzDBx8ZAf6FYIe1oZGW
	5ylR7Iy/3fK+BLC3+qIPPHIOuHtN6LpWfi4kvVCFitQ==
X-Gm-Gg: ASbGncv2QfK3NkeGjp4COJ3l/5WKCNaTVeijaR9GswFoZ7pI0hnZNY5/JiG3manHF7+
	1RKQBHjE+Nu2rO3LGkpjxKZdy3xsZLbv3CaT9kj1+j2fZMKZsYXpyN4jLb6DG4ErVE9H1Wqn1q5
	/g5dizhkCHdkBMMPYX8QPB9XGmoEQxNVsGROxPR5duyLJpHt8ecrmmJd32aChwy+VvLX3O6tpQQ
	Yw85gPiYyjZrbdyMh6X3Jk5ihGlnTfmbF0Jo3A/BGf88jao42hk3Uvm2DQA7CutMUcZj3zF
X-Google-Smtp-Source: AGHT+IE+mDtAHcj8cofetU5hFSC919BiuXGPbquu3PKU0UznoaKUN13j3pgLN59a6ZtfWEBTY/v4Bw3wEb2vT1GSTdc=
X-Received: by 2002:a2e:be25:0:b0:336:c873:1b10 with SMTP id
 38308e7fff4ca-374c36cc060mr6748801fa.15.1759488947068; Fri, 03 Oct 2025
 03:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-1-11bef014a778@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 12:55:34 +0200
X-Gm-Features: AS18NWAW-daWoNVINmwOmpTVjv-RaNkrGx2GTsWudsPfvxarUw2lB4KUyWnktIo
Message-ID: <CAMRc=McSfXDmObrBeCAnawe-BMB+824yEbWR+4vxJai9-n9+tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO
 bindings for Glymur PMICs
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 7:01=E2=80=AFPM Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
> and PMCX0102 PMICs.
>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

