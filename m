Return-Path: <linux-gpio+bounces-9083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0562A95D2F3
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3789D1C2235C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9330A18BBAA;
	Fri, 23 Aug 2024 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMVOYl//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9B5189B8F
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429668; cv=none; b=JzQBbdci4+KXlvlBKVGFKMSEWkVtsi9DOpqmTtxer8zXlmQlFb9G0S3QJOnZwD3I/giP0f+qW97/EbsLYnqF2W3gjT+2l748PcFyPMXOfbA5ywlCETuewrhx7c4EsMNSvf5VzdMZKW0pavkff+jXJamav4kMAmWtORCcwlL8tV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429668; c=relaxed/simple;
	bh=mkK9OpIlp+rC5+8SuvVSTiaZiUn8xekgkAN2PDqZa98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GShWwPRO6BNr8Q1gL7PFX3iHqhoLMtqJGr5ynyJ6qaiY8qc92VzRsKlhfrtcMQUYSFvcfGE7bHkEsv3Krqo8lyWFP3KKH8JTbYLnV4wyATJlQ3zBpUZ+3UTxlDHNNDmLcQtk+tVAjxfbJVs9YJR1o05xK8w6V6fydN/DAKtjUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMVOYl//; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533de5a88f8so1501214e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429663; x=1725034463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkK9OpIlp+rC5+8SuvVSTiaZiUn8xekgkAN2PDqZa98=;
        b=OMVOYl//1AEprFgoo69NCNiFCe6wu88vrEG6x0WIRZeqNtZZlknzC1EB6mhI/PmvgF
         FU1FFNud3FxHadF0b0mFlUBFmwGDEIjWo4i4RfQ6KMq7ResI7L2RD3UOV+WWJ0JPobs4
         tZa7tyPFc7hLVfXATqCVeqs33/RqJ/x8NPzXKrg8AB8sePqXnjPWY+EyXlZLgs8wYpXW
         CQXG8aaAccvhTK2OILFc1vF9EE9/wI5JR87hY9HkoKQctIT+JL3VVq+PFaOquXEZc7Av
         UlZs7dAUpKlCj/0Bd6G2ArlBTxzvENxUb7LFh+GJomwdHMU0QUsLnsJDr/trw4LmqmfL
         U6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429663; x=1725034463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkK9OpIlp+rC5+8SuvVSTiaZiUn8xekgkAN2PDqZa98=;
        b=EI6iR9G1y3Q2cxHRYSRWbvzoQpmULzZvao3HCL/E3J7DMlcXobNQj+es9fpvpTYyd8
         o58yzqklzpOErZpbZffP2yHExwNWU1v+pKV1mwK/KpkZzRtTy3p/km7h9JRF9isVH50W
         pADBLYKPSNHY5TuEfAt5VABvlHVPSf1Fa4af4lc+3EiPPMv1TiVT0IqwHneE4/C6oxwK
         cwIWPGjJeQMZyLq5F1O/Qx1mTFt+tjn4Vj/+ookCBWO0nXQ0kfPAVqCAyDNXqSJ2dsvn
         4Z2+nEva+40f8S2E8kMCrO/hybvUVVkC6If7TpugMmumxBdEklYaCz6LhTgJvzKQznjS
         8rAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0WCjdhXoHacCe/rCca3sgXUOF8M0jmkQmoFe6dTjEvc+tXV6/PK7TgUm3Qa3+xPQWL5pVwqPjtsL/@vger.kernel.org
X-Gm-Message-State: AOJu0YxS3FeVggZF2PAeGaKQzXdVVEpBY80g8plCsFvVuV7AlqrBTzrQ
	TKM3uWNyuRzlwbaW26NBX84NE7pbqm8498jP2EGjxzOEFNUwXenHtSGCPDk7tP6qnxFjMVHYJby
	zNuZkDRRHuUFAVwdBgY9qqAARzjvtyE9u9NHzEA==
X-Google-Smtp-Source: AGHT+IEsfcnzPgsQoJ771YERWp2GUiap4p2oaV1CMBOAbsvMhAWazYNU+D6IzPIgm3rXTmstOlX2PpANC4vujmG4rUc=
X-Received: by 2002:a05:6512:3c87:b0:52c:dc57:868b with SMTP id
 2adb3069b0e04-53438779988mr1859108e87.13.1724429662127; Fri, 23 Aug 2024
 09:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
In-Reply-To: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:14:11 +0200
Message-ID: <CACRpkdZPO=3RUAjMjB8hekn4s469d6LdCAiRhBYHh5ix5Z5_7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Fix special pin offsets
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:22=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:

> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>
> Remove the erroneus 0x100000 offset to prevent the boards from crashing
> on pin state setting, as well as for the intended state changes to take
> effect.
>
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>

Patch applied, sorry for the delay!

Yours,
Linus Walleij

