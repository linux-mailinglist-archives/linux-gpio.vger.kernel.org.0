Return-Path: <linux-gpio+bounces-29757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DAFCCF651
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 11:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95AB33018BD8
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 10:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D31E31AA94;
	Fri, 19 Dec 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uO8VWYOR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D11531AA86
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139346; cv=none; b=KlbT8N/1HGm1sHeJt9wtlgdiFne4o1Xy1NPU4lpS9og6NMNO/zWoP+uRga2d0FQpNj2ote5jERmm81hKGjG6mhqgsG1de1Ezv2CLN3960KzkNxPeu/jRy1Br8FZxrvdYakOvgudpWfGytA73iOJHbNBEeghOnRZC5WexxLVMfjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139346; c=relaxed/simple;
	bh=TdAjtUXnPi9UdzGYCmAV7NNqxn84GFDS7LKrZANiOVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3HjoZKj1f4Zwlu8S8aTdKq+ITplNu3hJaPnl3I9ihpAhh2wrMOsHX6RqMe+LqRaGfFafETX0oQIuTAaYUatuEUaEW9M15wfMwW3hJ1MPwV849qv0UtJtWEIuhqZvTFqBrWSXobQvhHBIFN4y9UD+sdpIOkcMywzLBBvOUrqAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uO8VWYOR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3219C19424
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766139345;
	bh=TdAjtUXnPi9UdzGYCmAV7NNqxn84GFDS7LKrZANiOVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uO8VWYORv00juJlR18gKGq79eKmKW5LiIU85rb0C4LMNs1hNtbGKJIC04pLtgBuLk
	 WwQNTdl2AOq0ULF0eGDW5wwXqWJUkIH7PMEVLZfDhm+Qz7tWI7/x6iUeJrmnMmgvZw
	 JahhzL+A53onpFSj6/uPvyqawqsjkGFW/4S30VFH9ftiMy/rUiAHAtex9NVgPSeHUP
	 UZhE50Y4Prt7vhRkkvbQFxuuvY2RhCFHJGujnQxX3DWUIyJxbS15IhgEq9lC42vENJ
	 s+MZ8ADBDEjr3T0/OQGEr2+IHEiWVYaCwWWG5PVBxcTFr9GI7MS16OaKslbtfEgNN7
	 A5s+usZooTDhg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943d20f352so1858676e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 02:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKVrE2pysOxMH7zZwvvmBCkhonbRY0Ta0J1o9XNf/QhBR27GAMhZwnPQZz7PvGVTUjqoxrtlVnWq1+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ini0K+mUSxCjF/MOEx4UVhuGcUm7v6OMCNLsp0YDzi5KFpwX
	bhAZrjnJITXwxkA+iwKmR4H19+zZSFWayVFYZgnZgZ2Rv8PknP6HTAdk61fOm2IL7zO1uXU3Agm
	55eRU9qfi4DhuS0jhMxUfYEk+ieXukBkea7C2Y7TQSw==
X-Google-Smtp-Source: AGHT+IHXXPtjxI+X3g9JF7oZTi0dKlS+jo+mIiQg/lKY3jeto9hFI38mrhvbiHA2Rp4MB/8840d+uPeQ7mLwH8ZXl0A=
X-Received: by 2002:a05:6512:39cc:b0:598:ee60:8af0 with SMTP id
 2adb3069b0e04-59a17d8c2d0mr860672e87.19.1766139344377; Fri, 19 Dec 2025
 02:15:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com> <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 19 Dec 2025 11:15:31 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
X-Gm-Features: AQt7F2rKNUD48qbiAtp8txVUkBhM27TcXELn4tTZ3gej5gIHuBVaFRaHInahGEM
Message-ID: <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: zynq: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 11:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

I think there are some copy-paste leftovers in your commit messages.
You're saying you're using of_ functions but you're really going for
the device_ ones. Also update error messages. And possibly use
dev_err_probe() too while at it?

Same elsewhere.

Bart

