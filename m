Return-Path: <linux-gpio+bounces-26788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A682DBB718D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 16:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10C5B3AAFC2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 14:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67711DEFE9;
	Fri,  3 Oct 2025 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kT9t+w7B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEB91DCB09
	for <linux-gpio@vger.kernel.org>; Fri,  3 Oct 2025 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759499999; cv=none; b=b5QkNjPLu4ISyArzkRgBGvg5RVYsWdBkbHVKrgIvF4PHLJEu9X14LDq7d8nVW/junbawDXcloXK1fk7/EnPNT7wmhmpfS1HivGAlYR5mnAoGNSVpe5o5xpSUJTRvjQgor8wQ0ofPOLWBpHzSSEAYJVCf9pF90X9REeI+Olleeow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759499999; c=relaxed/simple;
	bh=AQU1GoWQx9H+rY0gAtN6BmxXhIDrBh4kv/QaMY0qOu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIpbKV8sJB8h4mf+BzcwKo6ai6qXMXyB0/PKxfAY5zR65pZwf7G9M16c8cHScgzzdI+HS3Rif5ATS60YHgj9WSyUka6vpNLx6pbbX7sk0k9vHPokYZcSxjuANZnox5+RhG/YxLNaAw9jDBoy4+pLUj1EV8orTsP2L3HHRgzy0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kT9t+w7B; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C99954E40E9D;
	Fri,  3 Oct 2025 13:59:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AD5260683;
	Fri,  3 Oct 2025 13:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B44BD102F1C37;
	Fri,  3 Oct 2025 15:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759499993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gzcNMCmnqkTF5X7XAhQ6JHzAGxpKmX0Xms8tAud3qqc=;
	b=kT9t+w7BAkn8w09V7VCJww7DzGryXMjdpekRHpvHNwvBY/bdvi9qfq3Dq4JVbL9phg+reF
	jKyJ3US14+sXikLoHrS4vue9/S5WelhZckDroRApOgVsyatUlxzinz9O9ZydRoS7nhi7+o
	6XJ0DDOV2SDqyaiHOgZHm/4snMYwDiAbImwwsIoz+z7zm+AerqkmQIGJMEUPNKZ4oZLpOv
	ROSgzNNbzYLcb5UIt/xdiNPl4S+xl5QocCZ3fiBPJio1Af2yjanf3qaa8yWUsAGuIGZq1X
	cU/xPP2XtIgXGX9kbU1+YEHFnm8eRqRHoEzgjYT8/xdjpsnkkEekjDrlBFlb3w==
Message-ID: <4db46e2b-47c4-4c81-a36f-8b195b090d2f@bootlin.com>
Date: Fri, 3 Oct 2025 15:59:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <oliver.sang@intel.com>
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
 <CAMuHMdX5HXx2HSAHP-H1EEKO-csBku_cMm-OaacE7GZLXwBxOg@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMuHMdX5HXx2HSAHP-H1EEKO-csBku_cMm-OaacE7GZLXwBxOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

> 
> Is there any specific reason why you are doing this unconditionally,
> instead of only when any of its parents support .set_config(), like
> was done before?
> 
My idea was: it will be handled by the core, so the if statement is not
needed. But if we conditionally add the operation we can save some time
in case there is no chip supporting set_config().

Thomas

