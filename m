Return-Path: <linux-gpio+bounces-26781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52355BB67ED
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 12:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB78C423DD7
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC992EB5C6;
	Fri,  3 Oct 2025 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dt+2do/4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353652EAB89
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488909; cv=none; b=h2UIeCjJ8DBS8vXj9bJtIeRWaxdKjazraWLueFQkuDkSyfshDmcy56aOmZblHR0hyEv+rRwm7GCKV1FUZDw/+6EmhvB7kzaaPnvpeW+vBay132wGXdDODWonWIjTkauDF1M5x7Bd3kZflTpBsdlJhryEGn0MPDZWPUiAW703V2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488909; c=relaxed/simple;
	bh=cAECDx1sSxxHnbecn6VuOU03juzMj+AYiQE0DPv5YUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElVaPf7bPj2CNp/WnBT5oOM6UtQbuheFrMnlxi8gusSTpQJcW6SsflCIrdd75YsptA6bmMdj82k4M+Q0v24kXQYd71cKepmIQbvJ6zVtdnoQ+BoH2yxj8jCJLtUypidI+w3EWb7vKwPN2S/+mcPNYtUnhEdn/hKGHGin/2k6GY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dt+2do/4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57f1b88354eso2038322e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Oct 2025 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759488905; x=1760093705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAECDx1sSxxHnbecn6VuOU03juzMj+AYiQE0DPv5YUE=;
        b=Dt+2do/46SGcsGlqutC2Q/beezSoVs9eXPKN5p4FKJxnCrCkMHXrFEv1Pa0koWb1E0
         E3ylkTaRcOxyh6BZxHlh+rP9wzmHFm1G7KxB2fVhYuaG6x589AbsxP6vxrSvRrS5vR3x
         oh+kBAzL3k6rz1y8rRZi7VMcbKuVRc1z+QRe+tJJLeZqIC9jEIj7LCWdNXNjAjOzm/XE
         B48aP0YzfnBskXW5Xy5JNslpK4lkwWyMtGGcWHydOubqHA2wHw/iGjFPnS7pZMs01azt
         Y3V8rr5hGGRgUITB7xI4DWDkwDg/eR1PARpPsg1VkjP+gdv+dyCsyGIPFtgoclSivWzQ
         pDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488905; x=1760093705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAECDx1sSxxHnbecn6VuOU03juzMj+AYiQE0DPv5YUE=;
        b=VMLnYKqZo7p0NHfHFCdGCo9qSs9XNf/bw1CrLkNJPAYbZifz82W+wXH6GJ1mc6O6mu
         HAORszDlAcrtjvnC9xxq1wDyQ0n0868u6rVZlKxXleVtndI+O7YmYGomCTaxmqBWWH8Y
         CRA40ha0sJrWaWtsh+agWuKshqXS517r0JIuWJ45ysbd+hfEmRGV/y84a8p4IUJE5/ef
         JMwYmqpGm4oN0wy97gUqdboeh33BYA9CF3vphcac6hkjuUgrJKaIOXcuIDxvPoLuTgJ+
         toaeMO9K3cbpNZ6Yv5sGhAm6pD0TmXLzY/6KF2ttvQPm3b1n4mhHJtG4PGFRJP4+FveZ
         uzRA==
X-Forwarded-Encrypted: i=1; AJvYcCUqP3FteoxCj5LA8ZycARCudZrvxswonZQ3RFoQ3HXJQFANF3Qadj/xGDQ/1hLtIm+v/AmgSGhKYroZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGWxqyh8ZedKYxnrQZLsQazCLUJ6fxSk5svpTDf8EUovlSYIC
	tdcjY2go+nAM2GF1m4ugrFv0WxQzhI+dCMn0XxNtuLxf7UcNxPSBoMKEvVSUby28pOJPEIpxip3
	yd5BVj3ZnMau1hl9QWALQ3FSZgWdwO4fZ64vJApEPKg==
X-Gm-Gg: ASbGnctfGBxJZ+gEPxIevn5eTknqzwu0ybCjj9mVrfG/ujoDcu+Z0YASagNvknjLePi
	6NCnYgXXnAD1BSEqk3g2H44MRJwutDAFSw4lRAnhtHFeOZz7S2XHouqY504zx85Y1JXUb0OMB/l
	Ar+Btw9clqwSlbofF/wyHoO84b5TMJpDRZ8xCjgqy3EC6+qThyKqwEFhc5CmoauCq0PX4Ot1Ut9
	O4p3LRM4MowTY5UwkxR/YvEy7jGHEp1zUQOisK1NsGftZGxXLgoZnxrrQi8hQ==
X-Google-Smtp-Source: AGHT+IGo1Glv8ZcBFFkRNiPBtLkYhJhSKCGq1mD+OwgNLadjXj8hOaQai5wx3gNPSSCbTSSPaFVxfKegSNtXTCiWc44=
X-Received: by 2002:a05:6512:b96:b0:57d:8870:e96a with SMTP id
 2adb3069b0e04-58cbc2a5121mr956262e87.43.1759488904866; Fri, 03 Oct 2025
 03:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com> <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Oct 2025 12:54:52 +0200
X-Gm-Features: AS18NWD5PiAgE6Z0yAwhzxIEi8uvGvV7o02AtdVmxa4WxKd4BMM2EBFXwJajs9U
Message-ID: <CAMRc=MdaT-ZSep-VYBUvS29XPje2FF4EvCfuUrXUUE1+8bGTaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: add the tlmm driver for Kaanapali platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 1:18=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:
>
> Add support for Kaanapali TLMM configuration and control via the pinctrl
> framework.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

