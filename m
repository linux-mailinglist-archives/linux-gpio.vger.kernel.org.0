Return-Path: <linux-gpio+bounces-7480-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6090A791
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A966285035
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A39190045;
	Mon, 17 Jun 2024 07:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nYBrPIxL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447E18FDB7
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 07:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610230; cv=none; b=GX/RSDzyYMyerAq9xXzl3Vip8mOWREYAlLHl4XtwJViiXbVT4y3vD7+IPsHVaNkI/NW5VijNRh9DLTn7Ru7KqkHhjO/vk56rb4jcQzoRqVt5c+j+C9o0PlNZJpUJ1wmC4jFew4Y8POC/+Sy7L0rL/N1KXR/KTJrgLzw7Wy1fCXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610230; c=relaxed/simple;
	bh=miN9duLyeGmrf/X9FIwiruW49zhwlcBWt6ivrI61rFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1l3sFhh1lwpqzF1pPWkVz9KrbrqxLVZm0VqPcpcqB6uZTKbh8wLF/SPt9mGQotKkY/G4jFCA4A8zIcusoU6+0r5Eesb9Biumad3CwK3HpbaTvM5yQOnfwstsjcVQ7NfwlgEXywQkMqE61L4V8nMmmb6dJubGXBl4RJ52x5Zbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nYBrPIxL; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b7e693b8aso4431778e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 00:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718610227; x=1719215027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miN9duLyeGmrf/X9FIwiruW49zhwlcBWt6ivrI61rFM=;
        b=nYBrPIxLKJs1vHFbb6QoG7qIuR7SzUJvKpQpFOwRjWSe3lbzpIfx+n4Rs7deKWJD7W
         D6z5CkKvchosbwelv5UpCr6otyZ+a52HACr76+95OB2naeLQNHf3q8LZDZG3RpH/ZRFr
         KToPQ0o2W3sp+5o4j2UYrYLOYVjLlxkIJL0X/1IvCer96Cwxh/xl0t4QKRrRQa080GhG
         MWZ59Lk8fNmdTBauEHCyGHQaRl6ncJt+MAhDBMKXXipTmANuIUJnEv4p9BVVYh4Ti+3z
         V6UgQ14uQx+Tv7IMQ8sABP0t3wsCI3Ulym6bWmniSNxZOx4cIoW4vPV91z6+AFN0uOCB
         rCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718610227; x=1719215027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miN9duLyeGmrf/X9FIwiruW49zhwlcBWt6ivrI61rFM=;
        b=vO6jqq32UhMFZhDOsqs4jEmbeD53hHAUk3xh5ymdctEb72Uw9Bx5Ldidgg3vOOCQOG
         /x7u6oJO0njksNUp5JbofBRkUMMKNulV6t0O4UQmwlj5MFsQJ8VUR9cxsI3gSxoRGixa
         5OjZNAK6PfSUCcYcWayO0QvxQ4q09+QdgTHjMCxGw0zsCa9vWW9vbbuAM/hNCNX4uTIh
         WlPPXmozcBeiMH+RDar0Id1wwmwgQP7x12E8NiEr1zSGT345ttlD0mqe9EsgOOOrMOh1
         l+sAc0vOwPXvvPvgRYky9iHxfUyhJ8BOtFtYFnBKsFw2gsulDHQ4eV7fRZU/o4yIaYZx
         /tzA==
X-Forwarded-Encrypted: i=1; AJvYcCUAJPe/JApYPIUnbaAtq6Ex0RtVhuLNnx0O1OtOMAtsHy8EQHwiffWMxuXl4+ppbt/buT8WYNKwHpQEzHTXKq2MLNsm0lQp9UKhQA==
X-Gm-Message-State: AOJu0Yzsd4yH44lhjFgDPuUrefmllm/9idFXjjoeAGtiHMUkfwbF/Gk1
	uaYqmogX46C40yu6myjNqfrXotAjELNsqwU3cYFUvq31gi2SvmsJW3E4eiYHpHRspuQUMlF/cgb
	mQ/3gP2R15OWUKxrqK1aLbv6iSczOG01mKe9yZQ==
X-Google-Smtp-Source: AGHT+IFOqCN6cicq/x2MVaTTuIMNVO7XJDw/a9DBtHPabTzeQl7zifz5eKAuPRI/EmkhUo7ET77mP7kzjJRUBXUh29A=
X-Received: by 2002:a05:6512:3da5:b0:52b:c023:6e53 with SMTP id
 2adb3069b0e04-52ca6cb3012mr3181598e87.11.1718610226692; Mon, 17 Jun 2024
 00:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603082110.2104977-1-thomas.richard@bootlin.com>
In-Reply-To: <20240603082110.2104977-1-thomas.richard@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:43:35 +0200
Message-ID: <CACRpkdaYw=j2iArpC+om_guJtUg79uWSHiU_j6x_GdCLmJmPqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tps6594: add missing support for LP8764 PMIC
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: m.nirmaladevi@ltts.com, bhargav.r@ltts.com, lee@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com, 
	gregory.clement@bootlin.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:21=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add missing support for LP8764 PMIC in the probe().
>
> Fixes: 208829715917 (pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl =
and GPIO)
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>
> Issue detected with v6.10-rc1 (and reproduced with 6.10-rc2) using a TI
> J7200 EVM board.
>
> tps6594-pinctrl tps6594-pinctrl.8.auto: error -EINVAL: Couldn't register =
gpio_regmap driver
> tps6594-pinctrl tps6594-pinctrl.8.auto: probe with driver tps6594-pinctrl=
 failed with error -22

Patch applied for fixes, I moved this up into the commit message.

Yours,
Linus Walleij

