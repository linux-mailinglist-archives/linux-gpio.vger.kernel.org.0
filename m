Return-Path: <linux-gpio+bounces-7058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2FC8D8035
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3865528A76A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E85782D89;
	Mon,  3 Jun 2024 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2yw8/vR6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7B19F
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717411252; cv=none; b=rxJAaOgKy9JorKDRePs8AiDwt+QuPVTxctw1O/5qgRNdfmxrrwTfB8jLX/uyVaS3AKKMaFN++yb0S5zmyvc81TNjlM/5wfwbhC/MQqp1MlIt5UAH+aaTnndlkFOZ4DSTViK0nWqlOZ8MqRGQQ5QLh5DEcuj9yAWvX1IUXm3BMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717411252; c=relaxed/simple;
	bh=TwOinyiMCJk+IGLP/YYC7bbbpupY/taT+Zo1Z7KRpjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vto5SdgE1wSRsB228DL9VFPrnxjf4F6zxtpb+jDjNEweln6oD0QnebMEJILfv3OWISWixlEmd/9NlwCBPvZyPf3QhsgFkeO+rbLyWKOLjNMqRz+Q+71wiYLVLLP9lOYGUcc+zE4RalN9u6dIjL6AZPKigdQbdAVdlNzt0Vuleh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2yw8/vR6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so20727011fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717411248; x=1718016048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zoZi7yneno1k5sGVOx0ritgLeRd+HM63br4D20bk6c=;
        b=2yw8/vR6ZC5ViNCKLiCjophp/ZmMmIWpqbflCgGRtBk6Iqeegylwtff/WNCzpcbiy2
         XdDBnZVNWCu+TCvTJXQDCf1xWanDvlQzXYdC/vKm5SExV+vmYEzEkMGmwO+L4KLZsMGc
         uzWbNmiEf8opDAONsraubv3hmJa7dq/rJGyMNdpjGNNV2ViAkYYaXr9RR04rhF2odzRl
         9APKfeK9dg0VR6VPbT5Lbemy9KHQXZmL028WYzPS2fwQt3Q5OKV6grg2WTu3X6wdSTFW
         ivGdQ4BR0Au1owFERMBAHAEJIFy7wrdYR8dkohn97llNyaD7KKN52oMKlstRncTSzQ7L
         1Isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717411248; x=1718016048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zoZi7yneno1k5sGVOx0ritgLeRd+HM63br4D20bk6c=;
        b=mgdfSAO7aO9GiR+PTSaIpcWLJhoFihKx9VMWX+fdgAwybRcz7JF8Vb20Go8L0s+tyX
         fl3KxmcBajBiwidKT3RS6D8iXwKDOYb9vS8f3aKje8+qQVJ5TLv5lh5HDAfIifjwdrBO
         Nu+bxkq6DY4PkeXi0gJ2Kvjg45o9hPqygHtB019hbT+ndx7tsGgXOc8qjDuGzC33BMyJ
         NUCox+8Pemm+zEROi/HpZkQrmo35zMHbgBpRZFBx0Y9U+XJkZ4xhf05t4rpdC+DRClmW
         AlTPEbrBnMQpG72rSeLFBWRHW6P0ccK44ZZR2eoPA6kIuCeQZFlj1+giO7Y689lb5Uq7
         jQJA==
X-Gm-Message-State: AOJu0Yx+ddrOjKeRpDHtLazAFvVYrN5NFEKtqTHd3pxCWAx8xtWSLMsu
	CFx16ZslPlG+X94tjFUaaFLJdKlYH+PzfG5RghNEqg3rJnZoHav1d+W5mKAIg7ub6yDJOdda0PW
	3Ke2tJ86tIH4LyYfWvFrGI3eSexpoikvPS9ZGckWC1n9yRCHO
X-Google-Smtp-Source: AGHT+IEbm18vmyhyJ85JwfzcMm5imfJFh6sCiA9fi4zUq7CoCCmxk0qz+RitNXadgMzd0JsHCNvKj+/JDvDKgZZSVUE=
X-Received: by 2002:a05:651c:1a28:b0:2e9:768a:12ae with SMTP id
 38308e7fff4ca-2ea95121319mr73459831fa.22.1717411247848; Mon, 03 Jun 2024
 03:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531134512.443850-1-warthog618@gmail.com>
In-Reply-To: <20240531134512.443850-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 12:40:37 +0200
Message-ID: <CAMRc=McChxEY2cnbzmHY1LAwSAxT5+irRWtbv3KqW8anDgfL4Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/8] tools: tests: fix shellcheck warnings
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 3:45=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Following up on recent discussions, this series fixes all the warnings
> detected by shellcheck.  The resulting tools test script is now clean,
> at least from the perspective of shellcheck.
>
> These fixes do not correct any known issue, other than shellcheck
> reporting them as potential problems, the intent is to remove common
> shell issues that may impact future changes, and to simplify checking
> that any subsequent changes to the test script constitute "good" shell.
>
> All the patches other than Patch 8 address a particular warning.
> They are reasonably self-explanatory, but each commit comment includes a
> link to the relevant warning(s) which describes the issue and the
> appropriate corrections.
>
> Patch 8 addresses a number of warnings, all related to word splitting
> and globbing, and those constitute the bulk of the changes.
> Some of the earlier patches also address trivial splitting/globbing
> issues where that would prevent a line being modified multiple times.
>
> Cheers,
> Kent.
>
> Kent Gibson (8):
>   tools: tests: don't mix string and array
>   tools: tests: don't declare and assign separately
>   tools: tests: fix unused variables
>   tools: tests: use read -r to avoid mangling backslashes
>   tools: tests: don't use variables in printf format string
>   tools: tests: check exit code directly
>   tools: tests: shellcheck don't follow sourced file
>   tools: tests: avoid splitting and globbing
>
>  tools/gpio-tools-test.bash | 459 +++++++++++++++++++------------------
>  1 file changed, 234 insertions(+), 225 deletions(-)
>
> --
> 2.39.2
>

Ugh, you added links after the SoB and it messes up with b4. Can you
resend it with links before any tags? Or better yet: make [x] into
Link: [x] so that b4 can interpret it correctly?

Thanks
Bart

