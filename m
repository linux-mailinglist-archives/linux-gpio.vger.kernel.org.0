Return-Path: <linux-gpio+bounces-14094-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA79F9750
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 18:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C167A16DB2A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA6921A458;
	Fri, 20 Dec 2024 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CwFFs38L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40FD2153EF
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713751; cv=none; b=PMDTorw+wZ3zBcE/lxU3Ghp/2mzht9HzcOwytgg8uddlqyyqjsFFjO3x4RWUndCH4OB1lgjUEMPkOC/lHBLw2mr2UCDUhnfjO0SMc8aEsl4VvHpGSrtRt53ZHJ6/zdG0fCpQcAkpGvhZvE7CPHU+X5Gz8gQn52CtiqP2nBk74rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713751; c=relaxed/simple;
	bh=ZJ6BlFTh6Cd2QrVCVjLhtbcAD4DALAZMyCALpAZOwdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s2R5MngI0H6JuPhn8we5mx4ydReQNOhEwncJ6Ghq3uw9EK3qepUzaVRZDByK+tw+dONW+NdbXVtndLLZrGiLE+l2HWAFEiW1WADTGFEMjh1lpJrzdgQiMi4ZqyFrVUI8K5ReGW/+pvgfnzu1RoxhuKxcY0KhHXvwz2EKkiHHnHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CwFFs38L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434e3953b65so14928475e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734713748; x=1735318548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRMVd2Ct+RJM9mKq4M10JLL1AVbRbgv8gECSUOI9cfA=;
        b=CwFFs38LKnX2qjiKc6bbdAzbp+KdKtYBLIujleUiabOgYkHbqcGa0k2A/rafCQj8oG
         zTm0dUnZMLWXNwoeaINUX8puistLCf+mec9B6KJg/Dd1/08WkBe5YDgz9zn/QUYmQKGB
         oiRyBx/B/Yh+7Y2D6Rt1Pe4j1/Y/fu+ElvY0hmgyQqfz3TaqNTk+buN9T5tWZDaNQDDM
         nhGemds2do3u37g1NHKApqv0C0o6rjWrC5j0kcSDQgxAIwawT8gXybXxafX9Fmd34x0L
         JV40zfdMOszC3960x/BE44M4ycp+t6oWjo9DK4Zwh+F7GGW1lwc/f1KvMu3kKCkywWjt
         OmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713748; x=1735318548;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRMVd2Ct+RJM9mKq4M10JLL1AVbRbgv8gECSUOI9cfA=;
        b=DO946Ak3PvL8NvPN9ngHH/SrdggZE05KCWJ/+rY7MzMdk2jb+y4CaHSNXc7iSt6iRv
         wqhMoPfsh97dt6ShfGxR/VtKn5RYWixNhta4ZrnSW/WkRgOK8zKWg5sEjCa4UEVkpWZa
         mP0YoBlGS+QDi9NaORFZGt4RFknAjx+I0Szo3fgNgRNBFB81iHpJ+fu7Hkath9iKyKQo
         Vz7Am3Ufh2GfRltE6PlIx0w1J65SDwhdq4I/0SuI5DBh/GUX9qWg+OGWc4FvwsRllESU
         gnkMFLwe8UkpGd+aXs9+BBgxu2ZfNSTlbgpdckuBbLJL7NEG+YeH3GTqhEeqXm7vGJYq
         GL1A==
X-Forwarded-Encrypted: i=1; AJvYcCXFVFSHbSEvPGTSyZsTD7ueuRkQ14hW6G7yVGmeFo+TWDRDzrF+nOsiK3Wa3MAwg8RRNbZcYfxoHBSO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+VaE9k/fcXNiuhWd49YhekRGR4Vb/p4WCM+4Xd7VGwsP4Z+YJ
	tyK2JGKDMgW+aLMYpwe7OJJshV5Yv441LTZpTK7okSWBGdrt0t8WhDWIhzWVQIM=
X-Gm-Gg: ASbGnct6Lt5vLWuOT5PzOTTWlNlpBg0tzETz4DxNnLXZ9w+9L/CXdLTXQ+DHe8dUm4b
	nwAa2A4zSq0QYTv0Xg7Av6DPIT9LLXFWSS/MmKFdV8wYQysZYANZQz9utPHuNv2rjJf4f0dakCA
	rF8ns+Y2zNM9oNIfhMzPNKuWAqZaK7paLKxxwtkHYIlA7nK5YudRCcGKDkwKgeirdG1Lv+iAPXz
	ulrCa0AUom2t+DHyahtOgJdHrOY1TJgNtU2PTgCrfdlX0t9eP904LLqiUje4TuscDmCag3nuqA=
X-Google-Smtp-Source: AGHT+IEdH/GxYvmGV9OhqkZ4EH1vTHNkVaouX931hJminJB7ZTbk13vFQOd2dc1W1czg+c63hAfImg==
X-Received: by 2002:a05:600c:1c87:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-4366864320emr36500145e9.9.1734713748019;
        Fri, 20 Dec 2024 08:55:48 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e261sm4491454f8f.76.2024.12.20.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:55:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 Dang Huynh <danct12@riseup.net>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-msm8917-v10-0-35c27f704d34@mainlining.org>
References: <20241220-msm8917-v10-0-35c27f704d34@mainlining.org>
Subject: Re: (subset) [PATCH v10 0/5] Add MSM8917/PM8937/Redmi 5A
Message-Id: <173471374655.224301.13708019576127725452.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 16:55:46 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Fri, 20 Dec 2024 12:26:13 +0100, Barnabás Czémán wrote:
> This patch series add support for MSM8917 soc with PM8937 and
> Xiaomi Redmi 5A (riva).
> 
> 

Applied, thanks!

[2/5] dt-bindings: nvmem: Add compatible for MS8917
      commit: be7eb69d5db54ac9ce794c4dc7d278890a78e0fe

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


