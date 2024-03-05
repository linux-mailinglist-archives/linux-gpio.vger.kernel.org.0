Return-Path: <linux-gpio+bounces-4150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47A87268C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 19:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3DA61F2822B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 18:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D4418C36;
	Tue,  5 Mar 2024 18:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QlQY8mm1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F714AA0
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 18:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709663400; cv=none; b=au+Zeod1tlfKd+EvciPZxj98k7in3g/ImrZtLxkkLAvEwGDHWd9jTOcL9LyEp2aa/PdbnsAOBmuYLriQKL1+I7Zzl+Mh7T7dP0ickts/sVfYPYUP1VBVw0lfYLopDE9orXOdO/WPNSnTpa0qkM+pbluvsgAe15wlxBgaAb28B1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709663400; c=relaxed/simple;
	bh=5Ppa+R+0XzxFeakOVLHikQCXNl+/YtMGyczK5rMovXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lX9Fa9U2Am3ZQre+6bn1IlOyFUwIe5Z4lhIGzuvWE0AoNl8ge6rUbPgABO9vgQFUeAnUyGuiHzjiD+NY5bLw0Y6WwRF/hdHiuX00fEyK8QUHNzLgltyX8/lSgCgdG+W9tGw4I1y6ZifiWYnoWT4YI73ZLjOkZ1g5PIL1vAIIfIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QlQY8mm1; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-472630e4152so1120919137.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 10:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709663398; x=1710268198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ppa+R+0XzxFeakOVLHikQCXNl+/YtMGyczK5rMovXM=;
        b=QlQY8mm12Ra0N8GgCJ0/dqXPfgYe0EgnnyNAGP5zOP5cpUMI1okzhb2j76RZpUzEr6
         GoBg5ouYFV+FCVzcpq+ANlyh3NpiV897GwzeJUCkqRLfj/2aqf+VptWklidMbSfN0kMt
         ZSTzmeQd4OLhjVd8uNFNn8WvDB/hY/m4Y4JM2cQsHem5iYE33gL1oTMcQMX0486+fL54
         p6DxQlRFJ9WH4DDthKQVN4/fjiZNUlSvowERAAt6teOf18Srf73Jqd/RqsqJz2PMS2rk
         ruk3+jbWJKq6Eo96TGrPyKsRunrUkb3zty4nCPqH5pdfMQbnwJkqn+nkucWZqhsTLu/Z
         6USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709663398; x=1710268198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ppa+R+0XzxFeakOVLHikQCXNl+/YtMGyczK5rMovXM=;
        b=dljDme5EnTdPJ5We4nlPvgWVd6vEJsn9rNdPEtcJmGN/wkOtslua4TvGgTN5Xo8Rul
         BSFDwJVIW/rnbmQA1SGtjjwjpCYbzNXWcLnbmju9G4uvV/UB7tb/I12dSmSSdcH3SqU8
         92mw7STbtetg3bA3H+hn0YN8DQ8aodEZVpu8t9LXwi3or6YAdCtwK2f6PntZk/pbChM6
         A7ndte8RgU0JURHzphTJV7DUi6fTII+rCsqLgwBAM4G7XmOeOrucoKEKWzUrSzO0CYnn
         GhYQF2v06fM000W8YC884Z+2vu/4tWH0Kd4JRz+ypICEJKMJl1i/0NGlyVdhRmslNTBx
         boUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWduErv6KgozLnKX16k9X3Q1o99ARpPnj1KL1DSHiscw3b0nHtp6HqiwhSI60FFLa9zA/ebJLbQw7unh+HwoAqkFj2UZrzIFRiAiA==
X-Gm-Message-State: AOJu0YzaUoJoNz0wyK92GpFdi5OKbg/jKQPoqQeeKPNrM133o0rWIxXE
	0P+dyV5vOIsAsydCPKKFaPk3/JdrCQlzrKStCHJeyuSvfsq48umDMi1bpA0o5oZZP+gNVN96MYU
	b5AdGHQtetNahF0v3X7VLcSArykN3gI2ogcONDw==
X-Google-Smtp-Source: AGHT+IG9jVqhTMcMdyK8btYn8OnO/2Uff52no+WLiN7VylpwvZptkwmXQCkdKdkRK2NjpbUZHViXA9xgngSAEjpC4XE=
X-Received: by 2002:a67:c912:0:b0:472:e6e1:9b33 with SMTP id
 w18-20020a67c912000000b00472e6e19b33mr636651vsk.2.1709663398038; Tue, 05 Mar
 2024 10:29:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304173630.1150382-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240304173630.1150382-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 5 Mar 2024 19:29:47 +0100
Message-ID: <CAMRc=McU-jjNthSL4-Weo+Tchn6H9m2Y2xLuV593d5=a5yMGmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpiolib: Deduplicate cleanup for-loop in gpiochip_add_data_with_key()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 6:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There is no need to repeat for-loop twice in the error path in
> gpiochip_add_data_with_key(). Deduplicate it. While at it,
> rename loop variable to be more specific and avoid ambguity.
>
> It also properly unwinds the SRCU, i.e. in reversed order of allocating.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart

