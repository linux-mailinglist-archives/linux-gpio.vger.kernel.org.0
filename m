Return-Path: <linux-gpio+bounces-30278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8FD0376B
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 15:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3C493020957
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 14:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5252C3E8C48;
	Thu,  8 Jan 2026 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOyluDY4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080003E8C43
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883060; cv=none; b=Pa0wJ+zQd6q2VGwr5RadpItvFhOOMFuy8jBdkpWCgaNhXwaW3ZvjeKNenqSoeZx2QlnQ6mGJhUkaA0j7gcR/fymYaD4SmZeltA7FAD0xn61oVpjA0bHx2P3EyTGLK6QVauRa8MmnBbyP+TsC2c7Zd1HLHrVwrp1E9bNvkwU4UH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883060; c=relaxed/simple;
	bh=xdcDXZFwVNVQ35x4VfoLKdE2HzK1zTeVnCjAhVxyojE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAURpvkKp7cla/atPiupg4hDgsE6kPYwI3fTd7uwG71qaLNOb0BSqXB4P7reO0v2GOrbv1d+eGo4BQ96PQl4A9KdGXX2vSEk4WJvTjWMYnEMetWPpL8xekSM9ZutlWsHByJq7iU9t8Z4e2DrhZZyAMaTMly3bmNqbsNB1G4flfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOyluDY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB271C16AAE
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767883059;
	bh=xdcDXZFwVNVQ35x4VfoLKdE2HzK1zTeVnCjAhVxyojE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IOyluDY4kJjcYTItdNhuLEPi6rMXyGjrvci6CdqVmLRi/noHz8SDHdVxZzPQOvAA7
	 +TjZBVKb9i7FsE06x7Geteq/GIK04bG1VN90fz5QHjgjpHrAeDkfHeLN6bbCLjLTVM
	 Y7dbnON8PfeHExVn4tQzhjDuFe7i1GY1JszHUmLKhVypVIimMnMVAtYT7yDm5GEt5m
	 ujG2WP//OShFFoAQz56X8iaMPGLzAakG7QLoCAA+QIvWcRp54Ci2hrYfk3MFcd1Jbq
	 91LRvXSpx0O9vbvPTErNHuF+GElkpM3L5aHeaEJN4Z8jhlzMN7DFvBBItxPWUMCTGV
	 NcVD0LXUxe+ZQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b72a1e2f0so2469497e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 06:37:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxt7wFlrR7IfGfw4KraJpbQZHzeYsLiCEO0tU6WFJuJ8J5cqYYWT7QG5+5ZZHTwgY5G8RZNIg36Ysj@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+rsryji4QSM/6aRN48iH8q54IAgg5gbcMXr0YX3xtT5ZKyx3
	KvvJZx064hi+4owtgN9Ft+YG7jGqaKYnVRNx0T57G1BP6l+9Zv95ZhehIizGOBIrIiZbo2OGq5x
	x2jqmiyqgkmG5U9trIpxUKyCw8VFdlZ1o8Q9b6KzA4g==
X-Google-Smtp-Source: AGHT+IGAua+w0hZI7dvEczygU3mwU2kIlCKMoSiV+njFMOBaS6ramgIFu7BmUN6yjnHn8hqSM1y6y4DJzIn424D4Hjc=
X-Received: by 2002:a05:6512:12d1:b0:59b:7c3e:21bc with SMTP id
 2adb3069b0e04-59b7c3e2310mr42036e87.46.1767883058441; Thu, 08 Jan 2026
 06:37:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
 <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com> <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
 <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
In-Reply-To: <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 15:37:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mfa=350PWw-wNd3my4SD4DvJn8qDqGdTnTfrGR1XhA85Q@mail.gmail.com>
X-Gm-Features: AQt7F2oTdt9i_Kj_u8PfWHVcxRqKBe83LD6W2bJ2swryLe_OAXk-Wja4rSdfiH4
Message-ID: <CAMRc=Mfa=350PWw-wNd3my4SD4DvJn8qDqGdTnTfrGR1XhA85Q@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 10:44=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> >>>
> >>> Hi!
> >>>
> >>> This is not really the offending commit, it's a recent one in the
> >>> implementation. The issue should be fixed by the following series[1]
> >>> that will be in the next next tag. Can you give it a try?
> >>>
> >>> Bart
> >>>
> >>> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091=
d2f7581@oss.qualcomm.com/
> >>
> >> With the linked patchset applied I still see the same issue
> >>
> >> Pankaj
> >>
> >
> > Is the gpio-shared-proxy module available? If not, can you change the
> > config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?
> >
> > Bartosz
>
> With CONFIG_GPIO_SHARED_PROXY=3Dy the issue remains the same

Can you try this patch as well in addition to the other ones and on
top of current next?

https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5dbf8d=
1b2f7d@oss.qualcomm.com/

Thanks,
Bartosz

