Return-Path: <linux-gpio+bounces-13352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BF9DC206
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 11:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3FA7282615
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 10:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6164F18C02E;
	Fri, 29 Nov 2024 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0XRLVeq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B660155753
	for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732875438; cv=none; b=gUS4oFKOQe2scONuAE+d4wlBiu56DzvFljek/eCK2YRIKK35UZBTFfqfrFx8fBOhpXrsAn5WlcdPHCDPh81nieDQQnLpP17jf6YDZocWXHW5INxoCbu4HtR/z9DpnQbY33rZsHhilfYbgrsdXEAtCEtiCs+UJRL31J6QlVLjl5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732875438; c=relaxed/simple;
	bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwDitA5NqHwvX3bLrA+fO/6jIWlnK80Brq0y+f/g6pnO16bf1zF67zjxDwOqwABXj+sOyc19qQHJApA8gV0InjGbQr+VSimSdNvWq3uKHTX748CpahXqIr3qTNNxEyPZXAG2EVyFt80Mh5W5iYxqUlHPS7no0I6D+dPt5cXNXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0XRLVeq; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffc7a2c5d5so16714401fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732875433; x=1733480233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
        b=B0XRLVequSnqWRjkWtcLtPf1NdDFbNIWNT/55UQ/mER/7wt2cGSVQfpPGop3zCqyCy
         TMKxx7U7EUordvMkq8zPHiW3lUmGHc2qWOT/DVLOl/5SNQ+j4INfT/TPKSJIEn8zQitp
         azgcRHscyizQBPsXmqb9f8lHWGo2UKtUuJLwLOer5cn67PO+7oTS8pPiFhFs8TeCP1tk
         +vTmjphQbUuGJsml6P1LBDwpCFTwj4Nq0T8+P3di1jFYZRTUKmtGUnFAgHmimk8G9IdI
         HY0ptc45dQAFS8iff/KAHNqfJZYycuIpV7HMg7LSIcz75sckk4dDzceV100N0ewo/qio
         1znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875433; x=1733480233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
        b=gV5IU6q6vgqy+Vj6ZBOY7RMNdd2o8/kQau5WMSkhDr40q2yNdNfXEYl97PGd4rNwMJ
         uokhKsxrhX1k7XyOSdJITrJqTsMQ+MNNmKaoxSs26VMs7Opb2VicPJwLQw4Q4hOHHQWW
         uVbLIaV52v8PqDx6i6Dsq2bv7HuJylatS4jBrrg6K+3DE6xFZFkUgSkj/mwU5GIHW1QL
         hC8R8M4t2FVUyGmzKFEFHq4qbcvHeWWHFk5C5omjkww0C7sGhERbNsbkRlErQLYG8rLQ
         0bZPFxkTf7oy7fl7GH/eSYIP61P3zYKF/kGzKro5P01UgGbomWJoH3838e6L0V3p26Rw
         fDig==
X-Forwarded-Encrypted: i=1; AJvYcCWEpuWpwUr5T6YjnAmUkvJ611NlB/CN/TFAz/MydTRtm1CrTnxA71DWFgZF3cES8jRUYBMnIfXzPntR@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzkSNbt9Li2l4zTFxtz56ndSh7/DaVvHiNYP9xOuvxhkyZo+u
	QYyNc4I3E46QHYSBntntMbBSV2KnXlksrr+npucGWcQK02Z4HyOUDKQKturzEIDwkW5A/m1RUyE
	BhkzMi16EWUjJjbCUtEe0jqhzS4LUTFKhkS08tw==
X-Gm-Gg: ASbGncuvW9gNpVWjIsLoMALswZit0mUEdu5PhD5YnGGDQobubtf78Zp78MNomqPw6Tn
	XpaseizfJ/xqqXRlecdapSZAJAWt7Jag=
X-Google-Smtp-Source: AGHT+IHsgFbzClrBYfEFLufjcHJSY9BVx1yMAHpzLueAWoM1d4Mtai5958T8vHB4BDFRgLnlbKD/8tkWebNyM9HrsEE=
X-Received: by 2002:a05:6512:3d88:b0:53d:ed6d:71cc with SMTP id
 2adb3069b0e04-53df00c645cmr3259605e87.8.1732875433264; Fri, 29 Nov 2024
 02:17:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126172240.6044-1-raag.jadav@intel.com>
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 11:17:02 +0100
Message-ID: <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com, 
	broonie@kernel.org, pierre-louis.bossart@linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 6:22=E2=80=AFPM Raag Jadav <raag.jadav@intel.com> w=
rote:

> This series introduces a more robust and cleaner devm_kmemdup_array()
> helper and uses it across drivers.

For the series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It seems like Andy will push it to me which is excellent.

Yours,
Linus Walleij

