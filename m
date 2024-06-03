Return-Path: <linux-gpio+bounces-7076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FED8D8420
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 15:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6BA51C21D28
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F8412D769;
	Mon,  3 Jun 2024 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BagTaSxm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB8E12BF3A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421888; cv=none; b=OVH4+u00cfhIsMYW1Qs8MdYxhysYsG7iZlIAo1O5CJjgCPcgT13Sd3xvgQSybO+79ARCOTo4V6REfsQFgnvB4J/5UJErC0tY0NS8nND4z1hgs3W7cxVzpvOum9zP39Kcr7rL8XO8jMN3Ec2dXFRwuwuzFcR1XkTZgSLQdUqq3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421888; c=relaxed/simple;
	bh=s5oY5VB/ZeLchozmlxHpgn0jJCP7I7onyi92IM4s3Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zzm5E8KpI87KVrCmm7pT5BiGBbVud5N33USF5aep7WQXU7FEkk1/QIb+uiDZcWpJ8rOyWTB7QxomkvuzM9qllOT236oT3NrCQJjjg/8PzwQf4y1dcFr8QSUa7VKpx/EsGarX8wGmzJidOFRBMYV4m8BoeQY4HqPe8RD6mBPaGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BagTaSxm; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso47316751fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717421885; x=1718026685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5oY5VB/ZeLchozmlxHpgn0jJCP7I7onyi92IM4s3Jk=;
        b=BagTaSxmjSKP/D9vBOzKTAm3wVu/iGGJVQxrHNpFf7HCEPYYKRvQypYt+VxodVYLcO
         DWBzlLmlQk6p3jpZ1wrPMUfdjXnrVNYEBWJUYaa81bJbT5HCodbgazA+2mJa7SrCymgC
         IxzvY5GRjuDycLbpEF4tbCbPtLNmpnNMS4tVJDJL4wr2XxFsUiuBUioq0YZQlXOjBj7z
         bCVBCZqZzj6bTbf6qN+jT4tRXWTpGy60Y2BTCVl6ikz6bKaV+T9Bj/IOxkK58xlYoUSj
         pdDQFr3ebN2YgJCf0QstUUAigoq2KNUeUnWAwY1Aj2VPp/6rWygtRaWPNVLbp5meCY63
         P7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421885; x=1718026685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5oY5VB/ZeLchozmlxHpgn0jJCP7I7onyi92IM4s3Jk=;
        b=l3PBEtDC945MnvCjtsFqRUQrk2M2fsL04WZPRQhKsx35+sbSs5o8JaZAgqnXvOo9IN
         A5M4SoKeSU2XGeFUwBRCON/4SUr4hAtQmGQdxsvv5AQZvBTFXeWTLKAmd6zPEyJhOu1w
         UG7oyLPmJcbXrS58/2OqR9eiT5IVpdo7jJvvumZ+MqQELfxmuJa9OjiEe+kVoyEAK5Nu
         O8HUAsjuuJoID9WR9yKR9Wsr2AOJ6voSp+Iol6E6tpQwdDqpWXaeBh7V4+Z7FEl/dOoY
         UVENisfXuYOWmoKtsox7f1LI2L1LQFMyTTq5mH/aFqhdFM/yryfYXBN7qdDvt6M/ltX1
         UMfA==
X-Forwarded-Encrypted: i=1; AJvYcCUcvK6X5adyloiKV3W+y4q7/FRPTIcxB5aXgxMPv7kMpSzcJ970TUJq7zjXlo0qIQ7wEG0zoxw9C+qoBy9OCmSI6TbpLE9H2gr+fA==
X-Gm-Message-State: AOJu0YyUIeXnxre/GkXF3Zh7Bn7945nPR+T0WdxTyeZdv3JsM3YImYHV
	W5xgLiGAI/Oj/kE/ra/v9YrdWu/3ZbI+sKcDGRUXKH3ybHby7MIRZYqLH3LV3iApctkVQQmmefh
	Nq3d+svDgxtG72sklBUInk6scNN2+MMnr0b2p3w==
X-Google-Smtp-Source: AGHT+IGGEfsiDSa9MS2XjdxinT6DC4pr32ZQOQc6Alq++FGKHA8V9dvlrQ4QnDerXJqsX5VfWRcTedSN+rX53wc9/AQ=
X-Received: by 2002:a2e:b053:0:b0:2ea:938f:a23d with SMTP id
 38308e7fff4ca-2ea951b6102mr59561591fa.42.1717421885548; Mon, 03 Jun 2024
 06:38:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <CACRpkdbOAoSDNFhXfz3djUZh1_MQ_T75CC+-LmojRXvyCbUusA@mail.gmail.com>
 <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev> <CACRpkdbSsgxtKqF6ORXubufTaegjysHU7zH-tJfDfKNd=Kdoeg@mail.gmail.com>
 <51d984f5-896e-469f-914d-2c902be91748@linux.dev> <CACRpkdZ19+zUCEBCJJ+MBnnaF+caZKFTDxYiWZ0BRGx+PxN3bw@mail.gmail.com>
 <e4972a07-18d6-4a8b-bb5a-4b832aa2d20e@linux.dev> <CACRpkdbL63ZWcopgBbANKzr476rO6_cwZL6JLqkvTDXbzzpkpw@mail.gmail.com>
 <38cd5e6d-f18b-4ea2-8fa1-40416d4370a9@amd.com>
In-Reply-To: <38cd5e6d-f18b-4ea2-8fa1-40416d4370a9@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Jun 2024 15:37:53 +0200
Message-ID: <CACRpkdbKgjdA9MFs6VtXxrULAY0VA3PFim+qYwbX08OaHxZKKQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Michal Simek <michal.simek@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, linux-gpio@vger.kernel.org, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 2:37=E2=80=AFPM Michal Simek <michal.simek@amd.com> =
wrote:

> I have asked Sai (driver owner) to take a look at the patch more closely.

OK if you and Sai both provide your Reviewed-by tags so I know this is what=
 you
want to happen, then I'll apply the patch.

Thanks Michal!

Yours,
Linus Walleij

