Return-Path: <linux-gpio+bounces-3968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7786CACB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FB831C21224
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2114812AAEC;
	Thu, 29 Feb 2024 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+lwSG5j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA812A179
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215018; cv=none; b=AqtzmPREJBhwD+uCnH7lYQhC/m6cAH47o4d9tmQJ5tTYoTApE8HwRuDOYxYlY/PqL3gkTMHjOn/pHUmc/kzsCLs/QqKcJ1cIbhDkZ4nYP5wb8chpuQFf+MBw/kEbP9g96Z/XK8OyvmnzkXhrgRmsc43reoGl2hq79bSnHDZym+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215018; c=relaxed/simple;
	bh=Wws5urlY/pHKb5nO9L6+YF0fIvf4wojKA9CEm5jbQIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mD9b/ThBA88BDdmqqFpXRtlGpusKFqznnIpeBqMF0P1B+Rd+KGGqNj29VPUeFX4QSZDHTGKk8ErBu9zoQJylD3GEqoAEpM7tFCZP03DNX4zWVylVEJLOHZH0bIeyROpe39ulD8EM0TmSHH0WfrPU7YB4pTOMEEhyM9Y1WJGawZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f+lwSG5j; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso1049037276.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709215015; x=1709819815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wws5urlY/pHKb5nO9L6+YF0fIvf4wojKA9CEm5jbQIw=;
        b=f+lwSG5jcLV6Jvh2VptIWbckKIq4g3bVLGsCTxwAmoB4r9wOm0qjHxsBW5YQHXD5Fq
         8MeswxbOLPdHna7vbcMjOQRo6PSium9RcWJbQp/Y0M9FKZE92sK5AzeAwUrxsh+vWq5C
         ejHf99vyHKL2EbnEfZoZnwyS3Jr9mbDFW0Fol20KdUfO6DXeN8sKENFGPsAq+JQsJV3e
         D1QfAL2pGW0tQSzTvnuHeTNs9CzRo6+I937nDNiizWP1bXE0Jp2uGNwa1X+z2T0yQDtF
         CwjAIJTFYiEgrQV+W2IV3DGoBqyBkxYMDkCollRyzlpuS744issI97QqwK64PAaagcqX
         7U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709215015; x=1709819815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wws5urlY/pHKb5nO9L6+YF0fIvf4wojKA9CEm5jbQIw=;
        b=NO99nTbYme4Zf+iBeYO1sFeL89Rsade8I3yVdTR4YIDdfcifyDVOCaBoXQ2+WeBDrn
         jWLnzH/Ki7qNMEoKqiesfpstNvOzfRHCIcEvlVTEu0sCyrCzSZ2A6m9CxteWRV1hgokM
         in3gz2BuNgDbjtObWPR7QkYXiHbHdSyfMXuOAkzDMX8lhBb2P8Fu2BS89M090gUSjYBe
         Hcac1nJG8P6YjcJmttVIeVSz+q3Yai3EpN5AU4T8hwch9SQE9t3GDB4PMufZwuOfRG6W
         aPlCg6Naw9fUXi20gaGGyumm2Fur85H5u0aUPvSY/blfv8/pdv4+gpFjwEJGTTg1Imvi
         pPrg==
X-Forwarded-Encrypted: i=1; AJvYcCUUrSQE+GZsoZd4HZjnV6cIebKV9f8UPYKN/3SH8PPZ58EGoyE0oQo6iIB1P+vK7XAsQlTJqGM+5gzBgOEz/f4iSGzXNab8X7K+fg==
X-Gm-Message-State: AOJu0YzPvQW1fdUQx4ymFh+z+/75/vvm84DRAQbl8rvKZUSsdm5vQwAt
	EfQlhFLMUgqCdL4QNdTAFyNju91v9SY/x9mv1bJKMVuHrld/ixcSiDd3fi7xxnWvcW0O705UPm/
	OtSyemp07rN4g5ATArOUHW0f0chQQsWcGvtdjwg==
X-Google-Smtp-Source: AGHT+IGyYyjopk2S0BDW1Ghoa/7hBgl0rLX3ecHmVYFRGAMgeBOBqeibeDjXXuQsuPB0jGCrausTn0ucexpYoda4cP0=
X-Received: by 2002:a25:8249:0:b0:dc6:bcb3:5d8e with SMTP id
 d9-20020a258249000000b00dc6bcb35d8emr2335878ybn.20.1709215015418; Thu, 29 Feb
 2024 05:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227155308.18395-1-quic_mojha@quicinc.com> <20240227155308.18395-6-quic_mojha@quicinc.com>
In-Reply-To: <20240227155308.18395-6-quic_mojha@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:56:44 +0100
Message-ID: <CACRpkdaqf8niLVfT7i-x6gVda2nwy1A6akEEq+rYz+cEpg0DzQ@mail.gmail.com>
Subject: Re: [PATCH v12 5/9] pinctrl: qcom: Use qcom_scm_io_rmw() function
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 4:53=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> Use qcom_scm_io_rmw() exported function in pinctrl-msm
> driver.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> @Linus.Walleij,
>
> I have removed your Ack on this patch after your comment
> on https://lore.kernel.org/lkml/CACRpkdbnj3W3k=3DsnTx3iadHWU+RNv9GY4B3O4K=
0hu8TY+DrK=3DQ@mail.gmail.com/
>
> If you agree on the current solution, please ack this again.

It's fine, I trust you guys mostly :)
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

