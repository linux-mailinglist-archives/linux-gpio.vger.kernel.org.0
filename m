Return-Path: <linux-gpio+bounces-14067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E69F9250
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088141897D02
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDBA2153DC;
	Fri, 20 Dec 2024 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kyEuLROX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833322153CD
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698212; cv=none; b=OCPj2SPsnHMXPWOOhuiJQi+IJ+ukuwH5L32IWpMBRsk+EI1nNiQbaLMy9JSwWrLohr4La/XUpw+Mhh0eRLvHeDGL9/LNmNAZDt8Shm6vzwMbYvPU+NMCQF6Pn33owrNG95j6k58D2yG549IKKqtjHaG2ilcKeM5Bjn/iKxnplQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698212; c=relaxed/simple;
	bh=J8f9vgMRLuM9ELQ2kmp4Lw8evZk2VRstYiik4Pb7wiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkXR5rIFKNga5Jke7Ae+x6+yQxMrkE9P+1p3zfypXK+bFtl8a5AMCPLI1yoQuW8I6PBJlULxbYn9HGuPCrdslvWNrE6MR9nEaCMnAYWuN6YCUc8D6j9M8qRGvROL65ZoiBp+gZo9Rl5cxsMjQjEimT44kumP5prVzXoqQPrMQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kyEuLROX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f22fd6832so1848856e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698209; x=1735303009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8f9vgMRLuM9ELQ2kmp4Lw8evZk2VRstYiik4Pb7wiU=;
        b=kyEuLROXhMv9fGHcy3czZY+BcU4EGykLm96nGu9jT4StsA3QgzjD97j7lDBRSG2xmK
         XUcSUb3MQqY2TxCJlqbgTSZ5kkNBOVj/xRPEYpPYzB+GN/sVHTAt03K4ajRXSo79AFWY
         wXe+KDyvMJjZJtymNP6C+oV/vpiXdFTdTvRxheViq4V2PsqzTZbbothu4Vecin06RQws
         38ivG/B+HHsoXQ4VpBIZnW0gkqBpDOB2uIyt3rUsuZDiuMFiD6xElj5ioMs0mErlZMkN
         FCQJkQSfxC6JLlTjryZH32IEr3q2Af9C5rHsn0frlGbO01o2gUN6nj/3TL5B/jkOu7BA
         qPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698209; x=1735303009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8f9vgMRLuM9ELQ2kmp4Lw8evZk2VRstYiik4Pb7wiU=;
        b=U/pYJWOnWjdIvmqHqDp3/4JdHXCJ58YohgZRM+cUHJ6/XcXAZ7qgiSibcHdjKTHKMH
         3BD5adZHy7X5Ytd5SM5Fk7ArPX587HmUrPxgX2NYtH9w6/EZFB9W+3QdK5Y9KSy52wQ0
         VfHyzuwJr8Ijk8dGfmY23E/nAjDVeLCKjApnQvI6mz2kigxR1gzIGo8q2BNJi+sVVm+A
         7fjYL77qfdzd3pMuM0Tnxt58kfl/x4iLNX8WkCA2L1EVeVnQwYISZvWY2HLhMpFVawi6
         NwH7uWlJmPsfbbxeIV9IcvxFg4yK2TsA4H1EFIaF7snHz3UrUYaBPWmL3qqDosyT1rUy
         ZYlw==
X-Forwarded-Encrypted: i=1; AJvYcCWYv/Ow1YKyAnNAKVmuqtJ9U3X5hjVpdzFz4ENYpmCrngOBARWdOoKd1/TPerGc+odRfXusEOUXDlFt@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+DrhfwAQcCYdKKMAtQaRX+87XSg/vT+2Ijkta7Xq4+VTDJDP
	INwF1XhTeHTSr2W50m0bHwoOTKZI96MQTynbzXcMVq5hzr5tW6HtrMPUJFG7RrlUlYLQHISZ9hc
	kJUrklL7NxWWckoNjSsM1nhEQNj557gK2nRqGYQ==
X-Gm-Gg: ASbGncuxPNFmr/cvJtBTXcr6s9L3iVzul6DHYSPGQYIfo6EGzfJ6gGwx9We+xbYLGeU
	yE5ytOqE0Nnfi3hXSLTL9Z1Zk+5+QfHgX71tKsw==
X-Google-Smtp-Source: AGHT+IHrkqAX16ZypHFJngeb2Vh6RA26L7zYXfaVvPrwatjyxWsTOnLjJHT7Z28yQE1I26+KbzlTkeScYITmVM3w1bc=
X-Received: by 2002:a05:6512:3e22:b0:540:255d:42d7 with SMTP id
 2adb3069b0e04-54229533641mr832646e87.23.1734698208691; Fri, 20 Dec 2024
 04:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com> <173395636174.1729195.16129052745847104611.git-patchwork-notify@kernel.org>
In-Reply-To: <173395636174.1729195.16129052745847104611.git-patchwork-notify@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:36:37 +0100
Message-ID: <CACRpkdYcY2hgTzfPC1F3sdCPXvdrX_nQt0iWdLtGLBS3TTXopg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Modify the wrong "#undef"
To: patchwork-bot+linux-riscv@kernel.org
Cc: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>, linux-riscv@lists.infradead.org, 
	dlemoal@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:32=E2=80=AFPM <patchwork-bot+linux-riscv@kernel.=
org> wrote:

> This patch was applied to riscv/linux.git (fixes)
> by Linus Walleij <linus.walleij@linaro.org>:

No I did not.

Yours,
Linus Walleij

