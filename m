Return-Path: <linux-gpio+bounces-16700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8067A47C3B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6784D18856ED
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCB821C9F4;
	Thu, 27 Feb 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YoOsBgHd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01E2215F45
	for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655762; cv=none; b=U6gzDJtkeoasA3Ujf/EK3rmItIIQrAhiMP6S3p5JIxmkcEwc6fYI43jO3Bd3hJOvZCdssG8xeogsVtKWehSGkRibjnzOYi8tcoRAsilYbU+IzGqp+Kp0nbxLfZ8Pm3V8Mb773o1qqzHhV/zJt6d2UIZZbRXnk2Kra1LQJEayi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655762; c=relaxed/simple;
	bh=e8ij4xKai23ogt0Xw8R7M0XZ1aL+X2xi+NU31eBsCn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmUnOHqCHoy4l2OPg7nnYiMKTOA0KHDcLZiDv5bwGN300esqqtxGXRuezSrgYFOvnC78SF1uzVUrmmU119fh8zhW3tY2mYl1uu1ymgYACLT0PzmQ5y/pA2lHIJc4uUOGQoudN+ya5Vsqd/+Fzr2o7fg9L0zgr6T4H55C+3CPf2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YoOsBgHd; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53c9035003so589074276.2
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2025 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740655760; x=1741260560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nciX08GQPtZg7v1MyskI6adG+NQ3WuGO1GvwRWBCWUI=;
        b=YoOsBgHds2aSn3KZTYknZ2jGZVyYLqs3oiRsNZGYLhvFsfv78gemZFSxhr8EEATYsU
         TSLmU1zdHJaHvVwjnrTCBEbIuskBv75XVkQwseJCUjlJ6Peu7mbW+yPBbvC0B5POYE7/
         XXkGvtpbNSBbo4v8Agjs4xQPNaaXG8wEbxfOKvolu0z4aOtoG3ORdqLwgcoSQ/2Tkk79
         /qbtWCUXj2BX2a/10ahv+zwmeSBhREb8NYufnKOk3MPAQ5NDepBOvoYAiw9r5uzPcXcy
         3yqMt+rCHD6CFzbZBpzrTmch5mGcXYhXFtmlJutZiyAqRfW4Atxj0uxJue5bKDOb0UtK
         aJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740655760; x=1741260560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nciX08GQPtZg7v1MyskI6adG+NQ3WuGO1GvwRWBCWUI=;
        b=SDIo+P3JQWDYHX4W+Eb5+dQesyzso8dbpMIXhMndud3gzb+saRFu5da12rEZLQaK7d
         oqMfp2ZUYDQx+M/7TP10QyMtgJslzTwzIVChLnvoJzOx4FWh4FnjIKt5Aoz/eycJv+TP
         rI6EXw9NuG4cRPjIsRyThOBAc74yUWBhD5ezMNrn6dXJBpTy+ECiw0vLSuleg+9soeml
         8AAeoeKPoyGL3disYq44gRt008ZddaR1ao03bKVG52BrLRWwPMgX1oT+rMcdAvexkZEu
         sfMEB/H5BQwnVknjB0Rai/xmrG9qs2ycUnuWnKu3LWb0fRAb/S7RxlI39iREYIG1Ecmg
         3S0g==
X-Forwarded-Encrypted: i=1; AJvYcCUoZG1WeFj/1a15XTXGYxLxzzfMVki9ehk9nywzGbvnxVetPQH5n4l5F6/FxfxzD8KCUPpVdF2+RCDM@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQQC2P8VpfOCnuzrkGOZywToafWJIns/UOX7c8TTkRhzMO1yr
	7FLd5mxN4tkQQZsSkwmNzM6eP+m+NvVOazG3ZWjYGrOcHHixDu9BCaNfnOxYteaiZc9+hrCLgkp
	2mX7HqmkvPMWB5fHRAor6ux/tlRVQv6dGdUgr6A==
X-Gm-Gg: ASbGncsmSg6wGfN7lmUBfxhLCsjxaI9OsK3Tpk2Agg/KHYOn5PKBkJLFhOc1Sk1RDGO
	irv2IJmeswolyZh7jDIJA39UgJu3gxs4Ynj+iL8GQo56tqQ3Dnqu1A8NBKGuCzRkPBdB7d3K9Eo
	9cQaSZM+W34xOMK4uDzYbMMrgtO2h5eKh3pOzoQik=
X-Google-Smtp-Source: AGHT+IESP4bn3aguZLPtnJB+KBlLm+KUYI68Y9lUKKeme32FM+kiijBqj5YGuDbaDy0JlCaCg/CniG1vCZ9CIHWhtGc=
X-Received: by 2002:a05:6902:2d8e:b0:e60:93c5:9b1f with SMTP id
 3f1490d57ef6-e6093c59bfdmr3975863276.6.1740655759886; Thu, 27 Feb 2025
 03:29:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ1T-at4YO5TfR6y38JOkYKdEwz-CSeejoig8CzxTeuj3w@mail.gmail.com>
In-Reply-To: <CAMEGJJ1T-at4YO5TfR6y38JOkYKdEwz-CSeejoig8CzxTeuj3w@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 27 Feb 2025 11:29:03 +0000
X-Gm-Features: AQ5f1JrNcNxxm5AiIX9IpqFWuxQkXKfx_5ViLnWIaeyHrmK0sDSeJKGABcJDsOM
Message-ID: <CAPY8ntD72neJBVmWo_JVSE3cGoNEDBds5JBHjGkR89nMv_61zw@mail.gmail.com>
Subject: Re: New warning in gpiolib.c
To: Phil Elwell <phil@raspberrypi.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Dom Cobley <dom@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hi Phil

On Thu, 27 Feb 2025 at 11:20, Phil Elwell <phil@raspberrypi.com> wrote:
>
> Hi,
>
> While running the latest 6.14 release candidate I noticed lot of log
> spam such as this:
>
> [    1.315766] gpio gpiochip0: gpiochip_add_data_with_key:
> get_direction failed: -22
>
> It appears to have been added recently, with the intention that this
> will eventually become a fatal error once all GPIO drivers have been
> "fixed". However, I think the error return here can be appropriate and
> useful.
>
> The GPIO API is lacking a "none of the above" direction, for use with
> pins which can be configured for alternate functions (UART, I2C, SPI,
> etc.). Is it considered preferable to lie in such situations and say
> that the pin is an input? If so, wouldn't that make it impossible to
> detect the genuinely invalid (as far as the API is concerned) case of
> querying the value of a pin without first making it an input?

Link to the thread already discussing this
https://lore.kernel.org/linux-arm-kernel/20250219102750.38519-1-brgl@bgdev.pl/

  Dave

> Thanks,
>
> Phil

