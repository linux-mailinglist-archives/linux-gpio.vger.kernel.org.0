Return-Path: <linux-gpio+bounces-24130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088DB2009A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 09:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DC91896388
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 07:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168661FCCF8;
	Mon, 11 Aug 2025 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z5eyhWlY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1817120102C
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898448; cv=none; b=KjQ4fyt73TNgorcoGiDWGIuPK/ejIVXRzRCDSrJrpsqVQhKZ9U7aGN8pQ2QtXq+pBkhUM6IrQv2ZXOfaEzU8a6HHiQAELwc1GWJ3pP3ivogzjnAHEWDeFtowXVFRrCiwamSJnkEF79DX4roB1Lkvn0zPcoPlFtTDkBB6yyNDQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898448; c=relaxed/simple;
	bh=vLH1gqawWVrkH8DQwd8bbA3uokxzUYBljc36Sbl1pxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dw8FDXgdR5YNvVR84gZclUQecwLLIHbElqlIaRE4UJnRq4FM2DSGiWyTTpYreEuP6+kHZaphRiF2XnjgnCErjSGh867vesYhwMChiIyfrDSqwMeM0AyYrZ4G19EPiush6eGXJmwQJfCrqx//vAo50617z5Rx6pfoxSbsyEK7rcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z5eyhWlY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55b93104888so5177262e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754898445; x=1755503245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLH1gqawWVrkH8DQwd8bbA3uokxzUYBljc36Sbl1pxs=;
        b=z5eyhWlYcC0ekP85q1fTl01IJd+PFVXl1S2aQH52S41A8RpG8v8twrEOSK0UnBxdN4
         M40OBtJJrIDi4Jw+PK+gPRSdTIe9ND9lIQ0p8LS7zPF9FmCVXV1HshR699TxyUKr1XbV
         +TARM74PvIhx7INnDGvy4Lvhfcn4CP+KpfI77739EVBv/rTo6ANgztL2JGRCMUKFuro1
         ui0T7s5s4BUwpDsTV0HMNBpzjohVAw582YfpBsX9K1ru65u5tjBR0EmyzX7mWqRrsujA
         mZBV/vmxiK5KG13I1BQ/yF6okLkbBc40icYqcBptvjMCwI2hKChTzn6RXX1+wPahjW0i
         CXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898445; x=1755503245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLH1gqawWVrkH8DQwd8bbA3uokxzUYBljc36Sbl1pxs=;
        b=TPFku+Ka6IlQ6bzOtQBi42srS4/16nQHL/Ho6wlyipwdEOxRxvezNnT2kgDCJWbKOu
         D/bwKVLmKF60vW3LYFid2m0jl8RZRnqY/nAeKI1uQwuu2/ATkihCsV2Ge09jQc3txNR5
         SQderNzqP/pPtzJcEsugzj+bp0OdwVj+UCrcSMXKFbVUCToFOkmWkB5c1IQuWO1X+Ma9
         Km9MpNTFMqSR7fNZdHZgJ2pZ9p4OvNtf2fyejKj6wDIZLqrNxq66/mbjO5KcMYUyu9RD
         81lIaTlbnZs0cD0HGoV2sFZh2WkUqkU6Jj6dGqRrecTrLRm2gZyaM2LMhjwtTsJJfTPI
         Sd+w==
X-Forwarded-Encrypted: i=1; AJvYcCWC/xn+ln0gGEMv+9m6Z8pkB/VNvwK7VaFc4a8Qy+YInZrS094o1YfS2vTMcT+NeuHKB6YsS94YiTly@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ReNmyYn4jHMv6rJGyWgERSgYvuVsTaCWhKZzgMz9KfjUwtSD
	PFW0UX3zwOx8TaNDyakrMCqDUR2srV/3W6FH7ArgUGRJTvE8/ZLZ4q9kqWysgYnTmqjLsGQlnxw
	4D4W6V0mQP8BaYW3wcWu5lwSxwYGDhD4QjMKWnVXqUw==
X-Gm-Gg: ASbGncuiNh+DimJ88/oCUUl/fYrqubD+uNf0PEzs51UVsIqhCnTJRb44ws71zIENC5d
	qR1KhbeLEYVMqXQQekKTrxu2yiEIKrgHMZsaSRclOOz12cCcoUewBoAWSmCONZUyisPWwCqsZ7Q
	Bv3U9h/2jKTpSLt/NoEgFfCgu1x28T4VLs68B2T8jvTYRp8EatYFf6NTFOjEUkSLp/B/O0THa5Z
	v4LpNU=
X-Google-Smtp-Source: AGHT+IGrFAG3iXdJPs/ctpG63OOV25kZZFsNWCDuoZ2UqRMQ7MyguVt1VFp02LLWZKTkikVtnSijWjDPt0HkNcVhTyk=
X-Received: by 2002:a05:6512:3d09:b0:55b:57e8:16c4 with SMTP id
 2adb3069b0e04-55cc012c003mr3193177e87.30.1754898444992; Mon, 11 Aug 2025
 00:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aJd2Zho5QRUTAEzm@bhairav-test.ee.iitb.ac.in>
In-Reply-To: <aJd2Zho5QRUTAEzm@bhairav-test.ee.iitb.ac.in>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 09:47:13 +0200
X-Gm-Features: Ac12FXwMS3WB5EsQUQKu2BBekh_xFvZvqabL6It5COncLghaTwCpsk8JkuP-0Lc
Message-ID: <CAMRc=MczvR7w28Zw6Yn51W7wrkSHjitE3pimHBMgbL_zS8wYhQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: virtuser: remove debugfs_create_dir() error checks
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linus.walleij@linaro.org, dianders@chromium.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 9, 2025 at 6:25=E2=80=AFPM Akhilesh Patil <akhilesh@ee.iitb.ac.=
in> wrote:
>
> Remove return value checks for debugfs_create_dir() wherever
> appropriate. Follow guidelines mentioned in [1] that callers
> should ignore errors returned as other debugfs functions handle them
> appropriately.
> Refer commit 8bcbde2bb1374 ("debugfs: Document that debugfs_create
> functions need not be error checked") to clean up unnecessary error check=
s
> without impacting the functionality.
>
> Fixes: 91581c4b3f29e ("gpio: virtuser: new virtual testing driver for the=
 GPIO API")
> Link: https://lore.kernel.org/all/20220222154555.1.I26d364db7a007f8995e8f=
0dac978673bc8e9f5e2@changeid/ [1]
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---

The commit you linked says: "In many cases (...)". This is not one of
these cases as this driver is completely useless without functional
debugfs entries so it very much makes sense to check the relevant
calls.

Bart

