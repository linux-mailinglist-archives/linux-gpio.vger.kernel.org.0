Return-Path: <linux-gpio+bounces-5928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00F8B5890
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 14:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DEFE1C227DA
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2024 12:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C4B8487;
	Mon, 29 Apr 2024 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fY1Nqd16"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539E2F29
	for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2024 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714393908; cv=none; b=U9QNNV9FlnhlnPdPrZ0xFh91GfYKI48gfLu8NPr7k0K7dtyJFCU03OmlAGhLjytmE0qCoLJxprEkG31uxkFIMiOy/fnlLAWr5uWTLOe3SEZAum2o7W5w6OUXjrS5S96XhQcQ+gQIBMBUpPpr+bqA+YZZDYwNliqmHk/Bsv5XQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714393908; c=relaxed/simple;
	bh=TmkIUZXRReP8Drugn++pCGA4iSh3G0AlHnp894U10GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvmRy2Ew90LYiZrPCChdikP4GUNEeHX6H43Gvh+gz+Im4r4INi7UC2DYbozvw+0NizsZak4PV50x7WyZIwM03GDMzIeHfJL4WsmA10wyVu3bwN/FxtPtb8r/l2e2z+X4BLbzcYKbAUu7QuwKZItlxlBXox+FoYiPWJLOv4/B7Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fY1Nqd16; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso4663991276.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2024 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714393905; x=1714998705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BfrJkdfPHOL7AZ7zAIUgNp5Hv9h3M2AxRlbqmRGzF0=;
        b=fY1Nqd16urogFBLwGMz/bRVOQjO8LpRSLX9bf9vtmG8JMav6k2MqkkT1CH3bytUy/L
         w2jNM4qD5dSxDFXf+OiZW+l9SRDALWGa2Xe7zG8WTr/JDXR3VktvRfsbVNqbS/k3UWBC
         e9C9xXHqJs63/PREhVt6b1FLaJ9bSV5hZyCnX8A4lkcBctTXVNekiruF7L0g5S4PKqQ9
         5s02KdZfXuNGhqpAzRRzKg0rjEkP4m4WQSPiGx+DZ7K5RWVRwpYrDUte2FcwiWxYB42+
         zU80MUBrVcRzT02kBF8rDeQ3H+vK2JppboRGQNJXrOFeKOLjk/ZW7rx7j9HPLgmXiYor
         KsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714393905; x=1714998705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BfrJkdfPHOL7AZ7zAIUgNp5Hv9h3M2AxRlbqmRGzF0=;
        b=KKbyEDthMhhHbpWZFRIXu+dFm+/ty6bblKnvZjgXpHDEzbYhDXHFmJ2M+EnTwHdbGh
         Qx3zStI+/bku6rzPBT7QvM43srU9G03z0FXlcVkwUgtkWHr3ldCJQpcIFP0LxQRQ5AEP
         v9jvySUtLgDSA65ef2JH9UB9T2twieBx2DHuQ+ulvXvj55pHtJFutyTTuQlv5HCnWJ7j
         ReEDoVzujIJGWTTr6hkgJdL4SEYdD986Y/QQzIQULQt7csl2sOPYMKwHNpsBsOo+0bAg
         6wPDiiF8Yd4HgCgPfKpOAOQC1s4t21LHBrZc2gBaI+pKHjA5wiMkAl6skGb3Zhpo3NYA
         gY8w==
X-Gm-Message-State: AOJu0YyE/tnQF3XhHUH5kEKRCcOJgyxU/+kmftJPXrT8WuEISPBWWPTM
	G2vIdd1BY7Ft/M63qnoNiAegSZ8YGoUH4OxNChBbtyF+HmvLUyTJvDWA6EAFU4BwqGn6IsdINDC
	LnSVlNwviq+oZNvJKdS+IJduTfY7aahq1+Rdtnw==
X-Google-Smtp-Source: AGHT+IEPuO6HzvZL2Ct4Yme3zR+g+AeyBsIaIHr+0ylrivlIkBWKK4kW6nJ1YMCoZpqQ93NbUbeOthpLwAWklcYjnQ8=
X-Received: by 2002:a05:6902:1247:b0:dda:e401:df8c with SMTP id
 t7-20020a056902124700b00ddae401df8cmr10786869ybu.48.1714393905625; Mon, 29
 Apr 2024 05:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1714118620.git.geert+renesas@glider.be>
In-Reply-To: <cover.1714118620.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Apr 2024 14:31:34 +0200
Message-ID: <CACRpkdZtY-BFjn8agbgwVc2K6AkvO2iFniTsi+-VTNiP+7rfEQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.10
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 10:10=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 02cd2d3be1c31a3fd328ee83e576340d34bc57=
d9:
>
>   pinctrl: renesas: rzg2l: Configure the interrupt type on resume (2024-0=
4-22 09:54:00 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.10-tag1
>
> for you to fetch changes up to cd27553b0dee6fdc4a2535ab9fc3c8fbdd811d13:
>
>   pinctrl: renesas: rzg2l: Limit 2.5V power supply to Ethernet interfaces=
 (2024-04-25 10:35:05 +0200)

Pulled into my "devel" branch for v6.10, excellent work as usual!

Yours,
Linus Walleij

