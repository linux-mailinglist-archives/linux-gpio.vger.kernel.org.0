Return-Path: <linux-gpio+bounces-13917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E79F32FB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 15:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F96816957F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 14:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B84206F2A;
	Mon, 16 Dec 2024 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUdcC/wY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68967205AC6
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358575; cv=none; b=lyrSUx5O5YNtIcD+ufj3WlVX4D8YYzVqJP49q4+Rho/w30mbu366ig7Q05GBDXzxL+BeA27VnzZpGSAPEg5mY1zcNqkVRhlE0COsxoBTsihFCMI4RzAUilJbCnhwAZupZfHXZydGIIrfaEK3CfENZwKOzWXVLO+yLlsZ9EKkM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358575; c=relaxed/simple;
	bh=9F8Sq5ILmO/gzqNtjAPdIn6tThxcdWj/OBrH8RrPyDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsoFjjEEMKzKhO7HA5BGuSc+bFNvUluusCYDx+D/uGYFCt7o6is67VoU0TC+TB/cRKcilMJD+5US8Noxv3lWOw6veByYN2puCivfKKRqdKrVy/RvEo+mFuckW3ObOdDP3zOJDQvvqSkjL/E6d/dY4xpy6Lk9eqg2cI27oZdWI00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jUdcC/wY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso50608221fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358572; x=1734963372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F8Sq5ILmO/gzqNtjAPdIn6tThxcdWj/OBrH8RrPyDg=;
        b=jUdcC/wYJUTb1XjIWb4cfx4c3eVJOwNayr2TozgefZvwinlQcF83qjozfJsd4y+jne
         3GCvP1sJlePCnmhMqj8Of96w2snkDEP+Wj2PV2egchuVoQW29Lwwnyg5d5fba3cyaauF
         7uabMbJavDn95yXNtw9ptOJ3pnVK7DX3ak2dz8f1F/YtuhWNAXuNbzsgv7HIRegF8W5N
         kkywm+cfV4rZun2X2u+l7toSLXqlAiqOP/vmiZLKS581Bg5qaK5XhDxa90DwKjmrlH7z
         fEKVYyOuggz4kaHDrWPCEeL1xP7VnFu6VHAsBCUnFiauPCOqbn9vrHTfA4i6lfWi6oAp
         ta9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358572; x=1734963372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9F8Sq5ILmO/gzqNtjAPdIn6tThxcdWj/OBrH8RrPyDg=;
        b=kIppLnpgqKmlxT0AF3Sknn/GTixiQrpsMoClanXm07YPMKtLw3Qw3ViDRGip/WTT3h
         afkWnEeb/x1nBipJmqx1EsAKBuasqzOIaQOVKebw+BLsNhhQNvyI28t/4OVrm8cvqhWe
         zz+YFtz5XfNUTG4mMwqWDP2jlmkxnRgYNlmwTFT4tTZ2lrYXrvX+4R+dA8qPnovOo1/y
         UoCqRSUJjbvDd4/Z4Y0R5rWAT8LqaBQ1K43l9ugn8A6cJnBSfaTbptpreireUmcasGzM
         2fmGk2n31obTS+UtfM445+u6DL/sU7HgqIk59+84YDVikOgRWmBgeEM6u6JSkIL3+Xh/
         HgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS31d8Fs634zXxYErghx7TNGGRKchIWgGljsNh3Ds1wgCyZM/9xfiNDRI+GtYCI4QI1NAg9CufYbUm@vger.kernel.org
X-Gm-Message-State: AOJu0YwI+X1lA79H+50wm6KnHEJzfTEWzQKDu/EI0MUzdUxnhH9ZR9yV
	nCQWCutUmhrAhUkYDSK/+WPpt8G4YUNvKbRl3Cfir9R33Z+gLBBN9lzd52C/ZNZEFeKb/aw50M8
	iJJASw8Bd6geqVWu8KvyebGyesT4UWAfQKQuB6g==
X-Gm-Gg: ASbGncuP89giKWrbOBasktO+qIlgg5zs5+5HtDv166MSrgGO+VPcSNpGhniYriULlU7
	4nbw8wsa0+/Y2LQdnS8L/UHKvgJRkYyuLs5zY
X-Google-Smtp-Source: AGHT+IHrQd48Xs7QoUHIoEZ8phO8rM8S7YX0SBFWBJmTRPojYCc8OVEoWykulhJ01DH0iWUq+AcjAkdRGx/EZIl7tsM=
X-Received: by 2002:a05:6512:318b:b0:53e:3a79:1ad2 with SMTP id
 2adb3069b0e04-540917cb6a0mr4002662e87.40.1734358571463; Mon, 16 Dec 2024
 06:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org> <20241215-msm8917-v9-3-bacaa26f3eef@mainlining.org>
In-Reply-To: <20241215-msm8917-v9-3-bacaa26f3eef@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2024 15:16:00 +0100
Message-ID: <CACRpkdbKrf=AXGT1PmjQ6=HFKZ-8qCy7eG6fQ2NVUUK3gJoVTw@mail.gmail.com>
Subject: Re: [PATCH v9 3/8] pinctrl: qcom: Add MSM8917 tlmm pinctrl driver
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
	=?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 12:15=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> From: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
>
> It is based on MSM8916 driver with the pinctrl definitions from
> Qualcomm's downstream MSM8917 driver.
>
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

