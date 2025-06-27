Return-Path: <linux-gpio+bounces-22326-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79259AEB14B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 10:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCAB93BF7CF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 08:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BF823771E;
	Fri, 27 Jun 2025 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="swHPteLw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994123E32E
	for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012798; cv=none; b=mh6emNsRUKsCVe6qvB5cVbY+wqKW5wgHHQuEEyFH4wgAXrFH5FC7hPjoDLUauywmNKneM6BBhKXbHqbcMGKARuNHF4bfipF7owMh0+H93SeGG8Sn7wOWQU0wV+wmvRCjtDWGrG0iJeZz211WUqUCCk9iSrD5D1oue3oDO+JsCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012798; c=relaxed/simple;
	bh=mNZVUL0+Qk4pmLVzqUbamr+TVSmeq0+RLhYXo5vccoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUo/qoUYAWU9pCMTIYCVxC09h9JUWfCR75EJ7pMm+FeIvitUYxqgYhdTohogyiScBRDJn1vpJ2bB7GIcrHhILYUBONhH5L7cjRWvxljIky7YEizbBTfNYcwoAqIPGkDAdKTtbrK1ts5ZEpIsbsHBO8U836ibtt9GEdJqpCut6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=swHPteLw; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5533303070cso1897303e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jun 2025 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751012795; x=1751617595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/O27HFYbygAw71wXEu0U6ffZHl9IKBoXpsYtHIV6kU=;
        b=swHPteLwWIMp5RCgsBfu4fBC0q6+v78luvyLiF75JTQ52FFCjNV4dzOcY7UIWp70Jd
         a26rHKr4kHqGNSr9zL7MIP6KY2yBHVvrGZzQFXx+orpqZUxhVvTjWMxGOna9T1WqBD+p
         wxfjSAOSNgo64rlzCIvWqW7B40ZDK2VHrAYoWuWRouAFu8dVd6EcmyKbw18lhtQAtjp8
         6oXqu2K5WDWSZmjLDSPxaySMsO/Oz5dE/GmlRp/vsyddXHG9B+IWt+EcFPo6XpCymeZF
         bccC5xCKQncbjET5AjoaiAzEiWq1oFDhiU8x3yp7phd6ZZ+pYHvpaEsoA5OklYD0Of6O
         pYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751012795; x=1751617595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/O27HFYbygAw71wXEu0U6ffZHl9IKBoXpsYtHIV6kU=;
        b=D/hd9WpF8dhMcTZbdi2Uft2AEn4aGddz/9ScoGw2n6HWXo5ow/rNk6HMNFKik5Rxwh
         YD7AXXjfIe8PRfTUdodwdMFJR96vfnea0mYDdTxILynxfEp0AaVurPYp0Jn1uLaTW+bk
         6+69m8R0xglBuFXUqL0GBMTTpUSN8LMNI50+tnjKThH+otfhgn6HDlZ5wbZ+zg3a1QPH
         yUbHebKxeCehKkM/k+I/5Y53+4yWBP39K8bHNGg5a1K5bYjzXu4/s1CT2csSvqv0yqYl
         LRqS0PsxM9mGHbm/ZUA53vqn4t4UHsL1zsY6rlIJbHHsAniGDyjMNynnPiRIUBnomJSL
         vOGg==
X-Forwarded-Encrypted: i=1; AJvYcCVMoS89vOiJR6vW1LYaYMUn7ShbRpW9YOHH622eevU33Ntgn6OPkSGDc+w4fxEuyHyYuvXaysfGyI9T@vger.kernel.org
X-Gm-Message-State: AOJu0YySo67aqieAdNP6DaiWsx+JNakK/BWVYKeN5AEoSwreLvxRtBUN
	u+Xkp/DSjSpKMxarhFn4hQuhtzLGE4KbMyyZBmduyFjuoPybrCbZ6AbcUi3tl7/ftI2s9f2nMG9
	hcthZIk17Lb8Xw7hkc1sNWdP+VBjKDZMetjq+gIW78w==
X-Gm-Gg: ASbGncusgr8q1CcTrSWeBnarnFJfZyjAAmJlp7zUIqqOanTwaFY0XruBKBldcwDjYSJ
	u/bE/NXiXjFXtuxIeGo2tpCeIqXsd1EgXxgXdqPkGWCwxOWzDf5Qdm/aaodoq06V/Sg4urqvOo0
	V7BptrJKVl+MdUSVKt6AUQ03QQYJYWRWLKSeQGXpDCQw==
X-Google-Smtp-Source: AGHT+IGoNcpOgTzoXQXRqN1dWezxROCYZaaZoYdUKJELkDe49R/KL6HEbzofE3vpxkPoc1pMmOWuKvZe//ezYoT5bCM=
X-Received: by 2002:a05:6512:31c9:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-5550b74b8fdmr895259e87.0.1751012794659; Fri, 27 Jun 2025
 01:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153711.194208-1-brgl@bgdev.pl> <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
In-Reply-To: <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Jun 2025 10:26:22 +0200
X-Gm-Features: Ac12FXwRJ_3IsB2FK0M9TnHA6sQZpfEblvGOYSw0-hqNyGA7aDnUVy3lFui3z2M
Message-ID: <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 9:06=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/25/25 5:37 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The strict flag in struct pinmux_ops disallows the usage of the same pi=
n
> > as a GPIO and for another function. Without it, a rouge user-space
> > process with enough privileges (or even a buggy driver) can request a
> > used pin as GPIO and drive it, potentially confusing devices or even
> > crashing the system. Set it globally for all pinctrl-msm users.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> SC8280XP CRD breaks with this.. looks like there's a conflict between
> regulator-fixed accessing the pin with gpiod APIs and setting a pinmux:
>
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already request=
ed by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100=
000.pinctrl:570)
>
>
> Konrad

Yeah, I would be surprised if nothing broke.It's probably worth
looking into the implementation of the strict flag as it makes every
muxed pin unavailable as GPIO even if - like in this case - the
function *is* "gpio". Of course the "gpio" string has no real meaning
to the pinctrl core, it's just a name but it would be awesome if we
could say for a given function that this means GPIO and as such should
be available to the GPIOLIB API.

Bart

