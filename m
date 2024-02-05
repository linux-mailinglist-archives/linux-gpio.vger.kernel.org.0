Return-Path: <linux-gpio+bounces-2940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D106A84963A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 10:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18BE21C20D69
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Feb 2024 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBE5125A4;
	Mon,  5 Feb 2024 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bp59tLgr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0D12B8C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Feb 2024 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707124735; cv=none; b=NKVeL3JWWXQ2/z4bafMaPTsKHIH5DbZqZijQYi2OMfXZW9UQhJzIs1tLiFNzbWOoWa3KScv8S+Fxvp+CPnNHho9kakeLCofiDTtgclygxkuo7htxMaGTQOSxOz2VUDZkUNTQ7QPoX4x2pPg4/4kHO4kgZjoQeRwXzpBX6w2Hroo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707124735; c=relaxed/simple;
	bh=fQaQOVm2b9yEQiuCvFYJ31jOuiYeFKbhN4BAw5IvDXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkH0MSPSJ9v06lsUY3twXWXhqDhvayj5AzgyA81nXEDxS45dlQ/34pZoSsQ1NnsIR5Vu2RTmOYLKeZhKEhu6SKOZUUK8PKTP9o5AN5K375K2efvr5I7bWJapbu9+9VChiMcd8lvY19zmVshqFqfzWaRg+n6Kg7N1+s6K7XtooxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bp59tLgr; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7d6275d7d4dso1728786241.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Feb 2024 01:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707124731; x=1707729531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQaQOVm2b9yEQiuCvFYJ31jOuiYeFKbhN4BAw5IvDXQ=;
        b=Bp59tLgr0iYbBZ/f2dPuG6jQsNSMNNcfMpNqXvXGWgyFFs6YrV6bcSoA9cY23kt4pm
         RRJkgnvPIaxytmyztoSCk//3XASwXOYlulY0rwHqh5LqZW6q7XyqT5oxFCM2V8avlOrc
         aw0FAwZVJYMFQdKMuuuj267IosZhe5JQDAyVg8Z8weMJef/6ARKl7T04W0j2YpgpzkMv
         vce/wkPxowNje2rk2+d2vJf0Zitap+fT7Yb+vuLkSnegv1wsXMbNh+YKCudkz08wU3jK
         wZRszhWFSiGQRlS2isLUAUAOPYb6JQ5C4SNQOokqHm/918kY1QfaV2BWd38bvG2JUrYV
         gAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124731; x=1707729531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQaQOVm2b9yEQiuCvFYJ31jOuiYeFKbhN4BAw5IvDXQ=;
        b=XDC1r/JaZp0sCrnToSJAuAYupPT08IUN9gL7JWih5tkQ+x50R8JNk/oOrnjmyXJ9o+
         wzZsruWfFFnidP1NWBCz8JjWgnxRrJLV2tvrxN7po4au45ABLSYTKCRTjjsHpE2RzEC1
         +OZUCsnVlCRkV91MKIerfR8r7ZHvJKqzP70hEO84FC3rrRaPloVeAZ40Ph+JjJ9e84Tq
         OrjndKxHszcA+s36NMHUQzAGLybRBKFsN9Q5Grlg3YgL8tjoOTlWbNza/8RVSV8vH91Y
         sem0M/og6shkwDFYpjVr954eLVTzeYX43RdNt8FzCrhxWkIxRsZbWJpGxRVYxHq+zKyO
         LgAg==
X-Gm-Message-State: AOJu0Yzgo8Z1ePhxUfnaeUqQ/O4Q0ccGfim+OxF4a0Q3H1tmOa77IJJU
	/zPRru/52Zxa5XYfF0ndE92xv1Q4XOu9LFa2x6ERvOI70WFSG0WjPhGMcFn3Ww5qRBv0Kyyyf3u
	d2rOmc+NWj2GPHBwUKsCN00Xxp0E8HeuwwlgjEA==
X-Google-Smtp-Source: AGHT+IFQlHLs7JxdGmHm+gfw2JvelvjFsVpyT1WLFbb8053GL8UeJl55FMgMu2r1iKWVpqX6sqB8FZ+mkYeuC0KF+sM=
X-Received: by 2002:a67:fb98:0:b0:46d:30b0:af9f with SMTP id
 n24-20020a67fb98000000b0046d30b0af9fmr1086673vsr.9.1707124731656; Mon, 05 Feb
 2024 01:18:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202130806.36334-1-brgl@bgdev.pl>
In-Reply-To: <20240202130806.36334-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Feb 2024 10:18:40 +0100
Message-ID: <CAMRc=McqAnYOOuH_dG7CZfty==r1avfyaPWK+oLiTHs3yn0YEg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: fix __repr__() implementations
To: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Robert Thomas <rob.thomas@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 2:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The __repr__() function should - if possible - return a valid Python
> expression that can be used to instantiate a new object when evaluated.
>
> LineSettings.__repr__() is missing comas between arguments. Both Chip and
> LineSettings also don't prefix the returned string with 'gpiod.'. Fix
> both functions and add more test cases - including actually using the
> strings returned by __repr__() to create new objects and compare their
> contents.
>
> Reported-by: Robert Thomas <rob.thomas@raspberrypi.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Patch applied.

Bart

